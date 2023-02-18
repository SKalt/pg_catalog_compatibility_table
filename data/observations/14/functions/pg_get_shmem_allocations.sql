CREATE OR REPLACE FUNCTION pg_catalog.pg_get_shmem_allocations(OUT name text, OUT off bigint, OUT size bigint, OUT allocated_size bigint)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT ROWS 50
AS $function$pg_get_shmem_allocations$function$
;
