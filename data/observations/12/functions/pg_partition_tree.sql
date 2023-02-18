CREATE OR REPLACE FUNCTION pg_catalog.pg_partition_tree(rootrelid regclass, OUT relid regclass, OUT parentrelid regclass, OUT isleaf boolean, OUT level integer)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT
AS $function$pg_partition_tree$function$
;
