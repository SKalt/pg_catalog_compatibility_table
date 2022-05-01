```mermaid
erDiagram
    pg_aggregate {
    aggcombinefn regproc
    aggdeserialfn regproc
    aggfinalextra bool
    aggfinalfn regproc
    aggfinalmodify char
    aggfnoid regproc
    agginitval text
    aggkind char
    aggmfinalextra bool
    aggmfinalfn regproc
    aggmfinalmodify char
    aggminitval text
    aggminvtransfn regproc
    aggmtransfn regproc
    aggmtransspace int4
    aggmtranstype oid
    aggnumdirectargs int2
    aggserialfn regproc
    aggsortop oid
    aggtransfn regproc
    aggtransspace int4
    aggtranstype oid
  }
  pg_am {
    amhandler regproc
    amname name
    amtype char
    oid oid
  }
  pg_amop {
    amopfamily oid
    amoplefttype oid
    amopmethod oid
    amopopr oid
    amoppurpose char
    amoprighttype oid
    amopsortfamily oid
    amopstrategy int2
    oid oid
  }
  pg_amproc {
    amproc regproc
    amprocfamily oid
    amproclefttype oid
    amprocnum int2
    amprocrighttype oid
    oid oid
  }
  pg_attrdef {
    adbin pg_node_tree
    adnum int2
    adrelid oid
    oid oid
  }
  pg_attribute {
    attacl aclitemSlice
    attalign char
    attbyval bool
    attcacheoff int4
    attcollation oid
    attcompression char
    attfdwoptions textSlice
    attgenerated char
    atthasdef bool
    atthasmissing bool
    attidentity char
    attinhcount int4
    attisdropped bool
    attislocal bool
    attlen int2
    attmissingval anyarray
    attname name
    attndims int4
    attnotnull bool
    attnum int2
    attoptions textSlice
    attrelid oid
    attstattarget int4
    attstorage char
    atttypid oid
    atttypmod int4
  }
  pg_auth_members {
    admin_option bool
    grantor oid
    member oid
    roleid oid
  }
  pg_authid {
    oid oid
    rolbypassrls bool
    rolcanlogin bool
    rolconnlimit int4
    rolcreatedb bool
    rolcreaterole bool
    rolinherit bool
    rolname name
    rolpassword text
    rolreplication bool
    rolsuper bool
    rolvaliduntil timestamptz
  }
  pg_available_extension_versions {
    comment text
    installed bool
    name name
    relocatable bool
    requires nameSlice
    schema name
    superuser bool
    trusted bool
    version text
  }
  pg_available_extensions {
    comment text
    default_version text
    installed_version text
    name name
  }
  pg_backend_memory_contexts {
    free_bytes int8
    free_chunks int8
    ident text
    level int4
    name text
    parent text
    total_bytes int8
    total_nblocks int8
    used_bytes int8
  }
  pg_cast {
    castcontext char
    castfunc oid
    castmethod char
    castsource oid
    casttarget oid
    oid oid
  }
  pg_class {
    oid oid
    relacl aclitemSlice
    relallvisible int4
    relam oid
    relchecks int2
    relfilenode oid
    relforcerowsecurity bool
    relfrozenxid xid
    relhasindex bool
    relhasrules bool
    relhassubclass bool
    relhastriggers bool
    relispartition bool
    relispopulated bool
    relisshared bool
    relkind char
    relminmxid xid
    relname name
    relnamespace oid
    relnatts int2
    reloftype oid
    reloptions textSlice
    relowner oid
    relpages int4
    relpartbound pg_node_tree
    relpersistence char
    relreplident char
    relrewrite oid
    relrowsecurity bool
    reltablespace oid
    reltoastrelid oid
    reltuples float4
    reltype oid
  }
  pg_collation {
    collcollate name
    collctype name
    collencoding int4
    collisdeterministic bool
    collname name
    collnamespace oid
    collowner oid
    collprovider char
    collversion text
    oid oid
  }
  pg_config {
    name text
    setting text
  }
  pg_constraint {
    conbin pg_node_tree
    condeferrable bool
    condeferred bool
    conexclop oidSlice
    confdeltype char
    conffeqop oidSlice
    confkey int2Slice
    confmatchtype char
    confrelid oid
    confupdtype char
    conindid oid
    coninhcount int4
    conislocal bool
    conkey int2Slice
    conname name
    connamespace oid
    connoinherit bool
    conparentid oid
    conpfeqop oidSlice
    conppeqop oidSlice
    conrelid oid
    contype char
    contypid oid
    convalidated bool
    oid oid
  }
  pg_conversion {
    condefault bool
    conforencoding int4
    conname name
    connamespace oid
    conowner oid
    conproc regproc
    contoencoding int4
    oid oid
  }
  pg_cursors {
    creation_time timestamptz
    is_binary bool
    is_holdable bool
    is_scrollable bool
    name text
    statement text
  }
  pg_database {
    datacl aclitemSlice
    datallowconn bool
    datcollate name
    datconnlimit int4
    datctype name
    datdba oid
    datfrozenxid xid
    datistemplate bool
    datlastsysoid oid
    datminmxid xid
    datname name
    dattablespace oid
    encoding int4
    oid oid
  }
  pg_db_role_setting {
    setconfig textSlice
    setdatabase oid
    setrole oid
  }
  pg_default_acl {
    defaclacl aclitemSlice
    defaclnamespace oid
    defaclobjtype char
    defaclrole oid
    oid oid
  }
  pg_depend {
    classid oid
    deptype char
    objid oid
    objsubid int4
    refclassid oid
    refobjid oid
    refobjsubid int4
  }
  pg_description {
    classoid oid
    description text
    objoid oid
    objsubid int4
  }
  pg_enum {
    enumlabel name
    enumsortorder float4
    enumtypid oid
    oid oid
  }
  pg_event_trigger {
    evtenabled char
    evtevent name
    evtfoid oid
    evtname name
    evtowner oid
    evttags textSlice
    oid oid
  }
  pg_extension {
    extcondition textSlice
    extconfig oidSlice
    extname name
    extnamespace oid
    extowner oid
    extrelocatable bool
    extversion text
    oid oid
  }
  pg_file_settings {
    applied bool
    error text
    name text
    seqno int4
    setting text
    sourcefile text
    sourceline int4
  }
  pg_foreign_data_wrapper {
    fdwacl aclitemSlice
    fdwhandler oid
    fdwname name
    fdwoptions textSlice
    fdwowner oid
    fdwvalidator oid
    oid oid
  }
  pg_foreign_server {
    oid oid
    srvacl aclitemSlice
    srvfdw oid
    srvname name
    srvoptions textSlice
    srvowner oid
    srvtype text
    srvversion text
  }
  pg_foreign_table {
    ftoptions textSlice
    ftrelid oid
    ftserver oid
  }
  pg_group {
    grolist oidSlice
    groname name
    grosysid oid
  }
  pg_hba_file_rules {
    address text
    auth_method text
    database textSlice
    error text
    line_number int4
    netmask text
    options textSlice
    type text
    user_name textSlice
  }
  pg_index {
    indcheckxmin bool
    indclass oidvector
    indcollation oidvector
    indexprs pg_node_tree
    indexrelid oid
    indimmediate bool
    indisclustered bool
    indisexclusion bool
    indislive bool
    indisprimary bool
    indisready bool
    indisreplident bool
    indisunique bool
    indisvalid bool
    indkey int2vector
    indnatts int2
    indnkeyatts int2
    indoption int2vector
    indpred pg_node_tree
    indrelid oid
  }
  pg_indexes {
    indexdef text
    indexname name
    schemaname name
    tablename name
    tablespace name
  }
  pg_inherits {
    inhdetachpending bool
    inhparent oid
    inhrelid oid
    inhseqno int4
  }
  pg_init_privs {
    classoid oid
    initprivs aclitemSlice
    objoid oid
    objsubid int4
    privtype char
  }
  pg_language {
    lanacl aclitemSlice
    laninline oid
    lanispl bool
    lanname name
    lanowner oid
    lanplcallfoid oid
    lanpltrusted bool
    lanvalidator oid
    oid oid
  }
  pg_largeobject {
    data bytea
    loid oid
    pageno int4
  }
  pg_largeobject_metadata {
    lomacl aclitemSlice
    lomowner oid
    oid oid
  }
  pg_locks {
    classid oid
    database oid
    fastpath bool
    granted bool
    locktype text
    mode text
    objid oid
    objsubid int2
    page int4
    pid int4
    relation oid
    transactionid xid
    tuple int2
    virtualtransaction text
    virtualxid text
    waitstart timestamptz
  }
  pg_namespace {
    nspacl aclitemSlice
    nspname name
    nspowner oid
    oid oid
  }
  pg_opclass {
    oid oid
    opcdefault bool
    opcfamily oid
    opcintype oid
    opckeytype oid
    opcmethod oid
    opcname name
    opcnamespace oid
    opcowner oid
  }
  pg_operator {
    oid oid
    oprcanhash bool
    oprcanmerge bool
    oprcode regproc
    oprcom oid
    oprjoin regproc
    oprkind char
    oprleft oid
    oprname name
    oprnamespace oid
    oprnegate oid
    oprowner oid
    oprrest regproc
    oprresult oid
    oprright oid
  }
  pg_opfamily {
    oid oid
    opfmethod oid
    opfname name
    opfnamespace oid
    opfowner oid
  }
  pg_partitioned_table {
    partattrs int2vector
    partclass oidvector
    partcollation oidvector
    partdefid oid
    partexprs pg_node_tree
    partnatts int2
    partrelid oid
    partstrat char
  }
  pg_policies {
    cmd text
    permissive text
    policyname name
    qual text
    roles nameSlice
    schemaname name
    tablename name
    with_check text
  }
  pg_policy {
    oid oid
    polcmd char
    polname name
    polpermissive bool
    polqual pg_node_tree
    polrelid oid
    polroles oidSlice
    polwithcheck pg_node_tree
  }
  pg_prepared_statements {
    custom_plans int8
    from_sql bool
    generic_plans int8
    name text
    parameter_types regtypeSlice
    prepare_time timestamptz
    statement text
  }
  pg_prepared_xacts {
    database name
    gid text
    owner name
    prepared timestamptz
    transaction xid
  }
  pg_proc {
    oid oid
    proacl aclitemSlice
    proallargtypes oidSlice
    proargdefaults pg_node_tree
    proargmodes charSlice
    proargnames textSlice
    proargtypes oidvector
    probin text
    proconfig textSlice
    procost float4
    proisstrict bool
    prokind char
    prolang oid
    proleakproof bool
    proname name
    pronamespace oid
    pronargdefaults int2
    pronargs int2
    proowner oid
    proparallel char
    proretset bool
    prorettype oid
    prorows float4
    prosecdef bool
    prosqlbody pg_node_tree
    prosrc text
    prosupport regproc
    protrftypes oidSlice
    provariadic oid
    provolatile char
  }
  pg_publication {
    oid oid
    puballtables bool
    pubdelete bool
    pubinsert bool
    pubname name
    pubowner oid
    pubtruncate bool
    pubupdate bool
    pubviaroot bool
  }
  pg_publication_rel {
    oid oid
    prpubid oid
    prrelid oid
  }
  pg_publication_tables {
    pubname name
    schemaname name
    tablename name
  }
  pg_range {
    rngcanonical regproc
    rngcollation oid
    rngmultitypid oid
    rngsubdiff regproc
    rngsubopc oid
    rngsubtype oid
    rngtypid oid
  }
  pg_replication_origin {
    roident oid
    roname text
  }
  pg_replication_origin_status {
    external_id text
    local_id oid
    local_lsn pg_lsn
    remote_lsn pg_lsn
  }
  pg_replication_slots {
    active bool
    active_pid int4
    catalog_xmin xid
    confirmed_flush_lsn pg_lsn
    database name
    datoid oid
    plugin name
    restart_lsn pg_lsn
    safe_wal_size int8
    slot_name name
    slot_type text
    temporary bool
    two_phase bool
    wal_status text
    xmin xid
  }
  pg_rewrite {
    ev_action pg_node_tree
    ev_class oid
    ev_enabled char
    ev_qual pg_node_tree
    ev_type char
    is_instead bool
    oid oid
    rulename name
  }
  pg_roles {
    oid oid
    rolbypassrls bool
    rolcanlogin bool
    rolconfig textSlice
    rolconnlimit int4
    rolcreatedb bool
    rolcreaterole bool
    rolinherit bool
    rolname name
    rolpassword text
    rolreplication bool
    rolsuper bool
    rolvaliduntil timestamptz
  }
  pg_rules {
    definition text
    rulename name
    schemaname name
    tablename name
  }
  pg_seclabel {
    classoid oid
    label text
    objoid oid
    objsubid int4
    provider text
  }
  pg_seclabels {
    classoid oid
    label text
    objname text
    objnamespace oid
    objoid oid
    objsubid int4
    objtype text
    provider text
  }
  pg_sequence {
    seqcache int8
    seqcycle bool
    seqincrement int8
    seqmax int8
    seqmin int8
    seqrelid oid
    seqstart int8
    seqtypid oid
  }
  pg_sequences {
    cache_size int8
    cycle bool
    data_type regtype
    increment_by int8
    last_value int8
    max_value int8
    min_value int8
    schemaname name
    sequencename name
    sequenceowner name
    start_value int8
  }
  pg_settings {
    boot_val text
    category text
    context text
    enumvals textSlice
    extra_desc text
    max_val text
    min_val text
    name text
    pending_restart bool
    reset_val text
    setting text
    short_desc text
    source text
    sourcefile text
    sourceline int4
    unit text
    vartype text
  }
  pg_shadow {
    passwd text
    usebypassrls bool
    useconfig textSlice
    usecreatedb bool
    usename name
    userepl bool
    usesuper bool
    usesysid oid
    valuntil timestamptz
  }
  pg_shdepend {
    classid oid
    dbid oid
    deptype char
    objid oid
    objsubid int4
    refclassid oid
    refobjid oid
  }
  pg_shdescription {
    classoid oid
    description text
    objoid oid
  }
  pg_shmem_allocations {
    allocated_size int8
    name text
    off int8
    size int8
  }
  pg_shseclabel {
    classoid oid
    label text
    objoid oid
    provider text
  }
  pg_statistic {
    staattnum int2
    stacollN oid
    stadistinct float4
    stainherit bool
    stakindN int2
    stanullfrac float4
    stanumbersN float4Slice
    staopN oid
    starelid oid
    stavaluesN anyarray
    stawidth int4
  }
  pg_statistic_ext {
    oid oid
    stxexprs pg_node_tree
    stxkeys int2vector
    stxkind charSlice
    stxname name
    stxnamespace oid
    stxowner oid
    stxrelid oid
    stxstattarget int4
  }
  pg_statistic_ext_data {
    stxddependencies pg_dependencies
    stxdexpr pg_statisticSlice
    stxdmcv pg_mcv_list
    stxdndistinct pg_ndistinct
    stxoid oid
  }
  pg_stats {
    attname name
    avg_width int4
    correlation float4
    elem_count_histogram float4Slice
    histogram_bounds anyarray
    inherited bool
    most_common_elem_freqs float4Slice
    most_common_elems anyarray
    most_common_freqs float4Slice
    most_common_vals anyarray
    n_distinct float4
    null_frac float4
    schemaname name
    tablename name
  }
  pg_stats_ext {
    attnames nameSlice
    dependencies pg_dependencies
    exprs textSlice
    kinds charSlice
    most_common_base_freqs float8Slice
    most_common_freqs float8Slice
    most_common_val_nulls boolSlice
    most_common_vals textSlice
    n_distinct pg_ndistinct
    schemaname name
    statistics_name name
    statistics_owner name
    statistics_schemaname name
    tablename name
  }
  pg_stats_ext_exprs {
    avg_width int4
    correlation float4
    elem_count_histogram float4Slice
    expr text
    histogram_bounds anyarray
    most_common_elem_freqs float4Slice
    most_common_elems anyarray
    most_common_freqs float4Slice
    most_common_vals anyarray
    n_distinct float4
    null_frac float4
    schemaname name
    statistics_name name
    statistics_owner name
    statistics_schemaname name
    tablename name
  }
  pg_subscription {
    oid oid
    subbinary bool
    subconninfo text
    subdbid oid
    subenabled bool
    subname name
    subowner oid
    subpublications textSlice
    subslotname name
    substream bool
    subsynccommit text
  }
  pg_subscription_rel {
    srrelid oid
    srsubid oid
    srsublsn pg_lsn
    srsubstate char
  }
  pg_tables {
    hasindexes bool
    hasrules bool
    hastriggers bool
    rowsecurity bool
    schemaname name
    tablename name
    tableowner name
    tablespace name
  }
  pg_tablespace {
    oid oid
    spcacl aclitemSlice
    spcname name
    spcoptions textSlice
    spcowner oid
  }
  pg_timezone_abbrevs {
    abbrev text
    is_dst bool
    utc_offset interval
  }
  pg_timezone_names {
    abbrev text
    is_dst bool
    name text
    utc_offset interval
  }
  pg_transform {
    oid oid
    trffromsql regproc
    trflang oid
    trftosql regproc
    trftype oid
  }
  pg_trigger {
    oid oid
    tgargs bytea
    tgattr int2vector
    tgconstraint oid
    tgconstrindid oid
    tgconstrrelid oid
    tgdeferrable bool
    tgenabled char
    tgfoid oid
    tginitdeferred bool
    tgisinternal bool
    tgname name
    tgnargs int2
    tgnewtable name
    tgoldtable name
    tgparentid oid
    tgqual pg_node_tree
    tgrelid oid
    tgtype int2
  }
  pg_ts_config {
    cfgname name
    cfgnamespace oid
    cfgowner oid
    cfgparser oid
    oid oid
  }
  pg_ts_config_map {
    mapcfg oid
    mapdict oid
    mapseqno int4
    maptokentype int4
  }
  pg_ts_dict {
    dictinitoption text
    dictname name
    dictnamespace oid
    dictowner oid
    dicttemplate oid
    oid oid
  }
  pg_ts_parser {
    oid oid
    prsend regproc
    prsheadline regproc
    prslextype regproc
    prsname name
    prsnamespace oid
    prsstart regproc
    prstoken regproc
  }
  pg_ts_template {
    oid oid
    tmplinit regproc
    tmpllexize regproc
    tmplname name
    tmplnamespace oid
  }
  pg_type {
    oid oid
    typacl aclitemSlice
    typalign char
    typanalyze regproc
    typarray oid
    typbasetype oid
    typbyval bool
    typcategory char
    typcollation oid
    typdefault text
    typdefaultbin pg_node_tree
    typdelim char
    typelem oid
    typinput regproc
    typisdefined bool
    typispreferred bool
    typlen int2
    typmodin regproc
    typmodout regproc
    typname name
    typnamespace oid
    typndims int4
    typnotnull bool
    typoutput regproc
    typowner oid
    typreceive regproc
    typrelid oid
    typsend regproc
    typstorage char
    typsubscript regproc
    typtype char
    typtypmod int4
  }
  pg_user {
    passwd text
    usebypassrls bool
    useconfig textSlice
    usecreatedb bool
    usename name
    userepl bool
    usesuper bool
    usesysid oid
    valuntil timestamptz
  }
  pg_user_mapping {
    oid oid
    umoptions textSlice
    umserver oid
    umuser oid
  }
  pg_user_mappings {
    srvid oid
    srvname name
    umid oid
    umoptions textSlice
    umuser oid
    usename name
  }


  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_type : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_operator : oid
  pg_aggregate ||--|{ pg_proc : oid
  pg_aggregate ||--|{ pg_type : oid
  pg_am ||--|{ pg_proc : oid
  pg_amop ||--|{ pg_opfamily : oid
  pg_amop ||--|{ pg_type : oid
  pg_amop ||--|{ pg_am : oid
  pg_amop ||--|{ pg_operator : oid
  pg_amop ||--|{ pg_type : oid
  pg_amop ||--|{ pg_opfamily : oid
  pg_amproc ||--|{ pg_proc : oid
  pg_amproc ||--|{ pg_opfamily : oid
  pg_amproc ||--|{ pg_type : oid
  pg_amproc ||--|{ pg_type : oid
  pg_attrdef ||--|{ pg_attribute : attnum
  pg_attrdef ||--|{ pg_class : oid
  pg_attribute ||--|{ pg_collation : oid
  pg_attribute ||--|{ pg_class : oid
  pg_attribute ||--|{ pg_type : oid
  pg_auth_members ||--|{ pg_authid : oid
  pg_auth_members ||--|{ pg_authid : oid
  pg_auth_members ||--|{ pg_authid : oid
  pg_cast ||--|{ pg_proc : oid
  pg_cast ||--|{ pg_type : oid
  pg_cast ||--|{ pg_type : oid
  pg_class ||--|{ pg_am : oid
  pg_class ||--|{ pg_namespace : oid
  pg_class ||--|{ pg_type : oid
  pg_class ||--|{ pg_authid : oid
  pg_class ||--|{ pg_class : oid
  pg_class ||--|{ pg_tablespace : oid
  pg_class ||--|{ pg_class : oid
  pg_class ||--|{ pg_type : oid
  pg_collation ||--|{ pg_namespace : oid
  pg_collation ||--|{ pg_authid : oid
  pg_constraint ||--|{ pg_operator : oid
  pg_constraint ||--|{ pg_operator : oid
  pg_constraint ||--|{ pg_attribute : attnum
  pg_constraint ||--|{ pg_class : oid
  pg_constraint ||--|{ pg_class : oid
  pg_constraint ||--|{ pg_attribute : attnum
  pg_constraint ||--|{ pg_namespace : oid
  pg_constraint ||--|{ pg_constraint : oid
  pg_constraint ||--|{ pg_operator : oid
  pg_constraint ||--|{ pg_operator : oid
  pg_constraint ||--|{ pg_class : oid
  pg_constraint ||--|{ pg_type : oid
  pg_conversion ||--|{ pg_namespace : oid
  pg_conversion ||--|{ pg_authid : oid
  pg_conversion ||--|{ pg_proc : oid
  pg_database ||--|{ pg_authid : oid
  pg_database ||--|{ pg_tablespace : oid
  pg_db_role_setting ||--|{ pg_database : oid
  pg_db_role_setting ||--|{ pg_authid : oid
  pg_default_acl ||--|{ pg_namespace : oid
  pg_default_acl ||--|{ pg_authid : oid
  pg_depend ||--|{ pg_class : oid
  pg_depend ||--|{ pg_class : oid
  pg_description ||--|{ pg_class : oid
  pg_enum ||--|{ pg_type : oid
  pg_event_trigger ||--|{ pg_proc : oid
  pg_event_trigger ||--|{ pg_authid : oid
  pg_extension ||--|{ pg_class : oid
  pg_extension ||--|{ pg_namespace : oid
  pg_extension ||--|{ pg_authid : oid
  pg_foreign_data_wrapper ||--|{ pg_proc : oid
  pg_foreign_data_wrapper ||--|{ pg_authid : oid
  pg_foreign_data_wrapper ||--|{ pg_proc : oid
  pg_foreign_server ||--|{ pg_foreign_data_wrapper : oid
  pg_foreign_server ||--|{ pg_authid : oid
  pg_foreign_table ||--|{ pg_class : oid
  pg_foreign_table ||--|{ pg_foreign_server : oid
  pg_group ||--|{ pg_authid : oid
  pg_group ||--|{ pg_authid : rolname
  pg_group ||--|{ pg_authid : oid
  pg_index ||--|{ pg_opclass : oid
  pg_index ||--|{ pg_collation : oid
  pg_index ||--|{ pg_class : oid
  pg_index ||--|{ pg_attribute : attnum
  pg_index ||--|{ pg_class : oid
  pg_indexes ||--|{ pg_class : relname
  pg_indexes ||--|{ pg_namespace : nspname
  pg_indexes ||--|{ pg_class : relname
  pg_indexes ||--|{ pg_tablespace : spcname
  pg_inherits ||--|{ pg_class : oid
  pg_inherits ||--|{ pg_class : oid
  pg_init_privs ||--|{ pg_class : oid
  pg_language ||--|{ pg_proc : oid
  pg_language ||--|{ pg_authid : oid
  pg_language ||--|{ pg_proc : oid
  pg_language ||--|{ pg_proc : oid
  pg_largeobject ||--|{ pg_largeobject_metadata : oid
  pg_largeobject_metadata ||--|{ pg_authid : oid
  pg_locks ||--|{ pg_class : oid
  pg_locks ||--|{ pg_database : oid
  pg_locks ||--|{ pg_class : oid
  pg_namespace ||--|{ pg_authid : oid
  pg_opclass ||--|{ pg_opfamily : oid
  pg_opclass ||--|{ pg_type : oid
  pg_opclass ||--|{ pg_type : oid
  pg_opclass ||--|{ pg_am : oid
  pg_opclass ||--|{ pg_namespace : oid
  pg_opclass ||--|{ pg_authid : oid
  pg_operator ||--|{ pg_proc : oid
  pg_operator ||--|{ pg_operator : oid
  pg_operator ||--|{ pg_proc : oid
  pg_operator ||--|{ pg_type : oid
  pg_operator ||--|{ pg_namespace : oid
  pg_operator ||--|{ pg_operator : oid
  pg_operator ||--|{ pg_authid : oid
  pg_operator ||--|{ pg_proc : oid
  pg_operator ||--|{ pg_type : oid
  pg_operator ||--|{ pg_type : oid
  pg_opfamily ||--|{ pg_am : oid
  pg_opfamily ||--|{ pg_namespace : oid
  pg_opfamily ||--|{ pg_authid : oid
  pg_partitioned_table ||--|{ pg_attribute : attnum
  pg_partitioned_table ||--|{ pg_opclass : oid
  pg_partitioned_table ||--|{ pg_collation : oid
  pg_partitioned_table ||--|{ pg_class : oid
  pg_partitioned_table ||--|{ pg_class : oid
  pg_policies ||--|{ pg_policy : polname
  pg_policies ||--|{ pg_namespace : nspname
  pg_policies ||--|{ pg_class : relname
  pg_policy ||--|{ pg_class : oid
  pg_policy ||--|{ pg_authid : oid
  pg_prepared_xacts ||--|{ pg_database : datname
  pg_prepared_xacts ||--|{ pg_authid : rolname
  pg_proc ||--|{ pg_type : oid
  pg_proc ||--|{ pg_type : oid
  pg_proc ||--|{ pg_language : oid
  pg_proc ||--|{ pg_namespace : oid
  pg_proc ||--|{ pg_authid : oid
  pg_proc ||--|{ pg_type : oid
  pg_proc ||--|{ pg_proc : oid
  pg_proc ||--|{ pg_type : oid
  pg_proc ||--|{ pg_type : oid
  pg_publication ||--|{ pg_authid : oid
  pg_publication_rel ||--|{ pg_publication : oid
  pg_publication_rel ||--|{ pg_class : oid
  pg_publication_tables ||--|{ pg_publication : pubname
  pg_publication_tables ||--|{ pg_namespace : nspname
  pg_publication_tables ||--|{ pg_class : relname
  pg_range ||--|{ pg_proc : oid
  pg_range ||--|{ pg_collation : oid
  pg_range ||--|{ pg_type : oid
  pg_range ||--|{ pg_proc : oid
  pg_range ||--|{ pg_opclass : oid
  pg_range ||--|{ pg_type : oid
  pg_range ||--|{ pg_type : oid
  pg_replication_origin_status ||--|{ pg_replication_origin : roname
  pg_replication_origin_status ||--|{ pg_replication_origin : roident
  pg_replication_slots ||--|{ pg_database : datname
  pg_replication_slots ||--|{ pg_database : oid
  pg_rewrite ||--|{ pg_class : oid
  pg_roles ||--|{ pg_authid : oid
  pg_rules ||--|{ pg_rewrite : rulename
  pg_rules ||--|{ pg_namespace : nspname
  pg_rules ||--|{ pg_class : relname
  pg_seclabel ||--|{ pg_class : oid
  pg_seclabels ||--|{ pg_class : oid
  pg_seclabels ||--|{ pg_seclabel : label
  pg_seclabels ||--|{ pg_namespace : oid
  pg_seclabels ||--|{ pg_seclabel : provider
  pg_sequence ||--|{ pg_class : oid
  pg_sequence ||--|{ pg_type : oid
  pg_sequences ||--|{ pg_type : oid
  pg_sequences ||--|{ pg_namespace : nspname
  pg_sequences ||--|{ pg_class : relname
  pg_sequences ||--|{ pg_authid : rolname
  pg_shadow ||--|{ pg_authid : rolname
  pg_shadow ||--|{ pg_authid : oid
  pg_shdepend ||--|{ pg_class : oid
  pg_shdepend ||--|{ pg_database : oid
  pg_shdepend ||--|{ pg_class : oid
  pg_shdescription ||--|{ pg_class : oid
  pg_shseclabel ||--|{ pg_class : oid
  pg_statistic ||--|{ pg_attribute : attnum
  pg_statistic ||--|{ pg_collation : oid
  pg_statistic ||--|{ pg_operator : oid
  pg_statistic ||--|{ pg_class : oid
  pg_statistic_ext ||--|{ pg_attribute : attnum
  pg_statistic_ext ||--|{ pg_namespace : oid
  pg_statistic_ext ||--|{ pg_authid : oid
  pg_statistic_ext ||--|{ pg_class : oid
  pg_statistic_ext_data ||--|{ pg_statistic_ext : oid
  pg_stats ||--|{ pg_attribute : attname
  pg_stats ||--|{ pg_namespace : nspname
  pg_stats ||--|{ pg_class : relname
  pg_stats_ext ||--|{ pg_attribute : attname
  pg_stats_ext ||--|{ pg_namespace : nspname
  pg_stats_ext ||--|{ pg_statistic_ext : stxname
  pg_stats_ext ||--|{ pg_authid : rolname
  pg_stats_ext ||--|{ pg_namespace : nspname
  pg_stats_ext ||--|{ pg_class : relname
  pg_stats_ext_exprs ||--|{ pg_namespace : nspname
  pg_stats_ext_exprs ||--|{ pg_statistic_ext : stxname
  pg_stats_ext_exprs ||--|{ pg_authid : rolname
  pg_stats_ext_exprs ||--|{ pg_namespace : nspname
  pg_stats_ext_exprs ||--|{ pg_class : relname
  pg_subscription ||--|{ pg_database : oid
  pg_subscription ||--|{ pg_authid : oid
  pg_subscription_rel ||--|{ pg_class : oid
  pg_subscription_rel ||--|{ pg_subscription : oid
  pg_tables ||--|{ pg_class : relhasindex
  pg_tables ||--|{ pg_class : relhasrules
  pg_tables ||--|{ pg_class : relhastriggers
  pg_tables ||--|{ pg_class : relrowsecurity
  pg_tables ||--|{ pg_namespace : nspname
  pg_tables ||--|{ pg_class : relname
  pg_tables ||--|{ pg_authid : rolname
  pg_tables ||--|{ pg_tablespace : spcname
  pg_tablespace ||--|{ pg_authid : oid
  pg_transform ||--|{ pg_proc : oid
  pg_transform ||--|{ pg_language : oid
  pg_transform ||--|{ pg_proc : oid
  pg_transform ||--|{ pg_type : oid
  pg_trigger ||--|{ pg_attribute : attnum
  pg_trigger ||--|{ pg_constraint : oid
  pg_trigger ||--|{ pg_class : oid
  pg_trigger ||--|{ pg_class : oid
  pg_trigger ||--|{ pg_proc : oid
  pg_trigger ||--|{ pg_trigger : oid
  pg_trigger ||--|{ pg_class : oid
  pg_ts_config ||--|{ pg_namespace : oid
  pg_ts_config ||--|{ pg_authid : oid
  pg_ts_config ||--|{ pg_ts_parser : oid
  pg_ts_config_map ||--|{ pg_ts_config : oid
  pg_ts_config_map ||--|{ pg_ts_dict : oid
  pg_ts_dict ||--|{ pg_namespace : oid
  pg_ts_dict ||--|{ pg_authid : oid
  pg_ts_dict ||--|{ pg_ts_template : oid
  pg_ts_parser ||--|{ pg_proc : oid
  pg_ts_parser ||--|{ pg_proc : oid
  pg_ts_parser ||--|{ pg_proc : oid
  pg_ts_parser ||--|{ pg_namespace : oid
  pg_ts_parser ||--|{ pg_proc : oid
  pg_ts_parser ||--|{ pg_proc : oid
  pg_ts_template ||--|{ pg_proc : oid
  pg_ts_template ||--|{ pg_proc : oid
  pg_ts_template ||--|{ pg_namespace : oid
  pg_type ||--|{ pg_proc : oid
  pg_type ||--|{ pg_type : oid
  pg_type ||--|{ pg_type : oid
  pg_type ||--|{ pg_collation : oid
  pg_type ||--|{ pg_type : oid
  pg_type ||--|{ pg_proc : oid
  pg_type ||--|{ pg_proc : oid
  pg_type ||--|{ pg_proc : oid
  pg_type ||--|{ pg_namespace : oid
  pg_type ||--|{ pg_proc : oid
  pg_type ||--|{ pg_authid : oid
  pg_type ||--|{ pg_proc : oid
  pg_type ||--|{ pg_class : oid
  pg_type ||--|{ pg_proc : oid
  pg_type ||--|{ pg_proc : oid
  pg_user_mapping ||--|{ pg_foreign_server : oid
  pg_user_mapping ||--|{ pg_authid : oid
  pg_user_mappings ||--|{ pg_foreign_server : oid
  pg_user_mappings ||--|{ pg_foreign_server : srvname
  pg_user_mappings ||--|{ pg_user_mapping : oid
  pg_user_mappings ||--|{ pg_authid : oid
```
