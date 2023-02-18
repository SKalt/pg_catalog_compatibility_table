CREATE OR REPLACE FUNCTION pg_catalog.mic_to_latin4(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/latin_and_mic', $function$mic_to_latin4$function$
;
