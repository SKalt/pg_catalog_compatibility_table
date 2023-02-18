 SELECT c.oid AS relid, n.nspname AS schemaname, c.relname, 
    pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid) AS heap_blks_read, 
    pg_stat_get_blocks_hit(c.oid) AS heap_blks_hit, 
    sum(pg_stat_get_blocks_fetched(i.indexrelid) - pg_stat_get_blocks_hit(i.indexrelid))::bigint AS idx_blks_read, 
    sum(pg_stat_get_blocks_hit(i.indexrelid))::bigint AS idx_blks_hit, 
    pg_stat_get_blocks_fetched(t.oid) - pg_stat_get_blocks_hit(t.oid) AS toast_blks_read, 
    pg_stat_get_blocks_hit(t.oid) AS toast_blks_hit, 
    pg_stat_get_blocks_fetched(x.oid) - pg_stat_get_blocks_hit(x.oid) AS tidx_blks_read, 
    pg_stat_get_blocks_hit(x.oid) AS tidx_blks_hit
   FROM pg_class c
   LEFT JOIN pg_index i ON c.oid = i.indrelid
   LEFT JOIN pg_class t ON c.reltoastrelid = t.oid
   LEFT JOIN pg_class x ON t.reltoastidxid = x.oid
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char"])
  GROUP BY c.oid, n.nspname, c.relname, t.oid, x.oid;