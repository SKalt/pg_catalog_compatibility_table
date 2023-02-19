CREATE OR REPLACE FUNCTION pg_catalog."position"(bit, bit)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bitposition$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."position"(bytea, bytea)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$byteapos$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."position"(text, text)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$textpos$function$
;
