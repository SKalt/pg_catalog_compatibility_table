CREATE OR REPLACE FUNCTION pg_catalog."like"(bytea, bytea)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$bytealike$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."like"(name, text)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$namelike$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."like"(text, text)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$textlike$function$
;
