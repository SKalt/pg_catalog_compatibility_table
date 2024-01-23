CREATE TABLE pg_statistic_ext_data (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , ctid tid NOT NULL
  , stxoid oid NOT NULL
  , stxdndistinct pg_ndistinct NULL
  , stxddependencies pg_dependencies NULL
  , stxdmcv pg_mcv_list NULL
);

CREATE VIEW pg_stat_progress_create_index
 SELECT s.pid,
    s.datid,
    d.datname,
    s.relid,
    s.param7::oid AS index_relid,
        CASE s.param1
            WHEN 1 THEN 'CREATE INDEX'::text
            WHEN 2 THEN 'CREATE INDEX CONCURRENTLY'::text
            WHEN 3 THEN 'REINDEX'::text
            WHEN 4 THEN 'REINDEX CONCURRENTLY'::text
            ELSE NULL::text
        END AS command,
        CASE s.param10
            WHEN 0 THEN 'initializing'::text
            WHEN 1 THEN 'waiting for writers before build'::text
            WHEN 2 THEN 'building index'::text || COALESCE(': '::text || pg_indexam_progress_phasename(s.param9::oid, s.param11), ''::text)
            WHEN 3 THEN 'waiting for writers before validation'::text
            WHEN 4 THEN 'index validation: scanning index'::text
            WHEN 5 THEN 'index validation: sorting tuples'::text
            WHEN 6 THEN 'index validation: scanning table'::text
            WHEN 7 THEN 'waiting for old snapshots'::text
            WHEN 8 THEN 'waiting for readers before marking dead'::text
            WHEN 9 THEN 'waiting for readers before dropping'::text
            ELSE NULL::text
        END AS phase,
    s.param4 AS lockers_total,
    s.param5 AS lockers_done,
    s.param6 AS current_locker_pid,
    s.param16 AS blocks_total,
    s.param17 AS blocks_done,
    s.param12 AS tuples_total,
    s.param13 AS tuples_done,
    s.param14 AS partitions_total,
    s.param15 AS partitions_done
   FROM pg_stat_get_progress_info('CREATE INDEX'::text) s(pid, datid, relid, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20)
     LEFT JOIN pg_database d ON s.datid = d.oid;

CREATE VIEW pg_stat_gssapi
 SELECT s.pid,
    s.gss_auth AS gss_authenticated,
    s.gss_princ AS principal,
    s.gss_enc AS encrypted
   FROM pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, wait_event_type, wait_event, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin, backend_type, ssl, sslversion, sslcipher, sslbits, sslcompression, ssl_client_dn, ssl_client_serial, ssl_issuer_dn, gss_auth, gss_princ, gss_enc);

CREATE VIEW pg_stats_ext
 SELECT cn.nspname AS schemaname,
    c.relname AS tablename,
    sn.nspname AS statistics_schemaname,
    s.stxname AS statistics_name,
    pg_get_userbyid(s.stxowner) AS statistics_owner,
    ( SELECT array_agg(a.attname ORDER BY a.attnum) AS array_agg
           FROM unnest(s.stxkeys) k(k)
             JOIN pg_attribute a ON a.attrelid = s.stxrelid AND a.attnum = k.k) AS attnames,
    s.stxkind AS kinds,
    sd.stxdndistinct AS n_distinct,
    sd.stxddependencies AS dependencies,
    m.most_common_vals,
    m.most_common_val_nulls,
    m.most_common_freqs,
    m.most_common_base_freqs
   FROM pg_statistic_ext s
     JOIN pg_class c ON c.oid = s.stxrelid
     JOIN pg_statistic_ext_data sd ON s.oid = sd.stxoid
     LEFT JOIN pg_namespace cn ON cn.oid = c.relnamespace
     LEFT JOIN pg_namespace sn ON sn.oid = s.stxnamespace
     LEFT JOIN LATERAL ( SELECT array_agg(pg_mcv_list_items."values") AS most_common_vals,
            array_agg(pg_mcv_list_items.nulls) AS most_common_val_nulls,
            array_agg(pg_mcv_list_items.frequency) AS most_common_freqs,
            array_agg(pg_mcv_list_items.base_frequency) AS most_common_base_freqs
           FROM pg_mcv_list_items(sd.stxdmcv) pg_mcv_list_items(index, "values", nulls, frequency, base_frequency)) m ON sd.stxdmcv IS NOT NULL
  WHERE NOT (EXISTS ( SELECT 1
           FROM unnest(s.stxkeys) k(k)
             JOIN pg_attribute a ON a.attrelid = s.stxrelid AND a.attnum = k.k
          WHERE NOT has_column_privilege(c.oid, a.attnum, 'select'::text))) AND (c.relrowsecurity = false OR NOT row_security_active(c.oid));

