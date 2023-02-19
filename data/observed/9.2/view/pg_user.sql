 SELECT pg_shadow.usename, pg_shadow.usesysid, pg_shadow.usecreatedb, 
    pg_shadow.usesuper, pg_shadow.usecatupd, pg_shadow.userepl, 
    '********'::text AS passwd, pg_shadow.valuntil, pg_shadow.useconfig
   FROM pg_shadow;