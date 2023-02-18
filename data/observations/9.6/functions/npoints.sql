CREATE OR REPLACE FUNCTION pg_catalog.npoints(path)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$path_npoints$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.npoints(polygon)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$poly_npoints$function$
;
