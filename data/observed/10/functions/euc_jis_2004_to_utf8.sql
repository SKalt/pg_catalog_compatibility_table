CREATE OR REPLACE FUNCTION pg_catalog.euc_jis_2004_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/utf8_and_euc2004', $function$euc_jis_2004_to_utf8$function$
;
