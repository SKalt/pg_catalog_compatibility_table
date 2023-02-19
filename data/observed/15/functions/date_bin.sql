CREATE OR REPLACE FUNCTION pg_catalog.date_bin(interval, timestamp with time zone, timestamp with time zone)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_bin$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_bin(interval, timestamp without time zone, timestamp without time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamp_bin$function$
;
