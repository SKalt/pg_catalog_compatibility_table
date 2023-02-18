CREATE OR REPLACE FUNCTION pg_catalog.upper_inf(anymultirange)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_upper_inf$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.upper_inf(anyrange)
 RETURNS boolean
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$range_upper_inf$function$
;
