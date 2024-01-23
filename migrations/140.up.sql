
CREATE VIEW pg_stats_ext_exprs
 SELECT cn.nspname AS schemaname,
    c.relname AS tablename,
    sn.nspname AS statistics_schemaname,
    s.stxname AS statistics_name,
    pg_get_userbyid(s.stxowner) AS statistics_owner,
    stat.expr,
    (stat.a).stanullfrac AS null_frac,
    (stat.a).stawidth AS avg_width,
    (stat.a).stadistinct AS n_distinct,
        CASE
            WHEN (stat.a).stakind1 = 1 THEN (stat.a).stavalues1
            WHEN (stat.a).stakind2 = 1 THEN (stat.a).stavalues2
            WHEN (stat.a).stakind3 = 1 THEN (stat.a).stavalues3
            WHEN (stat.a).stakind4 = 1 THEN (stat.a).stavalues4
            WHEN (stat.a).stakind5 = 1 THEN (stat.a).stavalues5
            ELSE NULL::anyarray
        END AS most_common_vals,
        CASE
            WHEN (stat.a).stakind1 = 1 THEN (stat.a).stanumbers1
            WHEN (stat.a).stakind2 = 1 THEN (stat.a).stanumbers2
            WHEN (stat.a).stakind3 = 1 THEN (stat.a).stanumbers3
            WHEN (stat.a).stakind4 = 1 THEN (stat.a).stanumbers4
            WHEN (stat.a).stakind5 = 1 THEN (stat.a).stanumbers5
            ELSE NULL::real[]
        END AS most_common_freqs,
        CASE
            WHEN (stat.a).stakind1 = 2 THEN (stat.a).stavalues1
            WHEN (stat.a).stakind2 = 2 THEN (stat.a).stavalues2
            WHEN (stat.a).stakind3 = 2 THEN (stat.a).stavalues3
            WHEN (stat.a).stakind4 = 2 THEN (stat.a).stavalues4
            WHEN (stat.a).stakind5 = 2 THEN (stat.a).stavalues5
            ELSE NULL::anyarray
        END AS histogram_bounds,
        CASE
            WHEN (stat.a).stakind1 = 3 THEN (stat.a).stanumbers1[1]
            WHEN (stat.a).stakind2 = 3 THEN (stat.a).stanumbers2[1]
            WHEN (stat.a).stakind3 = 3 THEN (stat.a).stanumbers3[1]
            WHEN (stat.a).stakind4 = 3 THEN (stat.a).stanumbers4[1]
            WHEN (stat.a).stakind5 = 3 THEN (stat.a).stanumbers5[1]
            ELSE NULL::real
        END AS correlation,
        CASE
            WHEN (stat.a).stakind1 = 4 THEN (stat.a).stavalues1
            WHEN (stat.a).stakind2 = 4 THEN (stat.a).stavalues2
            WHEN (stat.a).stakind3 = 4 THEN (stat.a).stavalues3
            WHEN (stat.a).stakind4 = 4 THEN (stat.a).stavalues4
            WHEN (stat.a).stakind5 = 4 THEN (stat.a).stavalues5
            ELSE NULL::anyarray
        END AS most_common_elems,
        CASE
            WHEN (stat.a).stakind1 = 4 THEN (stat.a).stanumbers1
            WHEN (stat.a).stakind2 = 4 THEN (stat.a).stanumbers2
            WHEN (stat.a).stakind3 = 4 THEN (stat.a).stanumbers3
            WHEN (stat.a).stakind4 = 4 THEN (stat.a).stanumbers4
            WHEN (stat.a).stakind5 = 4 THEN (stat.a).stanumbers5
            ELSE NULL::real[]
        END AS most_common_elem_freqs,
        CASE
            WHEN (stat.a).stakind1 = 5 THEN (stat.a).stanumbers1
            WHEN (stat.a).stakind2 = 5 THEN (stat.a).stanumbers2
            WHEN (stat.a).stakind3 = 5 THEN (stat.a).stanumbers3
            WHEN (stat.a).stakind4 = 5 THEN (stat.a).stanumbers4
            WHEN (stat.a).stakind5 = 5 THEN (stat.a).stanumbers5
            ELSE NULL::real[]
        END AS elem_count_histogram
   FROM pg_statistic_ext s
     JOIN pg_class c ON c.oid = s.stxrelid
     LEFT JOIN pg_statistic_ext_data sd ON s.oid = sd.stxoid
     LEFT JOIN pg_namespace cn ON cn.oid = c.relnamespace
     LEFT JOIN pg_namespace sn ON sn.oid = s.stxnamespace
     JOIN LATERAL ( SELECT unnest(pg_get_statisticsobjdef_expressions(s.oid)) AS expr,
            unnest(sd.stxdexpr) AS a) stat ON stat.expr IS NOT NULL;
