CREATE OR REPLACE FUNCTION pg_catalog.obj_description(oid)
 RETURNS text
 LANGUAGE sql
 STABLE STRICT
AS $function$select description from pg_catalog.pg_description where objoid = $1 and objsubid = 0$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.obj_description(oid, name)
 RETURNS text
 LANGUAGE sql
 STABLE STRICT
AS $function$select description from pg_catalog.pg_description where objoid = $1 and classoid = (select oid from pg_catalog.pg_class where relname = $2 and relnamespace = 11) and objsubid = 0$function$
;
