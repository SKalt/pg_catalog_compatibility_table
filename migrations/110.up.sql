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
     LEFT JOIN pg_database d ON s.datid = d.oid;

CREATE VIEW pg_stat_archiver
 SELECT s.archived_count,
    s.last_archived_wal,
    s.last_archived_time,
    s.failed_count,
    s.last_failed_wal,
    s.last_failed_time,
    s.stats_reset
   FROM pg_stat_get_archiver() s(archived_count, last_archived_wal, last_archived_time, failed_count, last_failed_wal, last_failed_time, stats_reset);

CREATE VIEW pg_stat_ssl
 SELECT s.pid,
    s.ssl,
    s.sslversion AS version,
    s.sslcipher AS cipher,
    s.sslbits AS bits,
    s.sslcompression AS compression,
    s.sslclientdn AS clientdn
   FROM pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, wait_event_type, wait_event, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin, backend_type, ssl, sslversion, sslcipher, sslbits, sslcompression, sslclientdn);

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
    s.sender_host,
    s.sender_port,
    s.conninfo
   FROM pg_stat_get_wal_receiver() s(pid, status, receive_start_lsn, receive_start_tli, received_lsn, received_tli, last_msg_send_time, last_msg_receipt_time, latest_end_lsn, latest_end_time, slot_name, sender_host, sender_port, conninfo)
  WHERE s.pid IS NOT NULL;

CREATE VIEW pg_stat_subscription
 SELECT su.oid AS subid,
    su.subname,
    st.pid,
    st.relid,
    st.received_lsn,
    st.last_msg_send_time,
    st.last_msg_receipt_time,
    st.latest_end_lsn,
    st.latest_end_time
   FROM pg_subscription su
     LEFT JOIN pg_stat_get_subscription(NULL::oid) st(subid, relid, pid, received_lsn, last_msg_send_time, last_msg_receipt_time, latest_end_lsn, latest_end_time) ON st.subid = su.oid;



ALTER TABLE pg_description ALTER COLUMN description SET NOT NULL;


ALTER TABLE pg_attribute ADD COLUMN atthasmissing bool NULL;
ALTER TABLE pg_attribute ADD COLUMN attmissingval anyarray NOT NULL;


ALTER TABLE pg_attribute ALTER COLUMN attidentity SET NOT NULL;


ALTER TABLE pg_subscription ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_subscription ADD COLUMN cmax cid NULL;
ALTER TABLE pg_subscription ADD COLUMN xmax xid NULL;
ALTER TABLE pg_subscription ADD COLUMN cmin cid NULL;
ALTER TABLE pg_subscription ADD COLUMN xmin xid NULL;
ALTER TABLE pg_subscription ADD COLUMN ctid tid NULL;


ALTER TABLE pg_subscription ALTER COLUMN oid SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subdbid SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subname SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subowner SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subenabled SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subconninfo SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subslotname SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subsynccommit SET NOT NULL;
ALTER TABLE pg_subscription ALTER COLUMN subpublications SET NOT NULL;


ALTER TABLE pg_partitioned_table ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_partitioned_table ADD COLUMN cmax cid NULL;
ALTER TABLE pg_partitioned_table ADD COLUMN xmax xid NULL;
ALTER TABLE pg_partitioned_table ADD COLUMN cmin cid NULL;
ALTER TABLE pg_partitioned_table ADD COLUMN xmin xid NULL;
ALTER TABLE pg_partitioned_table ADD COLUMN ctid tid NULL;
ALTER TABLE pg_partitioned_table ADD COLUMN partdefid oid NULL;


ALTER TABLE pg_partitioned_table ALTER COLUMN partrelid SET NOT NULL;
ALTER TABLE pg_partitioned_table ALTER COLUMN partstrat SET NOT NULL;
ALTER TABLE pg_partitioned_table ALTER COLUMN partnatts SET NOT NULL;
ALTER TABLE pg_partitioned_table ALTER COLUMN partattrs SET NOT NULL;
ALTER TABLE pg_partitioned_table ALTER COLUMN partclass SET NOT NULL;
ALTER TABLE pg_partitioned_table ALTER COLUMN partcollation SET NOT NULL;
ALTER TABLE pg_partitioned_table ALTER COLUMN partexprs DROP NOT NULL;


