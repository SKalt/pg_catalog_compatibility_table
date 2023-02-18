CREATE OR REPLACE FUNCTION pg_catalog.ascii_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/utf8_and_ascii', $function$ascii_to_utf8$function$
;
