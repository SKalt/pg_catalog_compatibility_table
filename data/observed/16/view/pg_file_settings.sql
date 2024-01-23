 SELECT sourcefile,
    sourceline,
    seqno,
    name,
    setting,
    applied,
    error
   FROM pg_show_all_file_settings() a(sourcefile, sourceline, seqno, name, setting, applied, error);