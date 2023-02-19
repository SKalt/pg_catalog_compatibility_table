CREATE OR REPLACE FUNCTION pg_catalog.json_populate_recordset(base anyelement, from_json json, use_json_as_text boolean DEFAULT false)
 RETURNS SETOF anyelement
 LANGUAGE internal
 STABLE PARALLEL SAFE ROWS 100
AS $function$json_populate_recordset$function$
;
