 SELECT pg_timezone_names.name, pg_timezone_names.abbrev, 
    pg_timezone_names.utc_offset, pg_timezone_names.is_dst
   FROM pg_timezone_names() pg_timezone_names(name, abbrev, utc_offset, is_dst);