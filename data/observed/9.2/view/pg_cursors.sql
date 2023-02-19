 SELECT c.name, c.statement, c.is_holdable, c.is_binary, c.is_scrollable, 
    c.creation_time
   FROM pg_cursor() c(name, statement, is_holdable, is_binary, is_scrollable, creation_time);