CREATE VIEW pg_stat_replication_slots
 SELECT s.slot_name,
    s.spill_txns,
    s.spill_count,
    s.spill_bytes,
    s.stream_txns,
    s.stream_count,
    s.stream_bytes,
    s.total_txns,
    s.total_bytes,
    s.stats_reset
   FROM pg_replication_slots r,
    LATERAL pg_stat_get_replication_slot(r.slot_name::text) s(slot_name, spill_txns, spill_count, spill_bytes, stream_txns, stream_count, stream_bytes, total_txns, total_bytes, stats_reset)
  WHERE r.datoid IS NOT NULL;
CREATE VIEW pg_backend_memory_contexts
 SELECT pg_get_backend_memory_contexts.name,
    pg_get_backend_memory_contexts.ident,
    pg_get_backend_memory_contexts.parent,
    pg_get_backend_memory_contexts.level,
    pg_get_backend_memory_contexts.total_bytes,
    pg_get_backend_memory_contexts.total_nblocks,
    pg_get_backend_memory_contexts.free_bytes,
    pg_get_backend_memory_contexts.free_chunks,
    pg_get_backend_memory_contexts.used_bytes
   FROM pg_get_backend_memory_contexts() pg_get_backend_memory_contexts(name, ident, parent, level, total_bytes, total_nblocks, free_bytes, free_chunks, used_bytes);
CREATE VIEW pg_stat_wal
 SELECT w.wal_records,
    w.wal_fpi,
    w.wal_bytes,
    w.wal_buffers_full,
    w.wal_write,
    w.wal_sync,
    w.wal_write_time,
    w.wal_sync_time,
    w.stats_reset
   FROM pg_stat_get_wal() w(wal_records, wal_fpi, wal_bytes, wal_buffers_full, wal_write, wal_sync, wal_write_time, wal_sync_time, stats_reset);

CREATE VIEW pg_stat_progress_copy
 SELECT s.pid,
    s.datid,
    d.datname,
    s.relid,
        CASE s.param5
            WHEN 1 THEN 'COPY FROM'::text
            WHEN 2 THEN 'COPY TO'::text
            ELSE NULL::text
        END AS command,
        CASE s.param6
            WHEN 1 THEN 'FILE'::text
            WHEN 2 THEN 'PROGRAM'::text
            WHEN 3 THEN 'PIPE'::text
            WHEN 4 THEN 'CALLBACK'::text
            ELSE NULL::text
        END AS type,
    s.param1 AS bytes_processed,
    s.param2 AS bytes_total,
    s.param3 AS tuples_processed,
    s.param4 AS tuples_excluded
   FROM pg_stat_get_progress_info('COPY'::text) s(pid, datid, relid, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20)
     LEFT JOIN pg_database d ON s.datid = d.oid;

ALTER TABLE pg_statistic_ext_data ADD COLUMN stxdexpr pg_statistic[] NOT NULL;

ALTER TABLE pg_attribute ADD COLUMN attcompression char NULL;

ALTER TABLE pg_subscription ADD COLUMN subbinary bool NULL;
ALTER TABLE pg_subscription ADD COLUMN substream bool NULL;

ALTER TABLE pg_statistic_ext ADD COLUMN stxexprs pg_node_tree NOT NULL;

ALTER TABLE pg_inherits ADD COLUMN inhdetachpending bool NULL;

ALTER TABLE pg_proc ADD COLUMN prosqlbody pg_node_tree NOT NULL;

ALTER TABLE pg_type ADD COLUMN typsubscript regproc NULL;

ALTER TABLE pg_range ADD COLUMN rngmultitypid oid NULL;
/*
## view `pg_replication_slots`

### Features

feat: add column `two_phase bool NOT NULL`

## view `pg_stat_activity`

### Features

feat: add column `query_id int8 NOT NULL`

## view `pg_locks`

### Features

feat: add column `waitstart timestamptz NOT NULL`

## view `pg_stat_database`

### Features

feat: add column `session_time double precision NOT NULL`
feat: add column `active_time double precision NOT NULL`
feat: add column `idle_in_transaction_time double precision NOT NULL`
feat: add column `sessions int8 NOT NULL`
feat: add column `sessions_abandoned int8 NOT NULL`
feat: add column `sessions_fatal int8 NOT NULL`
feat: add column `sessions_killed int8 NOT NULL`

## view `pg_stats_ext`

### Features

feat: add column `exprs text[] NOT NULL`

## view `pg_prepared_statements`

### Features

feat: add column `generic_plans int8 NOT NULL`
feat: add column `custom_plans int8 NOT NULL`

## view `pg_stat_ssl`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_ssl drop column compression

*/
