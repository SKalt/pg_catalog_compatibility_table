 SELECT p.pubname,
    n.nspname AS schemaname,
    c.relname AS tablename
   FROM pg_publication p,
    LATERAL pg_get_publication_tables(p.pubname::text) gpt(relid),
    pg_class c
     JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.oid = gpt.relid;