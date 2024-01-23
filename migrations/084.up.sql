DROP TABLE pg_autovacuum;

CREATE TABLE pg_foreign_data_wrapper (
  fdwacl aclitem[] NULL
  , fdwname name NULL
  , fdwoptions text[] NULL
  , fdwowner oid NULL
  , fdwvalidator oid NULL
);
CREATE TABLE pg_user_mapping (
  umoptions text[] NULL
  , umserver oid NULL
  , umuser oid NULL
);
CREATE TABLE pg_foreign_server (
  srvacl aclitem[] NULL
  , srvfdw oid NULL
  , srvname name NULL
  , srvoptions text[] NULL
  , srvowner oid NULL
  , srvtype text NULL
  , srvversion text NULL
);
CREATE VIEW pg_user_mappings AS (SELECT $$...$$);
ALTER TABLE pg_attribute ADD COLUMN attacl aclitem[] NULL;

ALTER TABLE pg_am ADD COLUMN amcanbackward bool NULL;
ALTER TABLE pg_am ADD COLUMN amgetbitmap regproc NULL;
ALTER TABLE pg_am ADD COLUMN amkeytype oid NULL;
ALTER TABLE pg_am DROP COLUMN amgetmulti;

ALTER TABLE pg_class ADD COLUMN relhastriggers bool NULL;
ALTER TABLE pg_class ADD COLUMN relistemp bool NULL;
ALTER TABLE pg_class DROP COLUMN relfkeys;
ALTER TABLE pg_class DROP COLUMN relrefs;
ALTER TABLE pg_class DROP COLUMN reltriggers;
ALTER TABLE pg_class DROP COLUMN relukeys;

ALTER TABLE pg_cast ADD COLUMN castmethod char NULL;

ALTER TABLE pg_amop DROP COLUMN amopreqcheck;

ALTER TABLE pg_shdepend ADD COLUMN objsubid int4 NULL;

ALTER TABLE pg_constraint ADD COLUMN coninhcount int4 NULL;
ALTER TABLE pg_constraint ADD COLUMN conislocal bool NULL;

ALTER TABLE pg_database ADD COLUMN datcollate name NULL;
ALTER TABLE pg_database ADD COLUMN datctype name NULL;

ALTER TABLE pg_proc ADD COLUMN proargdefaults text NULL;
ALTER TABLE pg_proc ADD COLUMN proiswindow bool NULL;
ALTER TABLE pg_proc ADD COLUMN pronargdefaults int2 NULL;
ALTER TABLE pg_proc ADD COLUMN provariadic oid NULL;

ALTER TABLE pg_type ADD COLUMN typcategory char NULL;
ALTER TABLE pg_type ADD COLUMN typispreferred bool NULL;

/*
## view `pg_settings`
feat: add column `boot_val text NULL`
feat: add column `enumvals text[] NULL`
feat: add column `reset_val text NULL`
feat: add column `sourcefile text NULL`
feat: add column `sourceline int4 NULL`
*/
