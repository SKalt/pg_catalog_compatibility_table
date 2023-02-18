CREATE OR REPLACE FUNCTION pg_catalog.char_length(character)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bpcharlen$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.char_length(text)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textlen$function$
;
