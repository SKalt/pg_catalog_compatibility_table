CREATE OR REPLACE FUNCTION pg_catalog.euc_tw_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_euc_tw', $function$euc_tw_to_utf8$function$
;
