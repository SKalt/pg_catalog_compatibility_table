CREATE OR REPLACE FUNCTION pg_catalog.lcm(bigint, bigint)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int8lcm$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lcm(integer, integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int4lcm$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lcm(numeric, numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_lcm$function$
;
