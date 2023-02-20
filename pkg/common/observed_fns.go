package common

import (
	"fmt"
	"strings"

	tsvUtils "github.com/SKalt/pg_catalog_compatibility_table/pkg/tsv_utils"
)

const (
	ObservedFnTsvName = iota
	ObservedFnTsvArgs
	ObservedFnTsvReturnType
	ObservedFnTsvNFields
)

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

func ParseObservedFnTsv(data string) (result []FnData, err error) {
	lines := strings.Split(data, "\n")
	result = make([]FnData, 0, len(lines)-2)
	for i, line := range lines {
		if i == 0 || line == "" {
			continue // skip header, footer
		}
		parts := strings.Split(line, "\t")
		if len(parts) != ObservedFnTsvNFields {
			err = fmt.Errorf("unexpected number of fields in line: %d", len(parts))
			return
		}
		result = append(result, FnData{
			Name:         tsvUtils.UnescapeTsvCell(parts[ObservedFnTsvName]),
			IdentityArgs: tsvUtils.UnescapeTsvCell(parts[ObservedFnTsvArgs]),
			ReturnType:   tsvUtils.UnescapeTsvCell(parts[ObservedFnTsvReturnType]),
		})
	}
	return
}
