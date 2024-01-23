CREATE OR REPLACE FUNCTION pg_catalog.shift_jis_2004_to_utf8(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_sjis2004', $function$shift_jis_2004_to_utf8$function$
;
