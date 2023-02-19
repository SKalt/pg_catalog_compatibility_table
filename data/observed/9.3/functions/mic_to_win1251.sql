CREATE OR REPLACE FUNCTION pg_catalog.mic_to_win1251(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/cyrillic_and_mic', $function$mic_to_win1251$function$
;
