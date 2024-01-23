 SELECT p.name,
    p.statement,
    p.prepare_time,
    p.parameter_types,
    p.from_sql
   FROM pg_prepared_statement() p(name, statement, prepare_time, parameter_types, from_sql);