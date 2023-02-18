CREATE OR REPLACE FUNCTION pg_catalog.utf8_to_sjis(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_sjis', $function$utf8_to_sjis$function$
;
