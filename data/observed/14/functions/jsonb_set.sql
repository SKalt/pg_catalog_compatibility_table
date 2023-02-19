CREATE OR REPLACE FUNCTION pg_catalog.jsonb_set(jsonb_in jsonb, path text[], replacement jsonb, create_if_missing boolean DEFAULT true)
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_set$function$
;
