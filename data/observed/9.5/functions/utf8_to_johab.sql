CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_johab(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/utf8_and_johab', $function$utf8_to_johab$function$
;
