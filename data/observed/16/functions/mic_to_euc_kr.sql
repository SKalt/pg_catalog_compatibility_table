CREATE OR REPLACE FUNCTION pg_catalog.mic_to_euc_kr(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/euc_kr_and_mic', $function$mic_to_euc_kr$function$
;