ALTER TABLE pg_policy ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_policy ADD COLUMN cmax cid NULL;
ALTER TABLE pg_policy ADD COLUMN xmax xid NULL;
ALTER TABLE pg_policy ADD COLUMN cmin cid NULL;
ALTER TABLE pg_policy ADD COLUMN xmin xid NULL;
ALTER TABLE pg_policy ADD COLUMN oid oid NULL;
ALTER TABLE pg_policy ADD COLUMN ctid tid NULL;


ALTER TABLE pg_policy ALTER COLUMN polname SET NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polrelid SET NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polcmd SET NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polpermissive SET NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polroles DROP NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polqual DROP NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polwithcheck DROP NOT NULL;


ALTER TABLE pg_authid ALTER COLUMN rolbypassrls SET NOT NULL;



ALTER TABLE pg_authid DROP COLUMN rolcatupdate;


ALTER TABLE pg_shseclabel ALTER COLUMN provider SET NOT NULL;
ALTER TABLE pg_shseclabel ALTER COLUMN label SET NOT NULL;


ALTER TABLE pg_init_privs ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_init_privs ADD COLUMN cmax cid NULL;
ALTER TABLE pg_init_privs ADD COLUMN xmax xid NULL;
ALTER TABLE pg_init_privs ADD COLUMN cmin cid NULL;
ALTER TABLE pg_init_privs ADD COLUMN xmin xid NULL;
ALTER TABLE pg_init_privs ADD COLUMN ctid tid NULL;


ALTER TABLE pg_init_privs ALTER COLUMN objoid SET NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN classoid SET NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN objsubid SET NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN privtype SET NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN initprivs SET NOT NULL;


ALTER TABLE pg_am ALTER COLUMN amhandler SET NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amtype SET NOT NULL;



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


ALTER TABLE pg_extension ALTER COLUMN extversion SET NOT NULL;


ALTER TABLE pg_class ADD COLUMN relrewrite oid NULL;


ALTER TABLE pg_class ALTER COLUMN relrowsecurity SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relforcerowsecurity SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relispopulated SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relreplident SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relispartition SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relminmxid SET NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relpartbound DROP NOT NULL;



ALTER TABLE pg_class DROP COLUMN reltoastidxid;
ALTER TABLE pg_class DROP COLUMN relhaspkey;


ALTER TABLE pg_statistic_ext ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_statistic_ext ADD COLUMN cmax cid NULL;
ALTER TABLE pg_statistic_ext ADD COLUMN xmax xid NULL;
ALTER TABLE pg_statistic_ext ADD COLUMN cmin cid NULL;
ALTER TABLE pg_statistic_ext ADD COLUMN xmin xid NULL;
ALTER TABLE pg_statistic_ext ADD COLUMN oid oid NULL;
ALTER TABLE pg_statistic_ext ADD COLUMN ctid tid NULL;


ALTER TABLE pg_statistic_ext ALTER COLUMN stxrelid SET NOT NULL;
ALTER TABLE pg_statistic_ext ALTER COLUMN stxname SET NOT NULL;
ALTER TABLE pg_statistic_ext ALTER COLUMN stxnamespace SET NOT NULL;
ALTER TABLE pg_statistic_ext ALTER COLUMN stxowner SET NOT NULL;
ALTER TABLE pg_statistic_ext ALTER COLUMN stxkeys SET NOT NULL;
ALTER TABLE pg_statistic_ext ALTER COLUMN stxkind SET NOT NULL;
ALTER TABLE pg_statistic_ext ALTER COLUMN stxndistinct DROP NOT NULL;
ALTER TABLE pg_statistic_ext ALTER COLUMN stxdependencies DROP NOT NULL;


ALTER TABLE pg_pltemplate ALTER COLUMN tmplhandler SET NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmpllibrary SET NOT NULL;


ALTER TABLE pg_publication ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_publication ADD COLUMN cmax cid NULL;
ALTER TABLE pg_publication ADD COLUMN xmax xid NULL;
ALTER TABLE pg_publication ADD COLUMN cmin cid NULL;
ALTER TABLE pg_publication ADD COLUMN xmin xid NULL;
ALTER TABLE pg_publication ADD COLUMN ctid tid NULL;
ALTER TABLE pg_publication ADD COLUMN pubtruncate bool NULL;


ALTER TABLE pg_publication ALTER COLUMN oid SET NOT NULL;
ALTER TABLE pg_publication ALTER COLUMN pubname SET NOT NULL;
ALTER TABLE pg_publication ALTER COLUMN pubowner SET NOT NULL;
ALTER TABLE pg_publication ALTER COLUMN puballtables SET NOT NULL;
ALTER TABLE pg_publication ALTER COLUMN pubinsert SET NOT NULL;
ALTER TABLE pg_publication ALTER COLUMN pubupdate SET NOT NULL;
ALTER TABLE pg_publication ALTER COLUMN pubdelete SET NOT NULL;


