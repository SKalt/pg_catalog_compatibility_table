 SELECT n.nspname AS schemaname, c.relname AS viewname, 
    pg_get_userbyid(c.relowner) AS viewowner, 
    pg_get_viewdef(c.oid) AS definition
   FROM pg_class c
   LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = 'v'::"char";