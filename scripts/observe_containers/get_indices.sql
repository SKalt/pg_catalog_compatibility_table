select
  idx.relname
  , rel.relname
  , pg_catalog.pg_get_indexdef(idx.oid) || ';'
from pg_catalog.pg_class AS idx
inner join pg_catalog.pg_namespace as ns
  on idx.relkind in ('i', 'I')
  and ns.nspname = 'pg_catalog'
  and idx.relnamespace = ns.oid
inner join pg_catalog.pg_index AS _idx ON idx.oid = _idx.indexrelid 
left join pg_catalog.pg_class AS rel on _idx.indrelid = rel.oid
order by 1, 2, 3
;
