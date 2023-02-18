CREATE OR REPLACE FUNCTION pg_catalog.jsonb_delete(from_json jsonb, VARIADIC path_elems text[])
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_delete_array$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.jsonb_delete(jsonb, integer)
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_delete_idx$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.jsonb_delete(jsonb, text)
 RETURNS jsonb
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_delete$function$
;
