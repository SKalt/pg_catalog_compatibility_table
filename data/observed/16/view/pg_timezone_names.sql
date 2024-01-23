 SELECT name,
    abbrev,
    utc_offset,
    is_dst
   FROM pg_timezone_names() pg_timezone_names(name, abbrev, utc_offset, is_dst);