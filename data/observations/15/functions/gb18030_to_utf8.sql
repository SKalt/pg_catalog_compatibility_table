CREATE OR REPLACE FUNCTION pg_catalog.gb18030_to_utf8(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_gb18030', $function$gb18030_to_utf8$function$
;
