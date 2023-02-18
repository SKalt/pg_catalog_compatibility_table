CREATE OR REPLACE FUNCTION pg_catalog.euc_kr_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/utf8_and_euc_kr', $function$euc_kr_to_utf8$function$
;
