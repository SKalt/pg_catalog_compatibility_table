CREATE OR REPLACE FUNCTION pg_catalog.has_function_privilege(name, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_function_privilege_name_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_function_privilege(name, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_function_privilege_name_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_function_privilege(oid, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_function_privilege_id_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_function_privilege(oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_function_privilege_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_function_privilege(oid, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_function_privilege_id_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_function_privilege(text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_function_privilege_name$function$
;
