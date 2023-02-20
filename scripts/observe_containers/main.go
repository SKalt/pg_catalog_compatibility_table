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

	"github.com/SKalt/pg_catalog_compatibility_table/pkg/common"
	_ "github.com/lib/pq"
	log "github.com/sirupsen/logrus"
)

const dirMode = os.ModeDir | 0o776

//go:embed get_all_relations.sql
var allRelationsQuery string

//go:embed get_columns.sql
var colQuery string

//go:embed get_functions.sql
var fnQuery string

//go:embed get_view_def.sql
var viewDefQuery string

//go:embed get_fn_def.sql
var fnDefQuery string

//go:embed get_indices.sql
var idxQuery string

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

// find the postgres version numbers in the data-dir in ascending order
func getPgVersions(scrapedDataDir string) []string {
	entries, err := os.ReadDir(scrapedDataDir)
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

func observeFnDefs(observationDir, version string, db *sql.DB, waiter *sync.WaitGroup) {
	defer waiter.Done()
	stmt, err := db.Prepare(fnDefQuery)
	if err != nil {
		log.Fatal(err)
	}
	fnTsvPath := filepath.Join(observationDir, version, "functions.tsv")
	fns := map[string]uint8{}
	{ // lifetime for original tsv data
		data, err := os.ReadFile(fnTsvPath)
		if err != nil {
			log.Fatal(err)
		}
		lines := strings.Split(string(data), "\n")
		for i, line := range lines {
			if i == 0 || line == "" {
				continue
			}
			parts := strings.SplitN(line, "\t", 2)
			name := parts[0]
			fns[name] += 1
			// if _, ok := fns[name]; !ok {
			// 	fns[name] = 0
			// }
		}
	}
	fnsDir := filepath.Join(observationDir, version, "functions")
	for fn := range fns {
		row, err := stmt.Query(fn)
		if err != nil {
			// always an aggregate/window fn
			log.Debug(err)
			continue
		}
		if err := os.MkdirAll(fnsDir, os.ModeDir|0o776); err != nil {
			log.Fatal(err)
		}
		file, err := os.Create(filepath.Join(fnsDir, fn+".sql"))
		if err != nil {
			log.Fatal(err)
		}
		sql := bufio.NewWriter(file)
		var fnDef string
		for row.Next() {
			if err = row.Scan(&fnDef); err != nil {
				log.Fatal(err)
			}
			sql.WriteString(fnDef + ";\n")
		}
		sql.Flush()
		file.Close()
	}
}

func observeRelation(relationsDir string, relation string, stmt *sql.Stmt, waiter *sync.WaitGroup) {
	log.Debugf("observing relation %s/%s", relationsDir, relation)
	rows, err := stmt.Query(relation)
	if err != nil {
		log.Fatal(err)
	}
	catalogTsvPath := filepath.Join(relationsDir, relation+".tsv")
	file, err := os.Create(catalogTsvPath)
	if err != nil {
		log.Fatal(err)
	}
	tsv := bufio.NewWriter(file)
	defer func() {
		if err = tsv.Flush(); err != nil {
			log.Fatal(err)
		}
		if err = file.Close(); err != nil {
			log.Fatal(err)
		}
		waiter.Done()
	}()
	if _, err = tsv.WriteString(common.ObservedColTsvHeader); err != nil {
		log.Fatal(err)
	}
	for rows.Next() {
		var n int
		var name, kind string
		var defaultExpr *string
		var notNullable *bool
		if err := rows.Scan(&n, &name, &kind, &notNullable, &defaultExpr); err != nil {
			log.Fatal(err)
		}
		result := common.ObservedColData{Name: name, Type: common.CorrectTypeName(kind), Nullable: ""}
		if notNullable != nil {
			if *notNullable {
				result.Nullable = "false"
			} else {
				result.Nullable = "true"
			}
		}
		if defaultExpr != nil {
			log.Fatalf("%s.%s has default '%s'", relation, result.Name, *defaultExpr)
		}
		if _, err = tsv.WriteString(result.TsvRow()); err != nil {
			log.Fatal(err)
		}
	}
}

func getAllRelationNames(conn *sql.DB, relKinds string) (result []string) {
	row, err := conn.Query(strings.ReplaceAll(allRelationsQuery, "$1", relKinds))
	if err != nil {
		log.Fatal(err)
	}
	for row.Next() {
		var rel string
		if err = row.Scan(&rel); err != nil {
			log.Fatal(err)
		}
		result = append(result, rel)
	}
	return result
}

func observeRelationKind(observationDir, version, relationKind string, conn *sql.DB, waiter *sync.WaitGroup) {
	log.Debugf("observing relations of kind %s for version %s", relationKind, version)
	relationDir := filepath.Join(observationDir, version, relationKind)
	if err := os.MkdirAll(relationDir, dirMode); err != nil {
		log.Fatal(err)
	}
	relations := []string{}
	switch relationKind {
	case "catalog":
		relations = getAllRelationNames(conn, "('r', 'p')")
	case "view":
		relations = getAllRelationNames(conn, "('v', 'm')")
	}

	txn, err := conn.Begin()
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		txn.Rollback()
		waiter.Done()
	}()
	stmt, err := txn.Prepare(colQuery)
	if err != nil {
		log.Fatal(err)
	}
	for _, relation := range relations {
		waiter.Add(1)
		observeRelation(relationDir, relation, stmt, waiter)
	}
}