ALTER TABLE pg_publication_rel ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_publication_rel ADD COLUMN cmax cid NULL;
ALTER TABLE pg_publication_rel ADD COLUMN xmax xid NULL;
ALTER TABLE pg_publication_rel ADD COLUMN cmin cid NULL;
ALTER TABLE pg_publication_rel ADD COLUMN xmin xid NULL;
ALTER TABLE pg_publication_rel ADD COLUMN oid oid NULL;
ALTER TABLE pg_publication_rel ADD COLUMN ctid tid NULL;


ALTER TABLE pg_publication_rel ALTER COLUMN prpubid SET NOT NULL;
ALTER TABLE pg_publication_rel ALTER COLUMN prrelid SET NOT NULL;


ALTER TABLE pg_collation ALTER COLUMN collprovider SET NOT NULL;
ALTER TABLE pg_collation ALTER COLUMN collversion DROP NOT NULL;


ALTER TABLE pg_trigger ALTER COLUMN tgargs SET NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgoldtable DROP NOT NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgnewtable DROP NOT NULL;


ALTER TABLE pg_replication_origin ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_replication_origin ADD COLUMN cmax cid NULL;
ALTER TABLE pg_replication_origin ADD COLUMN xmax xid NULL;
ALTER TABLE pg_replication_origin ADD COLUMN cmin cid NULL;
ALTER TABLE pg_replication_origin ADD COLUMN xmin xid NULL;
ALTER TABLE pg_replication_origin ADD COLUMN ctid tid NULL;


ALTER TABLE pg_replication_origin ALTER COLUMN roident SET NOT NULL;
ALTER TABLE pg_replication_origin ALTER COLUMN roname SET NOT NULL;


ALTER TABLE pg_constraint ADD COLUMN conparentid oid NULL;


ALTER TABLE pg_shdescription ALTER COLUMN description SET NOT NULL;


ALTER TABLE pg_aggregate ADD COLUMN aggfinalmodify char NULL;
ALTER TABLE pg_aggregate ADD COLUMN aggmfinalmodify char NULL;


ALTER TABLE pg_aggregate ALTER COLUMN aggkind SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggnumdirectargs SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggcombinefn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggserialfn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggdeserialfn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmtransfn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggminvtransfn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmfinalfn SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggfinalextra SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmfinalextra SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggtransspace SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmtranstype SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmtransspace SET NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggminitval DROP NOT NULL;


ALTER TABLE pg_seclabel ALTER COLUMN provider SET NOT NULL;
ALTER TABLE pg_seclabel ALTER COLUMN label SET NOT NULL;


ALTER TABLE pg_database ALTER COLUMN datminmxid SET NOT NULL;


ALTER TABLE pg_subscription_rel ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_subscription_rel ADD COLUMN cmax cid NULL;
ALTER TABLE pg_subscription_rel ADD COLUMN xmax xid NULL;
ALTER TABLE pg_subscription_rel ADD COLUMN cmin cid NULL;
ALTER TABLE pg_subscription_rel ADD COLUMN xmin xid NULL;
ALTER TABLE pg_subscription_rel ADD COLUMN ctid tid NULL;


ALTER TABLE pg_subscription_rel ALTER COLUMN srsubid SET NOT NULL;
ALTER TABLE pg_subscription_rel ALTER COLUMN srrelid SET NOT NULL;
ALTER TABLE pg_subscription_rel ALTER COLUMN srsubstate SET NOT NULL;
ALTER TABLE pg_subscription_rel ALTER COLUMN srsublsn SET NOT NULL;


ALTER TABLE pg_largeobject ALTER COLUMN data SET NOT NULL;


ALTER TABLE pg_sequence ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_sequence ADD COLUMN cmax cid NULL;
ALTER TABLE pg_sequence ADD COLUMN xmax xid NULL;
ALTER TABLE pg_sequence ADD COLUMN cmin cid NULL;
ALTER TABLE pg_sequence ADD COLUMN xmin xid NULL;
ALTER TABLE pg_sequence ADD COLUMN ctid tid NULL;


