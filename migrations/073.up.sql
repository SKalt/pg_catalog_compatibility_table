DROP TABLE pg_relcheck;

CREATE TABLE pg_opclass (
  opcamid oid NULL
  , opcdefault bool NULL
  , opcintype oid NULL
  , opckeytype oid NULL
  , opcname name NULL
  , opcnamespace oid NULL
  , opcowner int4 NULL
);

CREATE TABLE pg_amproc (
  amopclaid oid NULL
  , amproc regproc NULL
  , amprocnum int2 NULL
);

CREATE TABLE pg_am (
  ambeginscan regproc NULL
  , ambuild regproc NULL
  , ambulkdelete regproc NULL
  , amcanmulticol bool NULL
  , amcanunique bool NULL
  , amconcurrent bool NULL
  , amcostestimate regproc NULL
  , amendscan regproc NULL
  , amgettuple regproc NULL
  , amindexnulls bool NULL
  , aminsert regproc NULL
  , ammarkpos regproc NULL
  , amname name NULL
  , amorderstrategy int2 NULL
  , amowner int4 NULL
  , amrescan regproc NULL
  , amrestrpos regproc NULL
  , amstrategies int2 NULL
  , amsupport int2 NULL
);

CREATE TABLE pg_depend (
  classid oid NULL
  , deptype char NULL
  , objid oid NULL
  , objsubid int4 NULL
  , refclassid oid NULL
  , refobjid oid NULL
  , refobjsubid int4 NULL
);

CREATE TABLE pg_cast (
  castcontext char NULL
  , castfunc oid NULL
  , castsource oid NULL
  , casttarget oid NULL
);

CREATE TABLE pg_amop (
  amopclaid oid NULL
  , amopopr oid NULL
  , amopreqcheck bool NULL
  , amopstrategy int2 NULL
);

CREATE TABLE pg_constraint (
  conbin text NULL
  , condeferrable bool NULL
  , condeferred bool NULL
  , confdeltype char NULL
  , confkey int2[] NULL
  , confmatchtype char NULL
  , confrelid oid NULL
  , confupdtype char NULL
  , conkey int2[] NULL
  , conname name NULL
  , connamespace oid NULL
  , conrelid oid NULL
  , consrc text NULL
  , contype char NULL
  , contypid oid NULL
);

CREATE TABLE pg_namespace (
  nspacl aclitem[] NULL
  , nspname name NULL
  , nspowner int4 NULL
);

CREATE TABLE pg_conversion (
  condefault bool NULL
  , conforencoding int4 NULL
  , conname name NULL
  , connamespace oid NULL
  , conowner int4 NULL
  , conproc regproc NULL
  , contoencoding int4 NULL
);

ALTER TABLE pg_attribute ADD COLUMN attinhcount int4 NULL;
ALTER TABLE pg_attribute ADD COLUMN attisdropped bool NULL;
ALTER TABLE pg_attribute ADD COLUMN attislocal bool NULL;

ALTER TABLE pg_language ADD COLUMN lanacl aclitem[] NULL;
ALTER TABLE pg_language ADD COLUMN lanvalidator oid NULL;

ALTER TABLE pg_language DROP COLUMN lancompiler;


ALTER TABLE pg_operator ADD COLUMN oprgtcmpop oid NULL;
ALTER TABLE pg_operator ADD COLUMN oprltcmpop oid NULL;
ALTER TABLE pg_operator ADD COLUMN oprnamespace oid NULL;

ALTER TABLE pg_operator DROP COLUMN oprisleft;
ALTER TABLE pg_operator DROP COLUMN oprprec;

ALTER TABLE pg_class ADD COLUMN relnamespace oid NULL;

ALTER TABLE pg_aggregate ADD COLUMN aggfnoid regproc NULL;

ALTER TABLE pg_aggregate ALTER COLUMN aggfinalfn SET TYPE regproc;
ALTER TABLE pg_aggregate ALTER COLUMN aggtransfn SET TYPE regproc;

ALTER TABLE pg_aggregate DROP COLUMN aggbasetype;
ALTER TABLE pg_aggregate DROP COLUMN aggfinaltype;
ALTER TABLE pg_aggregate DROP COLUMN aggname;
ALTER TABLE pg_aggregate DROP COLUMN aggowner;

ALTER TABLE pg_database ADD COLUMN datacl aclitem[] NULL;
ALTER TABLE pg_database ADD COLUMN datconfig text[] NULL;

ALTER TABLE pg_shadow ADD COLUMN useconfig text[] NULL;

ALTER TABLE pg_shadow DROP COLUMN usetrace;

ALTER TABLE pg_proc ADD COLUMN proacl aclitem[] NULL;
ALTER TABLE pg_proc ADD COLUMN proisagg bool NULL;
ALTER TABLE pg_proc ADD COLUMN pronamespace oid NULL;
ALTER TABLE pg_proc ADD COLUMN prosecdef bool NULL;
ALTER TABLE pg_proc ADD COLUMN provolatile char NULL;

ALTER TABLE pg_proc DROP COLUMN probyte_pct;
ALTER TABLE pg_proc DROP COLUMN proiscachable;
ALTER TABLE pg_proc DROP COLUMN proisinh;
ALTER TABLE pg_proc DROP COLUMN proistrusted;
ALTER TABLE pg_proc DROP COLUMN prooutin_ratio;
ALTER TABLE pg_proc DROP COLUMN properbyte_cpu;
ALTER TABLE pg_proc DROP COLUMN propercall_cpu;

ALTER TABLE pg_type ADD COLUMN typbasetype oid NULL;
ALTER TABLE pg_type ADD COLUMN typdefaultbin text NULL;
ALTER TABLE pg_type ADD COLUMN typnamespace oid NULL;
ALTER TABLE pg_type ADD COLUMN typndims int4 NULL;
ALTER TABLE pg_type ADD COLUMN typnotnull bool NULL;
ALTER TABLE pg_type ADD COLUMN typtypmod int4 NULL;

ALTER TABLE pg_type DROP COLUMN typprtlen;
ALTER TABLE pg_type DROP COLUMN typreceive;
ALTER TABLE pg_type DROP COLUMN typsend;
