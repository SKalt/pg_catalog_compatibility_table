CREATE OR REPLACE FUNCTION pg_catalog.col_description(oid, integer)
 RETURNS text
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
BEGIN ATOMIC
 SELECT pg_description.description
    FROM pg_description
   WHERE ((pg_description.objoid = $1) AND (pg_description.classoid = ('pg_class'::regclass)::oid) AND (pg_description.objsubid = $2));
END
;
