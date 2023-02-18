CREATE OR REPLACE FUNCTION pg_catalog.range_merge(anymultirange)
 RETURNS anyrange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$range_merge_from_multirange$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.range_merge(anyrange, anyrange)
 RETURNS anyrange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$range_merge$function$
;
