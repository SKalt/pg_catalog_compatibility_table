CREATE OR REPLACE FUNCTION pg_catalog.mic_to_latin3(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/latin_and_mic', $function$mic_to_latin3$function$
;
