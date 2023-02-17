 SELECT pg_config.name,
    pg_config.setting
   FROM pg_config() pg_config(name, setting);