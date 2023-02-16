package main

import (
	"bufio"
	_ "encoding/csv"
	"fmt"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
	"strings"
	"sync"

	"github.com/SKalt/pg_catalog_compatibility_table/pkg/common"
	pb "github.com/cheggaaa/pb/v3"

	"github.com/PuerkitoBio/goquery"
	"github.com/gocolly/colly/v2"
	"github.com/gocolly/colly/v2/debug"
	log "github.com/sirupsen/logrus"
)

var whitespaceChars = " \r\n\t"
var dedentRe *regexp.Regexp = regexp.MustCompile("[" + whitespaceChars + "]+")

// lowercase + strip whitespace
func normalizeString(s string) string {
	s = strings.ReplaceAll(s, "\u00a0", " ")
	s = strings.Trim(s, whitespaceChars)
	s = strings.ToLower(s)
	return strings.ToLower(s)
}

// remove extraneous whitespace, curly-quotes
func sanitizeString(s string) string {
	s = strings.Trim(s, whitespaceChars)
	s = strings.ReplaceAll(s, "“", "\"")
	s = strings.ReplaceAll(s, "”", "\"")
	s = strings.ReplaceAll(s, "’", "'")
	return s
}

func getVersions(baseCollector *colly.Collector, siteDir string) (versions []string) {
	collector := baseCollector.Clone()
	versionSet := map[string]float64{}
	collector.OnHTML("#pgContentWrap div.row>div>a[href]", func(h *colly.HTMLElement) {
		href := h.Attr("href")
		if !strings.HasPrefix(href, "/docs/") {
			return
		}
		parts := strings.Split(href, "/")
		if len(parts) < 3 {
			return
		}
		// "/docs/version/..."
		// 0   1  2
		version := parts[2]
		if v, err := strconv.ParseFloat(version, 64); err == nil {
			// 32-bit floats can't represent .2
			if _, ok := versionSet[version]; !ok {
				versionSet[version] = v
				versions = append(versions, version)
			}
		}
	})
	err := collector.Visit("file://" + siteDir + "/docs/current/index.html")
	if err != nil {
		log.Fatal(err)
	}
	sort.Slice(versions, func(i, j int) bool {
		return versionSet[versions[i]] < versionSet[versions[j]]
	}) // ascending, in-place
	fmt.Println(versions)
	return
}

// create or truncate a target file for writing a tsv
func ensureTargetFile(dir, version, kind, relation string) *os.File {
	targetDir := path.Join(dir, version, kind)
	if err := os.MkdirAll(targetDir, os.ModeDir|0o776); err != nil {
		log.Fatal(err)
	}
	targetFilePath := path.Join(targetDir, relation+".tsv")
	file, err := os.Create(targetFilePath)
	if err != nil {
		log.Fatal(err)
	}
	return file
}

func scrape12Minus(html *colly.HTMLElement, dataDir, version, kind, relation string) {
	tableEl := html.DOM.Find("table.table, table.CALSTABLE").First()
	ths := tableEl.Find("thead").First().Find("th")
	headers := make([]string, ths.Length())
	ths.Each(func(i int, th *goquery.Selection) {
		headers[i] = normalizeString(th.Text())
	})
	trs := tableEl.Find("tbody tr")
	if trs.Length() == 0 {
		log.Warnf("no rows: %s\n", html.Request.URL)
		return
	}
	file := ensureTargetFile(dataDir, version, kind, relation)
	tsv := bufio.NewWriter(file)
	defer func() {
		if err := tsv.Flush(); err != nil {
			log.Fatal(err)
		}
		if err := file.Close(); err != nil {
			log.Fatal(err)
		}
	}()
	tsv.WriteString(common.TsvHeader)
	index := 0
	trs.Each(func(i int, tr *goquery.Selection) {
		col := common.ColData{}
		tr.Find("td").Each(func(j int, td *goquery.Selection) {
			text := normalizeString(td.Text())
			if j >= len(headers) {
				return // we can ignore this row
				// log.Fatalf("row %d column %d out of range of headers: %v @ %s", i, j, headers, html.Request.URL)
			}
			switch headers[j] {
			case "Name", "name":
				col.Name = text
			case "References", "references":
				col.References = text
			case "Data Type", "data type", "type":
				col.Type = text
			case "Description", "description":
				col.Description = sanitizeString(dedentRe.ReplaceAllString(text, " "))
				col.Description = purgeSectionRefs(col.Description)
			default:
				log.Fatalf("unknown header: '%s' @ %s", headers[j], html.Request.URL)
			}
		})
		if strings.Contains(col.Description, "explicitly selected") {
			col.Index = -1
		} else {
			index += 1
			col.Index = index
		}
		tsv.WriteString(col.TsvRow())
	})
}

func scrape13Plus(page *colly.HTMLElement, dataDir, version, kind, relation string) {
	rows := page.DOM.Find("table.table, table.CALSTABLE").First().Find("table tbody tr")
	if rows.Length() == 0 {
		log.Warnf("no rows: %s\n", page.Request.URL)
	}
	file := ensureTargetFile(dataDir, version, kind, relation)
	tsv := bufio.NewWriter(file)
	defer func() {
		if err := tsv.Flush(); err != nil {
			log.Fatal(err)
		}
		if err := file.Close(); err != nil {
			log.Fatal(err)
		}
	}()
	tsv.WriteString(common.TsvHeader)
	rows.Each(func(i int, tr *goquery.Selection) {
		col := common.ColData{Index: i + 1}
		row := tr.Find(".column_definition").First()
		colNames := row.Find(".structfield")
		col.Name = normalizeString(colNames.First().Text())
		col.Type = normalizeString(tr.Find(".type").First().Text())
		notes := normalizeString(row.NextAll().Filter("p").Text())
		notes = dedentRe.ReplaceAllString(notes, " ")
		notes = purgeSectionRefs(notes)
		col.Description = sanitizeString(notes)
		tsv.WriteString(col.TsvRow())
	})
}

