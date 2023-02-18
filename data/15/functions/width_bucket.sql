CREATE OR REPLACE FUNCTION pg_catalog.width_bucket(anycompatible, anycompatiblearray)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$width_bucket_array$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.width_bucket(double precision, double precision, double precision, integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$width_bucket_float8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.width_bucket(numeric, numeric, numeric, integer)
 RETURNS integer
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$width_bucket_numeric$function$
;
