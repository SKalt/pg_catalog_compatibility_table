CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, date)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$select pg_catalog.date_part($1, cast($2 as timestamp without time zone))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, interval)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$interval_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, time with time zone)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timetz_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, time without time zone)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$time_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, timestamp with time zone)
 RETURNS double precision
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamptz_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, timestamp without time zone)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamp_part$function$
;
