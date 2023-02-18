CREATE OR REPLACE FUNCTION pg_catalog.pg_event_trigger_ddl_commands(OUT classid oid, OUT objid oid, OUT objsubid integer, OUT command_tag text, OUT object_type text, OUT schema_name text, OUT object_identity text, OUT in_extension boolean, OUT command pg_ddl_command)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED STRICT COST 10 ROWS 100
AS $function$pg_event_trigger_ddl_commands$function$
;
