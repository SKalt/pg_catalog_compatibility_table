CREATE OR REPLACE FUNCTION pg_catalog.koi8r_to_win1251(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/cyrillic_and_mic', $function$koi8r_to_win1251$function$
;
