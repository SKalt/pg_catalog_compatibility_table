CREATE OR REPLACE FUNCTION pg_catalog.timetzdate_pl(time with time zone, date)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
RETURN ($2 + $1)
;
