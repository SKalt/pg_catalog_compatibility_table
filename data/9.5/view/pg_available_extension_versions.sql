 SELECT e.name,
    e.version,
    x.extname IS NOT NULL AS installed,
    e.superuser,
    e.relocatable,
    e.schema,
    e.requires,
    e.comment
   FROM pg_available_extension_versions() e(name, version, superuser, relocatable, schema, requires, comment)
     LEFT JOIN pg_extension x ON e.name = x.extname AND e.version = x.extversion;