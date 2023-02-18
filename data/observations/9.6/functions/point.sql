CREATE OR REPLACE FUNCTION pg_catalog.point(box)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$box_center$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.point(circle)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$circle_center$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.point(double precision, double precision)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$construct_point$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.point(lseg)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$lseg_center$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.point(path)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$path_center$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.point(polygon)
 RETURNS point
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$poly_center$function$
;
