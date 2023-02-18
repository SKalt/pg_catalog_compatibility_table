CREATE OR REPLACE FUNCTION pg_catalog.path_contain_pt(path, point)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.on_ppath($2, $1)$function$
;
