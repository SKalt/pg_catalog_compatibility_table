package common

import "fmt"

const (
	TsvColIndex = iota
	TsvColName
	TsvColType
	TsvColReferences
	TsvColNullable
	TsvColDescription
)

type ColData struct {
	Index                             int
	Name, Type                        string // must be present
	References, Nullable, Description string // may be absent
}

const ColTsvHeader = "Index	Name	Type	Nullable	References	Description\n"

func (c ColData) TsvRow() string {
	return fmt.Sprintf(
		"%d\t%s\t%s\t%s\t%s\t%s\n",
		c.Index,
		escapeTsvField(c.Name),
		escapeTsvField(c.Type),
		escapeTsvField(c.Nullable),
		escapeTsvField(c.References),
		escapeTsvField(c.Description),
	)
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
		escapeTsvField(fn.Name),
		escapeTsvField(fn.IdentityArgs),
		escapeTsvField(fn.ReturnType),
	)
}

func escapeTsvField(s string) string {
	// s must have already been trimmed
	fixed := make([]rune, 0, len(s))
	needsQuote := false
	for _, c := range s {
		switch c {
		case '"':
			needsQuote = true
			fixed = append(fixed, '"', '"')
			break
		case '\n':
			needsQuote = true
			fixed = append(fixed, '\\', 'n')
			break
		case '\t':
			needsQuote = true
			fixed = append(fixed, '\\', 't')
			break
		case '\r':
			needsQuote = true // ignore it
		case ' ':
			needsQuote = true
			fixed = append(fixed, c)
			break
		default:
			fixed = append(fixed, c)
			break
		}
	}
	result := string(fixed)
	if needsQuote {
		result = `"` + result + `"`
	}
	return result
}
