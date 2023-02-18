CREATE OR REPLACE FUNCTION pg_catalog.abstime(timestamp with time zone)
 RETURNS abstime
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timestamptz_abstime$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abstime(timestamp without time zone)
 RETURNS abstime
 LANGUAGE internal
 STABLE STRICT
AS $function$timestamp_abstime$function$
;
