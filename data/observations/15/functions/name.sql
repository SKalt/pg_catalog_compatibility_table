CREATE OR REPLACE FUNCTION pg_catalog.name(character varying)
 RETURNS name
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT LEAKPROOF
AS $function$text_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.name(character)
 RETURNS name
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT LEAKPROOF
AS $function$bpchar_name$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.name(text)
 RETURNS name
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT LEAKPROOF
AS $function$text_name$function$
;
