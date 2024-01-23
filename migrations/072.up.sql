CREATE TABLE pg_statistic (
  staattnum int2 NULL
  , stadistinct float4 NULL
  , stakindn int2 NULL
  , stanullfrac float4 NULL
  , stanumbersn float4[] NULL
  , staopn oid NULL
  , starelid oid NULL
  , stavaluesn text[] NULL
  , stawidth int4 NULL
);

CREATE TABLE pg_description (
  classoid oid NULL
  , description text NULL
  , objoid oid NULL
  , objsubid int4 NULL
);

CREATE TABLE pg_attribute (
  attalign char NULL
  , attbyval bool NULL
  , attcacheoff int4 NULL
  , atthasdef bool NULL
  , attisset bool NULL
  , attlen int2 NULL
  , attname name NULL
  , attndims int4 NULL
  , attnotnull bool NULL
  , attnum int2 NULL
  , attrelid oid NULL
  , attstattarget int4 NULL
  , attstorage char NULL
  , atttypid oid NULL
  , atttypmod int4 NULL
);

CREATE TABLE pg_language (
  lancompiler text NULL
  , lanispl bool NULL
  , lanname name NULL
  , lanplcallfoid oid NULL
  , lanpltrusted bool NULL
);

CREATE TABLE pg_group (
  grolist int4[] NULL
  , groname name NULL
  , grosysid int4 NULL
);

CREATE TABLE pg_operator (
  oprcanhash bool NULL
  , oprcode regproc NULL
  , oprcom oid NULL
  , oprisleft bool NULL
  , oprjoin regproc NULL
  , oprkind char NULL
  , oprleft oid NULL
  , oprlsortop oid NULL
  , oprname name NULL
  , oprnegate oid NULL
  , oprowner int4 NULL
  , oprprec int2 NULL
  , oprrest regproc NULL
  , oprresult oid NULL
  , oprright oid NULL
  , oprrsortop oid NULL
);

CREATE TABLE pg_class (
  relacl aclitem[] NULL
  , relam oid NULL
  , relchecks int2 NULL
  , relfilenode oid NULL
  , relfkeys int2 NULL
  , relhasindex bool NULL
  , relhasoids bool NULL
  , relhaspkey bool NULL
  , relhasrules bool NULL
  , relhassubclass bool NULL
  , relisshared bool NULL
  , relkind char NULL
  , relname name NULL
  , relnatts int2 NULL
  , relowner int4 NULL
  , relpages int4 NULL
  , relrefs int2 NULL
  , reltoastidxid oid NULL
  , reltoastrelid oid NULL
  , reltriggers int2 NULL
  , reltuples float4 NULL
  , reltype oid NULL
  , relukeys int2 NULL
);

CREATE TABLE pg_relcheck (
  rcbin text NULL
  , rcname name NULL
  , rcrelid oid NULL
  , rcsrc text NULL
);

CREATE TABLE pg_trigger (
  tgargs bytea NULL
  , tgattr int2vector NULL
  , tgconstrname name NULL
  , tgconstrrelid oid NULL
  , tgdeferrable bool NULL
  , tgenabled bool NULL
  , tgfoid oid NULL
  , tginitdeferred bool NULL
  , tgisconstraint bool NULL
  , tgname name NULL
  , tgnargs int2 NULL
  , tgrelid oid NULL
  , tgtype int2 NULL
);

CREATE TABLE pg_inherits (
  inhparent oid NULL
  , inhrelid oid NULL
  , inhseqno int4 NULL
);

CREATE TABLE pg_aggregate (
  aggbasetype oid NULL
  , aggfinalfn regproc (function) NULL
  , aggfinaltype oid NULL
  , agginitval text NULL
  , aggname name NULL
  , aggowner int4 NULL
  , aggtransfn regproc (function) NULL
  , aggtranstype oid NULL
);

CREATE TABLE pg_listener (
  listenerpid int4 NULL
  , notification int4 NULL
  , relname name NULL
);

CREATE TABLE pg_database (
  datallowconn bool NULL
  , datdba int4 NULL
  , datfrozenxid xid NULL
  , datistemplate bool NULL
  , datlastsysoid oid NULL
  , datname name NULL
  , datpath text NULL
  , datvacuumxid xid NULL
  , encoding int4 NULL
);

CREATE TABLE pg_shadow (
  passwd text NULL
  , usecatupd bool NULL
  , usecreatedb bool NULL
  , usename name NULL
  , usesuper bool NULL
  , usesysid int4 NULL
  , usetrace bool NULL
  , valuntil abstime NULL
);

CREATE TABLE pg_largeobject (
  data bytea NULL
  , loid oid NULL
  , pageno int4 NULL
);

CREATE TABLE pg_index (
  indclass oidvector NULL
  , indexrelid oid NULL
  , indisclustered bool NULL
  , indisprimary bool NULL
  , indisunique bool NULL
  , indkey int2vector NULL
  , indpred text NULL
  , indproc regproc NULL
  , indreference oid NULL
  , indrelid oid NULL
);

CREATE TABLE pg_attrdef (
  adbin text NULL
  , adnum int2 NULL
  , adrelid oid NULL
  , adsrc text NULL
);

CREATE TABLE pg_proc (
  proargtypes oidvector NULL
  , probin bytea NULL
  , probyte_pct int4 NULL
  , proiscachable bool NULL
  , proisinh bool NULL
  , proisstrict bool NULL
  , proistrusted bool NULL
  , prolang oid NULL
  , proname name NULL
  , pronargs int2 NULL
  , prooutin_ratio int4 NULL
  , proowner int4 NULL
  , properbyte_cpu int4 NULL
  , propercall_cpu int4 NULL
  , proretset bool NULL
  , prorettype oid NULL
  , prosrc text NULL
);

CREATE TABLE pg_type (
  typalign char NULL
  , typbyval bool NULL
  , typdefault text NULL
  , typdelim char NULL
  , typelem oid NULL
  , typinput regproc NULL
  , typisdefined bool NULL
  , typlen int2 NULL
  , typname name NULL
  , typoutput regproc NULL
  , typowner int4 NULL
  , typprtlen int2 NULL
  , typreceive regproc NULL
  , typrelid oid NULL
  , typsend regproc NULL
  , typstorage char NULL
  , typtype char NULL
);

CREATE TABLE pg_rewrite (
  ev_action text NULL
  , ev_attr int2 NULL
  , ev_class oid NULL
  , ev_qual text NULL
  , ev_type char NULL
  , is_instead bool NULL
  , rulename name NULL
);
