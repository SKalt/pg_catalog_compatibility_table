CREATE OR REPLACE FUNCTION pg_catalog."extract"(text, date)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$extract_date$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."extract"(text, interval)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$extract_interval$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."extract"(text, time with time zone)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$extract_timetz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."extract"(text, time without time zone)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$extract_time$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."extract"(text, timestamp with time zone)
 RETURNS numeric
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$extract_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog."extract"(text, timestamp without time zone)
 RETURNS numeric
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$extract_timestamp$function$
;
