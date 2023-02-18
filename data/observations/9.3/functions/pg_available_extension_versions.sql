CREATE OR REPLACE FUNCTION pg_catalog.pg_available_extension_versions(OUT name name, OUT version text, OUT superuser boolean, OUT relocatable boolean, OUT schema name, OUT requires name[], OUT comment text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE STRICT COST 10 ROWS 100
AS $function$pg_available_extension_versions$function$
;
