CREATE OR REPLACE FUNCTION pg_catalog.in_range(bigint, bigint, bigint, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_int8_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(date, date, interval, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_date_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(double precision, double precision, double precision, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_float8_float8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(integer, integer, bigint, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_int4_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(integer, integer, integer, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_int4_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(integer, integer, smallint, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_int4_int2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(interval, interval, interval, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_interval_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(numeric, numeric, numeric, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_numeric_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(real, real, double precision, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_float4_float8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(smallint, smallint, bigint, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_int2_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(smallint, smallint, integer, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_int2_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(smallint, smallint, smallint, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_int2_int2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(time with time zone, time with time zone, interval, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_timetz_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(time without time zone, time without time zone, interval, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_time_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(timestamp with time zone, timestamp with time zone, interval, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$in_range_timestamptz_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.in_range(timestamp without time zone, timestamp without time zone, interval, boolean, boolean)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$in_range_timestamp_interval$function$
;
