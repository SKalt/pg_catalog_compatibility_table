 SELECT s.datid, d.datname, s.pid, s.usesysid, u.rolname AS usename, 
    s.application_name, s.client_addr, s.client_hostname, s.client_port, 
    s.backend_start, s.xact_start, s.query_start, s.state_change, s.waiting, 
    s.state, s.query
   FROM pg_database d, 
    pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, waiting, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port), 
    pg_authid u
  WHERE s.datid = d.oid AND s.usesysid = u.oid;