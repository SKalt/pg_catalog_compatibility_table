 SELECT a.name, a.setting, a.unit, a.category, a.short_desc, a.extra_desc, 
    a.context, a.vartype, a.source, a.min_val, a.max_val, a.enumvals, 
    a.boot_val, a.reset_val, a.sourcefile, a.sourceline
   FROM pg_show_all_settings() a(name, setting, unit, category, short_desc, extra_desc, context, vartype, source, min_val, max_val, enumvals, boot_val, reset_val, sourcefile, sourceline);