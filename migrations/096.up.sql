CREATE TABLE pg_init_privs (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , ctid tid NOT NULL
  , objoid oid NOT NULL
  , classoid oid NOT NULL
  , objsubid int4 NOT NULL
  , privtype char NOT NULL
  , initprivs aclitem[] NOT NULL
);

CREATE VIEW pg_stat_progress_vacuum
 SELECT s.pid,
    s.datid,
    d.datname,
    s.relid,
        CASE s.param1
            WHEN 0 THEN 'initializing'::text
            WHEN 1 THEN 'scanning heap'::text
            WHEN 2 THEN 'vacuuming indexes'::text
            WHEN 3 THEN 'vacuuming heap'::text
            WHEN 4 THEN 'cleaning up indexes'::text
            WHEN 5 THEN 'truncating heap'::text
            WHEN 6 THEN 'performing final cleanup'::text
            ELSE NULL::text
        END AS phase,
    s.param2 AS heap_blks_total,
    s.param3 AS heap_blks_scanned,
    s.param4 AS heap_blks_vacuumed,
    s.param5 AS index_vacuum_count,
    s.param6 AS max_dead_tuples,
    s.param7 AS num_dead_tuples
   FROM pg_stat_get_progress_info('VACUUM'::text) s(pid, datid, relid, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
     JOIN pg_database d ON s.datid = d.oid;

CREATE VIEW pg_stat_wal_receiver
 SELECT s.pid,
    s.status,
    s.receive_start_lsn,
    s.receive_start_tli,
    s.received_lsn,
    s.received_tli,
    s.last_msg_send_time,
    s.last_msg_receipt_time,
    s.latest_end_lsn,
    s.latest_end_time,
    s.slot_name,
    s.conninfo
   FROM pg_stat_get_wal_receiver() s(pid, status, receive_start_lsn, receive_start_tli, received_lsn, received_tli, last_msg_send_time, last_msg_receipt_time, latest_end_lsn, latest_end_time, slot_name, conninfo)
  WHERE s.pid IS NOT NULL;

CREATE VIEW pg_config
 SELECT pg_config.name,
    pg_config.setting
   FROM pg_config() pg_config(name, setting);

ALTER TABLE pg_am ADD COLUMN amhandler regproc NULL;
ALTER TABLE pg_am ADD COLUMN amtype char NULL;

ALTER TABLE pg_am DROP COLUMN amstrategies;
ALTER TABLE pg_am DROP COLUMN amsupport;
ALTER TABLE pg_am DROP COLUMN amcanorder;
ALTER TABLE pg_am DROP COLUMN amcanorderbyop;
ALTER TABLE pg_am DROP COLUMN amcanbackward;
ALTER TABLE pg_am DROP COLUMN amcanunique;
ALTER TABLE pg_am DROP COLUMN amcanmulticol;
ALTER TABLE pg_am DROP COLUMN amoptionalkey;
ALTER TABLE pg_am DROP COLUMN amsearcharray;
ALTER TABLE pg_am DROP COLUMN amsearchnulls;
ALTER TABLE pg_am DROP COLUMN amstorage;
ALTER TABLE pg_am DROP COLUMN amclusterable;
ALTER TABLE pg_am DROP COLUMN ampredlocks;
ALTER TABLE pg_am DROP COLUMN amkeytype;
ALTER TABLE pg_am DROP COLUMN aminsert;
ALTER TABLE pg_am DROP COLUMN ambeginscan;
ALTER TABLE pg_am DROP COLUMN amgettuple;
ALTER TABLE pg_am DROP COLUMN amgetbitmap;
ALTER TABLE pg_am DROP COLUMN amrescan;
ALTER TABLE pg_am DROP COLUMN amendscan;
ALTER TABLE pg_am DROP COLUMN ammarkpos;
ALTER TABLE pg_am DROP COLUMN amrestrpos;
ALTER TABLE pg_am DROP COLUMN ambuild;
ALTER TABLE pg_am DROP COLUMN ambuildempty;
ALTER TABLE pg_am DROP COLUMN ambulkdelete;
ALTER TABLE pg_am DROP COLUMN amvacuumcleanup;
ALTER TABLE pg_am DROP COLUMN amcanreturn;
ALTER TABLE pg_am DROP COLUMN amcostestimate;
ALTER TABLE pg_am DROP COLUMN amoptions;

ALTER TABLE pg_aggregate ADD COLUMN aggcombinefn regproc NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggserialfn regproc NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggdeserialfn regproc NULL;


ALTER TABLE pg_proc ADD COLUMN proparallel char NULL;
/*
## view `pg_replication_slots`

### Features

feat: add column `confirmed_flush_lsn pg_lsn NOT NULL`

## view `pg_stat_activity`

### Features

feat: add column `wait_event_type text NOT NULL`
feat: add column `wait_event text NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_activity drop column waiting
*/
