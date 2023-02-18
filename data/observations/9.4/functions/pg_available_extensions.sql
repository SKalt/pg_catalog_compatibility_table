CREATE OR REPLACE FUNCTION pg_catalog.pg_available_extensions(OUT name name, OUT default_version text, OUT comment text)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE STRICT COST 10 ROWS 100
AS $function$pg_available_extensions$function$
;
