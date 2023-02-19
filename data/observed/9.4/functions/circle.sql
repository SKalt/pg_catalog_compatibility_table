CREATE OR REPLACE FUNCTION pg_catalog.circle(box)
 RETURNS circle
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$box_circle$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.circle(point, double precision)
 RETURNS circle
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$cr_circle$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.circle(polygon)
 RETURNS circle
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$poly_circle$function$
;
