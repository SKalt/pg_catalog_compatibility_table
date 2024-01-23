 SELECT local_id,
    external_id,
    remote_lsn,
    local_lsn
   FROM pg_show_replication_origin_status() pg_show_replication_origin_status(local_id, external_id, remote_lsn, local_lsn);