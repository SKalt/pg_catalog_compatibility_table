 SELECT pg_statio_all_indexes.relid,
    pg_statio_all_indexes.indexrelid,
    pg_statio_all_indexes.schemaname,
    pg_statio_all_indexes.relname,
    pg_statio_all_indexes.indexrelname,
    pg_statio_all_indexes.idx_blks_read,
    pg_statio_all_indexes.idx_blks_hit
   FROM pg_statio_all_indexes
  WHERE (pg_statio_all_indexes.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_statio_all_indexes.schemaname !~ '^pg_toast'::text;