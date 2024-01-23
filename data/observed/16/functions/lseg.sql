CREATE OR REPLACE FUNCTION pg_catalog.lseg(box)
 RETURNS lseg
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$box_diagonal$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.lseg(point, point)
 RETURNS lseg
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$lseg_construct$function$
;
