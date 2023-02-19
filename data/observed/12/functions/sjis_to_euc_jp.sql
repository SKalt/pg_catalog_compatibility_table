CREATE OR REPLACE FUNCTION pg_catalog.sjis_to_euc_jp(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/euc_jp_and_sjis', $function$sjis_to_euc_jp$function$
;
