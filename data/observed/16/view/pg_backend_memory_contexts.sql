 SELECT name,
    ident,
    parent,
    level,
    total_bytes,
    total_nblocks,
    free_bytes,
    free_chunks,
    used_bytes
   FROM pg_get_backend_memory_contexts() pg_get_backend_memory_contexts(name, ident, parent, level, total_bytes, total_nblocks, free_bytes, free_chunks, used_bytes);