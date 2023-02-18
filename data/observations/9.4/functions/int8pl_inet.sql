CREATE OR REPLACE FUNCTION pg_catalog.int8pl_inet(bigint, inet)
 RETURNS inet
 LANGUAGE sql
 IMMUTABLE STRICT COST 1
AS $function$select $2 + $1$function$
;
