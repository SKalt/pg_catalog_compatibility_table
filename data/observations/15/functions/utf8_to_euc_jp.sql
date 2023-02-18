CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_euc_jp(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_euc_jp', $function$utf8_to_euc_jp$function$
;