ALTER TABLE pg_sequence ALTER COLUMN seqrelid SET NOT NULL;
ALTER TABLE pg_sequence ALTER COLUMN seqtypid SET NOT NULL;
ALTER TABLE pg_sequence ALTER COLUMN seqstart SET NOT NULL;
ALTER TABLE pg_sequence ALTER COLUMN seqincrement SET NOT NULL;
ALTER TABLE pg_sequence ALTER COLUMN seqmax SET NOT NULL;
ALTER TABLE pg_sequence ALTER COLUMN seqmin SET NOT NULL;
ALTER TABLE pg_sequence ALTER COLUMN seqcache SET NOT NULL;
ALTER TABLE pg_sequence ALTER COLUMN seqcycle SET NOT NULL;


ALTER TABLE pg_index ADD COLUMN indnkeyatts int2 NULL;


ALTER TABLE pg_index ALTER COLUMN indislive SET NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisreplident SET NOT NULL;


ALTER TABLE pg_proc ADD COLUMN prokind char NULL;


ALTER TABLE pg_proc ALTER COLUMN proparallel SET NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN protrftypes DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN prosrc SET NOT NULL;

ALTER TABLE pg_proc DROP COLUMN proisagg;
ALTER TABLE pg_proc DROP COLUMN proiswindow;

ALTER TABLE pg_transform ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_transform ADD COLUMN cmax cid NULL;
ALTER TABLE pg_transform ADD COLUMN xmax xid NULL;
ALTER TABLE pg_transform ADD COLUMN cmin cid NULL;
ALTER TABLE pg_transform ADD COLUMN xmin xid NULL;
ALTER TABLE pg_transform ADD COLUMN oid oid NULL;
ALTER TABLE pg_transform ADD COLUMN ctid tid NULL;


ALTER TABLE pg_transform ALTER COLUMN trftype SET NOT NULL;
ALTER TABLE pg_transform ALTER COLUMN trflang SET NOT NULL;
ALTER TABLE pg_transform ALTER COLUMN trffromsql SET NOT NULL;
ALTER TABLE pg_transform ALTER COLUMN trftosql SET NOT NULL;


ALTER TABLE pg_event_trigger ADD COLUMN tableoid oid NULL;
ALTER TABLE pg_event_trigger ADD COLUMN cmax cid NULL;
ALTER TABLE pg_event_trigger ADD COLUMN xmax xid NULL;
ALTER TABLE pg_event_trigger ADD COLUMN cmin cid NULL;
ALTER TABLE pg_event_trigger ADD COLUMN xmin xid NULL;
ALTER TABLE pg_event_trigger ADD COLUMN oid oid NULL;
ALTER TABLE pg_event_trigger ADD COLUMN ctid tid NULL;


ALTER TABLE pg_event_trigger ALTER COLUMN evtname SET NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtevent SET NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtowner SET NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtfoid SET NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtenabled SET NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evttags DROP NOT NULL;

