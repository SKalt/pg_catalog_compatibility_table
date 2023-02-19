 SELECT u.oid AS umid,
    s.oid AS srvid,
    s.srvname,
    u.umuser,
        CASE
            WHEN u.umuser = 0::oid THEN 'public'::name
            ELSE a.rolname
        END AS usename,
        CASE
            WHEN u.umuser <> 0::oid AND a.rolname = CURRENT_USER AND (pg_has_role(s.srvowner, 'USAGE'::text) OR has_server_privilege(s.oid, 'USAGE'::text)) OR u.umuser = 0::oid AND pg_has_role(s.srvowner, 'USAGE'::text) OR ( SELECT pg_authid.rolsuper
               FROM pg_authid
              WHERE pg_authid.rolname = CURRENT_USER) THEN u.umoptions
            ELSE NULL::text[]
        END AS umoptions
   FROM pg_user_mapping u
     JOIN pg_foreign_server s ON u.umserver = s.oid
     LEFT JOIN pg_authid a ON a.oid = u.umuser;