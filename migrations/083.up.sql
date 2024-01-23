CREATE TABLE pg_ts_dict (
  dictinitoption text NULL
  , dictname name NULL
  , dictnamespace oid NULL
  , dictowner oid NULL
  , dicttemplate oid NULL
);

CREATE TABLE pg_ts_template (
  tmplinit regproc NULL
  , tmpllexize regproc NULL
  , tmplname name NULL
  , tmplnamespace oid NULL
);

CREATE TABLE pg_ts_parser (
  prsend regproc NULL
  , prsheadline regproc NULL
  , prslextype regproc NULL
  , prsname name NULL
  , prsnamespace oid NULL
  , prsstart regproc NULL
  , prstoken regproc NULL
);

CREATE TABLE pg_enum (
  enumlabel name NULL
  , enumtypid oid NULL
);

CREATE TABLE pg_opfamily (
  opfmethod oid NULL
  , opfname name NULL
  , opfnamespace oid NULL
  , opfowner oid NULL
);

CREATE TABLE pg_ts_config_map (
  mapcfg oid NULL
  , mapdict oid NULL
  , mapseqno int4 NULL
  , maptokentype int4 NULL
);

CREATE TABLE pg_ts_config (
  cfgname name NULL
  , cfgnamespace oid NULL
  , cfgowner oid NULL
  , cfgparser oid NULL
);

ALTER TABLE pg_language ADD COLUMN lanowner oid NULL;


ALTER TABLE pg_opclass ADD COLUMN opcfamily oid NULL;
ALTER TABLE pg_opclass ADD COLUMN opcmethod oid NULL;
ALTER TABLE pg_opclass DROP COLUMN opcamid;


ALTER TABLE pg_operator ADD COLUMN oprcanmerge bool NULL;
ALTER TABLE pg_operator DROP COLUMN oprgtcmpop;
ALTER TABLE pg_operator DROP COLUMN oprlsortop;
ALTER TABLE pg_operator DROP COLUMN oprltcmpop;
ALTER TABLE pg_operator DROP COLUMN oprrsortop;


ALTER TABLE pg_amproc ADD COLUMN amprocfamily oid NULL;
ALTER TABLE pg_amproc ADD COLUMN amproclefttype oid NULL;
ALTER TABLE pg_amproc ADD COLUMN amprocrighttype oid NULL;
ALTER TABLE pg_amproc DROP COLUMN amopclaid;
ALTER TABLE pg_amproc DROP COLUMN amprocsubtype;


ALTER TABLE pg_am ADD COLUMN amcanorder bool NULL;
ALTER TABLE pg_am ADD COLUMN amsearchnulls bool NULL;
ALTER TABLE pg_am DROP COLUMN amorderstrategy;


ALTER TABLE pg_pltemplate ADD COLUMN tmpldbacreate bool NULL;


ALTER TABLE pg_amop ADD COLUMN amopfamily oid NULL;
ALTER TABLE pg_amop ADD COLUMN amoplefttype oid NULL;
ALTER TABLE pg_amop ADD COLUMN amopmethod oid NULL;
ALTER TABLE pg_amop ADD COLUMN amoprighttype oid NULL;
ALTER TABLE pg_amop DROP COLUMN amopclaid;
ALTER TABLE pg_amop DROP COLUMN amopsubtype;


ALTER TABLE pg_trigger ADD COLUMN tgconstraint oid NULL;
ALTER TABLE pg_trigger ALTER COLUMN tgenabled SET TYPE char;


ALTER TABLE pg_constraint ADD COLUMN conffeqop oid[] NULL;
ALTER TABLE pg_constraint ADD COLUMN conpfeqop oid[] NULL;
ALTER TABLE pg_constraint ADD COLUMN conppeqop oid[] NULL;


ALTER TABLE pg_index ADD COLUMN indcheckxmin bool NULL;
ALTER TABLE pg_index ADD COLUMN indisready bool NULL;
ALTER TABLE pg_index ADD COLUMN indoption int2vector NULL;


ALTER TABLE pg_proc ADD COLUMN proconfig text[] NULL;
ALTER TABLE pg_proc ADD COLUMN procost float4 NULL;
ALTER TABLE pg_proc ADD COLUMN prorows float4 NULL;


ALTER TABLE pg_type ADD COLUMN typarray oid NULL;
ALTER TABLE pg_type ADD COLUMN typmodin regproc NULL;
ALTER TABLE pg_type ADD COLUMN typmodout regproc NULL;


ALTER TABLE pg_rewrite ADD COLUMN ev_enabled char NULL;


/*## view `pg_locks`
### Features
feat: add column `virtualtransaction text NULL`
feat: add column `virtualxid text NULL`
### Breaking changes
ALTER TABLE pg_locks DROP COLUMN transaction;

*/
