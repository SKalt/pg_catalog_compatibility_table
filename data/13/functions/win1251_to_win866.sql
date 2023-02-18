CREATE OR REPLACE FUNCTION pg_catalog.win1251_to_win866(integer, integer, cstring, internal, integer)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/cyrillic_and_mic', $function$win1251_to_win866$function$
;
