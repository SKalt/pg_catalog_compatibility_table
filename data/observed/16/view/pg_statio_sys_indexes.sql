 SELECT relid,
    indexrelid,
    schemaname,
    relname,
    indexrelname,
    idx_blks_read,
    idx_blks_hit
   FROM pg_statio_all_indexes
  WHERE (schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR schemaname ~ '^pg_toast'::text;