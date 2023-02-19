 SELECT c.oid AS relid, n.nspname AS schemaname, c.relname, 
    pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid) AS blks_read, 
    pg_stat_get_blocks_hit(c.oid) AS blks_hit
   FROM pg_class c
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = 'S'::"char";