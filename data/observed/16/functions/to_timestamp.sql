CREATE OR REPLACE FUNCTION pg_catalog.to_timestamp(double precision)
 RETURNS timestamp with time zone
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$float8_timestamptz$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.to_timestamp(text, text)
 RETURNS timestamp with time zone
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$to_timestamp$function$
;
