CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_io(OUT backend_type text, OUT object text, OUT context text, OUT reads bigint, OUT read_time double precision, OUT writes bigint, OUT write_time double precision, OUT writebacks bigint, OUT writeback_time double precision, OUT extends bigint, OUT extend_time double precision, OUT op_bytes bigint, OUT hits bigint, OUT evictions bigint, OUT reuses bigint, OUT fsyncs bigint, OUT fsync_time double precision, OUT stats_reset timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 PARALLEL RESTRICTED STRICT ROWS 30
AS $function$pg_stat_get_io$function$
;
