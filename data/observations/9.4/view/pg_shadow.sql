 SELECT pg_authid.rolname AS usename,
    pg_authid.oid AS usesysid,
    pg_authid.rolcreatedb AS usecreatedb,
    pg_authid.rolsuper AS usesuper,
    pg_authid.rolcatupdate AS usecatupd,
    pg_authid.rolreplication AS userepl,
    pg_authid.rolpassword AS passwd,
    pg_authid.rolvaliduntil::abstime AS valuntil,
    s.setconfig AS useconfig
   FROM pg_authid
     LEFT JOIN pg_db_role_setting s ON pg_authid.oid = s.setrole AND s.setdatabase = 0::oid
  WHERE pg_authid.rolcanlogin;