func hasSectionRef(doc string) bool {
	doc = strings.ToLower(doc)
	return strings.Contains(doc, "see section")
}

var forDetailsSee = regexp.MustCompile(`;?\s*for\s+details\s+see\s+section [0-9.]+\s*`)
var sectionRef = regexp.MustCompile(`\s*[sS]ee [sS]ection [0-9.]+(\s+for\s+(more information|details)\s*[.]?|)?`)
var sectionRef2 = regexp.MustCompile(`\s*\(?[sS]ee\s+[sS]ection\s+[^)]+\)`)

func purgeSectionRefs(s string) string {
	if hasSectionRef(s) {
		s = forDetailsSee.ReplaceAllString(s, "")
		s = sectionRef2.ReplaceAllString(s, "")
		s = sectionRef.ReplaceAllString(s, "")
		s = strings.TrimRight(s, whitespaceChars+",;")
	}
	return s
}

func collectAllUrlsToScrape(baseCollector *colly.Collector, siteDir string, versions []string) (urls []string) {
	collector := baseCollector.Clone()
	// nRoutines := runtime.NumCPU()*2 - 1
	// collector.Limit(&colly.LimitRule{Parallelism: nRoutines - runtime.NumCPU()})
	wg := sync.WaitGroup{}

	urlChan := make(chan string)
	wg.Add(1)
	go func() {
		defer wg.Done()
		for {
			if url, ok := <-urlChan; ok {
				urls = append(urls, url)
			} else {
				break
			}
		}
	}()
	collector.OnHTML("div.toc a[href], div.TOC a[href]", func(a *colly.HTMLElement) {
		href := a.Request.AbsoluteURL(a.Attr("href"))
		urlChan <- href
	})
	for _, version := range versions {
		url := fmt.Sprintf("file://%s/docs/%s/catalogs.html", siteDir, version)
		err := collector.Visit(url)
		if err != nil {
			log.Fatal(err)
		}
		err = collector.Visit(fmt.Sprintf("file://%s/docs/%s/views.html", siteDir, version))
		if err != nil {
			log.Fatal(err)
		}
	}
	collector.Wait()
	close(urlChan)
	wg.Wait()

	sort.Strings(urls)
	return
}

func scrapeEverything(dataDir string, dbg bool) {
	var err error
	dataDir, err = filepath.Abs(dataDir)
	if err != nil {
		log.Fatal(err)
	}
	siteDir := path.Join(dataDir, "site")

	localFileTransport := &http.Transport{}
	localFileTransport.RegisterProtocol("file", http.NewFileTransport(http.Dir("/")))
	baseCollector := colly.NewCollector()
	baseCollector.WithTransport(localFileTransport)
	if dbg {
		baseCollector.SetDebugger(&debug.LogDebugger{})
	}
	allPgVersions := getVersions(baseCollector, siteDir)

	baseCollector.Async = true
	baseCollector.URLFilters = []*regexp.Regexp{
		regexp.MustCompile(`^file://` + siteDir + `/docs/[0-9.]+`),
	}

	urls := collectAllUrlsToScrape(baseCollector, siteDir, allPgVersions)
	re := regexp.MustCompile(`[a-zA-Z_]+$`)
	progress := pb.New(len(urls))
	progress.Start()
	collector := baseCollector.Clone() // just in case

	collector.OnHTML("html", func(html *colly.HTMLElement) {
		defer progress.Increment()
		parts := strings.Split(strings.Split(html.Request.URL.Path, "/docs/")[1], "/")
		if len(parts) != 2 {
			log.Fatalf("unexpected url parts: %v", parts)
		}
		version := parts[0] // we can be sure this is the version thanks to the url filter!

		kind := "catalog"
		if !strings.HasPrefix(parts[1], "catalog-") {
			if strings.HasPrefix(parts[1], "view-") {
				kind = "view"
			} else if strings.HasSuffix(parts[1], "-overview.html") {
				return // ignore the overview pages
			} else {
				log.Fatalf("unexpected pg_catalog relation kind: %s", parts[1])
			}
		}
		relation := strings.TrimSuffix(parts[1], ".html")
		relation = strings.TrimPrefix(relation, kind+"-")
		relation = strings.ReplaceAll(relation, "-", "_")
		title := normalizeString(html.DOM.Find("title").Text()) // 13+ sometimes have 0-width or non-breaking spaces thrown in
		tableName := strings.Trim(strings.ToLower(re.FindString(title)), " ")
		if tableName != relation {
			log.Fatalf("relation '%s' != '%s' title", relation, tableName)
		}
		if v, err := strconv.ParseFloat(version, 32); err == nil {
			if v >= 13 {
				scrape13Plus(html, dataDir, version, kind, relation)
			} else {
				scrape12Minus(html, dataDir, version, kind, relation)
			}
		} else {
			panic(err)
		}
	})
	for _, url := range urls {
		collector.Visit(url)
	}
	collector.Wait()
}

func main() {
	scrapeEverything("./data", false)
}
