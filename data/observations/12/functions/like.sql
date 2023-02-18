CREATE OR REPLACE FUNCTION pg_catalog."like"(bytea, bytea)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT textlike_support
AS $function$bytealike$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."like"(name, text)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT textlike_support
AS $function$namelike$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."like"(text, text)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT textlike_support
AS $function$textlike$function$
;
