CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_uhc(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/utf8_and_uhc', $function$utf8_to_uhc$function$
;
