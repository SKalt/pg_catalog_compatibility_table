 SELECT oid AS datid,
    datname,
        CASE
            WHEN oid = 0::oid THEN 0
            ELSE pg_stat_get_db_numbackends(oid)
        END AS numbackends,
    pg_stat_get_db_xact_commit(oid) AS xact_commit,
    pg_stat_get_db_xact_rollback(oid) AS xact_rollback,
    pg_stat_get_db_blocks_fetched(oid) - pg_stat_get_db_blocks_hit(oid) AS blks_read,
    pg_stat_get_db_blocks_hit(oid) AS blks_hit,
    pg_stat_get_db_tuples_returned(oid) AS tup_returned,
    pg_stat_get_db_tuples_fetched(oid) AS tup_fetched,
    pg_stat_get_db_tuples_inserted(oid) AS tup_inserted,
    pg_stat_get_db_tuples_updated(oid) AS tup_updated,
    pg_stat_get_db_tuples_deleted(oid) AS tup_deleted,
    pg_stat_get_db_conflict_all(oid) AS conflicts,
    pg_stat_get_db_temp_files(oid) AS temp_files,
    pg_stat_get_db_temp_bytes(oid) AS temp_bytes,
    pg_stat_get_db_deadlocks(oid) AS deadlocks,
    pg_stat_get_db_checksum_failures(oid) AS checksum_failures,
    pg_stat_get_db_checksum_last_failure(oid) AS checksum_last_failure,
    pg_stat_get_db_blk_read_time(oid) AS blk_read_time,
    pg_stat_get_db_blk_write_time(oid) AS blk_write_time,
    pg_stat_get_db_session_time(oid) AS session_time,
    pg_stat_get_db_active_time(oid) AS active_time,
    pg_stat_get_db_idle_in_transaction_time(oid) AS idle_in_transaction_time,
    pg_stat_get_db_sessions(oid) AS sessions,
    pg_stat_get_db_sessions_abandoned(oid) AS sessions_abandoned,
    pg_stat_get_db_sessions_fatal(oid) AS sessions_fatal,
    pg_stat_get_db_sessions_killed(oid) AS sessions_killed,
    pg_stat_get_db_stat_reset_time(oid) AS stats_reset
   FROM ( SELECT 0 AS oid,
            NULL::name AS datname
        UNION ALL
         SELECT pg_database.oid,
            pg_database.datname
           FROM pg_database) d;