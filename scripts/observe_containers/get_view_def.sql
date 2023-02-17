select pg_get_viewdef(oid, true)
from pg_class
where relkind IN ('v', 'm') AND relname = $1
