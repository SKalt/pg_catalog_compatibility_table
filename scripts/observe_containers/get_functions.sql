select
  (
    proname
    || '('
    || pg_get_function_identity_arguments(fn.oid)
    || ')'
  )  AS id
  , pg_get_function_result(fn.oid) AS return_type
from pg_catalog.pg_proc AS fn
inner join pg_catalog.pg_namespace AS ns
  ON fn.pronamespace = ns.oid AND ns.nspname = 'pg_catalog'
;

