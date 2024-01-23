CREATE OR REPLACE FUNCTION pg_catalog.koi8u_to_utf8(integer, integer, cstring, internal, integer, boolean)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/utf8_and_cyrillic', $function$koi8u_to_utf8$function$
;
