CREATE OR REPLACE FUNCTION pg_catalog.array_to_json(anyarray)
 RETURNS json
 LANGUAGE internal
 STABLE STRICT
AS $function$array_to_json$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.array_to_json(anyarray, boolean)
 RETURNS json
 LANGUAGE internal
 STABLE STRICT
AS $function$array_to_json_pretty$function$
;
