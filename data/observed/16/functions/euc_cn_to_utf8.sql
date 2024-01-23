CREATE OR REPLACE FUNCTION pg_catalog.euc_cn_to_utf8(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_euc_cn', $function$euc_cn_to_utf8$function$
;
