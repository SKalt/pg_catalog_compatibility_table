CREATE OR REPLACE FUNCTION pg_catalog.iso8859_to_utf8(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_iso8859', $function$iso8859_to_utf8$function$
;
