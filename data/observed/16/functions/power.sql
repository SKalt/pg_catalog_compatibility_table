CREATE OR REPLACE FUNCTION pg_catalog.power(double precision, double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dpow$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.power(numeric, numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_power$function$
;
