CREATE OR REPLACE FUNCTION pg_catalog.make_timestamptz(year integer, month integer, mday integer, hour integer, min integer, sec double precision)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$make_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.make_timestamptz(year integer, month integer, mday integer, hour integer, min integer, sec double precision, timezone text)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$make_timestamptz_at_timezone$function$
;
