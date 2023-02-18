 SELECT c.oid AS relid, i.oid AS indexrelid, n.nspname AS schemaname, c.relname, 
    i.relname AS indexrelname, pg_stat_get_numscans(i.oid) AS idx_scan, 
    pg_stat_get_tuples_returned(i.oid) AS idx_tup_read, 
    pg_stat_get_tuples_fetched(i.oid) AS idx_tup_fetch
   FROM pg_class c
   JOIN pg_index x ON c.oid = x.indrelid
   JOIN pg_class i ON i.oid = x.indexrelid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"]);