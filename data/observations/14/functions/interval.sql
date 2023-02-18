CREATE OR REPLACE FUNCTION pg_catalog."interval"(interval, integer)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT interval_support
AS $function$interval_scale$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."interval"(time without time zone)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT LEAKPROOF
AS $function$time_interval$function$
;
