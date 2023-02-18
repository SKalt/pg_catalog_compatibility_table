CREATE OR REPLACE FUNCTION pg_catalog.gcd(bigint, bigint)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int8gcd$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.gcd(integer, integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int4gcd$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.gcd(numeric, numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_gcd$function$
;
