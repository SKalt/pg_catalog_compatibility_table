CREATE OR REPLACE FUNCTION pg_catalog.koi8r_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/utf8_and_cyrillic', $function$koi8r_to_utf8$function$
;
