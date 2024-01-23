CREATE OR REPLACE FUNCTION pg_catalog.iso8859_1_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/utf8_and_iso8859_1', $function$iso8859_1_to_utf8$function$
;
