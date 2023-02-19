CREATE OR REPLACE FUNCTION pg_catalog.pg_event_trigger_dropped_objects(OUT classid oid, OUT objid oid, OUT objsubid integer, OUT original boolean, OUT normal boolean, OUT is_temporary boolean, OUT object_type text, OUT schema_name text, OUT object_name text, OUT object_identity text, OUT address_names text[], OUT address_args text[])
 RETURNS SETOF record
 LANGUAGE internal
 STABLE STRICT COST 10 ROWS 100
AS $function$pg_event_trigger_dropped_objects$function$
;
