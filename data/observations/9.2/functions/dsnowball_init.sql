CREATE OR REPLACE FUNCTION pg_catalog.dsnowball_init(internal)
 RETURNS internal
 LANGUAGE c
 STRICT
AS '$libdir/dict_snowball', $function$dsnowball_init$function$
;
