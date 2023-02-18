CREATE OR REPLACE FUNCTION pg_catalog.center(box)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$box_center$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.center(circle)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$circle_center$function$
;
