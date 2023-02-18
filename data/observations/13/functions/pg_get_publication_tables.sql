CREATE OR REPLACE FUNCTION pg_catalog.pg_get_publication_tables(pubname text, OUT relid oid)
 RETURNS SETOF oid
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_get_publication_tables$function$
;
