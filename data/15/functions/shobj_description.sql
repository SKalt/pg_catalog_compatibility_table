CREATE OR REPLACE FUNCTION pg_catalog.shobj_description(oid, name)
 RETURNS text
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
BEGIN ATOMIC
 SELECT pg_shdescription.description
    FROM pg_shdescription
   WHERE ((pg_shdescription.objoid = $1) AND (pg_shdescription.classoid = ( SELECT pg_class.oid
            FROM pg_class
           WHERE ((pg_class.relname = $2) AND (pg_class.relnamespace = ('pg_catalog'::regnamespace)::oid)))));
END
;
