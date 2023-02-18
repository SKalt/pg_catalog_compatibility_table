CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_recovery_prefetch(OUT stats_reset timestamp with time zone, OUT prefetch bigint, OUT hit bigint, OUT skip_init bigint, OUT skip_new bigint, OUT skip_fpw bigint, OUT skip_rep bigint, OUT wal_distance integer, OUT block_distance integer, OUT io_depth integer)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL SAFE STRICT ROWS 1
AS $function$pg_stat_get_recovery_prefetch$function$
;
