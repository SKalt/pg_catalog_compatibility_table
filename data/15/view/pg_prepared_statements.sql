 SELECT p.name,
    p.statement,
    p.prepare_time,
    p.parameter_types,
    p.from_sql,
    p.generic_plans,
    p.custom_plans
   FROM pg_prepared_statement() p(name, statement, prepare_time, parameter_types, from_sql, generic_plans, custom_plans);