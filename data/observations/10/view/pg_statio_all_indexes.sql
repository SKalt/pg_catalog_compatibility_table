 SELECT c.oid AS relid, i.oid AS indexrelid, n.nspname AS schemaname, c.relname, 
    i.relname AS indexrelname, 
    pg_stat_get_blocks_fetched(i.oid) - pg_stat_get_blocks_hit(i.oid) AS idx_blks_read, 
    pg_stat_get_blocks_hit(i.oid) AS idx_blks_hit
   FROM pg_class c
   JOIN pg_index x ON c.oid = x.indrelid
   JOIN pg_class i ON i.oid = x.indexrelid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"]);