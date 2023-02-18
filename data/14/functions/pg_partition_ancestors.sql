CREATE OR REPLACE FUNCTION pg_catalog.pg_partition_ancestors(partitionid regclass, OUT relid regclass)
 RETURNS SETOF regclass
 LANGUAGE internal
 PARALLEL SAFE STRICT ROWS 10
AS $function$pg_partition_ancestors$function$
;
