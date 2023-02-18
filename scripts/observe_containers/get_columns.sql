SELECT
  col.attnum::TEXT AS col_number -- int2: 1-indexed
  , col.attname AS col_name
  , pg_catalog.format_type(col.atttypid, col.atttypmod) AS formatted_type
  , col.attnotnull AS not_null -- bool NOTE: all not-null constraints represented here, NOT in pg_constraint
  , (CASE WHEN col.atthasdef THEN pg_get_expr(adbin, adrelid) ELSE NULL END) AS default_expr
  -- , pg_catalog.col_description(col.attrelid, col.attnum) AS "comment"
FROM (
  SELECT *
  FROM pg_catalog.pg_attribute AS col -- https://www.postgresql.org/docs/current/catalog-pg-attribute.html
  WHERE col.atttypid > 0 -- un-dropped columns only
  -- note: many system columns included
) AS col
INNER JOIN pg_catalog.pg_class AS rel -- https://www.postgresql.org/docs/current/catalog-pg-class.html
  ON rel.relname = $1
  AND col.attrelid = rel.oid
INNER JOIN pg_catalog.pg_namespace AS rel_schema -- https://www.postgresql.org/docs/current/catalog-pg-namespace.html
  ON rel.relnamespace = rel_schema.oid
  AND rel_schema.nspname = 'pg_catalog'
LEFT JOIN pg_catalog.pg_attrdef AS col_def -- https://www.postgresql.org/docs/current/catalog-pg-attrdef.html
  ON col.atthasdef
  AND col.attrelid = col_def.adrelid
  AND col.attnum = col_def.adnum
ORDER BY col.attnum
;
