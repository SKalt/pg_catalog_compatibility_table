CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(time with time zone, time with time zone, time with time zone, time with time zone)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE
AS $function$overlaps_timetz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(time without time zone, interval, time without time zone, interval)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE COST 1
AS $function$select ($1, ($1 + $2)) overlaps ($3, ($3 + $4))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(time without time zone, interval, time without time zone, time without time zone)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE COST 1
AS $function$select ($1, ($1 + $2)) overlaps ($3, $4)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(time without time zone, time without time zone, time without time zone, interval)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE COST 1
AS $function$select ($1, $2) overlaps ($3, ($3 + $4))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(time without time zone, time without time zone, time without time zone, time without time zone)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE
AS $function$overlaps_time$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp with time zone, interval, timestamp with time zone, interval)
 RETURNS boolean
 LANGUAGE sql
 STABLE COST 1
AS $function$select ($1, ($1 + $2)) overlaps ($3, ($3 + $4))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp with time zone, interval, timestamp with time zone, timestamp with time zone)
 RETURNS boolean
 LANGUAGE sql
 STABLE COST 1
AS $function$select ($1, ($1 + $2)) overlaps ($3, $4)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp with time zone, timestamp with time zone, timestamp with time zone, interval)
 RETURNS boolean
 LANGUAGE sql
 STABLE COST 1
AS $function$select ($1, $2) overlaps ($3, ($3 + $4))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp with time zone, timestamp with time zone, timestamp with time zone, timestamp with time zone)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE
AS $function$overlaps_timestamp$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp without time zone, interval, timestamp without time zone, interval)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE COST 1
AS $function$select ($1, ($1 + $2)) overlaps ($3, ($3 + $4))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp without time zone, interval, timestamp without time zone, timestamp without time zone)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE COST 1
AS $function$select ($1, ($1 + $2)) overlaps ($3, $4)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp without time zone, timestamp without time zone, timestamp without time zone, interval)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE COST 1
AS $function$select ($1, $2) overlaps ($3, ($3 + $4))$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."overlaps"(timestamp without time zone, timestamp without time zone, timestamp without time zone, timestamp without time zone)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE
AS $function$overlaps_timestamp$function$
;
