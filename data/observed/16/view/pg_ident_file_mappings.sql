 SELECT map_number,
    file_name,
    line_number,
    map_name,
    sys_name,
    pg_username,
    error
   FROM pg_ident_file_mappings() a(map_number, file_name, line_number, map_name, sys_name, pg_username, error);