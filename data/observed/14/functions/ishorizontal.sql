CREATE OR REPLACE FUNCTION pg_catalog.ishorizontal(line)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$line_horizontal$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ishorizontal(lseg)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$lseg_horizontal$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ishorizontal(point, point)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$point_horiz$function$
;
