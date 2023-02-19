CREATE OR REPLACE FUNCTION pg_catalog.generate_series(bigint, bigint)
 RETURNS SETOF bigint
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$generate_series_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(bigint, bigint, bigint)
 RETURNS SETOF bigint
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$generate_series_step_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(integer, integer)
 RETURNS SETOF integer
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$generate_series_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(integer, integer, integer)
 RETURNS SETOF integer
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$generate_series_step_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(timestamp with time zone, timestamp with time zone, interval)
 RETURNS SETOF timestamp with time zone
 LANGUAGE internal
 STABLE STRICT
AS $function$generate_series_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.generate_series(timestamp without time zone, timestamp without time zone, interval)
 RETURNS SETOF timestamp without time zone
 LANGUAGE internal
 IMMUTABLE STRICT
AS $function$generate_series_timestamp$function$
;
