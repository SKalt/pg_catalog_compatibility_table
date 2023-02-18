CREATE OR REPLACE FUNCTION pg_catalog.has_any_column_privilege(name, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10
AS $function$has_any_column_privilege_name_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_any_column_privilege(name, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10
AS $function$has_any_column_privilege_name_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_any_column_privilege(oid, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10
AS $function$has_any_column_privilege_id_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_any_column_privilege(oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10
AS $function$has_any_column_privilege_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_any_column_privilege(oid, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10
AS $function$has_any_column_privilege_id_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_any_column_privilege(text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 10
AS $function$has_any_column_privilege_name$function$
;
