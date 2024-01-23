CREATE TABLE pg_extension (
  extcondition text[] NULL
  , extconfig oid[] NULL
  , extname name NULL
  , extnamespace oid NULL
  , extowner oid NULL
  , extrelocatable bool NULL
  , extversion text NULL
);

CREATE TABLE pg_collation (
  collcollate name NULL
  , collctype name NULL
  , collencoding int4 NULL
  , collname name NULL
  , collnamespace oid NULL
  , collowner oid NULL
);

CREATE TABLE pg_foreign_table (
  ftoptions text[] NULL
  , ftrelid oid NULL
  , ftserver oid NULL
);

CREATE TABLE pg_seclabel (
  classoid oid NULL
  , label text NULL
  , objoid oid NULL
  , objsubid int4 NULL
  , provider text NULL
);

CREATE VIEW pg_available_extensions AS (SELECT $$...$$);

CREATE VIEW pg_seclabels AS (SELECT $$...$$);

CREATE VIEW pg_available_extension_versions AS (SELECT $$...$$);


ALTER TABLE pg_attribute ADD COLUMN attcollation oid NULL;


ALTER TABLE pg_authid ADD COLUMN rolreplication bool NULL;


ALTER TABLE pg_foreign_data_wrapper ADD COLUMN fdwhandler oid NULL;


ALTER TABLE pg_am ADD COLUMN ambuildempty regproc NULL;
ALTER TABLE pg_am ADD COLUMN amcanorderbyop bool NULL;
ALTER TABLE pg_am ADD COLUMN ampredlocks bool NULL;

ALTER TABLE pg_am DROP COLUMN amindexnulls;


ALTER TABLE pg_class ADD COLUMN relpersistence char NULL;

ALTER TABLE pg_class DROP COLUMN relhasexclusion;
ALTER TABLE pg_class DROP COLUMN relistemp;


ALTER TABLE pg_amop ADD COLUMN amoppurpose char NULL;
ALTER TABLE pg_amop ADD COLUMN amopsortfamily oid NULL;


ALTER TABLE pg_trigger ALTER COLUMN tgqual SET TYPE pg_node_tree;


ALTER TABLE pg_constraint ADD COLUMN convalidated bool NULL;

ALTER TABLE pg_constraint ALTER COLUMN conbin SET TYPE pg_node_tree;


ALTER TABLE pg_enum ADD COLUMN enumsortorder float4 NULL;


ALTER TABLE pg_index ADD COLUMN indcollation oidvector NULL;
ALTER TABLE pg_index ADD COLUMN indisexclusion bool NULL;

ALTER TABLE pg_index ALTER COLUMN indexprs SET TYPE pg_node_tree;
ALTER TABLE pg_index ALTER COLUMN indpred SET TYPE pg_node_tree;


ALTER TABLE pg_attrdef ALTER COLUMN adbin SET TYPE pg_node_tree;


ALTER TABLE pg_proc ALTER COLUMN proargdefaults SET TYPE pg_node_tree;


ALTER TABLE pg_type ADD COLUMN typcollation oid NULL;

ALTER TABLE pg_type ALTER COLUMN typdefaultbin SET TYPE pg_node_tree;


ALTER TABLE pg_rewrite ALTER COLUMN ev_action SET TYPE pg_node_tree;
ALTER TABLE pg_rewrite ALTER COLUMN ev_qual SET TYPE pg_node_tree;


/*
## view `pg_roles`
### Features
feat: add column `rolreplication bool NULL`
*/
