CREATE OR REPLACE FUNCTION pg_catalog.uhc_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/utf8_and_uhc', $function$uhc_to_utf8$function$
;
