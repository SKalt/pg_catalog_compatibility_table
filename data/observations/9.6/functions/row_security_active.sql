CREATE OR REPLACE FUNCTION pg_catalog.row_security_active(oid)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$row_security_active$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.row_security_active(text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$row_security_active_name$function$
;
