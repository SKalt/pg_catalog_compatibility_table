CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, abstime)
 RETURNS double precision
 LANGUAGE sql
 STABLE STRICT COST 1
AS $function$select pg_catalog.date_part($1, cast($2 as timestamp with time zone))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, date)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select pg_catalog.date_part($1, cast($2 as timestamp without time zone))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, interval)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$interval_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, reltime)
 RETURNS double precision
 LANGUAGE sql
 STABLE STRICT COST 1
AS $function$select pg_catalog.date_part($1, cast($2 as pg_catalog.interval))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, time with time zone)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timetz_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, time without time zone)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$time_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, timestamp with time zone)
 RETURNS double precision
 LANGUAGE internal
 STABLE STRICT
AS $function$timestamptz_part$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.date_part(text, timestamp without time zone)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$timestamp_part$function$
;
