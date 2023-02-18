CREATE OR REPLACE FUNCTION pg_catalog.jsonb_path_query_first(target jsonb, path jsonpath, vars jsonb DEFAULT '{}'::jsonb, silent boolean DEFAULT false)
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_path_query_first$function$
;
