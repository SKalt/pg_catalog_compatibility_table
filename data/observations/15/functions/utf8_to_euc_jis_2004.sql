CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_euc_jis_2004(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_euc2004', $function$utf8_to_euc_jis_2004$function$
;
