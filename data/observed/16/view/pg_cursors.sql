 SELECT name,
    statement,
    is_holdable,
    is_binary,
    is_scrollable,
    creation_time
   FROM pg_cursor() c(name, statement, is_holdable, is_binary, is_scrollable, creation_time);