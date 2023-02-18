CREATE OR REPLACE FUNCTION pg_catalog.jsonb_to_tsvector(jsonb, jsonb)
 RETURNS tsvector
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT COST 100
AS $function$jsonb_to_tsvector$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.jsonb_to_tsvector(regconfig, jsonb, jsonb)
 RETURNS tsvector
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS $function$jsonb_to_tsvector_byid$function$
;
