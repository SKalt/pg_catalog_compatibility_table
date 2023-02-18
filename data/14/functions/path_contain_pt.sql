CREATE OR REPLACE FUNCTION pg_catalog.path_contain_pt(path, point)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN on_ppath($2, $1)
;
