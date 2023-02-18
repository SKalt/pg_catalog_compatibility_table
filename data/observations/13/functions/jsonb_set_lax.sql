CREATE OR REPLACE FUNCTION pg_catalog.jsonb_set_lax(jsonb_in jsonb, path text[], replacement jsonb, create_if_missing boolean DEFAULT true, null_value_treatment text DEFAULT 'use_json_null'::text)
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE
AS $function$jsonb_set_lax$function$
;
