CREATE OR REPLACE FUNCTION pg_catalog.timetz(time with time zone, integer)
 RETURNS time with time zone
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timetz_scale$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timetz(time without time zone)
 RETURNS time with time zone
 LANGUAGE internal
 STABLE STRICT
AS $function$time_timetz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timetz(timestamp with time zone)
 RETURNS time with time zone
 LANGUAGE internal
 STABLE STRICT
AS $function$timestamptz_timetz$function$
;
