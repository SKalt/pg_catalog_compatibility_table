CREATE OR REPLACE FUNCTION pg_catalog."interval"(interval, integer)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$interval_scale$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."interval"(reltime)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$reltime_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."interval"(time without time zone)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$time_interval$function$
;
