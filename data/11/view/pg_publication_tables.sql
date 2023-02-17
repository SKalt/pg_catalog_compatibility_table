 SELECT p.pubname,
    n.nspname AS schemaname,
    c.relname AS tablename
   FROM pg_publication p,
    pg_class c
     JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE (c.oid IN ( SELECT pg_get_publication_tables.relid
           FROM pg_get_publication_tables(p.pubname::text) pg_get_publication_tables(relid)));