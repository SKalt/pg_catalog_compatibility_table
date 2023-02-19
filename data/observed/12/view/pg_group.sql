 SELECT pg_authid.rolname AS groname,
    pg_authid.oid AS grosysid,
    ARRAY( SELECT pg_auth_members.member
           FROM pg_auth_members
          WHERE pg_auth_members.roleid = pg_authid.oid) AS grolist
   FROM pg_authid
  WHERE NOT pg_authid.rolcanlogin;