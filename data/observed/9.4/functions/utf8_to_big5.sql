CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_big5(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/utf8_and_big5', $function$utf8_to_big5$function$
;
