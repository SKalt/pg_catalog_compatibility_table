CREATE OR REPLACE FUNCTION pg_catalog.col_description(oid, integer)
 RETURNS text
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
AS $function$select description from pg_catalog.pg_description where objoid = $1 and classoid = 'pg_catalog.pg_class'::pg_catalog.regclass and objsubid = $2$function$
;
