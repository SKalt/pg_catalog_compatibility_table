package common

import (
	"fmt"
	"strings"

	tsvUtils "github.com/SKalt/pg_catalog_compatibility_table/pkg/tsv_utils"
)

type CombinedColData struct {
	Name, Type, Nullable, References, Description string // must be present
}

const CombinedColTsvHeader = "Name\tType\tNullable\tReferences\tDescription\n"
const (
	ComboColTsvName = iota
	ComboColTsvType
	ComboColTsvNullable
	ComboColTsvReferences
	ComboColTsvDescription
	ComboColTsvNFields
)

func (c CombinedColData) TsvRow() string {
	return fmt.Sprintf(
		"%s\t%s\t%s\t%s\t%s\n",
		tsvUtils.EscapeTsvField(c.Name),
		tsvUtils.EscapeTsvField(c.Type),
		tsvUtils.EscapeTsvField(c.Nullable),
		tsvUtils.EscapeTsvField(c.References),
		tsvUtils.EscapeTsvField(c.Description),
	)
}

func ParseCombinedColTsv(data string) (result []CombinedColData, err error) {
	lines := strings.Split(data, "\n")
	result = make([]CombinedColData, 0, len(lines)-2)
	for i, line := range lines {
		if i == 0 || line == "" {
			continue // skip header, footer
		}
		parts := strings.Split(line, "\t")
		if len(parts) != ComboColTsvNFields {
			err = fmt.Errorf("unexpected number of fields in line: %d", len(parts))
			return
		}
		result = append(result, CombinedColData{
			Name:        tsvUtils.UnescapeTsvCell(parts[ComboColTsvName]),
			Type:        tsvUtils.UnescapeTsvCell(parts[ComboColTsvType]),
			Nullable:    tsvUtils.UnescapeTsvCell(parts[ComboColTsvNullable]),
			References:  tsvUtils.UnescapeTsvCell(parts[ComboColTsvReferences]),
			Description: tsvUtils.UnescapeTsvCell(parts[ComboColTsvDescription]),
		})
	}
	return
}
