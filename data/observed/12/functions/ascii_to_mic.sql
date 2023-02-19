CREATE OR REPLACE FUNCTION pg_catalog.ascii_to_mic(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/ascii_and_mic', $function$ascii_to_mic$function$
;
