CREATE OR REPLACE FUNCTION pg_catalog."numeric"(bigint)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$int8_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(double precision)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$float8_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$int4_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(money)
 RETURNS numeric
 LANGUAGE internal
 STABLE STRICT
AS $function$cash_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(numeric, integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(real)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$float4_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(smallint)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$int2_numeric$function$
;
