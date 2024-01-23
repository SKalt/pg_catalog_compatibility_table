DROP TABLE pg_pltemplate;

CREATE VIEW pg_stat_progress_basebackup
 SELECT s.pid,
        CASE s.param1
            WHEN 0 THEN 'initializing'::text
            WHEN 1 THEN 'waiting for checkpoint to finish'::text
            WHEN 2 THEN 'estimating backup size'::text
            WHEN 3 THEN 'streaming database files'::text
            WHEN 4 THEN 'waiting for wal archiving to finish'::text
            WHEN 5 THEN 'transferring wal files'::text
            ELSE NULL::text
        END AS phase,
        CASE s.param2
            WHEN '-1'::integer THEN NULL::bigint
            ELSE s.param2
        END AS backup_total,
    s.param3 AS backup_streamed,
    s.param4 AS tablespaces_total,
    s.param5 AS tablespaces_streamed
   FROM pg_stat_get_progress_info('BASEBACKUP'::text) s(pid, datid, relid, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20);

CREATE VIEW pg_shmem_allocations
 SELECT pg_get_shmem_allocations.name,
    pg_get_shmem_allocations.off,
    pg_get_shmem_allocations.size,
    pg_get_shmem_allocations.allocated_size
   FROM pg_get_shmem_allocations() pg_get_shmem_allocations(name, off, size, allocated_size);

CREATE VIEW pg_stat_progress_analyze
 SELECT s.pid,
    s.datid,
    d.datname,
    s.relid,
        CASE s.param1
            WHEN 0 THEN 'initializing'::text
            WHEN 1 THEN 'acquiring sample rows'::text
            WHEN 2 THEN 'acquiring inherited sample rows'::text
            WHEN 3 THEN 'computing statistics'::text
            WHEN 4 THEN 'computing extended statistics'::text
            WHEN 5 THEN 'finalizing analyze'::text
            ELSE NULL::text
        END AS phase,
    s.param2 AS sample_blks_total,
    s.param3 AS sample_blks_scanned,
    s.param4 AS ext_stats_total,
    s.param5 AS ext_stats_computed,
    s.param6 AS child_tables_total,
    s.param7 AS child_tables_done,
    s.param8::oid AS current_child_table_relid
   FROM pg_stat_get_progress_info('ANALYZE'::text) s(pid, datid, relid, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20)
     LEFT JOIN pg_database d ON s.datid = d.oid;

CREATE VIEW pg_stat_slru
 SELECT s.name,
    s.blks_zeroed,
    s.blks_hit,
    s.blks_read,
    s.blks_written,
    s.blks_exists,
    s.flushes,
    s.truncates,
    s.stats_reset
   FROM pg_stat_get_slru() s(name, blks_zeroed, blks_hit, blks_read, blks_written, blks_exists, flushes, truncates, stats_reset);

ALTER TABLE pg_subscription ALTER COLUMN subslotname DROP NOT NULL;

ALTER TABLE pg_statistic_ext ADD COLUMN stxstattarget int4 NULL;

ALTER TABLE pg_publication ADD COLUMN pubviaroot bool NULL;

ALTER TABLE pg_trigger ADD COLUMN tgparentid oid NULL;

ALTER TABLE pg_subscription_rel ALTER COLUMN srsublsn DROP NOT NULL;
/*
## view `pg_replication_slots`

### Features

feat: add column `wal_status text NOT NULL`
feat: add column `safe_wal_size int8 NOT NULL`

### Non-Breaking Changes

refactor: column `database` type set to `name`

## view `pg_stat_activity`

### Features

feat: add column `leader_pid int4 NOT NULL`

## view `pg_stat_user_tables`

### Features

feat: add column `n_ins_since_vacuum int8 NOT NULL`

## view `pg_stats_ext`

### Non-Breaking Changes

refactor: column `statistics_owner` type set to `name`
refactor: column `kinds` type set to `char[]`
refactor: column `most_common_vals` type set to `text[]`
refactor: column `most_common_val_nulls` type set to `bool[]`
refactor: column `most_common_freqs` type set to `float8[]`
refactor: column `most_common_base_freqs` type set to `float8[]`

## view `pg_stat_all_tables`

### Features

feat: add column `n_ins_since_vacuum int8 NOT NULL`

## view `pg_policies`

### Breaking changes

BREAKING CHANGE: alter view pg_policies drop column polpermissive

## view `pg_stat_wal_receiver`

### Features

feat: add column `written_lsn pg_lsn NOT NULL`
feat: add column `flushed_lsn pg_lsn NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_wal_receiver drop column received_lsn

## view `pg_stat_sys_tables`

### Features

feat: add column `n_ins_since_vacuum int8 NOT NULL`

## view `pg_available_extension_versions`

### Features

feat: add column `trusted bool NOT NULL`
*/
