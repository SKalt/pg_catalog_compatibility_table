CREATE OR REPLACE FUNCTION pg_catalog.to_ascii(text)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$to_ascii_default$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_ascii(text, integer)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$to_ascii_enc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_ascii(text, name)
 RETURNS text
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$to_ascii_encname$function$
;
