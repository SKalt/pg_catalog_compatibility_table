package common

import (
	"fmt"
	"strings"

	tsvUtils "github.com/SKalt/pg_catalog_compatibility_table/pkg/tsv_utils"
)

type ScrapedColData struct {
	Name, Type, Description string // must be present
	References              string // may be absent
}

const ScrapedColTsvHeader = "Name\tType\tReferences\tDescription\n"
const (
	ScrapedTsvColName = iota
	ScrapedTsvColType
	ScrapedTsvColReferences
	ScrapedTsvColDescription
	ScrapedTsvNFields
)

func (c ScrapedColData) TsvRow() string {
	return fmt.Sprintf(
		"%s\t%s\t%s\t%s\n",
		tsvUtils.EscapeTsvField(c.Name),
		tsvUtils.EscapeTsvField(c.Type),
		tsvUtils.EscapeTsvField(c.References),
		tsvUtils.EscapeTsvField(c.Description),
	)
}

func ParseScrapedTsv(data string) (result []ScrapedColData, err error) {
	lines := strings.Split(data, "\n")
	result = make([]ScrapedColData, 0, len(lines)-2)
	for i, line := range lines {
		if i == 0 || line == "" {
			continue // skip header, footer
		}
		parts := strings.Split(line, "\t")
		if len(parts) != ScrapedTsvNFields {
			err = fmt.Errorf("unexpected number of fields in line: %d", len(parts))
			return
		}
		result = append(result, ScrapedColData{
			Name:        parts[ScrapedTsvColName],
			Type:        parts[ScrapedTsvColType],
			References:  parts[ScrapedTsvColReferences],
			Description: parts[ScrapedTsvColDescription],
		})
	}
	return
}

// const (
//
//	TsvFnName = iota
//	TsvFnIdentityArgs
//	TsvFnResult
// )

const FnTsvHeader = "Name	Args	\"Return Type\"\n"

type FnData struct {
	Name, IdentityArgs, ReturnType string
}

func (fn FnData) TsvRow() string {
	return fmt.Sprintf(
		"%s\t%s\t%s\n",
		tsvUtils.EscapeTsvField(fn.Name),
		tsvUtils.EscapeTsvField(fn.IdentityArgs),
		tsvUtils.EscapeTsvField(fn.ReturnType),
	)
}
