CREATE OR REPLACE FUNCTION pg_catalog.float4(bigint)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$i8tof$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float4(double precision)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$dtof$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float4(integer)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$i4tof$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float4(numeric)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$numeric_float4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float4(smallint)
 RETURNS real
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$i2tof$function$
;
