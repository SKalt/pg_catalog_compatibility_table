CREATE OR REPLACE FUNCTION pg_catalog.pg_control_system(OUT pg_control_version integer, OUT catalog_version_no integer, OUT system_identifier bigint, OUT pg_control_last_modified timestamp with time zone)
 RETURNS record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_control_system$function$
;
