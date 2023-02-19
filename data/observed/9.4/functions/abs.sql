CREATE OR REPLACE FUNCTION pg_catalog.abs(bigint)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$int8abs$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abs(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$float8abs$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abs(integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$int4abs$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abs(numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$numeric_abs$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abs(real)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$float4abs$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abs(smallint)
 RETURNS smallint
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$int2abs$function$
;
