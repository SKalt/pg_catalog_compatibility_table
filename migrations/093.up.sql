CREATE TABLE pg_event_trigger (
  tableoid oid NOT NULL
  , cmax cid NOT NULL
  , xmax xid NOT NULL
  , cmin cid NOT NULL
  , xmin xid NOT NULL
  , oid oid NOT NULL
  , ctid tid NOT NULL
  , evtname name NOT NULL
  , evtevent name NOT NULL
  , evtowner oid NOT NULL
  , evtfoid oid NOT NULL
  , evtenabled char NOT NULL
  , evttags text[] NULL
);

CREATE VIEW pg_matviews
 SELECT n.nspname AS schemaname,
    c.relname AS matviewname,
    pg_get_userbyid(c.relowner) AS matviewowner,
    t.spcname AS tablespace,
    c.relhasindex AS hasindexes,
    c.relispopulated AS ispopulated,
    pg_get_viewdef(c.oid) AS definition
   FROM pg_class c
     LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
     LEFT JOIN pg_tablespace t ON t.oid = c.reltablespace
  WHERE c.relkind = 'm'::"char";

ALTER TABLE pg_class ADD COLUMN relispopulated bool NULL;
ALTER TABLE pg_class ADD COLUMN relminmxid xid NULL;

ALTER TABLE pg_database ADD COLUMN datminmxid xid NULL;

ALTER TABLE pg_index ADD COLUMN indislive bool NULL;

