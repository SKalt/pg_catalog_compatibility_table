CREATE OR REPLACE FUNCTION pg_catalog.win1251_to_iso(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/cyrillic_and_mic', $function$win1251_to_iso$function$
;
