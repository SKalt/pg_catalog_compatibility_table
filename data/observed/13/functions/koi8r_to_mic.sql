CREATE OR REPLACE FUNCTION pg_catalog.koi8r_to_mic(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/cyrillic_and_mic', $function$koi8r_to_mic$function$
;
