CREATE OR REPLACE FUNCTION pg_catalog.jsonb_each_text(from_json jsonb, OUT key text, OUT value text)
 RETURNS SETOF record
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT ROWS 100
AS $function$jsonb_each_text$function$
;
