 SELECT relid,
    schemaname,
    relname,
    blks_read,
    blks_hit
   FROM pg_statio_all_sequences
  WHERE (schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND schemaname !~ '^pg_toast'::text;