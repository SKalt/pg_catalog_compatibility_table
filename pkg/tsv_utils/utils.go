package tsvUtils

import "strings"

func EscapeTsvField(s string) string {
	// s must have already been trimmed
	fixed := make([]rune, 0, len(s))
	needsQuote := false
	for _, c := range s {
		switch c {
		case '"':
			needsQuote = true
			fixed = append(fixed, '"', '"')
		case '\n':
			needsQuote = true
			fixed = append(fixed, '\\', 'n')
		case '\t':
			needsQuote = true
			fixed = append(fixed, '\\', 't')
		case '\r':
			needsQuote = true // ignore it
		case ' ':
			needsQuote = true
			fixed = append(fixed, c)
		default:
			fixed = append(fixed, c)
		}
	}
	result := string(fixed)
	if needsQuote {
		result = `"` + result + `"`
	}
	return result
}

func UnescapeTsvCell(cell string) string {
	if strings.HasPrefix(cell, `"`) {
		return strings.ReplaceAll(strings.Trim(cell, `"`), `""`, `"`)
	} else {
		return cell // doesn't need un-escaping!
	}
}
