CREATE OR REPLACE FUNCTION pg_catalog.isfinite(abstime)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$abstime_finite$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.isfinite(date)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$date_finite$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.isfinite(interval)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$interval_finite$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.isfinite(timestamp with time zone)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timestamp_finite$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.isfinite(timestamp without time zone)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timestamp_finite$function$
;
