CREATE OR REPLACE FUNCTION pg_catalog.pg_get_viewdef(oid)
 RETURNS text
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_get_viewdef$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_get_viewdef(oid, boolean)
 RETURNS text
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_get_viewdef_ext$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_get_viewdef(oid, integer)
 RETURNS text
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_get_viewdef_wrap$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_get_viewdef(text)
 RETURNS text
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_get_viewdef_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_get_viewdef(text, boolean)
 RETURNS text
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_get_viewdef_name_ext$function$
;
