package main

import (
	"bufio"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"sync"

	log "github.com/sirupsen/logrus"

	"github.com/SKalt/pg_catalog_compatibility_table/pkg/common"
)

func mkdir(path string) {
	if err := os.MkdirAll(path, os.ModeDir|0o776); err != nil {
		log.Fatal(err)
	}
}

func mergeCol(scraped *common.ScrapedColData, observed *common.ObservedColData) (result common.CombinedColData) {
	if scraped == nil && observed == nil {
		log.Fatal("need at least one of scraped and observed")
	}
	if observed != nil {
		result.Name = observed.Name
		result.Type = observed.Type
		result.Nullable = observed.Nullable
	} else {
		result.Description = "<unobserved>"
	}
	if scraped != nil {
		if observed != nil {
			if scraped.Name != observed.Name {
				log.Panicf("name must match: scraped '%s' != '%s' observed", scraped.Name, observed.Name)
			}
			if scraped.Type != observed.Type {
				log.Warnf("type (scraped) '%s' != '%s' (observed)", scraped.Type, observed.Type)
			}
		}
		result.Name = scraped.Name
		result.Type = scraped.Type
		result.References = scraped.References
		result.Description = scraped.Description
	}
	return
}

func mergeRelation(dataDir, version, kind, name, scrapedTsvPath, observedTsvPath string, waiter *sync.WaitGroup) {
	if scrapedTsvPath == observedTsvPath {
		log.Fatal("missing both scraped and observed")
	}
	scrapedCols := []common.ScrapedColData{}
	if scrapedTsvPath != "" {
		data, err := os.ReadFile(scrapedTsvPath)
		if err != nil {
			log.Fatal(err)
		}
		scrapedCols, err = common.ParseScrapedTsv(string(data))
		if err != nil {
			log.Fatal(err)
		}
	}
	// using a map of offsets to avoid map[string]*common.ScrapedCol weirdness
	scraped := make(map[string]int, len(scrapedCols))
	for i, j := range scrapedCols {
		scraped[j.Name] = i
	}

	observed := []common.ObservedColData{}
	if observedTsvPath != "" {
		data, err := os.ReadFile(observedTsvPath)
		if err != nil {
			log.Fatal(err)
		}
		observed, err = common.ParseObservedTsv(string(data))
		if err != nil {
			log.Fatal(err)
		}
	}
	kindDir := filepath.Join(dataDir, "combined", version, kind)
	mkdir(kindDir)
	targetTsvFile, err := os.Create(filepath.Join(kindDir, name+".tsv"))
	if err != nil {
		log.Fatal(err)
	}
	tsv := bufio.NewWriter(targetTsvFile)
	defer func() {
		tsv.Flush()
		targetTsvFile.Close()
		waiter.Done()
	}()
	if _, err = tsv.WriteString(common.CombinedColTsvHeader); err != nil {
		log.Fatal(err)
	}
	for _, observedCol := range observed {
		name := observedCol.Name
		i, ok := scraped[name]
		var s *common.ScrapedColData = nil
		if ok {
			s = &scrapedCols[i]
			delete(scraped, name)
		}

		_, err = tsv.WriteString(mergeCol(s, &observedCol).TsvRow())
		if err != nil {
			log.Fatal(err)
		}
	}
	if len(scraped) > 0 {
		remaining := make([]common.CombinedColData, 0, len(scraped))
		for _, i := range scraped {
			remaining = append(remaining, mergeCol(&scrapedCols[i], nil))
		}
		sort.SliceStable(remaining, func(i, j int) bool {
			return remaining[i].Name < remaining[j].Name
		})
		for _, combo := range remaining {
			_, err = tsv.WriteString(combo.TsvRow())
			if err != nil {
				log.Fatal(err)
			}
		}
	}
}
func getVersions(dataDir, source string) map[string]string {
	sourceDir := filepath.Join(dataDir, source)
	entries, err := os.ReadDir(sourceDir)
	if err != nil {
		log.Fatal(err)
	}
	result := make(map[string]string, len(entries))
	// sorted?
	for _, e := range entries {
		if e.IsDir() {
			result[e.Name()] = filepath.Join(sourceDir, e.Name())
		}
	}
	return result
}
func getScrapedVersions(dataDir string) map[string]string {
	return getVersions(dataDir, "scraped")
}
func getObservedVersions(dataDir string) map[string]string {
	return getVersions(dataDir, "observed")
}
func getKindRelations(versionDir, kind string) map[string]string {
	kindDir := filepath.Join(versionDir, kind)
	result := make(map[string]string, 0)
	if entries, err := os.ReadDir(kindDir); err == nil {
		for _, f := range entries {
			parts := strings.Split(f.Name(), ".tsv")
			if len(parts) == 2 {
				result[parts[0]] = filepath.Join(kindDir, f.Name())
			}
		}
	}
	return result
}
func getCatalogs(versionDir string) map[string]string {
	return getKindRelations(versionDir, "catalog")
}
func getViews(versionDir string) map[string]string {
	return getKindRelations(versionDir, "view")
}
func mergeRelations(dataDir, version, kind string, scraped map[string]string, observed map[string]string) {
	waiter := sync.WaitGroup{} // waits for all tsv-writing jobs to terminate
	for relation, observePath := range observed {
		waiter.Add(1)
		scrapedPath, ok := scraped[relation]
		if ok {
			delete(scraped, relation)
		}
		mergeRelation(dataDir, version, kind, relation, scrapedPath, observePath, &waiter)
	}
	for catalog, scrapedPath := range scraped {
		waiter.Add(1)
		mergeRelation(dataDir, version, kind, catalog, scrapedPath, "", &waiter)
	}
	waiter.Wait()
}
func mergeVersion(dataDir, version, scrapedVersionDir, observedVersionDir string) {
	scrapedCatalogs := getCatalogs(scrapedVersionDir)
	observedCatalogs := getCatalogs(observedVersionDir)
	mergeRelations(dataDir, version, "catalog", scrapedCatalogs, observedCatalogs)
	scrapedViews := getViews(scrapedVersionDir)
	observedViews := getViews(observedVersionDir)
	mergeRelations(dataDir, version, "view", scrapedViews, observedViews)
	// TODO: symlink fn def, view def, index inventory, fn inventory
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
	scrapedVersions := getScrapedVersions(dataDir)
	observedVersions := getObservedVersions(dataDir)
	for version, scrapedVersionDir := range scrapedVersions {
		observedVersionDir, ok := observedVersions[version]
		if ok {
			delete(observedVersions, version)
		}
		mergeVersion(dataDir, version, scrapedVersionDir, observedVersionDir)
	}
	for version, observedVersionDir := range observedVersions {
		mergeVersion(dataDir, version, "", observedVersionDir)
	}
}
