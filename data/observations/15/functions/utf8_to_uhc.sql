CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_uhc(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_uhc', $function$utf8_to_uhc$function$
;
