CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_ascii(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_ascii', $function$utf8_to_ascii$function$
;
