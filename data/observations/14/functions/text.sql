CREATE OR REPLACE FUNCTION pg_catalog.text("char")
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$char_text$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.text(boolean)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$booltext$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.text(character)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$rtrim1$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.text(inet)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$network_show$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.text(name)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT LEAKPROOF
AS $function$name_text$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.text(xml)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$xmltotext$function$
;
