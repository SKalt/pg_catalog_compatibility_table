CREATE OR REPLACE FUNCTION pg_catalog.enum_range(anyenum)
 RETURNS anyarray
 LANGUAGE internal
 STABLE PARALLEL SAFE
AS $function$enum_range_all$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.enum_range(anyenum, anyenum)
 RETURNS anyarray
 LANGUAGE internal
 STABLE PARALLEL SAFE
AS $function$enum_range_bounds$function$
;
