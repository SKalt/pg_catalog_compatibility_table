CREATE OR REPLACE FUNCTION pg_catalog.float8(bigint)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$i8tod$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float8(integer)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$i4tod$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float8(jsonb)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_float8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float8(numeric)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_float8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float8(real)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ftod$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.float8(smallint)
 RETURNS double precision
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$i2tod$function$
;
