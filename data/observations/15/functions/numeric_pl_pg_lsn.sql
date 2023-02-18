CREATE OR REPLACE FUNCTION pg_catalog.numeric_pl_pg_lsn(numeric, pg_lsn)
 RETURNS pg_lsn
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN ($2 + $1)
;
