CREATE OR REPLACE FUNCTION pg_catalog.generate_series(bigint, bigint)
 RETURNS SETOF bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_int8_support
AS $function$generate_series_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(bigint, bigint, bigint)
 RETURNS SETOF bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_int8_support
AS $function$generate_series_step_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(integer, integer)
 RETURNS SETOF integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_int4_support
AS $function$generate_series_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(integer, integer, integer)
 RETURNS SETOF integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT SUPPORT generate_series_int4_support
AS $function$generate_series_step_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(numeric, numeric)
 RETURNS SETOF numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$generate_series_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(numeric, numeric, numeric)
 RETURNS SETOF numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$generate_series_step_numeric$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(timestamp with time zone, timestamp with time zone, interval)
 RETURNS SETOF timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$generate_series_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(timestamp with time zone, timestamp with time zone, interval, text)
 RETURNS SETOF timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$generate_series_timestamptz_at_zone$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(timestamp without time zone, timestamp without time zone, interval)
 RETURNS SETOF timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$generate_series_timestamp$function$
;
