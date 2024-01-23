CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_slru(OUT name text, OUT blks_zeroed bigint, OUT blks_hit bigint, OUT blks_read bigint, OUT blks_written bigint, OUT blks_exists bigint, OUT flushes bigint, OUT truncates bigint, OUT stats_reset timestamp with time zone)
 RETURNS SETOF record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED ROWS 100
AS $function$pg_stat_get_slru$function$
;