CREATE VIEW pg_stat_progress_cluster
 SELECT s.pid,
    s.datid,
    d.datname,
    s.relid,
        CASE s.param1
            WHEN 1 THEN 'CLUSTER'::text
            WHEN 2 THEN 'VACUUM FULL'::text
            ELSE NULL::text
        END AS command,
        CASE s.param2
            WHEN 0 THEN 'initializing'::text
            WHEN 1 THEN 'seq scanning heap'::text
            WHEN 2 THEN 'index scanning heap'::text
            WHEN 3 THEN 'sorting tuples'::text
            WHEN 4 THEN 'writing new heap'::text
            WHEN 5 THEN 'swapping relation files'::text
            WHEN 6 THEN 'rebuilding index'::text
            WHEN 7 THEN 'performing final cleanup'::text
            ELSE NULL::text
        END AS phase,
    s.param3::oid AS cluster_index_relid,
    s.param4 AS heap_tuples_scanned,
    s.param5 AS heap_tuples_written,
    s.param6 AS heap_blks_total,
    s.param7 AS heap_blks_scanned,
    s.param8 AS index_rebuild_count
   FROM pg_stat_get_progress_info('CLUSTER'::text) s(pid, datid, relid, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20)
     LEFT JOIN pg_database d ON s.datid = d.oid;

ALTER TABLE pg_statistic ADD COLUMN stacoll1 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN stacoll2 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN stacoll3 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN stacoll4 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN stacoll5 oid NULL;
ALTER TABLE pg_statistic ADD COLUMN stacolln oid NULL;

ALTER TABLE pg_attribute ADD COLUMN attgenerated char NULL;

ALTER TABLE pg_policy ALTER COLUMN polroles SET NOT NULL;


ALTER TABLE pg_default_acl ALTER COLUMN defaclacl SET NOT NULL;



ALTER TABLE pg_class DROP COLUMN relhasoids;



ALTER TABLE pg_statistic_ext DROP COLUMN stxndistinct;
ALTER TABLE pg_statistic_ext DROP COLUMN stxdependencies;

ALTER TABLE pg_collation ADD COLUMN collisdeterministic bool NULL;

ALTER TABLE pg_constraint DROP COLUMN consrc;

ALTER TABLE pg_attrdef ALTER COLUMN adbin SET NOT NULL;
ALTER TABLE pg_attrdef DROP COLUMN adsrc;

ALTER TABLE pg_proc ADD COLUMN prosupport regproc NULL;
ALTER TABLE pg_proc DROP COLUMN protransform;



ALTER TABLE pg_rewrite ALTER COLUMN ev_qual SET NOT NULL;
ALTER TABLE pg_rewrite ALTER COLUMN ev_action SET NOT NULL;
/*
## view `pg_stat_database`

### Features

feat: add column `checksum_failures int8 NOT NULL`
feat: add column `checksum_last_failure timestamptz NOT NULL`

## view `pg_user`

### Non-Breaking Changes

refactor: column `valuntil` type set to `timestamptz`

## view `pg_stat_ssl`

### Features

feat: add column `client_dn text NOT NULL`
feat: add column `client_serial numeric NOT NULL`
feat: add column `issuer_dn text NOT NULL`

### Breaking changes

BREAKING CHANGE: alter view pg_stat_ssl drop column clientdn

## view `pg_stat_replication`

### Features

feat: add column `reply_time timestamptz NOT NULL`

## view `pg_shadow`

### Non-Breaking Changes

refactor: column `valuntil` type set to `timestamptz`
*/
