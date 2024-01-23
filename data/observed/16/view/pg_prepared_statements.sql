 SELECT name,
    statement,
    prepare_time,
    parameter_types,
    result_types,
    from_sql,
    generic_plans,
    custom_plans
   FROM pg_prepared_statement() p(name, statement, prepare_time, parameter_types, result_types, from_sql, generic_plans, custom_plans);