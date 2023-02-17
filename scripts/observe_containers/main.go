package main

import (
	"bufio"
	"database/sql"
	_ "embed"
	"fmt"
	"sync"

	"os"
	"path/filepath"
	"sort"
	"strconv"
	"strings"
	"time"

	"github.com/SKalt/pg_catalog_compatibility_table/pkg/common"
	_ "github.com/lib/pq"
	log "github.com/sirupsen/logrus"
)

//go:embed get_columns.sql
var colQuery string

//go:embed get_functions.sql
var fnQuery string

// min version of postgres with an *-alpine tag I can find on docker hub as of
// 2023-02-12. See
// https://hub.docker.com/_/postgres/tags?page=1&ordering=last_updated&name=9.2-alpine
const minAlpineVersion = "9.2"

func getPort(version string) string {
	parts := strings.Split(version, ".")
	major, err := strconv.ParseInt(parts[0], 10, 32)
	if err != nil {
		log.Fatal(err)
	}
	var minor int64
	minor = 0
	if len(parts) == 2 {
		minor, err = strconv.ParseInt(parts[1], 10, 32)
		if err != nil {
			log.Fatal(err)
		}
	} else if len(parts) > 2 {
		log.Fatalf("too many decimals: %s", version)
	}
	return fmt.Sprintf("50%02d%d", major, minor)
}

func unescapeTsvCell(cell string) string {
	return strings.ReplaceAll(strings.Trim(cell, `"`), `""`, `"`)
}

// find the postgres version numbers in the data-dir in ascending order
func getPgVersions(dataDir string) []string {
	entries, err := os.ReadDir(dataDir)
	if err != nil {
		log.Fatal(err)
	}
	versions := make([]string, 0, len(entries))
	for _, entry := range entries {
		if entry.IsDir() {
			versionStr := entry.Name()
			_, err := strconv.ParseFloat(versionStr, 64)
			if err == nil {
				versions = append(versions, entry.Name())
			}
			continue
		}
	}
	sort.SliceStable(versions, func(i, j int) bool {
		a, _ := strconv.ParseFloat(versions[i], 64)
		b, _ := strconv.ParseFloat(versions[j], 64)
		return a < b
	})
	return versions
}

func getServiceVersions(versions []string) []string {
	i := 0
	for {
		if versions[i] == minAlpineVersion {
			break
		} else {
			i++
		}
	}
	return versions[i:]
}

func WaitFor(driverName, dsn string, retries int) (db *sql.DB, finalErr error) {
	ticker := time.NewTicker(time.Second)
	for i := 0; i <= retries; i++ {
		<-ticker.C // wait for a tick

		if db, err := sql.Open(driverName, dsn); err == nil {
			if err := db.Ping(); err == nil {
				log.Infof("connected to %s", dsn)
				return db, nil
			} else {
				finalErr = err
				fmt.Printf(".")
			}
		} else {
			finalErr = err
			log.Debugf("%+v", err)
			fmt.Printf("_")
		}
	}
	return nil, finalErr
}

func patchRelationTsv(tsvPath string, observations []common.ColData, waiter *sync.WaitGroup) {
	defer waiter.Done()
	data, err := os.ReadFile(tsvPath)
	if err != nil {
		log.Fatal(err)
	}
	file, err := os.Create(tsvPath) // truncate the TSV
	if err != nil {
		log.Fatal(err)
	}
	tsv := bufio.NewWriter(file)
	defer func() {
		if err := tsv.Flush(); err != nil {
			log.Fatal(err)
		}
		if err = file.Close(); err != nil {
			log.Fatal(err)
		}
	}()
	_, err = tsv.WriteString(common.ColTsvHeader)
	if err != nil {
		log.Fatal(err)
	}
	lines := strings.Split(string(data), "\n")
	prev := make(map[string]common.ColData, len(lines)-1)
	for i, line := range lines {
		if i == 0 || line == "" {
			continue // skip the header and footer
		}
		cols := strings.Split(line, "\t")
		_index, err := strconv.ParseInt(cols[common.TsvColIndex], 10, 32)
		if err != nil {
			log.Fatal(err)
		}
		result := common.ColData{Index: int(_index)}
		result.Name = cols[common.TsvColName] // trust that col names are snake_case
		result.Type = unescapeTsvCell(cols[common.TsvColType])
		result.Description = unescapeTsvCell(cols[common.TsvColDescription])
		result.References = unescapeTsvCell(cols[common.TsvColReferences])
		prev[result.Name] = result
	}
	for _, row := range observations {
		if doc, ok := prev[row.Name]; ok {
			switch row.Type {
			case "boolean":
				row.Type = "bool"
			case "smallint":
				row.Type = "int2"
			case "integer":
				row.Type = "int4"
			case "bigint":
				row.Type = "int8"
			case "smallint[]":
				row.Type = "int2[]"
			case "integer[]":
				row.Type = "int4[]"
			case "bigint[]":
				row.Type = "int8[]"
			case "timestamp with time zone":
				row.Type = "timestamptz"
			case "real":
				row.Type = "float4"
			}
			if row.Type != doc.Type {
				log.Infof("%s:%d:%s type '%s' -> '%s'", tsvPath, row.Index, row.Name, doc.Type, row.Type)
			}
			row.Description = doc.Description
			if _, err = tsv.WriteString(row.TsvRow()); err != nil {
				log.Fatal(err)
			}
		}
	}
}
func observeRelation(relationsDir string, relation string, stmt *sql.Stmt, waiter *sync.WaitGroup) {
	log.Debugf("observing relation %s/%s", relationsDir, relation)
	defer waiter.Done()
	rows, err := stmt.Query(relation)
	if err != nil {
		log.Fatal(err)
	}
	results := []common.ColData{}
	for rows.Next() {
		var n int
		var name, kind string
		var defaultExpr *string
		var notNullable *bool
		if err := rows.Scan(&n, &name, &kind, &notNullable, &defaultExpr); err != nil {
			log.Fatal(err)
		}
		if strings.HasPrefix(kind, `"char`) {
			kind = strings.ReplaceAll(kind, `"`, "")
		}
		result := common.ColData{Index: n, Name: name, Type: kind}
		if notNullable != nil {
			if *notNullable {
				result.Nullable = "false"
			} else {
				result.Nullable = "true"
			}
		}
		if defaultExpr != nil {
			log.Fatalf("%s.%s has default '%s'", "pg_proc", result.Name, *defaultExpr)
			// result.defaultExpr = *defaultExpr
		}
		results = append(results, result)
	}
	catalogTsv := filepath.Join(relationsDir, relation+".tsv")
	waiter.Add(1)
	go patchRelationTsv(catalogTsv, results, waiter)
}

