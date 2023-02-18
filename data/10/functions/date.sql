CREATE OR REPLACE FUNCTION pg_catalog.date(abstime)
 RETURNS date
 LANGUAGE internal
 STABLE STRICT
AS $function$abstime_date$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date(timestamp with time zone)
 RETURNS date
 LANGUAGE internal
 STABLE STRICT
AS $function$timestamptz_date$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date(timestamp without time zone)
 RETURNS date
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timestamp_date$function$
;
