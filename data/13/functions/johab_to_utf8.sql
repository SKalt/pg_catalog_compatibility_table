CREATE OR REPLACE FUNCTION pg_catalog.johab_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_johab', $function$johab_to_utf8$function$
;
