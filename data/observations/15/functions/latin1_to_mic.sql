CREATE OR REPLACE FUNCTION pg_catalog.latin1_to_mic(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/latin_and_mic', $function$latin1_to_mic$function$
;
