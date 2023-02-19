CREATE OR REPLACE FUNCTION pg_catalog.pg_get_wal_resource_managers(OUT rm_id integer, OUT rm_name text, OUT rm_builtin boolean)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT ROWS 50
AS $function$pg_get_wal_resource_managers$function$
;
