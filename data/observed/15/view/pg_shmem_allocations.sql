 SELECT pg_get_shmem_allocations.name,
    pg_get_shmem_allocations.off,
    pg_get_shmem_allocations.size,
    pg_get_shmem_allocations.allocated_size
   FROM pg_get_shmem_allocations() pg_get_shmem_allocations(name, off, size, allocated_size);