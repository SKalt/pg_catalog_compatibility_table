DROP TABLE pg_listener;

CREATE TABLE pg_largeobject_metadata (
  lomacl aclitem[] NULL
  , lomowner oid NULL
);

CREATE TABLE pg_default_acl (
  defaclacl aclitem[] NULL
  , defaclnamespace oid NULL
  , defaclobjtype char NULL
  , defaclrole oid NULL
);

CREATE TABLE pg_db_role_setting (
  setconfig text[] NULL
  , setdatabase oid NULL
  , setrole oid NULL
);


ALTER TABLE pg_statistic ADD COLUMN stainherit bool NULL;


ALTER TABLE pg_attribute ADD COLUMN attoptions text[] NULL;


ALTER TABLE pg_language ADD COLUMN laninline oid NULL;


ALTER TABLE pg_authid DROP COLUMN rolconfig;


ALTER TABLE pg_class ADD COLUMN relhasexclusion bool NULL;
ALTER TABLE pg_class ADD COLUMN reloftype oid NULL;


ALTER TABLE pg_pltemplate ADD COLUMN tmplinline text NULL;


ALTER TABLE pg_trigger ADD COLUMN tgconstrindid oid NULL;
ALTER TABLE pg_trigger ADD COLUMN tgisinternal bool NULL;
ALTER TABLE pg_trigger ADD COLUMN tgqual text NULL;
ALTER TABLE pg_trigger DROP COLUMN tgconstrname;
ALTER TABLE pg_trigger DROP COLUMN tgisconstraint;


ALTER TABLE pg_constraint ADD COLUMN conexclop oid[] NULL;
ALTER TABLE pg_constraint ADD COLUMN conindid oid NULL;


ALTER TABLE pg_database DROP COLUMN datconfig;


ALTER TABLE pg_index ADD COLUMN indimmediate bool NULL;

ALTER TABLE pg_proc ALTER COLUMN probin SET TYPE text;


ALTER TABLE pg_tablespace ADD COLUMN spcoptions text[] NULL;

/*
## view `pg_stats`
feat: add column `inherited bool NULL`
*/
