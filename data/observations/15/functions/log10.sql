CREATE OR REPLACE FUNCTION pg_catalog.log10(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dlog10$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.log10(numeric)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN log((10)::numeric, $1)
;
