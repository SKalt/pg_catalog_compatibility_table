CREATE OR REPLACE FUNCTION pg_catalog.has_schema_privilege(name, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_schema_privilege_name_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_schema_privilege(name, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_schema_privilege_name_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_schema_privilege(oid, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_schema_privilege_id_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_schema_privilege(oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_schema_privilege_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_schema_privilege(oid, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_schema_privilege_id_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_schema_privilege(text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$has_schema_privilege_name$function$
;
