CREATE OR REPLACE FUNCTION pg_catalog.euc_jp_to_sjis(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/euc_jp_and_sjis', $function$euc_jp_to_sjis$function$
;
