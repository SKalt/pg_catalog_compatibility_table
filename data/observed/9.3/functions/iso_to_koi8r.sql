CREATE OR REPLACE FUNCTION pg_catalog.iso_to_koi8r(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/cyrillic_and_mic', $function$iso_to_koi8r$function$
;
