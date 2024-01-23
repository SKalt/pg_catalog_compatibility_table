CREATE OR REPLACE FUNCTION pg_catalog.tsmultirange()
 RETURNS tsmultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor0$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.tsmultirange(VARIADIC tsrange[])
 RETURNS tsmultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.tsmultirange(tsrange)
 RETURNS tsmultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor1$function$
;
