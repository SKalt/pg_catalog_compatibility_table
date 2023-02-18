CREATE OR REPLACE FUNCTION pg_catalog.pg_identify_object_as_address(classid oid, objid oid, subobjid integer, OUT type text, OUT object_names text[], OUT object_args text[])
 RETURNS record
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_identify_object_as_address$function$
;
