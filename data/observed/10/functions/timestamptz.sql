CREATE OR REPLACE FUNCTION pg_catalog.timestamptz(abstime)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$abstime_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timestamptz(date)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$date_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timestamptz(date, time with time zone)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$datetimetz_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timestamptz(date, time without time zone)
 RETURNS timestamp with time zone
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT COST 1
AS $function$select cast(($1 + $2) as timestamp with time zone)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timestamptz(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_scale$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timestamptz(timestamp without time zone)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamp_timestamptz$function$
;
