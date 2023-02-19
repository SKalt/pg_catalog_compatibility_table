CREATE OR REPLACE FUNCTION pg_catalog.euc_jis_2004_to_shift_jis_2004(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/euc2004_sjis2004', $function$euc_jis_2004_to_shift_jis_2004$function$
;
