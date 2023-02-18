CREATE OR REPLACE FUNCTION pg_catalog.pg_identify_object(classid oid, objid oid, subobjid integer, OUT type text, OUT schema text, OUT name text, OUT identity text)
 RETURNS record
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_identify_object$function$
;
