CREATE OR REPLACE FUNCTION pg_catalog.timezone(interval, time with time zone)
 RETURNS time with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timetz_izone$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timezone(interval, timestamp with time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_izone$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timezone(interval, timestamp without time zone)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamp_izone$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timezone(text, time with time zone)
 RETURNS time with time zone
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$timetz_zone$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timezone(text, timestamp with time zone)
 RETURNS timestamp without time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_zone$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.timezone(text, timestamp without time zone)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamp_zone$function$
;
