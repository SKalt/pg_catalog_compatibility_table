CREATE OR REPLACE FUNCTION pg_catalog.box(circle)
 RETURNS box
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$circle_box$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.box(point, point)
 RETURNS box
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$points_box$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.box(polygon)
 RETURNS box
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$poly_box$function$
;
