CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_euc_tw(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/utf8_and_euc_tw', $function$utf8_to_euc_tw$function$
;
