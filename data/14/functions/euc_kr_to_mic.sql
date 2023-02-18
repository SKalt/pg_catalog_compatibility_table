CREATE OR REPLACE FUNCTION pg_catalog.euc_kr_to_mic(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/euc_kr_and_mic', $function$euc_kr_to_mic$function$
;
