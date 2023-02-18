CREATE OR REPLACE FUNCTION pg_catalog.polygon(box)
 RETURNS polygon
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$box_poly$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.polygon(circle)
 RETURNS polygon
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.polygon(12, $1)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.polygon(integer, circle)
 RETURNS polygon
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$circle_poly$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.polygon(path)
 RETURNS polygon
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$path_poly$function$
;
