CREATE OR REPLACE FUNCTION pg_catalog.shobj_description(oid, name)
 RETURNS text
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
AS $function$select description from pg_catalog.pg_shdescription where objoid = $1 and classoid = (select oid from pg_catalog.pg_class where relname = $2 and relnamespace = 11)$function$
;
