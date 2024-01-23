CREATE OR REPLACE FUNCTION pg_catalog.int4multirange()
 RETURNS int4multirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor0$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4multirange(VARIADIC int4range[])
 RETURNS int4multirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor2$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4multirange(int4range)
 RETURNS int4multirange
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$multirange_constructor1$function$
;
