
DROP TABLE pg_group;
DROP TABLE pg_shadow;


CREATE TABLE pg_auth_members (
  admin_option bool NULL
  , grantor oid NULL
  , member oid NULL
  , roleid oid NULL
);

CREATE TABLE pg_authid (
  rolcanlogin bool NULL
  , rolcatupdate bool NULL
  , rolconfig text[] NULL
  , rolconnlimit int4 NULL
  , rolcreatedb bool NULL
  , rolcreaterole bool NULL
  , rolinherit bool NULL
  , rolname name NULL
  , rolpassword text NULL
  , rolsuper bool NULL
  , rolvaliduntil timestamptz NULL
);

CREATE TABLE pg_pltemplate (
  tmplacl aclitem[] NULL
  , tmplhandler text NULL
  , tmpllibrary text NULL
  , tmplname name NULL
  , tmpltrusted bool NULL
  , tmplvalidator text NULL
);

CREATE TABLE pg_shdepend (
  classid oid NULL
  , dbid oid NULL
  , deptype char NULL
  , objid oid NULL
  , refclassid oid NULL
  , refobjid oid NULL
);

CREATE TABLE pg_autovacuum (
  anl_base_thresh int4 NULL
  , anl_scale_factor float4 NULL
  , enabled bool NULL
  , vac_base_thresh int4 NULL
  , vac_cost_delay int4 NULL
  , vac_cost_limit int4 NULL
  , vac_scale_factor float4 NULL
  , vacrelid oid NULL
);

CREATE VIEW pg_group AS (SELECT $$...$$);

CREATE VIEW pg_roles AS (SELECT $$...$$);

CREATE VIEW pg_shadow AS (SELECT $$...$$);

CREATE VIEW pg_prepared_xacts AS (SELECT $$...$$);

ALTER TABLE pg_opclass ALTER COLUMN opcowner SET TYPE oid;


ALTER TABLE pg_operator ALTER COLUMN oprowner SET TYPE oid;

ALTER TABLE pg_am ADD COLUMN amgetmulti regproc NULL;
ALTER TABLE pg_am ADD COLUMN amoptionalkey bool NULL;

ALTER TABLE pg_am DROP COLUMN amowner;


ALTER TABLE pg_class ALTER COLUMN relowner SET TYPE oid;


ALTER TABLE pg_namespace ALTER COLUMN nspowner SET TYPE oid;

ALTER TABLE pg_aggregate ADD COLUMN aggsortop oid NULL;

ALTER TABLE pg_database ADD COLUMN datconnlimit int4 NULL;
ALTER TABLE pg_database ALTER COLUMN datdba SET TYPE oid;


ALTER TABLE pg_conversion ALTER COLUMN conowner SET TYPE oid;

ALTER TABLE pg_proc ADD COLUMN proallargtypes oid[] NULL;
ALTER TABLE pg_proc ADD COLUMN proargmodes char[] NULL;
ALTER TABLE pg_proc ALTER COLUMN proowner SET TYPE oid;


ALTER TABLE pg_tablespace ALTER COLUMN spcowner SET TYPE oid;


ALTER TABLE pg_type ALTER COLUMN typowner SET TYPE oid;


/* view `pg_locks`
feat: add column `classid oid NULL`
feat: add column `locktype text NULL`
feat: add column `objid oid NULL`
feat: add column `objsubid int2 NULL`
feat: add column `page int4 NULL`
feat: add column `transactionid xid NULL`
feat: add column `tuple int2 NULL`
*/
