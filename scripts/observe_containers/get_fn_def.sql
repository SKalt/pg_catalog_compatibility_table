select pg_get_functiondef(fn.oid)
from pg_proc AS fn
inner join pg_namespace AS ns on ns.nspname = 'pg_catalog' AND fn.pronamespace = ns.oid
where fn.proname = $1
order by 1
