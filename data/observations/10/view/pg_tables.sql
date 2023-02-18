 SELECT n.nspname AS schemaname, c.relname AS tablename, 
    pg_get_userbyid(c.relowner) AS tableowner, t.spcname AS tablespace, 
    c.relhasindex AS hasindexes, c.relhasrules AS hasrules, 
    c.relhastriggers AS hastriggers
   FROM pg_class c
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
   LEFT JOIN pg_tablespace t ON t.oid = c.reltablespace
  WHERE c.relkind = 'r'::"char";