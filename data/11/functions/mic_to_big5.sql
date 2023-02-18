CREATE OR REPLACE FUNCTION pg_catalog.mic_to_big5(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/euc_tw_and_big5', $function$mic_to_big5$function$
;
