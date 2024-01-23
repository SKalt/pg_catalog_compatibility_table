 SELECT relid,
    schemaname,
    relname,
    seq_scan,
    seq_tup_read,
    idx_scan,
    idx_tup_fetch,
    n_tup_ins,
    n_tup_upd,
    n_tup_del,
    n_tup_hot_upd,
    n_tup_newpage_upd
   FROM pg_stat_xact_all_tables
  WHERE (schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR schemaname ~ '^pg_toast'::text;