CREATE OR REPLACE FUNCTION pg_catalog.area(box)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$box_area$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.area(circle)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$circle_area$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.area(path)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$path_area$function$
;
