CREATE OR REPLACE FUNCTION pg_catalog.plpgsql_validator(oid)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/plpgsql', $function$plpgsql_validator$function$
;
