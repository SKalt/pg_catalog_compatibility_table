 SELECT relid,
    indexrelid,
    schemaname,
    relname,
    indexrelname,
    idx_scan,
    last_idx_scan,
    idx_tup_read,
    idx_tup_fetch
   FROM pg_stat_all_indexes
  WHERE (schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND schemaname !~ '^pg_toast'::text;