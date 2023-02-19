CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_archiver(OUT archived_count bigint, OUT last_archived_wal text, OUT last_archived_time timestamp with time zone, OUT failed_count bigint, OUT last_failed_wal text, OUT last_failed_time timestamp with time zone, OUT stats_reset timestamp with time zone)
 RETURNS record
 LANGUAGE internal
 STABLE
AS $function$pg_stat_get_archiver$function$
;
