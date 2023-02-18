CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_euc_cn(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_euc_cn', $function$utf8_to_euc_cn$function$
;
