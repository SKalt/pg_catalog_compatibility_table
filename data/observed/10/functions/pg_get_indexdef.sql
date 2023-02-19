CREATE OR REPLACE FUNCTION pg_catalog.pg_get_indexdef(oid)
 RETURNS text
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_get_indexdef$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_get_indexdef(oid, integer, boolean)
 RETURNS text
 LANGUAGE internal
 STABLE STRICT
AS $function$pg_get_indexdef_ext$function$
;
