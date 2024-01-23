CREATE TABLE pg_replication_slots (
  active bool NULL
  , catalog_xmin xid NULL
  , database text NULL
  , datoid oid NULL
  , plugin name NULL
  , restart_lsn pg_lsn NULL
  , slot_name name NULL
  , slot_type text NULL
  , xmin xid NULL
);

CREATE VIEW pg_replication_slots
 SELECT l.slot_name,
    l.plugin,
    l.slot_type,
    l.datoid,
    d.datname AS database,
    l.active,
    l.xmin,
    l.catalog_xmin,
    l.restart_lsn
   FROM pg_get_replication_slots() l(slot_name, plugin, slot_type, datoid, active, xmin, catalog_xmin, restart_lsn)
     LEFT JOIN pg_database d ON l.datoid = d.oid;

CREATE VIEW pg_stat_archiver
 SELECT s.archived_count,
    s.last_archived_wal,
    s.last_archived_time,
    s.failed_count,
    s.last_failed_wal,
    s.last_failed_time,
    s.stats_reset
   FROM pg_stat_get_archiver() s(archived_count, last_archived_wal, last_archived_time, failed_count, last_failed_wal, last_failed_time, stats_reset);

ALTER TABLE pg_class ADD COLUMN relreplident char NULL;

ALTER TABLE pg_class DROP COLUMN reltoastidxid;

ALTER TABLE pg_aggregate ADD COLUMN aggkind char NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggnumdirectargs int2 NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggmtransfn regproc NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggminvtransfn regproc NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggmfinalfn regproc NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggfinalextra bool NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggmfinalextra bool NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggtransspace int4 NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggmtranstype oid NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggmtransspace int4 NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggminitval text NOT NULL;

ALTER TABLE pg_index ADD COLUMN indisreplident bool NULL;


ALTER TABLE pg_rewrite DROP COLUMN ev_attr;

/*
## view `pg_stat_activity`
feat: add column `backend_xid xid NOT NULL`
feat: add column `backend_xmin xid NOT NULL`

## view `pg_stat_user_tables`
feat: add column `n_mod_since_analyze int8 NOT NULL`

## view `pg_stat_all_tables`
feat: add column `n_mod_since_analyze int8 NOT NULL`

## view `pg_stat_replication`
feat: add column `backend_xmin xid NOT NULL`
### Non-Breaking Changes
refactor: column `sent_location` type set to `pg_lsn`
refactor: column `write_location` type set to `pg_lsn`
refactor: column `flush_location` type set to `pg_lsn`
refactor: column `replay_location` type set to `pg_lsn`

## view `pg_stat_sys_tables`
feat: add column `n_mod_since_analyze int8 NOT NULL`
*/
