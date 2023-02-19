CREATE OR REPLACE FUNCTION pg_catalog.big5_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_big5', $function$big5_to_utf8$function$
;
