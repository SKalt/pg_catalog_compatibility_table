 SELECT name,
    off,
    size,
    allocated_size
   FROM pg_get_shmem_allocations() pg_get_shmem_allocations(name, off, size, allocated_size);