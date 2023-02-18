CREATE OR REPLACE FUNCTION pg_catalog.jsonb_path_query_array_tz(target jsonb, path jsonpath, vars jsonb DEFAULT '{}'::jsonb, silent boolean DEFAULT false)
 RETURNS jsonb
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$jsonb_path_query_array_tz$function$
;
