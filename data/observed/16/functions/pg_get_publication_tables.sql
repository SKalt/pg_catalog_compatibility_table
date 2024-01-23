CREATE OR REPLACE FUNCTION pg_catalog.pg_get_publication_tables(VARIADIC pubname text[], OUT pubid oid, OUT relid oid, OUT attrs int2vector, OUT qual pg_node_tree)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL SAFE STRICT
AS $function$pg_get_publication_tables$function$
;
