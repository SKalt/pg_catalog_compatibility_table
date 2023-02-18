 SELECT n.nspname AS schemaname,
    c.relname AS tablename,
    r.rulename,
    pg_get_ruledef(r.oid) AS definition
   FROM pg_rewrite r
     JOIN pg_class c ON c.oid = r.ev_class
     LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE r.rulename <> '_RETURN'::name;