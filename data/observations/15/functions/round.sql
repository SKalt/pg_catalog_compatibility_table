CREATE OR REPLACE FUNCTION pg_catalog.round(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dround$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.round(numeric)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN round($1, 0)
;
CREATE OR REPLACE FUNCTION pg_catalog.round(numeric, integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_round$function$
;
