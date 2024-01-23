DROP TABLE pg_replication_slots;

CREATE TABLE pg_policy (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , oid oid NOT NULL
  , ctid tid NOT NULL
  , polname name NOT NULL
  , polrelid oid NOT NULL
  , polcmd char NOT NULL
  , polroles oid[] NULL
  , polqual pg_node_tree NULL
  , polwithcheck pg_node_tree NULL
);

CREATE TABLE pg_replication_origin (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , ctid tid NOT NULL
  , roident oid NOT NULL
  , roname text NOT NULL
);

CREATE TABLE pg_transform (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , oid oid NOT NULL
  , ctid tid NOT NULL
  , trftype oid NOT NULL
  , trflang oid NOT NULL
  , trffromsql regproc NOT NULL
  , trftosql regproc NOT NULL
);

CREATE VIEW pg_replication_origin_status
 SELECT pg_show_replication_origin_status.local_id,
    pg_show_replication_origin_status.external_id,
    pg_show_replication_origin_status.remote_lsn,
    pg_show_replication_origin_status.local_lsn
   FROM pg_show_replication_origin_status() pg_show_replication_origin_status(local_id, external_id, remote_lsn, local_lsn);

CREATE VIEW pg_file_settings
 SELECT a.sourcefile,
    a.sourceline,
    a.seqno,
    a.name,
    a.setting,
    a.applied,
    a.error
   FROM pg_show_all_file_settings() a(sourcefile, sourceline, seqno, name, setting, applied, error);

CREATE VIEW pg_stat_ssl
 SELECT s.pid,
    s.ssl,
    s.sslversion AS version,
    s.sslcipher AS cipher,
    s.sslbits AS bits,
    s.sslcompression AS compression,
    s.sslclientdn AS clientdn
   FROM pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, waiting, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin, ssl, sslversion, sslcipher, sslbits, sslcompression, sslclientdn);

CREATE VIEW pg_policies
 SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    pol.polname AS policyname,
        CASE
            WHEN pol.polroles = '{0}'::oid[] THEN string_to_array('public'::text, ''::text)::name[]
            ELSE ARRAY( SELECT pg_authid.rolname
               FROM pg_authid
              WHERE pg_authid.oid = ANY (pol.polroles)
              ORDER BY pg_authid.rolname)
        END AS roles,
        CASE pol.polcmd
            WHEN 'r'::"char" THEN 'SELECT'::text
            WHEN 'a'::"char" THEN 'INSERT'::text
            WHEN 'w'::"char" THEN 'UPDATE'::text
            WHEN 'd'::"char" THEN 'DELETE'::text
            WHEN '*'::"char" THEN 'ALL'::text
            ELSE NULL::text
        END AS cmd,
    pg_get_expr(pol.polqual, pol.polrelid) AS qual,
    pg_get_expr(pol.polwithcheck, pol.polrelid) AS with_check
   FROM pg_policy pol
     JOIN pg_class c ON c.oid = pol.polrelid
     LEFT JOIN pg_namespace n ON n.oid = c.relnamespace;
ALTER TABLE pg_description ALTER COLUMN description SET NOT NULL;

ALTER TABLE pg_authid ADD COLUMN rolbypassrls bool NULL;
ALTER TABLE pg_authid DROP COLUMN rolcatupdate;

ALTER TABLE pg_shseclabel ALTER COLUMN provider SET NOT NULL;
ALTER TABLE pg_shseclabel ALTER COLUMN label SET NOT NULL;

ALTER TABLE pg_extension ALTER COLUMN extversion SET NOT NULL;

ALTER TABLE pg_class ADD COLUMN relrowsecurity bool NULL;
ALTER TABLE pg_class ADD COLUMN relforcerowsecurity bool NULL;

ALTER TABLE pg_pltemplate ALTER COLUMN tmplhandler SET NOT NULL;
ALTER TABLE pg_pltemplate ALTER COLUMN tmpllibrary SET NOT NULL;

ALTER TABLE pg_trigger ALTER COLUMN tgargs SET NOT NULL;

ALTER TABLE pg_shdescription ALTER COLUMN description SET NOT NULL;

ALTER TABLE pg_seclabel ALTER COLUMN provider SET NOT NULL;
ALTER TABLE pg_seclabel ALTER COLUMN label SET NOT NULL;

ALTER TABLE pg_largeobject ALTER COLUMN data SET NOT NULL;

ALTER TABLE pg_proc ADD COLUMN protrftypes oid[] NOT NULL;
ALTER TABLE pg_proc ALTER COLUMN prosrc SET NOT NULL;

/*
## view `pg_tables`
feat: add column `rowsecurity bool NOT NULL`


## view `pg_replication_slots`
feat: add column `active_pid int4 NOT NULL`
refactor: column `database` type set to `text`


## view `pg_user`
feat: add column `usebypassrls bool NOT NULL`
#
ALTER view pg_user DROP COLUMN usecatupd;


## view `pg_settings`
feat: add column `pending_restart bool NOT NULL`


## view `pg_roles`
feat: add column `rolbypassrls bool NOT NULL`
#
ALTER view pg_roles DROP COLUMN rolcatupdate;


## view `pg_shadow`
feat: add column `usebypassrls bool NOT NULL`
#
ALTER view pg_shadow DROP COLUMN usecatupd;
*/
