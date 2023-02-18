CREATE OR REPLACE FUNCTION pg_catalog.to_char(bigint, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$int8_to_char$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_char(double precision, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$float8_to_char$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_char(integer, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$int4_to_char$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_char(interval, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$interval_to_char$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_char(numeric, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$numeric_to_char$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_char(real, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$float4_to_char$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_char(timestamp with time zone, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamptz_to_char$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_char(timestamp without time zone, text)
 RETURNS text
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$timestamp_to_char$function$
;
