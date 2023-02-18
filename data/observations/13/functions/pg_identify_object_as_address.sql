CREATE OR REPLACE FUNCTION pg_catalog.pg_identify_object_as_address(classid oid, objid oid, objsubid integer, OUT type text, OUT object_names text[], OUT object_args text[])
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_identify_object_as_address$function$
;
