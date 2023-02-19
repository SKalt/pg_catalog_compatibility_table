CREATE OR REPLACE FUNCTION pg_catalog.has_language_privilege(name, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_language_privilege_name_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_language_privilege(name, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_language_privilege_name_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_language_privilege(oid, oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_language_privilege_id_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_language_privilege(oid, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_language_privilege_id$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_language_privilege(oid, text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_language_privilege_id_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.has_language_privilege(text, text)
 RETURNS boolean
 LANGUAGE internal
 STABLE STRICT
AS $function$has_language_privilege_name$function$
;
