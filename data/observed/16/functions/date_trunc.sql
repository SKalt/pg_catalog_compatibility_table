CREATE OR REPLACE FUNCTION pg_catalog.date_trunc(text, interval)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$interval_trunc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_trunc(text, timestamp with time zone)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamptz_trunc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_trunc(text, timestamp with time zone, text)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_trunc_zone$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_trunc(text, timestamp without time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamp_trunc$function$
;
