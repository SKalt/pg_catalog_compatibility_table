CREATE OR REPLACE FUNCTION pg_catalog.pg_get_constraintdef(oid)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_get_constraintdef$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_get_constraintdef(oid, boolean)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_get_constraintdef_ext$function$
;
