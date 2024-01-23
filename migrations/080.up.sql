
CREATE TABLE pg_tablespace (
  spcacl aclitem[] NULL
  , spclocation text NULL
  , spcname name NULL
  , spcowner int4 NULL
);
ALTER TABLE pg_attribute DROP COLUMN attisset;

ALTER TABLE pg_amproc ADD COLUMN amprocsubtype oid NULL;

ALTER TABLE pg_class ADD COLUMN reltablespace oid NULL;

ALTER TABLE pg_amop ADD COLUMN amopsubtype oid NULL;

ALTER TABLE pg_database ADD COLUMN dattablespace oid NULL;

ALTER TABLE pg_database DROP COLUMN datpath;

ALTER TABLE pg_proc ADD COLUMN proargnames text[] NULL;

ALTER TABLE pg_type ADD COLUMN typanalyze regproc NULL;

-- TODO: changes from views
