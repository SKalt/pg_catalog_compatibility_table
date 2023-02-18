CREATE OR REPLACE FUNCTION pg_catalog.json_to_tsvector(json, jsonb)
 RETURNS tsvector
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$json_to_tsvector$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.json_to_tsvector(regconfig, json, jsonb)
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$json_to_tsvector_byid$function$
;
