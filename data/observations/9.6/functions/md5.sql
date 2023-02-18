CREATE OR REPLACE FUNCTION pg_catalog.md5(bytea)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$md5_bytea$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.md5(text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$md5_text$function$
;
