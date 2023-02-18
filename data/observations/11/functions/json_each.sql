CREATE OR REPLACE FUNCTION pg_catalog.json_each(from_json json, OUT key text, OUT value json)
 RETURNS SETOF record
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT ROWS 100
AS $function$json_each$function$
;
