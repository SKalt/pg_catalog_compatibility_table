CREATE OR REPLACE FUNCTION pg_catalog.array_fill(anyelement, integer[])
 RETURNS anyarray
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE
AS $function$array_fill$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.array_fill(anyelement, integer[], integer[])
 RETURNS anyarray
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE
AS $function$array_fill_with_lower_bounds$function$
;
