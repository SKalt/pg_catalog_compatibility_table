DROP VIEW pg_stat_progress_vacuum;
DROP VIEW pg_stat_archiver;
DROP VIEW pg_stat_ssl;
DROP VIEW pg_stat_wal_receiver;

CREATE TABLE pg_subscription (
  oid oid NULL
  , subconninfo text NULL
  , subdbid oid NULL
  , subenabled bool NULL
  , subname name NULL
  , subowner oid NULL
  , subpublications text[] NULL
  , subslotname name NULL
  , subsynccommit text NULL
);

CREATE TABLE pg_partitioned_table (
  partattrs int2vector NULL
  , partclass oidvector NULL
  , partcollation oidvector NULL
  , partexprs pg_node_tree NULL
  , partnatts int2 NULL
  , partrelid oid NULL
  , partstrat char NULL
);

CREATE TABLE pg_statistic_ext (
  stxdependencies pg_dependencies NULL
  , stxkeys int2vector NULL
  , stxkind char[] NULL
  , stxname name NULL
  , stxnamespace oid NULL
  , stxndistinct pg_ndistinct NULL
  , stxowner oid NULL
  , stxrelid oid NULL
);

CREATE TABLE pg_publication (
  oid oid NULL
  , puballtables bool NULL
  , pubdelete bool NULL
  , pubinsert bool NULL
  , pubname name NULL
  , pubowner oid NULL
  , pubupdate bool NULL
);

CREATE TABLE pg_publication_rel (
  prpubid oid NULL
  , prrelid oid NULL
);

CREATE TABLE pg_subscription_rel (
  srrelid oid NULL
  , srsubid oid NULL
  , srsublsn pg_lsn NULL
  , srsubstate char NULL
);

CREATE TABLE pg_sequence (
  seqcache int8 NULL
  , seqcycle bool NULL
  , seqincrement int8 NULL
  , seqmax int8 NULL
  , seqmin int8 NULL
  , seqrelid oid NULL
  , seqstart int8 NULL
  , seqtypid oid NULL
);

CREATE VIEW pg_publication_tables AS (SELECT $$...$$);

CREATE VIEW pg_hba_file_rules AS (SELECT $$...$$);

CREATE VIEW pg_sequences AS (SELECT $$...$$);


ALTER TABLE pg_description ALTER COLUMN description DROP NOT NULL;

ALTER TABLE pg_attribute ADD COLUMN attidentity char NULL;

ALTER TABLE pg_policy ADD COLUMN polpermissive bool NULL;


ALTER TABLE pg_policy ALTER COLUMN polcmd ??? NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polname ??? NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polqual ??? NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polrelid ??? NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polroles ??? NOT NULL;
ALTER TABLE pg_policy ALTER COLUMN polwithcheck ??? NOT NULL;

### Breaking changes

ALTER TABLE pg_policy DROP COLUMN tableoid;
ALTER TABLE pg_policy DROP COLUMN cmax;
ALTER TABLE pg_policy DROP COLUMN xmax;
ALTER TABLE pg_policy DROP COLUMN cmin;
ALTER TABLE pg_policy DROP COLUMN xmin;
ALTER TABLE pg_policy DROP COLUMN oid;
ALTER TABLE pg_policy DROP COLUMN ctid;

ALTER TABLE pg_authid ADD COLUMN rolcatupdate bool NULL;


ALTER TABLE pg_authid ALTER COLUMN rolbypassrls ??? NOT NULL;


ALTER TABLE pg_shseclabel ALTER COLUMN provider DROP NOT NULL;
ALTER TABLE pg_shseclabel ALTER COLUMN label DROP NOT NULL;


ALTER TABLE pg_init_privs ALTER COLUMN classoid ??? NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN initprivs ??? NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN objoid ??? NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN objsubid ??? NOT NULL;
ALTER TABLE pg_init_privs ALTER COLUMN privtype ??? NOT NULL;

### Breaking changes

