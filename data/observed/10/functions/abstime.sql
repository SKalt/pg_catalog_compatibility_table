CREATE OR REPLACE FUNCTION pg_catalog.abstime(timestamp with time zone)
 RETURNS abstime
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_abstime$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.abstime(timestamp without time zone)
 RETURNS abstime
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamp_abstime$function$
;
