CREATE OR REPLACE FUNCTION pg_catalog.aclexplode(acl aclitem[], OUT grantor oid, OUT grantee oid, OUT privilege_type text, OUT is_grantable boolean)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT ROWS 10
AS $function$aclexplode$function$
;
