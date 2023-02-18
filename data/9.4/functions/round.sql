CREATE OR REPLACE FUNCTION pg_catalog.round(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$dround$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.round(numeric)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.round($1,0)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.round(numeric, integer)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$numeric_round$function$
;
