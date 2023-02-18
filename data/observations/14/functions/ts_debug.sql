CREATE OR REPLACE FUNCTION pg_catalog.ts_debug(config regconfig, document text, OUT alias text, OUT description text, OUT token text, OUT dictionaries regdictionary[], OUT dictionary regdictionary, OUT lexemes text[])
 RETURNS SETOF record
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
BEGIN ATOMIC
 SELECT tt.alias,
     tt.description,
     parse.token,
     ARRAY( SELECT (m.mapdict)::regdictionary AS mapdict
            FROM pg_ts_config_map m
           WHERE ((m.mapcfg = (ts_debug.config)::oid) AND (m.maptokentype = parse.tokid))
           ORDER BY m.mapseqno) AS dictionaries,
     ( SELECT (m.mapdict)::regdictionary AS mapdict
            FROM pg_ts_config_map m
           WHERE ((m.mapcfg = (ts_debug.config)::oid) AND (m.maptokentype = parse.tokid))
           ORDER BY (ts_lexize((m.mapdict)::regdictionary, parse.token) IS NULL), m.mapseqno
          LIMIT 1) AS dictionary,
     ( SELECT ts_lexize((m.mapdict)::regdictionary, parse.token) AS ts_lexize
            FROM pg_ts_config_map m
           WHERE ((m.mapcfg = (ts_debug.config)::oid) AND (m.maptokentype = parse.tokid))
           ORDER BY (ts_lexize((m.mapdict)::regdictionary, parse.token) IS NULL), m.mapseqno
          LIMIT 1) AS lexemes
    FROM ts_parse(( SELECT pg_ts_config.cfgparser
            FROM pg_ts_config
           WHERE (pg_ts_config.oid = (ts_debug.config)::oid)), ts_debug.document) parse(tokid, token),
     ts_token_type(( SELECT pg_ts_config.cfgparser
            FROM pg_ts_config
           WHERE (pg_ts_config.oid = (ts_debug.config)::oid))) tt(tokid, alias, description)
   WHERE (tt.tokid = parse.tokid);
END
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_debug(document text, OUT alias text, OUT description text, OUT token text, OUT dictionaries regdictionary[], OUT dictionary regdictionary, OUT lexemes text[])
 RETURNS SETOF record
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
BEGIN ATOMIC
 SELECT ts_debug.alias,
     ts_debug.description,
     ts_debug.token,
     ts_debug.dictionaries,
     ts_debug.dictionary,
     ts_debug.lexemes
    FROM ts_debug(get_current_ts_config(), ts_debug.document) ts_debug(alias, description, token, dictionaries, dictionary, lexemes);
END
;
