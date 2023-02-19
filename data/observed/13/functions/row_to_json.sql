CREATE OR REPLACE FUNCTION pg_catalog.row_to_json(record)
 RETURNS json
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$row_to_json$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.row_to_json(record, boolean)
 RETURNS json
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$row_to_json_pretty$function$
;
