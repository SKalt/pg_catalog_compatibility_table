CREATE OR REPLACE FUNCTION pg_catalog.gb18030_to_utf8(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/utf8_and_gb18030', $function$gb18030_to_utf8$function$
;