func observeViewDefs(observationDir, version string, conn *sql.DB, waiter *sync.WaitGroup) {
	views := getAllRelationNames(conn, "('v', 'm')")
	txn, err := conn.Begin()
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		waiter.Done()
		txn.Rollback()
	}()
	stmt, err := txn.Prepare(viewDefQuery)
	if err != nil {
		log.Fatal(err)
	}
	viewsDir := filepath.Join(observationDir, version, "view")
	var defn string
	for _, v := range views {
		if err = stmt.QueryRow(v).Scan(&defn); err != nil {
			if err == sql.ErrNoRows {
				// sometimes you can't see views
				continue
				//log.Fatalf("%s view %s: no rows", version, v)
			}
			log.Fatal(err)
		}
		file, err := os.Create(filepath.Join(viewsDir, v+".sql"))
		if err != nil {
			log.Fatal(err)
		}
		_, err = file.WriteString(defn)
		file.Close()
		if err != nil {
			log.Fatal(err)
		}
	}
}
func observeFns(observationDir string, version string, conn *sql.DB, waiter *sync.WaitGroup) {
	defer waiter.Done()
	row, err := conn.Query(fnQuery)
	if err != nil {
		log.Fatal(err)
	}
	tsvFile, err := os.Create(filepath.Join(observationDir, version, "functions.tsv"))
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
		} //!!!
		if _, err = tsv.WriteString(fn.TsvRow()); err != nil {
			log.Fatal(err)
		}
	}
}

func observeIndices(observationDir, version string, db *sql.DB, waiter *sync.WaitGroup) {
	defer waiter.Done()
	row, err := db.Query(idxQuery)
	if err != nil {
		log.Fatal(err)
	}
	idxTsvPath := filepath.Join(observationDir, version, "indices.tsv")
	file, err := os.Create(idxTsvPath)
	if err != nil {
		log.Fatal(err)
	}
	tsv := bufio.NewWriter(file)
	if _, err = tsv.WriteString("Name\tRelation\tDefinition\n"); err != nil {
		log.Fatal(err)
	}
	var indexName string
	var indexDef string
	for row.Next() {
		var relationName string
		if err = row.Scan(&indexName, &relationName, &indexDef); err != nil {
			log.Fatal(err)
		}
		tsv.WriteString(fmt.Sprintf("%s\t%s\t%s\n", indexName, relationName, indexDef))
	}
	tsv.Flush()
	file.Close()
}

// use a single connection per-container to audit all the relevant tables, views, functions, domains.
func auditContainer(observationDir string, version string, waiter *sync.WaitGroup) {
	log.Debugf("auditing container %s\n", version)
	port := getPort(version)
	conn, err := sql.Open("postgres", "host=localhost port="+port+" user=postgres dbname=postgres sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		if err = conn.Close(); err != nil {
			log.Fatal(err)
		}
		waiter.Done()
	}()
	inner := sync.WaitGroup{} // defines the lifetime of the database connection
	inner.Add(1)
	observeRelationKind(observationDir, version, "catalog", conn, &inner)
	inner.Add(1)
	observeRelationKind(observationDir, version, "view", conn, &inner)
	inner.Add(1)
	observeFns(observationDir, version, conn, &inner)
	inner.Add(1)
	observeViewDefs(observationDir, version, conn, &inner)
	inner.Add(1)
	observeFnDefs(observationDir, version, conn, &inner)
	inner.Add(1)
	observeIndices(observationDir, version, conn, &inner)
	inner.Wait()
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
	observationDir := filepath.Join(dataDir, "observed")
	if err = os.MkdirAll(observationDir, dirMode); err != nil {
		log.Fatal(err)
	}
	versions := getServiceVersions(getPgVersions(filepath.Join(dataDir, "scraped")))
	log.Infof("versions: %v\n", versions)
	waiter := sync.WaitGroup{}
	for _, version := range versions {
		waiter.Add(1)
		go auditContainer(observationDir, version, &waiter)
	}
	waiter.Wait()
}
