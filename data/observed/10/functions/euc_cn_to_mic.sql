CREATE OR REPLACE FUNCTION pg_catalog.euc_cn_to_mic(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/euc_cn_and_mic', $function$euc_cn_to_mic$function$
;