ALTER TABLE pg_rewrite DROP COLUMN ev_attr;
/*
## view `pg_replication_origin_status`

### Non-Breaking Changes

refactor: column `local_id` `DROP NOT NULL`
refactor: column `external_id` `DROP NOT NULL`
refactor: column `remote_lsn` `DROP NOT NULL`
refactor: column `local_lsn` `DROP NOT NULL`

## view `pg_tables`

### Non-Breaking Changes

refactor: column `rowsecurity` `DROP NOT NULL`

## view `pg_replication_slots`

### Non-Breaking Changes

refactor: column `slot_name` `DROP NOT NULL`
refactor: column `plugin` `DROP NOT NULL`
refactor: column `slot_type` `DROP NOT NULL`
refactor: column `datoid` `DROP NOT NULL`
refactor: column `database` `DROP NOT NULL`
refactor: column `temporary` `DROP NOT NULL`
refactor: column `active` `DROP NOT NULL`
refactor: column `active_pid` `DROP NOT NULL`
refactor: column `xmin` `DROP NOT NULL`
refactor: column `catalog_xmin` `DROP NOT NULL`
refactor: column `restart_lsn` `DROP NOT NULL`
refactor: column `confirmed_flush_lsn` `DROP NOT NULL`

## view `pg_publication_tables`

### Non-Breaking Changes

refactor: column `pubname` `DROP NOT NULL`
refactor: column `schemaname` `DROP NOT NULL`
refactor: column `tablename` `DROP NOT NULL`

## view `pg_stat_activity`

### Features

feat: add column `wait_event_type text NOT NULL`
feat: add column `wait_event text NOT NULL`
feat: add column `backend_xid xid NOT NULL`
feat: add column `backend_xmin xid NOT NULL`
feat: add column `backend_type text NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_activity drop column waiting

## view `pg_matviews`

### Non-Breaking Changes

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `matviewname` `DROP NOT NULL`
refactor: column `matviewowner` `DROP NOT NULL`
refactor: column `tablespace` `DROP NOT NULL`
refactor: column `hasindexes` `DROP NOT NULL`
refactor: column `ispopulated` `DROP NOT NULL`
refactor: column `definition` `DROP NOT NULL`

## view `pg_file_settings`

### Non-Breaking Changes

refactor: column `sourcefile` `DROP NOT NULL`
refactor: column `sourceline` `DROP NOT NULL`
refactor: column `seqno` `DROP NOT NULL`
refactor: column `name` `DROP NOT NULL`
refactor: column `setting` `DROP NOT NULL`
refactor: column `applied` `DROP NOT NULL`
refactor: column `error` `DROP NOT NULL`

## view `pg_stat_user_tables`

### Features

feat: add column `n_mod_since_analyze int8 NOT NULL`

## view `pg_user`

### Non-Breaking Changes

refactor: column `usebypassrls` `DROP NOT NULL`



BREAKING CHANGE: alter view pg_user drop column usecatupd

## view `pg_settings`

### Non-Breaking Changes

refactor: column `pending_restart` `DROP NOT NULL`

## view `pg_roles`

### Non-Breaking Changes

refactor: column `rolbypassrls` `DROP NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_roles drop column rolcatupdate

## view `pg_stat_all_tables`

### Features

feat: add column `n_mod_since_analyze int8 NOT NULL`

## view `pg_hba_file_rules`

### Non-Breaking Changes

refactor: column `line_number` `DROP NOT NULL`
refactor: column `type` `DROP NOT NULL`
refactor: column `database` `DROP NOT NULL`
refactor: column `user_name` `DROP NOT NULL`
refactor: column `address` `DROP NOT NULL`
refactor: column `netmask` `DROP NOT NULL`
refactor: column `auth_method` `DROP NOT NULL`
refactor: column `options` `DROP NOT NULL`
refactor: column `error` `DROP NOT NULL`

## view `pg_sequences`

### Non-Breaking Changes

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `sequencename` `DROP NOT NULL`
refactor: column `sequenceowner` `DROP NOT NULL`
refactor: column `data_type` `DROP NOT NULL`
refactor: column `start_value` `DROP NOT NULL`
refactor: column `min_value` `DROP NOT NULL`
refactor: column `max_value` `DROP NOT NULL`
refactor: column `increment_by` `DROP NOT NULL`
refactor: column `cycle` `DROP NOT NULL`
refactor: column `cache_size` `DROP NOT NULL`
refactor: column `last_value` `DROP NOT NULL`

## view `pg_stat_replication`

### Features

feat: add column `backend_xmin xid NOT NULL`
feat: add column `sent_lsn pg_lsn NOT NULL`
feat: add column `write_lsn pg_lsn NOT NULL`
feat: add column `flush_lsn pg_lsn NOT NULL`
feat: add column `replay_lsn pg_lsn NOT NULL`
feat: add column `write_lag interval NOT NULL`
feat: add column `flush_lag interval NOT NULL`
feat: add column `replay_lag interval NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_replication drop column sent_location
BREAKING CHANGE: alter view pg_stat_replication drop column write_location
BREAKING CHANGE: alter view pg_stat_replication drop column flush_location
BREAKING CHANGE: alter view pg_stat_replication drop column replay_location

## view `pg_policies`

### Features

feat: add column `permissive text NOT NULL`

### Non-Breaking Changes

refactor: column `schemaname` `DROP NOT NULL`
refactor: column `tablename` `DROP NOT NULL`
refactor: column `policyname` `DROP NOT NULL`
refactor: column `roles` `DROP NOT NULL`
refactor: column `cmd` `DROP NOT NULL`
refactor: column `qual` `DROP NOT NULL`
refactor: column `with_check` `DROP NOT NULL`

## view `pg_shadow`

### Non-Breaking Changes

refactor: column `usebypassrls` `DROP NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_shadow drop column usecatupd

## view `pg_stat_sys_tables`

### Features

feat: add column `n_mod_since_analyze int8 NOT NULL`

## view `pg_config`

### Non-Breaking Changes

refactor: column `name` `DROP NOT NULL`
refactor: column `setting` `DROP NOT NULL`
*/
