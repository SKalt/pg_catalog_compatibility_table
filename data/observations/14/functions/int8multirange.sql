CREATE OR REPLACE FUNCTION pg_catalog.int8multirange()
 RETURNS int8multirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor0$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8multirange(VARIADIC int8range[])
 RETURNS int8multirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8multirange(int8range)
 RETURNS int8multirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor1$function$
;