ALTER TABLE pg_init_privs DROP COLUMN tableoid;
ALTER TABLE pg_init_privs DROP COLUMN cmax;
ALTER TABLE pg_init_privs DROP COLUMN xmax;
ALTER TABLE pg_init_privs DROP COLUMN cmin;
ALTER TABLE pg_init_privs DROP COLUMN xmin;
ALTER TABLE pg_init_privs DROP COLUMN ctid;

ALTER TABLE pg_am ADD COLUMN amstrategies int2 NULL;
ALTER TABLE pg_am ADD COLUMN amsupport int2 NULL;
ALTER TABLE pg_am ADD COLUMN amcanorder bool NULL;
ALTER TABLE pg_am ADD COLUMN amcanorderbyop bool NULL;
ALTER TABLE pg_am ADD COLUMN amcanbackward bool NULL;
ALTER TABLE pg_am ADD COLUMN amcanunique bool NULL;
ALTER TABLE pg_am ADD COLUMN amcanmulticol bool NULL;
ALTER TABLE pg_am ADD COLUMN amoptionalkey bool NULL;
ALTER TABLE pg_am ADD COLUMN amsearcharray bool NULL;
ALTER TABLE pg_am ADD COLUMN amsearchnulls bool NULL;
ALTER TABLE pg_am ADD COLUMN amstorage bool NULL;
ALTER TABLE pg_am ADD COLUMN amclusterable bool NULL;
ALTER TABLE pg_am ADD COLUMN ampredlocks bool NULL;
ALTER TABLE pg_am ADD COLUMN amkeytype oid NULL;
ALTER TABLE pg_am ADD COLUMN aminsert regproc NULL;
ALTER TABLE pg_am ADD COLUMN ambeginscan regproc NULL;
ALTER TABLE pg_am ADD COLUMN amgettuple regproc NULL;
ALTER TABLE pg_am ADD COLUMN amgetbitmap regproc NULL;
ALTER TABLE pg_am ADD COLUMN amrescan regproc NULL;
ALTER TABLE pg_am ADD COLUMN amendscan regproc NULL;
ALTER TABLE pg_am ADD COLUMN ammarkpos regproc NULL;
ALTER TABLE pg_am ADD COLUMN amrestrpos regproc NULL;
ALTER TABLE pg_am ADD COLUMN ambuild regproc NULL;
ALTER TABLE pg_am ADD COLUMN ambuildempty regproc NULL;
ALTER TABLE pg_am ADD COLUMN ambulkdelete regproc NULL;
ALTER TABLE pg_am ADD COLUMN amvacuumcleanup regproc NULL;
ALTER TABLE pg_am ADD COLUMN amcanreturn regproc NULL;
ALTER TABLE pg_am ADD COLUMN amcostestimate regproc NULL;
ALTER TABLE pg_am ADD COLUMN amoptions regproc NULL;


ALTER TABLE pg_am ALTER COLUMN amhandler ??? NOT NULL;
ALTER TABLE pg_am ALTER COLUMN amtype ??? NOT NULL;


ALTER TABLE pg_extension ALTER COLUMN extversion DROP NOT NULL;

ALTER TABLE pg_class ADD COLUMN reltoastidxid oid NULL;
ALTER TABLE pg_class ADD COLUMN relispartition bool NULL;
ALTER TABLE pg_class ADD COLUMN relpartbound pg_node_tree NULL;


ALTER TABLE pg_class ALTER COLUMN relforcerowsecurity ??? NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relispopulated ??? NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relminmxid ??? NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relreplident ??? NOT NULL;
ALTER TABLE pg_class ALTER COLUMN relrowsecurity ??? NOT NULL;


ALTER TABLE pg_pltemplate ALTER COLUMN tmplhandler DROP NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmpllibrary DROP NOT NULL;

ALTER TABLE pg_collation ADD COLUMN collprovider char NULL;
ALTER TABLE pg_collation ADD COLUMN collversion text NULL;

ALTER TABLE pg_trigger ADD COLUMN tgnewtable name NULL;
ALTER TABLE pg_trigger ADD COLUMN tgoldtable name NULL;


