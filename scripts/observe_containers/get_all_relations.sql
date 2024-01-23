select relname
from pg_class
inner join pg_namespace as ns
  on nspname = 'pg_catalog'
  and relnamespace = ns.oid
where relkind in $1
order by relname;

