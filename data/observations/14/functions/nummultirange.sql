CREATE OR REPLACE FUNCTION pg_catalog.nummultirange()
 RETURNS nummultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor0$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.nummultirange(VARIADIC numrange[])
 RETURNS nummultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.nummultirange(numrange)
 RETURNS nummultirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor1$function$
;
