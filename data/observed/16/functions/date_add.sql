CREATE OR REPLACE FUNCTION pg_catalog.date_add(timestamp with time zone, interval)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamptz_pl_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_add(timestamp with time zone, interval, text)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_pl_interval_at_zone$function$
;
