CREATE OR REPLACE FUNCTION pg_catalog.win1250_to_mic(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/latin2_and_win1250', $function$win1250_to_mic$function$
;
