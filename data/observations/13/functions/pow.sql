CREATE OR REPLACE FUNCTION pg_catalog.pow(double precision, double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dpow$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pow(numeric, numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_power$function$
;
