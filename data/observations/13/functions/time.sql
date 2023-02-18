CREATE OR REPLACE FUNCTION pg_catalog."time"(interval)
 RETURNS time without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$interval_time$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."time"(time with time zone)
 RETURNS time without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timetz_time$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."time"(time without time zone, integer)
 RETURNS time without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT time_support
AS $function$time_scale$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."time"(timestamp with time zone)
 RETURNS time without time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamptz_time$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."time"(timestamp without time zone)
 RETURNS time without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamp_time$function$
;
