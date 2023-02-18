CREATE OR REPLACE FUNCTION pg_catalog.int4("char")
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$chartoi4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4(bigint)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int84$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4(bit)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bittoint4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4(boolean)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bool_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4(double precision)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dtoi4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4(numeric)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_int4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4(real)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ftoi4$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int4(smallint)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$i2toi4$function$
;