func observeRelationKind(dataDir, version, relationKind string, conn *sql.DB, waiter *sync.WaitGroup) {
	log.Debugf("observing catalogs for version %s", version)
	defer waiter.Done()
	relationDir := filepath.Join(dataDir, version, relationKind)
	tsvs, err := os.ReadDir(relationDir)
	if err != nil {
		log.Fatal(err)
	}
	relations := make([]string, 0, len(tsvs))
	for _, tsv := range tsvs {
		name := tsv.Name()
		relations = append(relations, name[0:len(name)-4])
	}
	txn, err := conn.Begin()
	if err != nil {
		log.Fatal(err)
	}
	defer txn.Rollback()
	stmt, err := txn.Prepare(colQuery)
	if err != nil {
		log.Fatal(err)
	}
	for _, relation := range relations {
		waiter.Add(1)
		observeRelation(relationDir, relation, stmt, waiter)
	}
}

//	func observeViewDefs(dataDir, version, view string, conn *sql.DB, waiter *sync.WaitGroup) {
//		stmt, err :=
//	}
func observeFns(dataDir string, version string, conn *sql.DB) {
	row, err := conn.Query(fnQuery)
	if err != nil {
		log.Fatal(err)
	}
	tsvFile, err := os.Create(filepath.Join(dataDir, version, "functions.tsv"))
	if err != nil {
		log.Fatal(err)
	}
	tsv := bufio.NewWriter(tsvFile)
	defer func() {
		tsv.Flush() // ignore error?
		if err := tsvFile.Close(); err != nil {
			log.Fatal(err)
		}
	}()
	_, err = tsvFile.WriteString(common.FnTsvHeader)
	if err != nil {
		log.Fatal(err)
	}
	for row.Next() {
		fn := common.FnData{}
		if err = row.Scan(&fn.Name, &fn.IdentityArgs, &fn.ReturnType); err != nil {
			log.Fatal(err)
		}
		if _, err = tsv.WriteString(fn.TsvRow()); err != nil {
			log.Fatal(err)
		}
	}
}

// use a single connection per-container to audit all the relevant tables, views, functions, domains.
func auditContainer(dataDir string, version string, waiter *sync.WaitGroup) {
	defer waiter.Done()
	log.Debugf("auditing container %s\n", version)
	port := getPort(version)
	conn, err := sql.Open("postgres", "host=localhost port="+port+" user=postgres dbname=postgres sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()
	inner := sync.WaitGroup{} // defines the lifetime of the database connection
	inner.Add(1)
	observeRelationKind(dataDir, version, "catalog", conn, &inner)
	inner.Add(1)
	observeRelationKind(dataDir, version, "view", conn, &inner)
	observeFns(dataDir, version, conn)
	inner.Wait()
	// TODO: fetch+record functions
}

func main() {
	switch os.Getenv("LOG_LEVEL") {
	case "", "ERROR":
		log.SetLevel(log.ErrorLevel)
	case "INFO":
		log.SetLevel(log.InfoLevel)
	case "DEBUG":
		log.SetLevel(log.DebugLevel)
	}
	dataDir, err := filepath.Abs("./data")
	if err != nil {
		log.Fatal(err)
	}
	versions := getServiceVersions(getPgVersions(dataDir))
	log.Infof("versions: %v\n", versions)
	waiter := sync.WaitGroup{}
	for _, version := range versions {
		waiter.Add(1)
		go auditContainer(dataDir, version, &waiter)
	}
	waiter.Wait()
}
