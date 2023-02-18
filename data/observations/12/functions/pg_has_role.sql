CREATE OR REPLACE FUNCTION pg_catalog.pg_has_role(name, name, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_has_role_name_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_has_role(name, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_has_role_name_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_has_role(name, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_has_role_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_has_role(oid, name, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_has_role_id_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_has_role(oid, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_has_role_id_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_has_role(oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_has_role_id$function$
;
