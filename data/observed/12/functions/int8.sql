CREATE OR REPLACE FUNCTION pg_catalog.int8(bit)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$bittoint8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8(double precision)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$dtoi8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8(integer)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int48$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8(jsonb)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$jsonb_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8(numeric)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$numeric_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8(oid)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$oidtoi8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8(real)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ftoi8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.int8(smallint)
 RETURNS bigint
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$int28$function$
;
