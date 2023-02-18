CREATE OR REPLACE FUNCTION pg_catalog.int8pl_inet(bigint, inet)
 RETURNS inet
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN ($2 + $1)
;