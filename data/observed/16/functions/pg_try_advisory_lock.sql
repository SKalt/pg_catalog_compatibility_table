CREATE OR REPLACE FUNCTION pg_catalog.pg_try_advisory_lock(bigint)
 RETURNS boolean
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_try_advisory_lock_int8$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.pg_try_advisory_lock(integer, integer)
 RETURNS boolean
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT
AS $function$pg_try_advisory_lock_int4$function$
;
