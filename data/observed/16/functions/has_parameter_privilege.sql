CREATE OR REPLACE FUNCTION pg_catalog.has_parameter_privilege(name, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_parameter_privilege_name_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_parameter_privilege(oid, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_parameter_privilege_id_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_parameter_privilege(text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_parameter_privilege_name$function$
;
