CREATE OR REPLACE FUNCTION pg_catalog.ts_debug(config regconfig, document text, OUT alias text, OUT description text, OUT token text, OUT dictionaries regdictionary[], OUT dictionary regdictionary, OUT lexemes text[])
 RETURNS SETOF record
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
AS $function$
SELECT
    tt.alias AS alias,
    tt.description AS description,
    parse.token AS token,
    ARRAY ( SELECT m.mapdict::pg_catalog.regdictionary
            FROM pg_catalog.pg_ts_config_map AS m
            WHERE m.mapcfg = $1 AND m.maptokentype = parse.tokid
            ORDER BY m.mapseqno )
    AS dictionaries,
    ( SELECT mapdict::pg_catalog.regdictionary
      FROM pg_catalog.pg_ts_config_map AS m
      WHERE m.mapcfg = $1 AND m.maptokentype = parse.tokid
      ORDER BY pg_catalog.ts_lexize(mapdict, parse.token) IS NULL, m.mapseqno
      LIMIT 1
    ) AS dictionary,
    ( SELECT pg_catalog.ts_lexize(mapdict, parse.token)
      FROM pg_catalog.pg_ts_config_map AS m
      WHERE m.mapcfg = $1 AND m.maptokentype = parse.tokid
      ORDER BY pg_catalog.ts_lexize(mapdict, parse.token) IS NULL, m.mapseqno
      LIMIT 1
    ) AS lexemes
FROM pg_catalog.ts_parse(
        (SELECT cfgparser FROM pg_catalog.pg_ts_config WHERE oid = $1 ), $2
    ) AS parse,
     pg_catalog.ts_token_type(
        (SELECT cfgparser FROM pg_catalog.pg_ts_config WHERE oid = $1 )
    ) AS tt
WHERE tt.tokid = parse.tokid
$function$
;
CREATE OR REPLACE FUNCTION pg_catalog.ts_debug(document text, OUT alias text, OUT description text, OUT token text, OUT dictionaries regdictionary[], OUT dictionary regdictionary, OUT lexemes text[])
 RETURNS SETOF record
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT
AS $function$
    SELECT * FROM pg_catalog.ts_debug( pg_catalog.get_current_ts_config(), $1);
$function$
;
