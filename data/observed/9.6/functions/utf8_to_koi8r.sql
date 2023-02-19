CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_koi8r(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/utf8_and_cyrillic', $function$utf8_to_koi8r$function$
;
