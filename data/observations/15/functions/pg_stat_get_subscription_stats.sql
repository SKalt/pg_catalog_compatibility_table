CREATE OR REPLACE FUNCTION pg_catalog.pg_stat_get_subscription_stats(subid oid, OUT subid oid, OUT apply_error_count bigint, OUT sync_error_count bigint, OUT stats_reset timestamp with time zone)
 RETURNS record
 LANGUAGE internal
 STABLE PARALLEL RESTRICTED STRICT
AS $function$pg_stat_get_subscription_stats$function$
;
