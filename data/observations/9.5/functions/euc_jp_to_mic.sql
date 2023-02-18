CREATE OR REPLACE FUNCTION pg_catalog.euc_jp_to_mic(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/euc_jp_and_sjis', $function$euc_jp_to_mic$function$
;
