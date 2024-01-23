 SELECT pg_statio_all_sequences.relid,
    pg_statio_all_sequences.schemaname,
    pg_statio_all_sequences.relname,
    pg_statio_all_sequences.blks_read,
    pg_statio_all_sequences.blks_hit
   FROM pg_statio_all_sequences
  WHERE (pg_statio_all_sequences.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND pg_statio_all_sequences.schemaname !~ '^pg_toast'::text;