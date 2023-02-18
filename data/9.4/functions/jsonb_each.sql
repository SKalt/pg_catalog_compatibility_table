CREATE OR REPLACE FUNCTION pg_catalog.jsonb_each(from_json jsonb, OUT key text, OUT value jsonb)
 RETURNS SETOF record
 LANGUAGE internal
 IMMUTABLE STRICT ROWS 100
AS $function$jsonb_each$function$
;
