 SELECT abbrev,
    utc_offset,
    is_dst
   FROM pg_timezone_abbrevs() pg_timezone_abbrevs(abbrev, utc_offset, is_dst);