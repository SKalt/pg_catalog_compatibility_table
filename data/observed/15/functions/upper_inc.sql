CREATE OR REPLACE FUNCTION pg_catalog.upper_inc(anymultirange)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_upper_inc$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.upper_inc(anyrange)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$range_upper_inc$function$
;
