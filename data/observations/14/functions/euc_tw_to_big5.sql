CREATE OR REPLACE FUNCTION pg_catalog.euc_tw_to_big5(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/euc_tw_and_big5', $function$euc_tw_to_big5$function$
;
