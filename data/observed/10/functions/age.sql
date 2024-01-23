CREATE OR REPLACE FUNCTION pg_catalog.age(timestamp with time zone)
 RETURNS interval
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT COST 1
AS $function$select pg_catalog.age(cast(current_date as timestamp with time zone), $1)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.age(timestamp with time zone, timestamp with time zone)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamptz_age$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.age(timestamp without time zone)
 RETURNS interval
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT COST 1
AS $function$select pg_catalog.age(cast(current_date as timestamp without time zone), $1)$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.age(timestamp without time zone, timestamp without time zone)
 RETURNS interval
 LANGUAGE internal
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$timestamp_age$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.age(xid)
 RETURNS integer
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED STRICT
AS $function$xid_age$function$
;
