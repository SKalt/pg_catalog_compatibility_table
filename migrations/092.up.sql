CREATE TABLE pg_shseclabel (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , ctid tid NOT NULL
  , objoid oid NOT NULL
  , classoid oid NOT NULL
  , provider text NULL
  , label text NULL
);

CREATE TABLE pg_range (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , ctid tid NOT NULL
  , rngtypid oid NOT NULL
  , rngsubtype oid NOT NULL
  , rngcollation oid NOT NULL
  , rngsubopc oid NOT NULL
  , rngcanonical regproc NOT NULL
  , rngsubdiff regproc NOT NULL
);

CREATE VIEW pg_stat_xact_user_tables AS
 SELECT pg_stat_xact_all_tables.relid, pg_stat_xact_all_tables.schemaname, 
    pg_stat_xact_all_tables.relname, pg_stat_xact_all_tables.seq_scan, 
    pg_stat_xact_all_tables.seq_tup_read, pg_stat_xact_all_tables.idx_scan, 
    pg_stat_xact_all_tables.idx_tup_fetch, pg_stat_xact_all_tables.n_tup_ins, 
    pg_stat_xact_all_tables.n_tup_upd, pg_stat_xact_all_tables.n_tup_del, 
    pg_stat_xact_all_tables.n_tup_hot_upd
   FROM pg_stat_xact_all_tables
  WHERE (pg_stat_xact_all_tables.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_stat_xact_all_tables.schemaname !~ '^pg_toast'::text;

CREATE VIEW pg_statio_user_indexes AS
 SELECT pg_statio_all_indexes.relid, pg_statio_all_indexes.indexrelid, 
    pg_statio_all_indexes.schemaname, pg_statio_all_indexes.relname, 
    pg_statio_all_indexes.indexrelname, pg_statio_all_indexes.idx_blks_read, 
    pg_statio_all_indexes.idx_blks_hit
   FROM pg_statio_all_indexes
  WHERE (pg_statio_all_indexes.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_statio_all_indexes.schemaname !~ '^pg_toast'::text;

CREATE VIEW pg_statio_sys_indexes AS
 SELECT pg_statio_all_indexes.relid, pg_statio_all_indexes.indexrelid, 
    pg_statio_all_indexes.schemaname, pg_statio_all_indexes.relname, 
    pg_statio_all_indexes.indexrelname, pg_statio_all_indexes.idx_blks_read, 
    pg_statio_all_indexes.idx_blks_hit
   FROM pg_statio_all_indexes
  WHERE (pg_statio_all_indexes.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR pg_statio_all_indexes.schemaname ~ '^pg_toast'::text;

CREATE VIEW pg_statio_sys_tables AS
 SELECT pg_statio_all_tables.relid, pg_statio_all_tables.schemaname, 
    pg_statio_all_tables.relname, pg_statio_all_tables.heap_blks_read, 
    pg_statio_all_tables.heap_blks_hit, pg_statio_all_tables.idx_blks_read, 
    pg_statio_all_tables.idx_blks_hit, pg_statio_all_tables.toast_blks_read, 
    pg_statio_all_tables.toast_blks_hit, pg_statio_all_tables.tidx_blks_read, 
    pg_statio_all_tables.tidx_blks_hit
   FROM pg_statio_all_tables
  WHERE (pg_statio_all_tables.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR pg_statio_all_tables.schemaname ~ '^pg_toast'::text;

CREATE VIEW pg_stat_activity AS
 SELECT s.datid, d.datname, s.pid, s.usesysid, u.rolname AS usename, 
    s.application_name, s.client_addr, s.client_hostname, s.client_port, 
    s.backend_start, s.xact_start, s.query_start, s.state_change, s.waiting, 
    s.state, s.query
   FROM pg_database d, 
    pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, waiting, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port), 
    pg_authid u
  WHERE s.datid = d.oid AND s.usesysid = u.oid;

CREATE VIEW pg_statio_sys_sequences AS
 SELECT pg_statio_all_sequences.relid, pg_statio_all_sequences.schemaname, 
    pg_statio_all_sequences.relname, pg_statio_all_sequences.blks_read, 
    pg_statio_all_sequences.blks_hit
   FROM pg_statio_all_sequences
  WHERE (pg_statio_all_sequences.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR pg_statio_all_sequences.schemaname ~ '^pg_toast'::text;

CREATE VIEW pg_stat_database AS
 SELECT d.oid AS datid, d.datname, 
    pg_stat_get_db_numbackends(d.oid) AS numbackends, 
    pg_stat_get_db_xact_commit(d.oid) AS xact_commit, 
    pg_stat_get_db_xact_rollback(d.oid) AS xact_rollback, 
    pg_stat_get_db_blocks_fetched(d.oid) - pg_stat_get_db_blocks_hit(d.oid) AS blks_read, 
    pg_stat_get_db_blocks_hit(d.oid) AS blks_hit, 
    pg_stat_get_db_tuples_returned(d.oid) AS tup_returned, 
    pg_stat_get_db_tuples_fetched(d.oid) AS tup_fetched, 
    pg_stat_get_db_tuples_inserted(d.oid) AS tup_inserted, 
    pg_stat_get_db_tuples_updated(d.oid) AS tup_updated, 
    pg_stat_get_db_tuples_deleted(d.oid) AS tup_deleted, 
    pg_stat_get_db_conflict_all(d.oid) AS conflicts, 
    pg_stat_get_db_temp_files(d.oid) AS temp_files, 
    pg_stat_get_db_temp_bytes(d.oid) AS temp_bytes, 
    pg_stat_get_db_deadlocks(d.oid) AS deadlocks, 
    pg_stat_get_db_blk_read_time(d.oid) AS blk_read_time, 
    pg_stat_get_db_blk_write_time(d.oid) AS blk_write_time, 
    pg_stat_get_db_stat_reset_time(d.oid) AS stats_reset
   FROM pg_database d;

CREATE VIEW pg_stat_user_tables AS
 SELECT pg_stat_all_tables.relid, pg_stat_all_tables.schemaname, 
    pg_stat_all_tables.relname, pg_stat_all_tables.seq_scan, 
    pg_stat_all_tables.seq_tup_read, pg_stat_all_tables.idx_scan, 
    pg_stat_all_tables.idx_tup_fetch, pg_stat_all_tables.n_tup_ins, 
    pg_stat_all_tables.n_tup_upd, pg_stat_all_tables.n_tup_del, 
    pg_stat_all_tables.n_tup_hot_upd, pg_stat_all_tables.n_live_tup, 
    pg_stat_all_tables.n_dead_tup, pg_stat_all_tables.last_vacuum, 
    pg_stat_all_tables.last_autovacuum, pg_stat_all_tables.last_analyze, 
    pg_stat_all_tables.last_autoanalyze, pg_stat_all_tables.vacuum_count, 
    pg_stat_all_tables.autovacuum_count, pg_stat_all_tables.analyze_count, 
    pg_stat_all_tables.autoanalyze_count
   FROM pg_stat_all_tables
  WHERE (pg_stat_all_tables.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_stat_all_tables.schemaname !~ '^pg_toast'::text;

CREATE VIEW pg_stat_sys_indexes AS
 SELECT pg_stat_all_indexes.relid, pg_stat_all_indexes.indexrelid, 
    pg_stat_all_indexes.schemaname, pg_stat_all_indexes.relname, 
    pg_stat_all_indexes.indexrelname, pg_stat_all_indexes.idx_scan, 
    pg_stat_all_indexes.idx_tup_read, pg_stat_all_indexes.idx_tup_fetch
   FROM pg_stat_all_indexes
  WHERE (pg_stat_all_indexes.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR pg_stat_all_indexes.schemaname ~ '^pg_toast'::text;

CREATE VIEW pg_stat_database_conflicts AS
 SELECT d.oid AS datid, d.datname, 
    pg_stat_get_db_conflict_tablespace(d.oid) AS confl_tablespace, 
    pg_stat_get_db_conflict_lock(d.oid) AS confl_lock, 
    pg_stat_get_db_conflict_snapshot(d.oid) AS confl_snapshot, 
    pg_stat_get_db_conflict_bufferpin(d.oid) AS confl_bufferpin, 
    pg_stat_get_db_conflict_startup_deadlock(d.oid) AS confl_deadlock
   FROM pg_database d;

CREATE VIEW pg_stat_all_tables AS
 SELECT c.oid AS relid, n.nspname AS schemaname, c.relname, 
    pg_stat_get_numscans(c.oid) AS seq_scan, 
    pg_stat_get_tuples_returned(c.oid) AS seq_tup_read, 
    sum(pg_stat_get_numscans(i.indexrelid))::bigint AS idx_scan, 
    sum(pg_stat_get_tuples_fetched(i.indexrelid))::bigint + pg_stat_get_tuples_fetched(c.oid) AS idx_tup_fetch, 
    pg_stat_get_tuples_inserted(c.oid) AS n_tup_ins, 
    pg_stat_get_tuples_updated(c.oid) AS n_tup_upd, 
    pg_stat_get_tuples_deleted(c.oid) AS n_tup_del, 
    pg_stat_get_tuples_hot_updated(c.oid) AS n_tup_hot_upd, 
    pg_stat_get_live_tuples(c.oid) AS n_live_tup, 
    pg_stat_get_dead_tuples(c.oid) AS n_dead_tup, 
    pg_stat_get_last_vacuum_time(c.oid) AS last_vacuum, 
    pg_stat_get_last_autovacuum_time(c.oid) AS last_autovacuum, 
    pg_stat_get_last_analyze_time(c.oid) AS last_analyze, 
    pg_stat_get_last_autoanalyze_time(c.oid) AS last_autoanalyze, 
    pg_stat_get_vacuum_count(c.oid) AS vacuum_count, 
    pg_stat_get_autovacuum_count(c.oid) AS autovacuum_count, 
    pg_stat_get_analyze_count(c.oid) AS analyze_count, 
    pg_stat_get_autoanalyze_count(c.oid) AS autoanalyze_count
   FROM pg_class c
   LEFT JOIN pg_index i ON c.oid = i.indrelid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"])
  GROUP BY c.oid, n.nspname, c.relname;

CREATE VIEW pg_stat_xact_all_tables AS
 SELECT c.oid AS relid, n.nspname AS schemaname, c.relname, 
    pg_stat_get_xact_numscans(c.oid) AS seq_scan, 
    pg_stat_get_xact_tuples_returned(c.oid) AS seq_tup_read, 
    sum(pg_stat_get_xact_numscans(i.indexrelid))::bigint AS idx_scan, 
    sum(pg_stat_get_xact_tuples_fetched(i.indexrelid))::bigint + pg_stat_get_xact_tuples_fetched(c.oid) AS idx_tup_fetch, 
    pg_stat_get_xact_tuples_inserted(c.oid) AS n_tup_ins, 
    pg_stat_get_xact_tuples_updated(c.oid) AS n_tup_upd, 
    pg_stat_get_xact_tuples_deleted(c.oid) AS n_tup_del, 
    pg_stat_get_xact_tuples_hot_updated(c.oid) AS n_tup_hot_upd
   FROM pg_class c
   LEFT JOIN pg_index i ON c.oid = i.indrelid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"])
  GROUP BY c.oid, n.nspname, c.relname;

CREATE VIEW pg_statio_all_indexes AS
 SELECT c.oid AS relid, i.oid AS indexrelid, n.nspname AS schemaname, c.relname, 
    i.relname AS indexrelname, 
    pg_stat_get_blocks_fetched(i.oid) - pg_stat_get_blocks_hit(i.oid) AS idx_blks_read, 
    pg_stat_get_blocks_hit(i.oid) AS idx_blks_hit
   FROM pg_class c
   JOIN pg_index x ON c.oid = x.indrelid
   JOIN pg_class i ON i.oid = x.indexrelid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"]);

CREATE VIEW pg_stat_user_functions AS
 SELECT p.oid AS funcid, n.nspname AS schemaname, p.proname AS funcname, 
    pg_stat_get_function_calls(p.oid) AS calls, 
    pg_stat_get_function_total_time(p.oid) AS total_time, 
    pg_stat_get_function_self_time(p.oid) AS self_time
   FROM pg_proc p
   LEFT JOIN pg_namespace n ON n.oid = p.pronamespace
  WHERE p.prolang <> 12::oid AND pg_stat_get_function_calls(p.oid) IS NOT NULL;

CREATE VIEW pg_stat_all_indexes AS
 SELECT c.oid AS relid, i.oid AS indexrelid, n.nspname AS schemaname, c.relname, 
    i.relname AS indexrelname, pg_stat_get_numscans(i.oid) AS idx_scan, 
    pg_stat_get_tuples_returned(i.oid) AS idx_tup_read, 
    pg_stat_get_tuples_fetched(i.oid) AS idx_tup_fetch
   FROM pg_class c
   JOIN pg_index x ON c.oid = x.indrelid
   JOIN pg_class i ON i.oid = x.indexrelid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"]);

CREATE VIEW pg_stat_xact_user_functions AS
 SELECT p.oid AS funcid, n.nspname AS schemaname, p.proname AS funcname, 
    pg_stat_get_xact_function_calls(p.oid) AS calls, 
    pg_stat_get_xact_function_total_time(p.oid) AS total_time, 
    pg_stat_get_xact_function_self_time(p.oid) AS self_time
   FROM pg_proc p
   LEFT JOIN pg_namespace n ON n.oid = p.pronamespace
  WHERE p.prolang <> 12::oid AND pg_stat_get_xact_function_calls(p.oid) IS NOT NULL;

CREATE VIEW pg_stat_xact_sys_tables AS
 SELECT pg_stat_xact_all_tables.relid, pg_stat_xact_all_tables.schemaname, 
    pg_stat_xact_all_tables.relname, pg_stat_xact_all_tables.seq_scan, 
    pg_stat_xact_all_tables.seq_tup_read, pg_stat_xact_all_tables.idx_scan, 
    pg_stat_xact_all_tables.idx_tup_fetch, pg_stat_xact_all_tables.n_tup_ins, 
    pg_stat_xact_all_tables.n_tup_upd, pg_stat_xact_all_tables.n_tup_del, 
    pg_stat_xact_all_tables.n_tup_hot_upd
   FROM pg_stat_xact_all_tables
  WHERE (pg_stat_xact_all_tables.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR pg_stat_xact_all_tables.schemaname ~ '^pg_toast'::text;

CREATE VIEW pg_statio_all_tables AS
 SELECT c.oid AS relid, n.nspname AS schemaname, c.relname, 
    pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid) AS heap_blks_read, 
    pg_stat_get_blocks_hit(c.oid) AS heap_blks_hit, 
    sum(pg_stat_get_blocks_fetched(i.indexrelid) - pg_stat_get_blocks_hit(i.indexrelid))::bigint AS idx_blks_read, 
    sum(pg_stat_get_blocks_hit(i.indexrelid))::bigint AS idx_blks_hit, 
    pg_stat_get_blocks_fetched(t.oid) - pg_stat_get_blocks_hit(t.oid) AS toast_blks_read, 
    pg_stat_get_blocks_hit(t.oid) AS toast_blks_hit, 
    pg_stat_get_blocks_fetched(x.oid) - pg_stat_get_blocks_hit(x.oid) AS tidx_blks_read, 
    pg_stat_get_blocks_hit(x.oid) AS tidx_blks_hit
   FROM pg_class c
   LEFT JOIN pg_index i ON c.oid = i.indrelid
   LEFT JOIN pg_class t ON c.reltoastrelid = t.oid
   LEFT JOIN pg_class x ON t.reltoastidxid = x.oid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"])
  GROUP BY c.oid, n.nspname, c.relname, t.oid, x.oid;

CREATE VIEW pg_stat_bgwriter AS
 SELECT pg_stat_get_bgwriter_timed_checkpoints() AS checkpoints_timed, 
    pg_stat_get_bgwriter_requested_checkpoints() AS checkpoints_req, 
    pg_stat_get_checkpoint_write_time() AS checkpoint_write_time, 
    pg_stat_get_checkpoint_sync_time() AS checkpoint_sync_time, 
    pg_stat_get_bgwriter_buf_written_checkpoints() AS buffers_checkpoint, 
    pg_stat_get_bgwriter_buf_written_clean() AS buffers_clean, 
    pg_stat_get_bgwriter_maxwritten_clean() AS maxwritten_clean, 
    pg_stat_get_buf_written_backend() AS buffers_backend, 
    pg_stat_get_buf_fsync_backend() AS buffers_backend_fsync, 
    pg_stat_get_buf_alloc() AS buffers_alloc, 
    pg_stat_get_bgwriter_stat_reset_time() AS stats_reset;

CREATE VIEW pg_stat_replication AS
 SELECT s.pid, s.usesysid, u.rolname AS usename, s.application_name, 
    s.client_addr, s.client_hostname, s.client_port, s.backend_start, w.state, 
    w.sent_location, w.write_location, w.flush_location, w.replay_location, 
    w.sync_priority, w.sync_state
   FROM pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, waiting, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port), 
    pg_authid u, 
    pg_stat_get_wal_senders() w(pid, state, sent_location, write_location, flush_location, replay_location, sync_priority, sync_state)
  WHERE s.usesysid = u.oid AND s.pid = w.pid;

CREATE VIEW pg_stat_user_indexes AS
 SELECT pg_stat_all_indexes.relid, pg_stat_all_indexes.indexrelid, 
    pg_stat_all_indexes.schemaname, pg_stat_all_indexes.relname, 
    pg_stat_all_indexes.indexrelname, pg_stat_all_indexes.idx_scan, 
    pg_stat_all_indexes.idx_tup_read, pg_stat_all_indexes.idx_tup_fetch
   FROM pg_stat_all_indexes
  WHERE (pg_stat_all_indexes.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_stat_all_indexes.schemaname !~ '^pg_toast'::text;

CREATE VIEW pg_statio_user_sequences AS
 SELECT pg_statio_all_sequences.relid, pg_statio_all_sequences.schemaname, 
    pg_statio_all_sequences.relname, pg_statio_all_sequences.blks_read, 
    pg_statio_all_sequences.blks_hit
   FROM pg_statio_all_sequences
  WHERE (pg_statio_all_sequences.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_statio_all_sequences.schemaname !~ '^pg_toast'::text;

CREATE VIEW pg_statio_user_tables AS
 SELECT pg_statio_all_tables.relid, pg_statio_all_tables.schemaname, 
    pg_statio_all_tables.relname, pg_statio_all_tables.heap_blks_read, 
    pg_statio_all_tables.heap_blks_hit, pg_statio_all_tables.idx_blks_read, 
    pg_statio_all_tables.idx_blks_hit, pg_statio_all_tables.toast_blks_read, 
    pg_statio_all_tables.toast_blks_hit, pg_statio_all_tables.tidx_blks_read, 
    pg_statio_all_tables.tidx_blks_hit
   FROM pg_statio_all_tables
  WHERE (pg_statio_all_tables.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_statio_all_tables.schemaname !~ '^pg_toast'::text;

CREATE VIEW pg_statio_all_sequences AS
 SELECT c.oid AS relid, n.nspname AS schemaname, c.relname, 
    pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid) AS blks_read, 
    pg_stat_get_blocks_hit(c.oid) AS blks_hit
   FROM pg_class c
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = 'S'::"char";

CREATE VIEW pg_stat_sys_tables AS
 SELECT pg_stat_all_tables.relid, pg_stat_all_tables.schemaname, 
    pg_stat_all_tables.relname, pg_stat_all_tables.seq_scan, 
    pg_stat_all_tables.seq_tup_read, pg_stat_all_tables.idx_scan, 
    pg_stat_all_tables.idx_tup_fetch, pg_stat_all_tables.n_tup_ins, 
    pg_stat_all_tables.n_tup_upd, pg_stat_all_tables.n_tup_del, 
    pg_stat_all_tables.n_tup_hot_upd, pg_stat_all_tables.n_live_tup, 
    pg_stat_all_tables.n_dead_tup, pg_stat_all_tables.last_vacuum, 
    pg_stat_all_tables.last_autovacuum, pg_stat_all_tables.last_analyze, 
    pg_stat_all_tables.last_autoanalyze, pg_stat_all_tables.vacuum_count, 
    pg_stat_all_tables.autovacuum_count, pg_stat_all_tables.analyze_count, 
    pg_stat_all_tables.autoanalyze_count
   FROM pg_stat_all_tables
  WHERE (pg_stat_all_tables.schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR pg_stat_all_tables.schemaname ~ '^pg_toast'::text;

ALTER TABLE pg_statistic ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_statistic ADD COLUMN cmax cid NULL;
ALTER TABLE pg_statistic ADD COLUMN xmax xid NULL;
ALTER TABLE pg_statistic ADD COLUMN cmin cid NULL;
ALTER TABLE pg_statistic ADD COLUMN xmin xid NULL;
ALTER TABLE pg_statistic ADD COLUMN ctid tid NULL;
ALTER TABLE pg_statistic ADD COLUMN stakind1 int2 NULL;
ALTER TABLE pg_statistic ADD COLUMN stakind2 int2 NULL;
ALTER TABLE pg_statistic ADD COLUMN stakind3 int2 NULL;
ALTER TABLE pg_statistic ADD COLUMN stakind4 int2 NULL;
ALTER TABLE pg_statistic ADD COLUMN stakind5 int2 NULL;
ALTER TABLE pg_statistic ADD COLUMN staop1 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN staop2 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN staop3 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN staop4 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN staop5 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN stanumbers1 float4[] NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stanumbers2 float4[] NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stanumbers3 float4[] NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stanumbers4 float4[] NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stanumbers5 float4[] NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stavalues1 anyarray NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stavalues2 anyarray NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stavalues3 anyarray NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stavalues4 anyarray NOT NULL;
ALTER TABLE pg_statistic ADD COLUMN stavalues5 anyarray NOT NULL;

ALTER TABLE pg_statistic ALTER COLUMN starelid SET NOT NULL;
ALTER TABLE pg_statistic ALTER COLUMN staattnum SET NOT NULL;
ALTER TABLE pg_statistic ALTER COLUMN stainherit SET NOT NULL;
ALTER TABLE pg_statistic ALTER COLUMN stanullfrac SET NOT NULL;
ALTER TABLE pg_statistic ALTER COLUMN stawidth SET NOT NULL;
ALTER TABLE pg_statistic ALTER COLUMN stadistinct SET NOT NULL;


ALTER TABLE pg_description ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_description ADD COLUMN cmax cid NULL;
ALTER TABLE pg_description ADD COLUMN xmax xid NULL;
ALTER TABLE pg_description ADD COLUMN cmin cid NULL;
ALTER TABLE pg_description ADD COLUMN xmin xid NULL;
ALTER TABLE pg_description ADD COLUMN ctid tid NULL;

ALTER TABLE pg_description ALTER COLUMN objoid SET NOT NULL;
ALTER TABLE pg_description ALTER COLUMN classoid SET NOT NULL;
ALTER TABLE pg_description ALTER COLUMN objsubid SET NOT NULL;
ALTER TABLE pg_description ALTER COLUMN description DROP NOT NULL;


ALTER TABLE pg_attribute ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_attribute ADD COLUMN cmax cid NULL;
ALTER TABLE pg_attribute ADD COLUMN xmax xid NULL;
ALTER TABLE pg_attribute ADD COLUMN cmin cid NULL;
ALTER TABLE pg_attribute ADD COLUMN xmin xid NULL;
ALTER TABLE pg_attribute ADD COLUMN ctid tid NULL;
ALTER TABLE pg_attribute ADD COLUMN attfdwoptions text[] NOT NULL;

ALTER TABLE pg_attribute ALTER COLUMN attrelid SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attname SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN atttypid SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attstattarget SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attlen SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attnum SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attndims SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attcacheoff SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN atttypmod SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attbyval SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attstorage SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attalign SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attnotnull SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN atthasdef SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attisdropped SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attislocal SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attinhcount SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attcollation SET NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attacl DROP NOT NULL;
ALTER TABLE pg_attribute ALTER COLUMN attoptions DROP NOT NULL;


ALTER TABLE pg_language ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_language ADD COLUMN cmax cid NULL;
ALTER TABLE pg_language ADD COLUMN xmax xid NULL;
ALTER TABLE pg_language ADD COLUMN cmin cid NULL;
ALTER TABLE pg_language ADD COLUMN xmin xid NULL;
ALTER TABLE pg_language ADD COLUMN oid oid NULL;
ALTER TABLE pg_language ADD COLUMN ctid tid NULL;

ALTER TABLE pg_language ALTER COLUMN lanname SET NOT NULL;
ALTER TABLE pg_language ALTER COLUMN lanowner SET NOT NULL;
ALTER TABLE pg_language ALTER COLUMN lanispl SET NOT NULL;
ALTER TABLE pg_language ALTER COLUMN lanpltrusted SET NOT NULL;
ALTER TABLE pg_language ALTER COLUMN lanplcallfoid SET NOT NULL;
ALTER TABLE pg_language ALTER COLUMN laninline SET NOT NULL;
ALTER TABLE pg_language ALTER COLUMN lanvalidator SET NOT NULL;
ALTER TABLE pg_language ALTER COLUMN lanacl DROP NOT NULL;


ALTER TABLE pg_largeobject_metadata ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_largeobject_metadata ADD COLUMN cmax cid NULL;
ALTER TABLE pg_largeobject_metadata ADD COLUMN xmax xid NULL;
ALTER TABLE pg_largeobject_metadata ADD COLUMN cmin cid NULL;
ALTER TABLE pg_largeobject_metadata ADD COLUMN xmin xid NULL;
ALTER TABLE pg_largeobject_metadata ADD COLUMN oid oid NULL;
ALTER TABLE pg_largeobject_metadata ADD COLUMN ctid tid NULL;

ALTER TABLE pg_largeobject_metadata ALTER COLUMN lomowner SET NOT NULL;
ALTER TABLE pg_largeobject_metadata ALTER COLUMN lomacl DROP NOT NULL;


ALTER TABLE pg_auth_members ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_auth_members ADD COLUMN cmax cid NULL;
ALTER TABLE pg_auth_members ADD COLUMN xmax xid NULL;
ALTER TABLE pg_auth_members ADD COLUMN cmin cid NULL;
ALTER TABLE pg_auth_members ADD COLUMN xmin xid NULL;
ALTER TABLE pg_auth_members ADD COLUMN ctid tid NULL;

ALTER TABLE pg_auth_members ALTER COLUMN roleid SET NOT NULL;
ALTER TABLE pg_auth_members ALTER COLUMN member SET NOT NULL;
ALTER TABLE pg_auth_members ALTER COLUMN grantor SET NOT NULL;
ALTER TABLE pg_auth_members ALTER COLUMN admin_option SET NOT NULL;


ALTER TABLE pg_opclass ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_opclass ADD COLUMN cmax cid NULL;
ALTER TABLE pg_opclass ADD COLUMN xmax xid NULL;
ALTER TABLE pg_opclass ADD COLUMN cmin cid NULL;
ALTER TABLE pg_opclass ADD COLUMN xmin xid NULL;
ALTER TABLE pg_opclass ADD COLUMN oid oid NULL;
ALTER TABLE pg_opclass ADD COLUMN ctid tid NULL;

ALTER TABLE pg_opclass ALTER COLUMN opcmethod SET NOT NULL;
ALTER TABLE pg_opclass ALTER COLUMN opcname SET NOT NULL;
ALTER TABLE pg_opclass ALTER COLUMN opcnamespace SET NOT NULL;
ALTER TABLE pg_opclass ALTER COLUMN opcowner SET NOT NULL;
ALTER TABLE pg_opclass ALTER COLUMN opcfamily SET NOT NULL;
ALTER TABLE pg_opclass ALTER COLUMN opcintype SET NOT NULL;
ALTER TABLE pg_opclass ALTER COLUMN opcdefault SET NOT NULL;
ALTER TABLE pg_opclass ALTER COLUMN opckeytype SET NOT NULL;


ALTER TABLE pg_authid ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_authid ADD COLUMN cmax cid NULL;
ALTER TABLE pg_authid ADD COLUMN xmax xid NULL;
ALTER TABLE pg_authid ADD COLUMN cmin cid NULL;
ALTER TABLE pg_authid ADD COLUMN xmin xid NULL;
ALTER TABLE pg_authid ADD COLUMN oid oid NULL;
ALTER TABLE pg_authid ADD COLUMN ctid tid NULL;

ALTER TABLE pg_authid ALTER COLUMN rolname SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolsuper SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolinherit SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolcreaterole SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolcreatedb SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolcatupdate SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolcanlogin SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolreplication SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolconnlimit SET NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolpassword DROP NOT NULL;
ALTER TABLE pg_authid ALTER COLUMN rolvaliduntil DROP NOT NULL;


ALTER TABLE pg_operator ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_operator ADD COLUMN cmax cid NULL;
ALTER TABLE pg_operator ADD COLUMN xmax xid NULL;
ALTER TABLE pg_operator ADD COLUMN cmin cid NULL;
ALTER TABLE pg_operator ADD COLUMN xmin xid NULL;
ALTER TABLE pg_operator ADD COLUMN oid oid NULL;
ALTER TABLE pg_operator ADD COLUMN ctid tid NULL;

ALTER TABLE pg_operator ALTER COLUMN oprname SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprnamespace SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprowner SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprkind SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprcanmerge SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprcanhash SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprleft SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprright SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprresult SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprcom SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprnegate SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprcode SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprrest SET NOT NULL;
ALTER TABLE pg_operator ALTER COLUMN oprjoin SET NOT NULL;


ALTER TABLE pg_ts_dict ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_ts_dict ADD COLUMN cmax cid NULL;
ALTER TABLE pg_ts_dict ADD COLUMN xmax xid NULL;
ALTER TABLE pg_ts_dict ADD COLUMN cmin cid NULL;
ALTER TABLE pg_ts_dict ADD COLUMN xmin xid NULL;
ALTER TABLE pg_ts_dict ADD COLUMN oid oid NULL;
ALTER TABLE pg_ts_dict ADD COLUMN ctid tid NULL;

ALTER TABLE pg_ts_dict ALTER COLUMN dictname SET NOT NULL;
ALTER TABLE pg_ts_dict ALTER COLUMN dictnamespace SET NOT NULL;
ALTER TABLE pg_ts_dict ALTER COLUMN dictowner SET NOT NULL;
ALTER TABLE pg_ts_dict ALTER COLUMN dicttemplate SET NOT NULL;
ALTER TABLE pg_ts_dict ALTER COLUMN dictinitoption DROP NOT NULL;


ALTER TABLE pg_default_acl ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_default_acl ADD COLUMN cmax cid NULL;
ALTER TABLE pg_default_acl ADD COLUMN xmax xid NULL;
ALTER TABLE pg_default_acl ADD COLUMN cmin cid NULL;
ALTER TABLE pg_default_acl ADD COLUMN xmin xid NULL;
ALTER TABLE pg_default_acl ADD COLUMN oid oid NULL;
ALTER TABLE pg_default_acl ADD COLUMN ctid tid NULL;

ALTER TABLE pg_default_acl ALTER COLUMN defaclrole SET NOT NULL;
ALTER TABLE pg_default_acl ALTER COLUMN defaclnamespace SET NOT NULL;
ALTER TABLE pg_default_acl ALTER COLUMN defaclobjtype SET NOT NULL;
ALTER TABLE pg_default_acl ALTER COLUMN defaclacl DROP NOT NULL;


ALTER TABLE pg_foreign_data_wrapper ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_foreign_data_wrapper ADD COLUMN cmax cid NULL;
ALTER TABLE pg_foreign_data_wrapper ADD COLUMN xmax xid NULL;
ALTER TABLE pg_foreign_data_wrapper ADD COLUMN cmin cid NULL;
ALTER TABLE pg_foreign_data_wrapper ADD COLUMN xmin xid NULL;
ALTER TABLE pg_foreign_data_wrapper ADD COLUMN oid oid NULL;
ALTER TABLE pg_foreign_data_wrapper ADD COLUMN ctid tid NULL;

ALTER TABLE pg_foreign_data_wrapper ALTER COLUMN fdwname SET NOT NULL;
ALTER TABLE pg_foreign_data_wrapper ALTER COLUMN fdwowner SET NOT NULL;
ALTER TABLE pg_foreign_data_wrapper ALTER COLUMN fdwhandler SET NOT NULL;
ALTER TABLE pg_foreign_data_wrapper ALTER COLUMN fdwvalidator SET NOT NULL;
ALTER TABLE pg_foreign_data_wrapper ALTER COLUMN fdwacl DROP NOT NULL;
ALTER TABLE pg_foreign_data_wrapper ALTER COLUMN fdwoptions DROP NOT NULL;


ALTER TABLE pg_amproc ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_amproc ADD COLUMN cmax cid NULL;
ALTER TABLE pg_amproc ADD COLUMN xmax xid NULL;
ALTER TABLE pg_amproc ADD COLUMN cmin cid NULL;
ALTER TABLE pg_amproc ADD COLUMN xmin xid NULL;
ALTER TABLE pg_amproc ADD COLUMN oid oid NULL;
ALTER TABLE pg_amproc ADD COLUMN ctid tid NULL;

ALTER TABLE pg_amproc ALTER COLUMN amprocfamily SET NOT NULL;
ALTER TABLE pg_amproc ALTER COLUMN amproclefttype SET NOT NULL;
ALTER TABLE pg_amproc ALTER COLUMN amprocrighttype SET NOT NULL;
ALTER TABLE pg_amproc ALTER COLUMN amprocnum SET NOT NULL;
ALTER TABLE pg_amproc ALTER COLUMN amproc SET NOT NULL;


ALTER TABLE pg_user_mapping ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_user_mapping ADD COLUMN cmax cid NULL;
ALTER TABLE pg_user_mapping ADD COLUMN xmax xid NULL;
ALTER TABLE pg_user_mapping ADD COLUMN cmin cid NULL;
ALTER TABLE pg_user_mapping ADD COLUMN xmin xid NULL;
ALTER TABLE pg_user_mapping ADD COLUMN oid oid NULL;
ALTER TABLE pg_user_mapping ADD COLUMN ctid tid NULL;

ALTER TABLE pg_user_mapping ALTER COLUMN umuser SET NOT NULL;
ALTER TABLE pg_user_mapping ALTER COLUMN umserver SET NOT NULL;
ALTER TABLE pg_user_mapping ALTER COLUMN umoptions DROP NOT NULL;


ALTER TABLE pg_am ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_am ADD COLUMN cmax cid NULL;
ALTER TABLE pg_am ADD COLUMN xmax xid NULL;
ALTER TABLE pg_am ADD COLUMN cmin cid NULL;
ALTER TABLE pg_am ADD COLUMN xmin xid NULL;
ALTER TABLE pg_am ADD COLUMN oid oid NULL;
ALTER TABLE pg_am ADD COLUMN ctid tid NULL;
ALTER TABLE pg_am ADD COLUMN amsearcharray bool NULL;
ALTER TABLE pg_am ADD COLUMN amcanreturn regproc NULL;

ALTER TABLE pg_am ALTER COLUMN amname SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amstrategies SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amsupport SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amcanorder SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amcanorderbyop SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amcanbackward SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amcanunique SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amcanmulticol SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amoptionalkey SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amsearchnulls SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amstorage SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amclusterable SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN ampredlocks SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amkeytype SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN aminsert SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN ambeginscan SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amgettuple SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amgetbitmap SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amrescan SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amendscan SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN ammarkpos SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amrestrpos SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN ambuild SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN ambuildempty SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN ambulkdelete SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amvacuumcleanup SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amcostestimate SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amoptions SET NOT NULL;


ALTER TABLE pg_foreign_server ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_foreign_server ADD COLUMN cmax cid NULL;
ALTER TABLE pg_foreign_server ADD COLUMN xmax xid NULL;
ALTER TABLE pg_foreign_server ADD COLUMN cmin cid NULL;
ALTER TABLE pg_foreign_server ADD COLUMN xmin xid NULL;
ALTER TABLE pg_foreign_server ADD COLUMN oid oid NULL;
ALTER TABLE pg_foreign_server ADD COLUMN ctid tid NULL;

ALTER TABLE pg_foreign_server ALTER COLUMN srvname SET NOT NULL;
ALTER TABLE pg_foreign_server ALTER COLUMN srvowner SET NOT NULL;
ALTER TABLE pg_foreign_server ALTER COLUMN srvfdw SET NOT NULL;
ALTER TABLE pg_foreign_server ALTER COLUMN srvtype DROP NOT NULL;
ALTER TABLE pg_foreign_server ALTER COLUMN srvversion DROP NOT NULL;
ALTER TABLE pg_foreign_server ALTER COLUMN srvacl DROP NOT NULL;
ALTER TABLE pg_foreign_server ALTER COLUMN srvoptions DROP NOT NULL;


ALTER TABLE pg_depend ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_depend ADD COLUMN cmax cid NULL;
ALTER TABLE pg_depend ADD COLUMN xmax xid NULL;
ALTER TABLE pg_depend ADD COLUMN cmin cid NULL;
ALTER TABLE pg_depend ADD COLUMN xmin xid NULL;
ALTER TABLE pg_depend ADD COLUMN ctid tid NULL;

ALTER TABLE pg_depend ALTER COLUMN classid SET NOT NULL;
ALTER TABLE pg_depend ALTER COLUMN objid SET NOT NULL;
ALTER TABLE pg_depend ALTER COLUMN objsubid SET NOT NULL;
ALTER TABLE pg_depend ALTER COLUMN refclassid SET NOT NULL;
ALTER TABLE pg_depend ALTER COLUMN refobjid SET NOT NULL;
ALTER TABLE pg_depend ALTER COLUMN refobjsubid SET NOT NULL;
ALTER TABLE pg_depend ALTER COLUMN deptype SET NOT NULL;


ALTER TABLE pg_extension ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_extension ADD COLUMN cmax cid NULL;
ALTER TABLE pg_extension ADD COLUMN xmax xid NULL;
ALTER TABLE pg_extension ADD COLUMN cmin cid NULL;
ALTER TABLE pg_extension ADD COLUMN xmin xid NULL;
ALTER TABLE pg_extension ADD COLUMN oid oid NULL;
ALTER TABLE pg_extension ADD COLUMN ctid tid NULL;

ALTER TABLE pg_extension ALTER COLUMN extname SET NOT NULL;
ALTER TABLE pg_extension ALTER COLUMN extowner SET NOT NULL;
ALTER TABLE pg_extension ALTER COLUMN extnamespace SET NOT NULL;
ALTER TABLE pg_extension ALTER COLUMN extrelocatable SET NOT NULL;
ALTER TABLE pg_extension ALTER COLUMN extversion DROP NOT NULL;
ALTER TABLE pg_extension ALTER COLUMN extconfig DROP NOT NULL;
ALTER TABLE pg_extension ALTER COLUMN extcondition DROP NOT NULL;


ALTER TABLE pg_class ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_class ADD COLUMN cmax cid NULL;
ALTER TABLE pg_class ADD COLUMN xmax xid NULL;
ALTER TABLE pg_class ADD COLUMN cmin cid NULL;
ALTER TABLE pg_class ADD COLUMN xmin xid NULL;
ALTER TABLE pg_class ADD COLUMN oid oid NULL;
ALTER TABLE pg_class ADD COLUMN ctid tid NULL;
ALTER TABLE pg_class ADD COLUMN relallvisible int4 NULL;

ALTER TABLE pg_class ALTER COLUMN relname SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relnamespace SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN reltype SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN reloftype SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relowner SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relam SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relfilenode SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN reltablespace SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relpages SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN reltuples SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN reltoastrelid SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN reltoastidxid SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relhasindex SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relisshared SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relpersistence SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relkind SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relnatts SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relchecks SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relhasoids SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relhaspkey SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relhasrules SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relhastriggers SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relhassubclass SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relfrozenxid SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relacl DROP NOT NULL;
ALTER TABLE pg_class ALTER COLUMN reloptions DROP NOT NULL;


ALTER TABLE pg_cast ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_cast ADD COLUMN cmax cid NULL;
ALTER TABLE pg_cast ADD COLUMN xmax xid NULL;
ALTER TABLE pg_cast ADD COLUMN cmin cid NULL;
ALTER TABLE pg_cast ADD COLUMN xmin xid NULL;
ALTER TABLE pg_cast ADD COLUMN oid oid NULL;
ALTER TABLE pg_cast ADD COLUMN ctid tid NULL;

ALTER TABLE pg_cast ALTER COLUMN castsource SET NOT NULL;
ALTER TABLE pg_cast ALTER COLUMN casttarget SET NOT NULL;
ALTER TABLE pg_cast ALTER COLUMN castfunc SET NOT NULL;
ALTER TABLE pg_cast ALTER COLUMN castcontext SET NOT NULL;
ALTER TABLE pg_cast ALTER COLUMN castmethod SET NOT NULL;


ALTER TABLE pg_pltemplate ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_pltemplate ADD COLUMN cmax cid NULL;
ALTER TABLE pg_pltemplate ADD COLUMN xmax xid NULL;
ALTER TABLE pg_pltemplate ADD COLUMN cmin cid NULL;
ALTER TABLE pg_pltemplate ADD COLUMN xmin xid NULL;
ALTER TABLE pg_pltemplate ADD COLUMN ctid tid NULL;

ALTER TABLE pg_pltemplate ALTER COLUMN tmplname SET NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmpltrusted SET NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmpldbacreate SET NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmplhandler DROP NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmplinline DROP NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmplvalidator DROP NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmpllibrary DROP NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmplacl DROP NOT NULL;


ALTER TABLE pg_ts_template ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_ts_template ADD COLUMN cmax cid NULL;
ALTER TABLE pg_ts_template ADD COLUMN xmax xid NULL;
ALTER TABLE pg_ts_template ADD COLUMN cmin cid NULL;
ALTER TABLE pg_ts_template ADD COLUMN xmin xid NULL;
ALTER TABLE pg_ts_template ADD COLUMN oid oid NULL;
ALTER TABLE pg_ts_template ADD COLUMN ctid tid NULL;

ALTER TABLE pg_ts_template ALTER COLUMN tmplname SET NOT NULL;
ALTER TABLE pg_ts_template ALTER COLUMN tmplnamespace SET NOT NULL;
ALTER TABLE pg_ts_template ALTER COLUMN tmplinit SET NOT NULL;
ALTER TABLE pg_ts_template ALTER COLUMN tmpllexize SET NOT NULL;


ALTER TABLE pg_collation ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_collation ADD COLUMN cmax cid NULL;
ALTER TABLE pg_collation ADD COLUMN xmax xid NULL;
ALTER TABLE pg_collation ADD COLUMN cmin cid NULL;
ALTER TABLE pg_collation ADD COLUMN xmin xid NULL;
ALTER TABLE pg_collation ADD COLUMN oid oid NULL;
ALTER TABLE pg_collation ADD COLUMN ctid tid NULL;

ALTER TABLE pg_collation ALTER COLUMN collname SET NOT NULL;
ALTER TABLE pg_collation ALTER COLUMN collnamespace SET NOT NULL;
ALTER TABLE pg_collation ALTER COLUMN collowner SET NOT NULL;
ALTER TABLE pg_collation ALTER COLUMN collencoding SET NOT NULL;
ALTER TABLE pg_collation ALTER COLUMN collcollate SET NOT NULL;
ALTER TABLE pg_collation ALTER COLUMN collctype SET NOT NULL;


ALTER TABLE pg_amop ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_amop ADD COLUMN cmax cid NULL;
ALTER TABLE pg_amop ADD COLUMN xmax xid NULL;
ALTER TABLE pg_amop ADD COLUMN cmin cid NULL;
ALTER TABLE pg_amop ADD COLUMN xmin xid NULL;
ALTER TABLE pg_amop ADD COLUMN oid oid NULL;
ALTER TABLE pg_amop ADD COLUMN ctid tid NULL;

ALTER TABLE pg_amop ALTER COLUMN amopfamily SET NOT NULL;
ALTER TABLE pg_amop ALTER COLUMN amoplefttype SET NOT NULL;
ALTER TABLE pg_amop ALTER COLUMN amoprighttype SET NOT NULL;
ALTER TABLE pg_amop ALTER COLUMN amopstrategy SET NOT NULL;
ALTER TABLE pg_amop ALTER COLUMN amoppurpose SET NOT NULL;
ALTER TABLE pg_amop ALTER COLUMN amopopr SET NOT NULL;
ALTER TABLE pg_amop ALTER COLUMN amopmethod SET NOT NULL;
ALTER TABLE pg_amop ALTER COLUMN amopsortfamily SET NOT NULL;


ALTER TABLE pg_trigger ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_trigger ADD COLUMN cmax cid NULL;
ALTER TABLE pg_trigger ADD COLUMN xmax xid NULL;
ALTER TABLE pg_trigger ADD COLUMN cmin cid NULL;
ALTER TABLE pg_trigger ADD COLUMN xmin xid NULL;
ALTER TABLE pg_trigger ADD COLUMN oid oid NULL;
ALTER TABLE pg_trigger ADD COLUMN ctid tid NULL;

ALTER TABLE pg_trigger ALTER COLUMN tgrelid SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgname SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgfoid SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgtype SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgenabled SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgisinternal SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgconstrrelid SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgconstrindid SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgconstraint SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgdeferrable SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tginitdeferred SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgnargs SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgattr SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgargs DROP NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgqual DROP NOT NULL;


ALTER TABLE pg_shdepend ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_shdepend ADD COLUMN cmax cid NULL;
ALTER TABLE pg_shdepend ADD COLUMN xmax xid NULL;
ALTER TABLE pg_shdepend ADD COLUMN cmin cid NULL;
ALTER TABLE pg_shdepend ADD COLUMN xmin xid NULL;
ALTER TABLE pg_shdepend ADD COLUMN ctid tid NULL;

ALTER TABLE pg_shdepend ALTER COLUMN dbid SET NOT NULL;
ALTER TABLE pg_shdepend ALTER COLUMN classid SET NOT NULL;
ALTER TABLE pg_shdepend ALTER COLUMN objid SET NOT NULL;
ALTER TABLE pg_shdepend ALTER COLUMN objsubid SET NOT NULL;
ALTER TABLE pg_shdepend ALTER COLUMN refclassid SET NOT NULL;
ALTER TABLE pg_shdepend ALTER COLUMN refobjid SET NOT NULL;
ALTER TABLE pg_shdepend ALTER COLUMN deptype SET NOT NULL;


ALTER TABLE pg_foreign_table ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_foreign_table ADD COLUMN cmax cid NULL;
ALTER TABLE pg_foreign_table ADD COLUMN xmax xid NULL;
ALTER TABLE pg_foreign_table ADD COLUMN cmin cid NULL;
ALTER TABLE pg_foreign_table ADD COLUMN xmin xid NULL;
ALTER TABLE pg_foreign_table ADD COLUMN ctid tid NULL;

ALTER TABLE pg_foreign_table ALTER COLUMN ftrelid SET NOT NULL;
ALTER TABLE pg_foreign_table ALTER COLUMN ftserver SET NOT NULL;
ALTER TABLE pg_foreign_table ALTER COLUMN ftoptions DROP NOT NULL;


ALTER TABLE pg_constraint ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_constraint ADD COLUMN cmax cid NULL;
ALTER TABLE pg_constraint ADD COLUMN xmax xid NULL;
ALTER TABLE pg_constraint ADD COLUMN cmin cid NULL;
ALTER TABLE pg_constraint ADD COLUMN xmin xid NULL;
ALTER TABLE pg_constraint ADD COLUMN oid oid NULL;
ALTER TABLE pg_constraint ADD COLUMN ctid tid NULL;
ALTER TABLE pg_constraint ADD COLUMN connoinherit bool NULL;

ALTER TABLE pg_constraint ALTER COLUMN conname SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN connamespace SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN contype SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN condeferrable SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN condeferred SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN convalidated SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conrelid SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN contypid SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conindid SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN confrelid SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN confupdtype SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN confdeltype SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN confmatchtype SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conislocal SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN coninhcount SET NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conkey DROP NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN confkey DROP NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conpfeqop DROP NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conppeqop DROP NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conffeqop DROP NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conexclop DROP NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN conbin DROP NOT NULL;
ALTER TABLE pg_constraint ALTER COLUMN consrc DROP NOT NULL;


ALTER TABLE pg_namespace ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_namespace ADD COLUMN cmax cid NULL;
ALTER TABLE pg_namespace ADD COLUMN xmax xid NULL;
ALTER TABLE pg_namespace ADD COLUMN cmin cid NULL;
ALTER TABLE pg_namespace ADD COLUMN xmin xid NULL;
ALTER TABLE pg_namespace ADD COLUMN oid oid NULL;
ALTER TABLE pg_namespace ADD COLUMN ctid tid NULL;

ALTER TABLE pg_namespace ALTER COLUMN nspname SET NOT NULL;
ALTER TABLE pg_namespace ALTER COLUMN nspowner SET NOT NULL;
ALTER TABLE pg_namespace ALTER COLUMN nspacl DROP NOT NULL;


ALTER TABLE pg_shdescription ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_shdescription ADD COLUMN cmax cid NULL;
ALTER TABLE pg_shdescription ADD COLUMN xmax xid NULL;
ALTER TABLE pg_shdescription ADD COLUMN cmin cid NULL;
ALTER TABLE pg_shdescription ADD COLUMN xmin xid NULL;
ALTER TABLE pg_shdescription ADD COLUMN ctid tid NULL;

ALTER TABLE pg_shdescription ALTER COLUMN objoid SET NOT NULL;
ALTER TABLE pg_shdescription ALTER COLUMN classoid SET NOT NULL;
ALTER TABLE pg_shdescription ALTER COLUMN description DROP NOT NULL;


ALTER TABLE pg_inherits ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_inherits ADD COLUMN cmax cid NULL;
ALTER TABLE pg_inherits ADD COLUMN xmax xid NULL;
ALTER TABLE pg_inherits ADD COLUMN cmin cid NULL;
ALTER TABLE pg_inherits ADD COLUMN xmin xid NULL;
ALTER TABLE pg_inherits ADD COLUMN ctid tid NULL;

ALTER TABLE pg_inherits ALTER COLUMN inhrelid SET NOT NULL;
ALTER TABLE pg_inherits ALTER COLUMN inhparent SET NOT NULL;
ALTER TABLE pg_inherits ALTER COLUMN inhseqno SET NOT NULL;


ALTER TABLE pg_aggregate ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_aggregate ADD COLUMN cmax cid NULL;
ALTER TABLE pg_aggregate ADD COLUMN xmax xid NULL;
ALTER TABLE pg_aggregate ADD COLUMN cmin cid NULL;
ALTER TABLE pg_aggregate ADD COLUMN xmin xid NULL;
ALTER TABLE pg_aggregate ADD COLUMN ctid tid NULL;

ALTER TABLE pg_aggregate ALTER COLUMN aggfnoid SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggtransfn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggfinalfn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggsortop SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggtranstype SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN agginitval DROP NOT NULL;


ALTER TABLE pg_ts_parser ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_ts_parser ADD COLUMN cmax cid NULL;
ALTER TABLE pg_ts_parser ADD COLUMN xmax xid NULL;
ALTER TABLE pg_ts_parser ADD COLUMN cmin cid NULL;
ALTER TABLE pg_ts_parser ADD COLUMN xmin xid NULL;
ALTER TABLE pg_ts_parser ADD COLUMN oid oid NULL;
ALTER TABLE pg_ts_parser ADD COLUMN ctid tid NULL;

ALTER TABLE pg_ts_parser ALTER COLUMN prsname SET NOT NULL;
ALTER TABLE pg_ts_parser ALTER COLUMN prsnamespace SET NOT NULL;
ALTER TABLE pg_ts_parser ALTER COLUMN prsstart SET NOT NULL;
ALTER TABLE pg_ts_parser ALTER COLUMN prstoken SET NOT NULL;
ALTER TABLE pg_ts_parser ALTER COLUMN prsend SET NOT NULL;
ALTER TABLE pg_ts_parser ALTER COLUMN prsheadline SET NOT NULL;
ALTER TABLE pg_ts_parser ALTER COLUMN prslextype SET NOT NULL;


ALTER TABLE pg_seclabel ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_seclabel ADD COLUMN cmax cid NULL;
ALTER TABLE pg_seclabel ADD COLUMN xmax xid NULL;
ALTER TABLE pg_seclabel ADD COLUMN cmin cid NULL;
ALTER TABLE pg_seclabel ADD COLUMN xmin xid NULL;
ALTER TABLE pg_seclabel ADD COLUMN ctid tid NULL;

ALTER TABLE pg_seclabel ALTER COLUMN objoid SET NOT NULL;
ALTER TABLE pg_seclabel ALTER COLUMN classoid SET NOT NULL;
ALTER TABLE pg_seclabel ALTER COLUMN objsubid SET NOT NULL;
ALTER TABLE pg_seclabel ALTER COLUMN provider DROP NOT NULL;
ALTER TABLE pg_seclabel ALTER COLUMN label DROP NOT NULL;


ALTER TABLE pg_enum ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_enum ADD COLUMN cmax cid NULL;
ALTER TABLE pg_enum ADD COLUMN xmax xid NULL;
ALTER TABLE pg_enum ADD COLUMN cmin cid NULL;
ALTER TABLE pg_enum ADD COLUMN xmin xid NULL;
ALTER TABLE pg_enum ADD COLUMN oid oid NULL;
ALTER TABLE pg_enum ADD COLUMN ctid tid NULL;

ALTER TABLE pg_enum ALTER COLUMN enumtypid SET NOT NULL;
ALTER TABLE pg_enum ALTER COLUMN enumsortorder SET NOT NULL;
ALTER TABLE pg_enum ALTER COLUMN enumlabel SET NOT NULL;


ALTER TABLE pg_db_role_setting ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_db_role_setting ADD COLUMN cmax cid NULL;
ALTER TABLE pg_db_role_setting ADD COLUMN xmax xid NULL;
ALTER TABLE pg_db_role_setting ADD COLUMN cmin cid NULL;
ALTER TABLE pg_db_role_setting ADD COLUMN xmin xid NULL;
ALTER TABLE pg_db_role_setting ADD COLUMN ctid tid NULL;

ALTER TABLE pg_db_role_setting ALTER COLUMN setdatabase SET NOT NULL;
ALTER TABLE pg_db_role_setting ALTER COLUMN setrole SET NOT NULL;
ALTER TABLE pg_db_role_setting ALTER COLUMN setconfig DROP NOT NULL;


ALTER TABLE pg_opfamily ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_opfamily ADD COLUMN cmax cid NULL;
ALTER TABLE pg_opfamily ADD COLUMN xmax xid NULL;
ALTER TABLE pg_opfamily ADD COLUMN cmin cid NULL;
ALTER TABLE pg_opfamily ADD COLUMN xmin xid NULL;
ALTER TABLE pg_opfamily ADD COLUMN oid oid NULL;
ALTER TABLE pg_opfamily ADD COLUMN ctid tid NULL;

ALTER TABLE pg_opfamily ALTER COLUMN opfmethod SET NOT NULL;
ALTER TABLE pg_opfamily ALTER COLUMN opfname SET NOT NULL;
ALTER TABLE pg_opfamily ALTER COLUMN opfnamespace SET NOT NULL;
ALTER TABLE pg_opfamily ALTER COLUMN opfowner SET NOT NULL;


ALTER TABLE pg_database ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_database ADD COLUMN cmax cid NULL;
ALTER TABLE pg_database ADD COLUMN xmax xid NULL;
ALTER TABLE pg_database ADD COLUMN cmin cid NULL;
ALTER TABLE pg_database ADD COLUMN xmin xid NULL;
ALTER TABLE pg_database ADD COLUMN oid oid NULL;
ALTER TABLE pg_database ADD COLUMN ctid tid NULL;

ALTER TABLE pg_database ALTER COLUMN datname SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datdba SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN encoding SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datcollate SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datctype SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datistemplate SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datallowconn SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datconnlimit SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datlastsysoid SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datfrozenxid SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN dattablespace SET NOT NULL;
ALTER TABLE pg_database ALTER COLUMN datacl DROP NOT NULL;


ALTER TABLE pg_conversion ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_conversion ADD COLUMN cmax cid NULL;
ALTER TABLE pg_conversion ADD COLUMN xmax xid NULL;
ALTER TABLE pg_conversion ADD COLUMN cmin cid NULL;
ALTER TABLE pg_conversion ADD COLUMN xmin xid NULL;
ALTER TABLE pg_conversion ADD COLUMN oid oid NULL;
ALTER TABLE pg_conversion ADD COLUMN ctid tid NULL;

ALTER TABLE pg_conversion ALTER COLUMN conname SET NOT NULL;
ALTER TABLE pg_conversion ALTER COLUMN connamespace SET NOT NULL;
ALTER TABLE pg_conversion ALTER COLUMN conowner SET NOT NULL;
ALTER TABLE pg_conversion ALTER COLUMN conforencoding SET NOT NULL;
ALTER TABLE pg_conversion ALTER COLUMN contoencoding SET NOT NULL;
ALTER TABLE pg_conversion ALTER COLUMN conproc SET NOT NULL;
ALTER TABLE pg_conversion ALTER COLUMN condefault SET NOT NULL;


ALTER TABLE pg_ts_config_map ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_ts_config_map ADD COLUMN cmax cid NULL;
ALTER TABLE pg_ts_config_map ADD COLUMN xmax xid NULL;
ALTER TABLE pg_ts_config_map ADD COLUMN cmin cid NULL;
ALTER TABLE pg_ts_config_map ADD COLUMN xmin xid NULL;
ALTER TABLE pg_ts_config_map ADD COLUMN ctid tid NULL;

ALTER TABLE pg_ts_config_map ALTER COLUMN mapcfg SET NOT NULL;
ALTER TABLE pg_ts_config_map ALTER COLUMN maptokentype SET NOT NULL;
ALTER TABLE pg_ts_config_map ALTER COLUMN mapseqno SET NOT NULL;
ALTER TABLE pg_ts_config_map ALTER COLUMN mapdict SET NOT NULL;


ALTER TABLE pg_largeobject ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_largeobject ADD COLUMN cmax cid NULL;
ALTER TABLE pg_largeobject ADD COLUMN xmax xid NULL;
ALTER TABLE pg_largeobject ADD COLUMN cmin cid NULL;
ALTER TABLE pg_largeobject ADD COLUMN xmin xid NULL;
ALTER TABLE pg_largeobject ADD COLUMN ctid tid NULL;

ALTER TABLE pg_largeobject ALTER COLUMN loid SET NOT NULL;
ALTER TABLE pg_largeobject ALTER COLUMN pageno SET NOT NULL;
ALTER TABLE pg_largeobject ALTER COLUMN data DROP NOT NULL;


ALTER TABLE pg_index ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_index ADD COLUMN cmax cid NULL;
ALTER TABLE pg_index ADD COLUMN xmax xid NULL;
ALTER TABLE pg_index ADD COLUMN cmin cid NULL;
ALTER TABLE pg_index ADD COLUMN xmin xid NULL;
ALTER TABLE pg_index ADD COLUMN ctid tid NULL;

ALTER TABLE pg_index ALTER COLUMN indexrelid SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indrelid SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indnatts SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisunique SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisprimary SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisexclusion SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indimmediate SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisclustered SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisvalid SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indcheckxmin SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisready SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indkey SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indcollation SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indclass SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indoption SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indexprs DROP NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indpred DROP NOT NULL;


ALTER TABLE pg_attrdef ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_attrdef ADD COLUMN cmax cid NULL;
ALTER TABLE pg_attrdef ADD COLUMN xmax xid NULL;
ALTER TABLE pg_attrdef ADD COLUMN cmin cid NULL;
ALTER TABLE pg_attrdef ADD COLUMN xmin xid NULL;
ALTER TABLE pg_attrdef ADD COLUMN oid oid NULL;
ALTER TABLE pg_attrdef ADD COLUMN ctid tid NULL;

ALTER TABLE pg_attrdef ALTER COLUMN adrelid SET NOT NULL;
ALTER TABLE pg_attrdef ALTER COLUMN adnum SET NOT NULL;
ALTER TABLE pg_attrdef ALTER COLUMN adbin DROP NOT NULL;
ALTER TABLE pg_attrdef ALTER COLUMN adsrc DROP NOT NULL;


ALTER TABLE pg_ts_config ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_ts_config ADD COLUMN cmax cid NULL;
ALTER TABLE pg_ts_config ADD COLUMN xmax xid NULL;
ALTER TABLE pg_ts_config ADD COLUMN cmin cid NULL;
ALTER TABLE pg_ts_config ADD COLUMN xmin xid NULL;
ALTER TABLE pg_ts_config ADD COLUMN oid oid NULL;
ALTER TABLE pg_ts_config ADD COLUMN ctid tid NULL;

ALTER TABLE pg_ts_config ALTER COLUMN cfgname SET NOT NULL;
ALTER TABLE pg_ts_config ALTER COLUMN cfgnamespace SET NOT NULL;
ALTER TABLE pg_ts_config ALTER COLUMN cfgowner SET NOT NULL;
ALTER TABLE pg_ts_config ALTER COLUMN cfgparser SET NOT NULL;


ALTER TABLE pg_proc ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_proc ADD COLUMN cmax cid NULL;
ALTER TABLE pg_proc ADD COLUMN xmax xid NULL;
ALTER TABLE pg_proc ADD COLUMN cmin cid NULL;
ALTER TABLE pg_proc ADD COLUMN xmin xid NULL;
ALTER TABLE pg_proc ADD COLUMN oid oid NULL;
ALTER TABLE pg_proc ADD COLUMN ctid tid NULL;
ALTER TABLE pg_proc ADD COLUMN protransform regproc NULL;
ALTER TABLE pg_proc ADD COLUMN proleakproof bool NULL;

ALTER TABLE pg_proc ALTER COLUMN proname SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN pronamespace SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proowner SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN prolang SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN procost SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN prorows SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN provariadic SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proisagg SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proiswindow SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN prosecdef SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proisstrict SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proretset SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN provolatile SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN pronargs SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN pronargdefaults SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN prorettype SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proargtypes SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proallargtypes DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proargmodes DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proargnames DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proargdefaults DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN prosrc DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN probin DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proconfig DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proacl DROP NOT NULL;


ALTER TABLE pg_tablespace ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_tablespace ADD COLUMN cmax cid NULL;
ALTER TABLE pg_tablespace ADD COLUMN xmax xid NULL;
ALTER TABLE pg_tablespace ADD COLUMN cmin cid NULL;
ALTER TABLE pg_tablespace ADD COLUMN xmin xid NULL;
ALTER TABLE pg_tablespace ADD COLUMN oid oid NULL;
ALTER TABLE pg_tablespace ADD COLUMN ctid tid NULL;

ALTER TABLE pg_tablespace ALTER COLUMN spcname SET NOT NULL;
ALTER TABLE pg_tablespace ALTER COLUMN spcowner SET NOT NULL;
ALTER TABLE pg_tablespace ALTER COLUMN spcacl DROP NOT NULL;
ALTER TABLE pg_tablespace ALTER COLUMN spcoptions DROP NOT NULL;

ALTER TABLE pg_tablespace DROP COLUMN spclocation;


ALTER TABLE pg_type ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_type ADD COLUMN cmax cid NULL;
ALTER TABLE pg_type ADD COLUMN xmax xid NULL;
ALTER TABLE pg_type ADD COLUMN cmin cid NULL;
ALTER TABLE pg_type ADD COLUMN xmin xid NULL;
ALTER TABLE pg_type ADD COLUMN oid oid NULL;
ALTER TABLE pg_type ADD COLUMN ctid tid NULL;
ALTER TABLE pg_type ADD COLUMN typacl aclitem[] NOT NULL;

ALTER TABLE pg_type ALTER COLUMN typname SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typnamespace SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typowner SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typlen SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typbyval SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typtype SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typcategory SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typispreferred SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typisdefined SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typdelim SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typrelid SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typelem SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typarray SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typinput SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typoutput SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typreceive SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typsend SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typmodin SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typmodout SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typanalyze SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typalign SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typstorage SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typnotnull SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typbasetype SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typtypmod SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typndims SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typcollation SET NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typdefaultbin DROP NOT NULL;
ALTER TABLE pg_type ALTER COLUMN typdefault DROP NOT NULL;


ALTER TABLE pg_rewrite ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_rewrite ADD COLUMN cmax cid NULL;
ALTER TABLE pg_rewrite ADD COLUMN xmax xid NULL;
ALTER TABLE pg_rewrite ADD COLUMN cmin cid NULL;
ALTER TABLE pg_rewrite ADD COLUMN xmin xid NULL;
ALTER TABLE pg_rewrite ADD COLUMN oid oid NULL;
ALTER TABLE pg_rewrite ADD COLUMN ctid tid NULL;

ALTER TABLE pg_rewrite ALTER COLUMN rulename SET NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN ev_class SET NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN ev_attr SET NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN ev_type SET NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN ev_enabled SET NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN is_instead SET NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN ev_qual DROP NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN ev_action DROP NOT NULL;

/*
## view `pg_stats`
feat: add column `most_common_elems anyarray NOT NULL`
feat: add column `most_common_elem_freqs float4[] NOT NULL`
feat: add column `elem_count_histogram float4[] NOT NULL`

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `tablename` `DROP NOT NULL`
refactor: column `attname` `DROP NOT NULL`
refactor: column `inherited` `DROP NOT NULL`
refactor: column `null_frac` `DROP NOT NULL`
refactor: column `avg_width` `DROP NOT NULL`
refactor: column `n_distinct` `DROP NOT NULL`
refactor: column `most_common_vals` `DROP NOT NULL`
refactor: column `most_common_freqs` `DROP NOT NULL`
refactor: column `histogram_bounds` `DROP NOT NULL`
refactor: column `correlation` `DROP NOT NULL`


## view `pg_tables`

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `tablename` `DROP NOT NULL`
refactor: column `tableowner` `DROP NOT NULL`
refactor: column `tablespace` `DROP NOT NULL`
refactor: column `hasindexes` `DROP NOT NULL`
refactor: column `hasrules` `DROP NOT NULL`
refactor: column `hastriggers` `DROP NOT NULL`


## view `pg_indexes`

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `tablename` `DROP NOT NULL`
refactor: column `indexname` `DROP NOT NULL`
refactor: column `tablespace` `DROP NOT NULL`
refactor: column `indexdef` `DROP NOT NULL`


## view `pg_group`

refactor: column `groname` `DROP NOT NULL`
refactor: column `grosysid` `DROP NOT NULL`
refactor: column `grolist` `DROP NOT NULL`


## view `pg_rules`

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `tablename` `DROP NOT NULL`
refactor: column `rulename` `DROP NOT NULL`
refactor: column `definition` `DROP NOT NULL`


## view `pg_timezone_abbrevs`

refactor: column `abbrev` `DROP NOT NULL`
refactor: column `utc_offset` `DROP NOT NULL`
refactor: column `is_dst` `DROP NOT NULL`


## view `pg_available_extensions`

refactor: column `name` `DROP NOT NULL`
refactor: column `default_version` `DROP NOT NULL`
refactor: column `installed_version` `DROP NOT NULL`
refactor: column `comment` `DROP NOT NULL`


## view `pg_locks`
feat: add column `fastpath bool NOT NULL`

refactor: column `locktype` `DROP NOT NULL`
refactor: column `database` `DROP NOT NULL`
refactor: column `relation` `DROP NOT NULL`
refactor: column `page` `DROP NOT NULL`
refactor: column `tuple` `DROP NOT NULL`
refactor: column `virtualxid` `DROP NOT NULL`
refactor: column `transactionid` `DROP NOT NULL`
refactor: column `classid` `DROP NOT NULL`
refactor: column `objid` `DROP NOT NULL`
refactor: column `objsubid` `DROP NOT NULL`
refactor: column `virtualtransaction` `DROP NOT NULL`
refactor: column `pid` `DROP NOT NULL`
refactor: column `mode` `DROP NOT NULL`
refactor: column `granted` `DROP NOT NULL`


## view `pg_cursors`

refactor: column `name` `DROP NOT NULL`
refactor: column `statement` `DROP NOT NULL`
refactor: column `is_holdable` `DROP NOT NULL`
refactor: column `is_binary` `DROP NOT NULL`
refactor: column `is_scrollable` `DROP NOT NULL`
refactor: column `creation_time` `DROP NOT NULL`


## view `pg_timezone_names`

refactor: column `name` `DROP NOT NULL`
refactor: column `abbrev` `DROP NOT NULL`
refactor: column `utc_offset` `DROP NOT NULL`
refactor: column `is_dst` `DROP NOT NULL`


## view `pg_user`
feat: add column `userepl bool NOT NULL`

refactor: column `usesysid` type set to `oid`
refactor: column `usesysid` `DROP NOT NULL`
refactor: column `usename` `DROP NOT NULL`
refactor: column `usecreatedb` `DROP NOT NULL`
refactor: column `usesuper` `DROP NOT NULL`
refactor: column `usecatupd` `DROP NOT NULL`
refactor: column `passwd` `DROP NOT NULL`
refactor: column `valuntil` `DROP NOT NULL`
refactor: column `useconfig` `DROP NOT NULL`


## view `pg_settings`

refactor: column `name` `DROP NOT NULL`
refactor: column `setting` `DROP NOT NULL`
refactor: column `unit` `DROP NOT NULL`
refactor: column `category` `DROP NOT NULL`
refactor: column `short_desc` `DROP NOT NULL`
refactor: column `extra_desc` `DROP NOT NULL`
refactor: column `context` `DROP NOT NULL`
refactor: column `vartype` `DROP NOT NULL`
refactor: column `source` `DROP NOT NULL`
refactor: column `min_val` `DROP NOT NULL`
refactor: column `max_val` `DROP NOT NULL`
refactor: column `enumvals` `DROP NOT NULL`
refactor: column `boot_val` `DROP NOT NULL`
refactor: column `reset_val` `DROP NOT NULL`
refactor: column `sourcefile` `DROP NOT NULL`
refactor: column `sourceline` `DROP NOT NULL`


## view `pg_roles`

refactor: column `rolname` `DROP NOT NULL`
refactor: column `rolsuper` `DROP NOT NULL`
refactor: column `rolinherit` `DROP NOT NULL`
refactor: column `rolcreaterole` `DROP NOT NULL`
refactor: column `rolcreatedb` `DROP NOT NULL`
refactor: column `rolcatupdate` `DROP NOT NULL`
refactor: column `rolcanlogin` `DROP NOT NULL`
refactor: column `rolreplication` `DROP NOT NULL`
refactor: column `rolconnlimit` `DROP NOT NULL`
refactor: column `rolpassword` `DROP NOT NULL`
refactor: column `rolvaliduntil` `DROP NOT NULL`
refactor: column `rolconfig` `DROP NOT NULL`
refactor: column `oid` `DROP NOT NULL`


## view `pg_prepared_statements`

refactor: column `name` `DROP NOT NULL`
refactor: column `statement` `DROP NOT NULL`
refactor: column `prepare_time` `DROP NOT NULL`
refactor: column `parameter_types` `DROP NOT NULL`
refactor: column `from_sql` `DROP NOT NULL`


## view `pg_seclabels`

refactor: column `objoid` `DROP NOT NULL`
refactor: column `classoid` `DROP NOT NULL`
refactor: column `objsubid` `DROP NOT NULL`
refactor: column `objtype` `DROP NOT NULL`
refactor: column `objnamespace` `DROP NOT NULL`
refactor: column `objname` `DROP NOT NULL`
refactor: column `provider` `DROP NOT NULL`
refactor: column `label` `DROP NOT NULL`


## view `pg_shadow`
feat: add column `userepl bool NOT NULL`

refactor: column `usename` `DROP NOT NULL`
refactor: column `usesysid` `DROP NOT NULL`
refactor: column `usecreatedb` `DROP NOT NULL`
refactor: column `usesuper` `DROP NOT NULL`
refactor: column `usecatupd` `DROP NOT NULL`
refactor: column `passwd` `DROP NOT NULL`
refactor: column `valuntil` `DROP NOT NULL`
refactor: column `useconfig` `DROP NOT NULL`


## view `pg_prepared_xacts`

refactor: column `transaction` `DROP NOT NULL`
refactor: column `gid` `DROP NOT NULL`
refactor: column `prepared` `DROP NOT NULL`
refactor: column `owner` `DROP NOT NULL`
refactor: column `database` `DROP NOT NULL`


## view `pg_user_mappings`

refactor: column `srvname` type set to `name`
refactor: column `srvname` `DROP NOT NULL`
refactor: column `umid` `DROP NOT NULL`
refactor: column `srvid` `DROP NOT NULL`
refactor: column `umuser` `DROP NOT NULL`
refactor: column `usename` `DROP NOT NULL`
refactor: column `umoptions` `DROP NOT NULL`


## view `pg_views`

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `viewname` `DROP NOT NULL`
refactor: column `viewowner` `DROP NOT NULL`
refactor: column `definition` `DROP NOT NULL`


## view `pg_available_extension_versions`

refactor: column `name` `DROP NOT NULL`
refactor: column `version` `DROP NOT NULL`
refactor: column `installed` `DROP NOT NULL`
refactor: column `superuser` `DROP NOT NULL`
refactor: column `relocatable` `DROP NOT NULL`
refactor: column `schema` `DROP NOT NULL`
refactor: column `requires` `DROP NOT NULL`
refactor: column `comment` `DROP NOT NULL`

*/
