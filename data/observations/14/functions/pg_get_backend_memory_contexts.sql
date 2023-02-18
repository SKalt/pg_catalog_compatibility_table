CREATE OR REPLACE FUNCTION pg_catalog.pg_get_backend_memory_contexts(OUT name text, OUT ident text, OUT parent text, OUT level integer, OUT total_bytes bigint, OUT total_nblocks bigint, OUT free_bytes bigint, OUT free_chunks bigint, OUT used_bytes bigint)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT ROWS 100
AS $function$pg_get_backend_memory_contexts$function$
;
