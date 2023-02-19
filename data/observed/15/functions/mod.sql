CREATE OR REPLACE FUNCTION pg_catalog.mod(bigint, bigint)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int8mod$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.mod(integer, integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int4mod$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.mod(numeric, numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_mod$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.mod(smallint, smallint)
 RETURNS smallint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int2mod$function$
;
