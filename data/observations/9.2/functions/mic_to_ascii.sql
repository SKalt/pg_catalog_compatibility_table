CREATE OR REPLACE FUNCTION pg_catalog.mic_to_ascii(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/ascii_and_mic', $function$mic_to_ascii$function$
;
