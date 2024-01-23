 SELECT c.oid AS relid,
    n.nspname AS schemaname,
    c.relname,
    pg_stat_get_blocks_fetched(c.oid) - pg_stat_get_blocks_hit(c.oid) AS heap_blks_read,
    pg_stat_get_blocks_hit(c.oid) AS heap_blks_hit,
    i.idx_blks_read,
    i.idx_blks_hit,
    pg_stat_get_blocks_fetched(t.oid) - pg_stat_get_blocks_hit(t.oid) AS toast_blks_read,
    pg_stat_get_blocks_hit(t.oid) AS toast_blks_hit,
    x.idx_blks_read AS tidx_blks_read,
    x.idx_blks_hit AS tidx_blks_hit
   FROM pg_class c
     LEFT JOIN pg_class t ON c.reltoastrelid = t.oid
     LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
     LEFT JOIN LATERAL ( SELECT sum(pg_stat_get_blocks_fetched(pg_index.indexrelid) - pg_stat_get_blocks_hit(pg_index.indexrelid))::bigint AS idx_blks_read,
            sum(pg_stat_get_blocks_hit(pg_index.indexrelid))::bigint AS idx_blks_hit
           FROM pg_index
          WHERE pg_index.indrelid = c.oid) i ON true
     LEFT JOIN LATERAL ( SELECT sum(pg_stat_get_blocks_fetched(pg_index.indexrelid) - pg_stat_get_blocks_hit(pg_index.indexrelid))::bigint AS idx_blks_read,
            sum(pg_stat_get_blocks_hit(pg_index.indexrelid))::bigint AS idx_blks_hit
           FROM pg_index
          WHERE pg_index.indrelid = t.oid) x ON true
  WHERE c.relkind = ANY (ARRAY['r'::"char", 't'::"char", 'm'::"char"]);