 SELECT a.line_number,
    a.map_name,
    a.sys_name,
    a.pg_username,
    a.error
   FROM pg_ident_file_mappings() a(line_number, map_name, sys_name, pg_username, error);