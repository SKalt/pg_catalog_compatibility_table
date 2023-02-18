CREATE OR REPLACE FUNCTION pg_catalog.octet_length(bit)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$bitoctetlength$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.octet_length(bytea)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$byteaoctetlen$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.octet_length(character)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$bpcharoctetlen$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.octet_length(text)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$textoctetlen$function$
;
