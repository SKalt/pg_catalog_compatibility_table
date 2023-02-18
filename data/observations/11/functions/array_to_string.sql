CREATE OR REPLACE FUNCTION pg_catalog.array_to_string(anyarray, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$array_to_text$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.array_to_string(anyarray, text, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE
AS $function$array_to_text_null$function$
;
