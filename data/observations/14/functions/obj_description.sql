CREATE OR REPLACE FUNCTION pg_catalog.obj_description(oid)
 RETURNS text
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
BEGIN ATOMIC
 SELECT pg_description.description
    FROM pg_description
   WHERE ((pg_description.objoid = $1) AND (pg_description.objsubid = 0));
END
;
CREATE OR REPLACE FUNCTION pg_catalog.obj_description(oid, name)
 RETURNS text
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
BEGIN ATOMIC
 SELECT pg_description.description
    FROM pg_description
   WHERE ((pg_description.objoid = $1) AND (pg_description.classoid = ( SELECT pg_class.oid
            FROM pg_class
           WHERE ((pg_class.relname = $2) AND (pg_class.relnamespace = ('pg_catalog'::regnamespace)::oid)))) AND (pg_description.objsubid = 0));
END
;
