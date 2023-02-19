 SELECT s.pid,
    s.ssl,
    s.sslversion AS version,
    s.sslcipher AS cipher,
    s.sslbits AS bits,
    s.sslcompression AS compression,
    s.ssl_client_dn AS client_dn,
    s.ssl_client_serial AS client_serial,
    s.ssl_issuer_dn AS issuer_dn
   FROM pg_stat_get_activity(NULL::integer) s(datid, pid, usesysid, application_name, state, query, wait_event_type, wait_event, xact_start, query_start, backend_start, state_change, client_addr, client_hostname, client_port, backend_xid, backend_xmin, backend_type, ssl, sslversion, sslcipher, sslbits, sslcompression, ssl_client_dn, ssl_client_serial, ssl_issuer_dn, gss_auth, gss_princ, gss_enc, leader_pid)
  WHERE s.client_port IS NOT NULL;