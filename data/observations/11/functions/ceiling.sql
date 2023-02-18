CREATE OR REPLACE FUNCTION pg_catalog.ceiling(double precision)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dceil$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ceiling(numeric)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_ceil$function$
;
