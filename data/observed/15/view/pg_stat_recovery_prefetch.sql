 SELECT s.stats_reset,
    s.prefetch,
    s.hit,
    s.skip_init,
    s.skip_new,
    s.skip_fpw,
    s.skip_rep,
    s.wal_distance,
    s.block_distance,
    s.io_depth
   FROM pg_stat_get_recovery_prefetch() s(stats_reset, prefetch, hit, skip_init, skip_new, skip_fpw, skip_rep, wal_distance, block_distance, io_depth);