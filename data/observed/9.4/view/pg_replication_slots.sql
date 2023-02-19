 SELECT l.slot_name,
    l.plugin,
    l.slot_type,
    l.datoid,
    d.datname AS database,
    l.active,
    l.xmin,
    l.catalog_xmin,
    l.restart_lsn
   FROM pg_get_replication_slots() l(slot_name, plugin, slot_type, datoid, active, xmin, catalog_xmin, restart_lsn)
     LEFT JOIN pg_database d ON l.datoid = d.oid;