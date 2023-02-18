CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(date)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$date_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(date, time without time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$datetime_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(timestamp with time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamptz_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."timestamp"(timestamp without time zone, integer)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT timestamp_support
AS $function$timestamp_scale$function$
;
