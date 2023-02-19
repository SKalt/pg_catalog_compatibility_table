CREATE OR REPLACE FUNCTION pg_catalog.notlike(bytea, bytea)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$byteanlike$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.notlike(name, text)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$namenlike$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.notlike(text, text)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textnlike$function$
;
