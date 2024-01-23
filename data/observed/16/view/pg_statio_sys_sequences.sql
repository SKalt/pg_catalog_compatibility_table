 SELECT relid,
    schemaname,
    relname,
    blks_read,
    blks_hit
   FROM pg_statio_all_sequences
  WHERE (schemaname = ANY (ARRAY['pg_catalog'::name, 'information_schema'::name])) OR schemaname ~ '^pg_toast'::text;