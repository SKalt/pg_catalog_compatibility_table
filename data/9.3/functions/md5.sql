CREATE OR REPLACE FUNCTION pg_catalog.md5(bytea)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$md5_bytea$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.md5(text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$md5_text$function$
;