ALTER TABLE pg_trigger ALTER COLUMN tgargs DROP NOT NULL;


ALTER TABLE pg_replication_origin ALTER COLUMN roident ??? NOT NULL;
ALTER TABLE pg_replication_origin ALTER COLUMN roname ??? NOT NULL;

### Breaking changes

ALTER TABLE pg_replication_origin DROP COLUMN tableoid;
ALTER TABLE pg_replication_origin DROP COLUMN cmax;
ALTER TABLE pg_replication_origin DROP COLUMN xmax;
ALTER TABLE pg_replication_origin DROP COLUMN cmin;
ALTER TABLE pg_replication_origin DROP COLUMN xmin;
ALTER TABLE pg_replication_origin DROP COLUMN ctid;


ALTER TABLE pg_shdescription ALTER COLUMN description DROP NOT NULL;


ALTER TABLE pg_aggregate ALTER COLUMN aggcombinefn ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggdeserialfn ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggfinalextra ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggkind ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmfinalextra ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmfinalfn ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggminitval ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggminvtransfn ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmtransfn ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmtransspace ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggmtranstype ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggnumdirectargs ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggserialfn ??? NOT NULL;
ALTER TABLE pg_aggregate ALTER COLUMN aggtransspace ??? NOT NULL;


ALTER TABLE pg_seclabel ALTER COLUMN provider DROP NOT NULL;
ALTER TABLE pg_seclabel ALTER COLUMN label DROP NOT NULL;


ALTER TABLE pg_database ALTER COLUMN datminmxid ??? NOT NULL;


ALTER TABLE pg_largeobject ALTER COLUMN data DROP NOT NULL;


ALTER TABLE pg_index ALTER COLUMN indislive ??? NOT NULL;
ALTER TABLE pg_index ALTER COLUMN indisreplident ??? NOT NULL;


ALTER TABLE pg_proc ALTER COLUMN prosrc DROP NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN proparallel ??? NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN protrftypes ??? NOT NULL;


ALTER TABLE pg_transform ALTER COLUMN trffromsql ??? NOT NULL;
ALTER TABLE pg_transform ALTER COLUMN trflang ??? NOT NULL;
ALTER TABLE pg_transform ALTER COLUMN trftosql ??? NOT NULL;
ALTER TABLE pg_transform ALTER COLUMN trftype ??? NOT NULL;

### Breaking changes

ALTER TABLE pg_transform DROP COLUMN tableoid;
ALTER TABLE pg_transform DROP COLUMN cmax;
ALTER TABLE pg_transform DROP COLUMN xmax;
ALTER TABLE pg_transform DROP COLUMN cmin;
ALTER TABLE pg_transform DROP COLUMN xmin;
ALTER TABLE pg_transform DROP COLUMN oid;
ALTER TABLE pg_transform DROP COLUMN ctid;


ALTER TABLE pg_event_trigger ALTER COLUMN evtenabled ??? NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtevent ??? NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtfoid ??? NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtname ??? NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evtowner ??? NOT NULL;
ALTER TABLE pg_event_trigger ALTER COLUMN evttags ??? NOT NULL;

ALTER TABLE pg_event_trigger DROP COLUMN tableoid;
ALTER TABLE pg_event_trigger DROP COLUMN cmax;
ALTER TABLE pg_event_trigger DROP COLUMN xmax;
ALTER TABLE pg_event_trigger DROP COLUMN cmin;
ALTER TABLE pg_event_trigger DROP COLUMN xmin;
ALTER TABLE pg_event_trigger DROP COLUMN oid;
ALTER TABLE pg_event_trigger DROP COLUMN ctid;

ALTER TABLE pg_rewrite ADD COLUMN ev_attr int2 NULL;

