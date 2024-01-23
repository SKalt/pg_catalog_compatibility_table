CREATE TABLE pg_publication_namespace (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , ctid tid NOT NULL
  , oid oid NOT NULL
  , pnpubid oid NOT NULL
  , pnnspid oid NOT NULL
);

CREATE TABLE pg_parameter_acl (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , ctid tid NOT NULL
  , oid oid NOT NULL
  , parname text NOT NULL
  , paracl aclitem[] NULL
);

CREATE VIEW pg_ident_file_mappings
 SELECT a.line_number,
    a.map_name,
    a.sys_name,
    a.pg_username,
    a.error
   FROM pg_ident_file_mappings() a(line_number, map_name, sys_name, pg_username, error);

CREATE VIEW pg_stat_subscription_stats
 SELECT ss.subid,
    s.subname,
    ss.apply_error_count,
    ss.sync_error_count,
    ss.stats_reset
   FROM pg_subscription s,
    LATERAL pg_stat_get_subscription_stats(s.oid) ss(subid, apply_error_count, sync_error_count, stats_reset);

CREATE VIEW pg_stat_recovery_prefetch
 SELECT s.stats_reset,
    s.prefetch,
    s.hit,
    s.skip_init,
    s.skip_new,
    s.skip_fpw,
    s.skip_rep,
    s.wal_distance,
    s.block_distance,
    s.io_depth
   FROM pg_stat_get_recovery_prefetch() s(stats_reset, prefetch, hit, skip_init, skip_new, skip_fpw, skip_rep, wal_distance, block_distance, io_depth);

ALTER TABLE pg_statistic_ext_data ADD COLUMN stxdinherit bool NULL;

ALTER TABLE pg_subscription ADD COLUMN subskiplsn pg_lsn NULL;
ALTER TABLE pg_subscription ADD COLUMN subtwophasestate char NULL;
ALTER TABLE pg_subscription ADD COLUMN subdisableonerr bool NULL;

ALTER TABLE pg_publication_rel ADD COLUMN prqual pg_node_tree NOT NULL;
ALTER TABLE pg_publication_rel ADD COLUMN prattrs int2vector NOT NULL;

ALTER TABLE pg_collation ADD COLUMN colliculocale text NOT NULL;

ALTER TABLE pg_collation ALTER COLUMN collcollate SET TYPE text;
ALTER TABLE pg_collation ALTER COLUMN collcollate DROP NOT NULL;
ALTER TABLE pg_collation ALTER COLUMN collctype SET TYPE text;
ALTER TABLE pg_collation ALTER COLUMN collctype DROP NOT NULL;

ALTER TABLE pg_constraint ADD COLUMN confdelsetcols int2[] NOT NULL;

ALTER TABLE pg_database ADD COLUMN datlocprovider char NULL;
ALTER TABLE pg_database ADD COLUMN daticulocale text NOT NULL;
ALTER TABLE pg_database ADD COLUMN datcollversion text NOT NULL;

ALTER TABLE pg_database ALTER COLUMN datcollate SET TYPE text;
ALTER TABLE pg_database ALTER COLUMN datctype SET TYPE text;

ALTER TABLE pg_database DROP COLUMN datlastsysoid;

ALTER TABLE pg_index ADD COLUMN indnullsnotdistinct bool NULL;
/*
## view `pg_stats_ext_exprs`

feat: add column `inherited bool NOT NULL`

## view `pg_publication_tables`

feat: add column `attnames name[] NOT NULL`
feat: add column `rowfilter text NOT NULL`

## view `pg_stats_ext`

feat: add column `inherited bool NOT NULL`

## view `pg_prepared_statements`

feat: add column `result_types regtype[] NULL`
*/
