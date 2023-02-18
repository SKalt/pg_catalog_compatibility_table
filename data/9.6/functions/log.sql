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
AS $function$select pg_catalog.log(10, $1)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.log(numeric, numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_log$function$
;