/*
## view `pg_replication_origin_status`

### Non-Breaking Changes

refactor: column `external_id` `??? NOT NULL`
refactor: column `local_id` `??? NOT NULL`
refactor: column `local_lsn` `??? NOT NULL`
refactor: column `remote_lsn` `??? NOT NULL`

## view `pg_tables`

### Non-Breaking Changes

refactor: column `rowsecurity` `??? NOT NULL`

## view `pg_replication_slots`

### Features

feat: add column `temporary bool NULL`

### Non-Breaking Changes

refactor: column `active` `??? NOT NULL`
refactor: column `active_pid` `??? NOT NULL`
refactor: column `catalog_xmin` `??? NOT NULL`
refactor: column `confirmed_flush_lsn` `??? NOT NULL`
refactor: column `database` `??? NOT NULL`
refactor: column `datoid` `??? NOT NULL`
refactor: column `plugin` `??? NOT NULL`
refactor: column `restart_lsn` `??? NOT NULL`
refactor: column `slot_name` `??? NOT NULL`
refactor: column `slot_type` `??? NOT NULL`
refactor: column `xmin` `??? NOT NULL`

## view `pg_stat_activity`

### Features

feat: add column `waiting bool NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_activity drop column wait_event_type
BREAKING CHANGE: alter view pg_stat_activity drop column wait_event
BREAKING CHANGE: alter view pg_stat_activity drop column backend_xid
BREAKING CHANGE: alter view pg_stat_activity drop column backend_xmin

## view `pg_matviews`

### Non-Breaking Changes

refactor: column `definition` `??? NOT NULL`
refactor: column `hasindexes` `??? NOT NULL`
refactor: column `ispopulated` `??? NOT NULL`
refactor: column `matviewname` `??? NOT NULL`
refactor: column `matviewowner` `??? NOT NULL`
refactor: column `schemaname` `??? NOT NULL`
refactor: column `tablespace` `??? NOT NULL`

## view `pg_file_settings`

### Non-Breaking Changes

refactor: column `applied` `??? NOT NULL`
refactor: column `error` `??? NOT NULL`
refactor: column `name` `??? NOT NULL`
refactor: column `seqno` `??? NOT NULL`
refactor: column `setting` `??? NOT NULL`
refactor: column `sourcefile` `??? NOT NULL`
refactor: column `sourceline` `??? NOT NULL`

## view `pg_stat_user_tables`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_user_tables drop column n_mod_since_analyze

## view `pg_user`

### Features

feat: add column `usecatupd bool NOT NULL`

### Non-Breaking Changes

refactor: column `usebypassrls` `??? NOT NULL`

## view `pg_settings`

### Non-Breaking Changes

refactor: column `pending_restart` `??? NOT NULL`

## view `pg_roles`

### Features

feat: add column `rolcatupdate bool NOT NULL`

### Non-Breaking Changes

refactor: column `rolbypassrls` `??? NOT NULL`

## view `pg_stat_all_tables`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_all_tables drop column n_mod_since_analyze

## view `pg_stat_replication`

### Non-Breaking Changes

refactor: column `sent_location` type set to `text`
refactor: column `write_location` type set to `text`
refactor: column `flush_location` type set to `text`
refactor: column `replay_location` type set to `text`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_replication drop column backend_xmin

## view `pg_policies`

### Features

feat: add column `polpermissive text NULL`

### Non-Breaking Changes

refactor: column `cmd` `??? NOT NULL`
refactor: column `policyname` `??? NOT NULL`
refactor: column `qual` `??? NOT NULL`
refactor: column `roles` `??? NOT NULL`
refactor: column `schemaname` `??? NOT NULL`
refactor: column `tablename` `??? NOT NULL`
refactor: column `with_check` `??? NOT NULL`

## view `pg_shadow`

### Features

feat: add column `usecatupd bool NOT NULL`

### Non-Breaking Changes

refactor: column `usebypassrls` `??? NOT NULL`

## view `pg_stat_sys_tables`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_sys_tables drop column n_mod_since_analyze

## view `pg_config`

### Non-Breaking Changes

refactor: column `name` `??? NOT NULL`
refactor: column `setting` `??? NOT NULL`
*/
