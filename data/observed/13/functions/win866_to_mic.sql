CREATE OR REPLACE FUNCTION pg_catalog.win866_to_mic(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/cyrillic_and_mic', $function$win866_to_mic$function$
;
