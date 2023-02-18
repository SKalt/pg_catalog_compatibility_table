CREATE OR REPLACE FUNCTION pg_catalog.polygon(box)
 RETURNS polygon
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$box_poly$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.polygon(circle)
 RETURNS polygon
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN polygon(12, $1)
;
CREATE OR REPLACE FUNCTION pg_catalog.polygon(integer, circle)
 RETURNS polygon
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$circle_poly$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.polygon(path)
 RETURNS polygon
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$path_poly$function$
;
