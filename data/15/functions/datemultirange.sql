CREATE OR REPLACE FUNCTION pg_catalog.datemultirange()
 RETURNS datemultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor0$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.datemultirange(VARIADIC daterange[])
 RETURNS datemultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.datemultirange(daterange)
 RETURNS datemultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor1$function$
;
