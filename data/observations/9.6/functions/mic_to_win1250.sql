CREATE OR REPLACE FUNCTION pg_catalog.mic_to_win1250(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/latin2_and_win1250', $function$mic_to_win1250$function$
;
