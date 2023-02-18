CREATE OR REPLACE FUNCTION pg_catalog.log(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dlog10$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.log(numeric)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN log((10)::numeric, $1)
;
CREATE OR REPLACE FUNCTION pg_catalog.log(numeric, numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_log$function$
;
