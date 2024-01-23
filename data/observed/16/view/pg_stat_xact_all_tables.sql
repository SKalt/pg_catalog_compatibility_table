 SELECT c.oid AS relid,
    n.nspname AS schemaname,
    c.relname,
    pg_stat_get_xact_numscans(c.oid) AS seq_scan,
    pg_stat_get_xact_tuples_returned(c.oid) AS seq_tup_read,
    sum(pg_stat_get_xact_numscans(i.indexrelid))::bigint AS idx_scan,
    sum(pg_stat_get_xact_tuples_fetched(i.indexrelid))::bigint + pg_stat_get_xact_tuples_fetched(c.oid) AS idx_tup_fetch,
    pg_stat_get_xact_tuples_inserted(c.oid) AS n_tup_ins,
    pg_stat_get_xact_tuples_updated(c.oid) AS n_tup_upd,
    pg_stat_get_xact_tuples_deleted(c.oid) AS n_tup_del,
    pg_stat_get_xact_tuples_hot_updated(c.oid) AS n_tup_hot_upd,
    pg_stat_get_xact_tuples_newpage_updated(c.oid) AS n_tup_newpage_upd
   FROM pg_class c
     LEFT JOIN pg_index i ON c.oid = i.indrelid
     LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char", 'm'::"char", 'p'::"char"])
  GROUP BY c.oid, n.nspname, c.relname;