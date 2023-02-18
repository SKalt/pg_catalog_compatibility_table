CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(abstime)
 RETURNS timestamp without time zone
 LANGUAGE internal
 STABLE STRICT
AS $function$abstime_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(date)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$date_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(date, time without time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$datetime_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(timestamp with time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 STABLE STRICT
AS $function$timestamptz_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(timestamp without time zone, integer)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timestamp_scale$function$
;
