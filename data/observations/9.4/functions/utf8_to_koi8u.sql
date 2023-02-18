CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_koi8u(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/utf8_and_cyrillic', $function$utf8_to_koi8u$function$
;
