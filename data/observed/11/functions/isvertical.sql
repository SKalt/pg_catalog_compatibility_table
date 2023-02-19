CREATE OR REPLACE FUNCTION pg_catalog.isvertical(line)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$line_vertical$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.isvertical(lseg)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$lseg_vertical$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.isvertical(point, point)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$point_vert$function$
;
