package common

import (
	"fmt"
	"strings"

	tsvUtils "github.com/SKalt/pg_catalog_compatibility_table/pkg/tsv_utils"
)

func CorrectTypeName(type_ string) string {
	switch type_ {
	case "boolean":
		return "bool"
	case "smallint":
		return "int2"
	case "integer":
		return "int4"
	case "bigint":
		return "int8"
	case "smallint[]":
		return "int2[]"
	case "integer[]":
		return "int4[]"
	case "bigint[]":
		return "int8[]"
	case "timestamp with time zone":
		return "timestamptz"
	case "real":
		return "float4"
	case "real[]":
		return "float4[]"
	default:
		return type_
	}
}

type ObservedColData struct {
	Name, Type, Nullable string // must be present
}

const ObservedColTsvHeader = "Name\tType\tNullable\tDefault\n"
const (
	ObservedTsvColName = iota
	ObservedTsvColType
	ObservedTsvColNullable
	ObservedTsvNFields
)

func (c ObservedColData) TsvRow() string {
	return fmt.Sprintf(
		"%s\t%s\t%s\n",
		tsvUtils.EscapeTsvField(c.Name),
		tsvUtils.EscapeTsvField(c.Type),
		tsvUtils.EscapeTsvField(c.Nullable),
	)
}

func ParseObservedTsv(data string) (result []ObservedColData, err error) {
	lines := strings.Split(data, "\n")
	result = make([]ObservedColData, 0, len(lines)-2)
	for i, line := range lines {
		if i == 0 || line == "" {
			continue // skip header, footer
		}
		parts := strings.Split(line, "\t")
		if len(parts) != ObservedTsvNFields {
			err = fmt.Errorf("unexpected number of fields in line: %d", len(parts))
			return
		}
		result = append(result, ObservedColData{
			Name:     parts[ObservedTsvColName],
			Type:     parts[ObservedTsvColType],
			Nullable: parts[ObservedTsvColNullable],
		})
	}
	return
}
