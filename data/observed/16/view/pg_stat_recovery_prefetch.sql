 SELECT stats_reset,
    prefetch,
    hit,
    skip_init,
    skip_new,
    skip_fpw,
    skip_rep,
    wal_distance,
    block_distance,
    io_depth
   FROM pg_stat_get_recovery_prefetch() s(stats_reset, prefetch, hit, skip_init, skip_new, skip_fpw, skip_rep, wal_distance, block_distance, io_depth);