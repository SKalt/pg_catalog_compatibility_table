CREATE OR REPLACE FUNCTION pg_catalog.jsonb_path_match_tz(target jsonb, path jsonpath, vars jsonb DEFAULT '{}'::jsonb, silent boolean DEFAULT false)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$jsonb_path_match_tz$function$
;
