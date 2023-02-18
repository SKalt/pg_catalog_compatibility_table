CREATE OR REPLACE FUNCTION pg_catalog.euc_tw_to_big5(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/euc_tw_and_big5', $function$euc_tw_to_big5$function$
;
