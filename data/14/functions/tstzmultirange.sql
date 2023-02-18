CREATE OR REPLACE FUNCTION pg_catalog.tstzmultirange()
 RETURNS tstzmultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor0$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.tstzmultirange(VARIADIC tstzrange[])
 RETURNS tstzmultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.tstzmultirange(tstzrange)
 RETURNS tstzmultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor1$function$
;
