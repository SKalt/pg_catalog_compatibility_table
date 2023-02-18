CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_shift_jis_2004(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_sjis2004', $function$utf8_to_shift_jis_2004$function$
;
