CREATE OR REPLACE FUNCTION pg_catalog."numeric"(bigint)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int8_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(double precision)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$float8_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int4_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(jsonb)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(money)
 RETURNS numeric
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$cash_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(numeric, integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT numeric_support
AS $function$numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(real)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$float4_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."numeric"(smallint)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int2_numeric$function$
;
