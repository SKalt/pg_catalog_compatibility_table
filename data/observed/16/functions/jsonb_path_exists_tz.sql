CREATE OR REPLACE FUNCTION pg_catalog.jsonb_path_exists_tz(target jsonb, path jsonpath, vars jsonb DEFAULT '{}'::jsonb, silent boolean DEFAULT false)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$jsonb_path_exists_tz$function$
;
