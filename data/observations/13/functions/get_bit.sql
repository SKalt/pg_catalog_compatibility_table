CREATE OR REPLACE FUNCTION pg_catalog.get_bit(bit, integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bitgetbit$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.get_bit(bytea, bigint)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$byteaGetBit$function$
;
