 SELECT p.pubname,
    n.nspname AS schemaname,
    c.relname AS tablename,
    ( SELECT array_agg(a.attname ORDER BY a.attnum) AS array_agg
           FROM pg_attribute a
          WHERE a.attrelid = gpt.relid AND (a.attnum = ANY (gpt.attrs::smallint[]))) AS attnames,
    pg_get_expr(gpt.qual, gpt.relid) AS rowfilter
   FROM pg_publication p,
    LATERAL pg_get_publication_tables(VARIADIC ARRAY[p.pubname::text]) gpt(pubid, relid, attrs, qual),
    pg_class c
     JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.oid = gpt.relid;