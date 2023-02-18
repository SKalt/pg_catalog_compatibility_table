CREATE OR REPLACE FUNCTION pg_catalog.sqrt(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dsqrt$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.sqrt(numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_sqrt$function$
;
