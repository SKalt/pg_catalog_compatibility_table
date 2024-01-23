#!/usr/bin/env python3
import csv
import os
from pathlib import Path
from textwrap import wrap as wrap_text
from typing import (
    Dict,
    List,
    Literal,
    Mapping,
    NamedTuple,
    Optional,
    Protocol,
    Set,
    cast,
)

this_dir = Path(__file__).parent
repo_root = this_dir / ".."
data_dir = repo_root / "data"
combined_dir = data_dir / "combined"
_RelationKind = Literal["catalog", "view"]


def get_all_version_dirs() -> List[Path]:
    "Get all version directories sorted in ascending order"
    versions = {
        path
        for d in os.listdir(combined_dir)
        if (path := Path(combined_dir / d)).is_dir()
    }
    return sorted(versions, key=lambda a: float(a.name))


class Relations(NamedTuple):
    catalogs: List[str]
    views: List[str]


def strip_tsv(tsv_name: str) -> str:
    "strip a the file extension from a tsv name"
    return tsv_name[:-4]


class ToSql(Protocol):
    def to_sql(self) -> str:
        ...


class ToMd(Protocol):
    def to_md(self) -> str:
        ...


class Bitmap:  # python ints are unbounded
    _inner: int

    def __init__(self) -> None:
        self._inner = 0

    def set(self, n: int) -> None:
        self._inner |= 1 << n

    def unset(self, n: int) -> None:
        self._inner &= ~(1 << n)

    def get(self, n: int) -> bool:
        return bool(self._inner & (1 << n))


class Relation(NamedTuple):  # discount Arrow format
    rel_name: str
    col_names: List[str]
    nullable: Bitmap
    nullable_known: Bitmap
    types: List[str]


class Column(NamedTuple):
    name: str
    type_: str
    nullable: Literal["true", "false", ""]
    references: str  # can be empty
    description: str  # can be empty


class DropColumn(NamedTuple):
    table: str
    col: str


# https://www.postgresql.org/docs/current/sql-altertable.html
class AlterColumnType(NamedTuple):
    table: str
    col: str
    target_type: str
    source_type: Optional[str] = None  # <- informational only


class AlterColumnDefault(NamedTuple):
    table: str
    col: str
    default: Optional[str] = None


class ExpandColumnEnum(NamedTuple):
    table: str
    col: str
    enum: Mapping[str, str]
    diff: Optional[Mapping[str, str]] = None  # <- informational only


class ShrinkColumnEnum(NamedTuple):
    table: str
    col: str
    enum: Mapping[str, str]
    diff: Optional[Mapping[str, str]] = None  # <- informational only

    def to_sql(self) -> str:
        ...

    def to_md(self) -> str:
        ...


class AddColumn(NamedTuple):
    table: str
    col: str
    type_: str
    nullable: bool
    default: Optional[str] = None


class AddConstraint(NamedTuple):
    table: str
    constraint_kind: str
    constraint_name: str
    columns: List[str]


class CreateIndex(NamedTuple):
    ...


def get_col(name: str, relation: List[Column]) -> Optional[Column]:
    for row in relation:
        if row.name == name:
            return row
    return None


def interpret_column_tsv(tsv_path: Path) -> List[Column]:
    with tsv_path.open() as prev_file:  # TODO: figure out some way of caching this i/o?
        rows = (line for line in csv.reader(prev_file, delimiter="\t"))
        try:
            rows.__next__()  # discard the header
        except StopIteration:
            raise Exception(f"empty file: {tsv_path.absolute()}")
        try:
            return [
                Column(
                    name=line[0],
                    type_=line[1],
                    nullable=cast(
                        Literal["true", "false", ""], line[2]
                    ),  # FIXME: check
                    references=line[3],
                    description=line[4],
                )
                for line in rows
                if line
            ]
        except ValueError as err:
            raise ValueError(f"{tsv_path}: {err}")


def make_specific_catalog_changelog(
    catalog: str,
    prev: List[Column],
    current: List[Column],
) -> str:
    prev_names = {row.name: row for row in prev}
    current_names = {row.name: row for row in current}
    dropped = {row.name: row for row in prev if row.name not in current_names}
    added = {row.name: row for row in current if row.name not in prev_names}
    shared = {row.name: row for row in current if row.name in prev_names}
    type_changed: Dict[str, Column] = {}
    null_changed: Dict[str, Column] = {}
    for name, row in shared.items():
        if row.type_ != prev_names[name].type_:
            type_changed[name] = row
        if row.nullable != prev_names[name].nullable:
            null_changed[name] = row
    # TODO: try to match on type + index to detect renames?
    if added or dropped or type_changed or null_changed:
        print(f"## catalog `{catalog}`")
        if added:
            print("### Features")
            for name, row in added.items():
                print(
                    f"feat: `ALTER TABLE {catalog} "
                    f"ADD COLUMN {name} {row.type_}"
                    f" {'NOT ' if row.nullable == 'true' else ''}NULL;`"
                )
        if type_changed or null_changed:
            print("### Non-Breaking Changes")
            for name, row in type_changed.items():
                print(
                    f"refactor: `ALTER TABLE {catalog} ALTER COLUMN {name} SET TYPE {row.type_};`"
                )
                if name in null_changed:
                    null_changed.pop(name)
                    action = "???"
                    if row.nullable == "true":
                        action = "DROP"
                    elif row.nullable == "false":
                        action = "SET"
                    else:
                        ...  # ?
                    print(
                        f"refactor: `ALTER TABLE {catalog} ALTER COLUMN {name} {action} NOT NULL;`"
                    )
            for name, row in null_changed.items():
                action = "???"
                if row.nullable == "true":
                    action = "DROP"
                elif row.nullable == "false":
                    action = "SET"
                else:
                    ...  # ?
                print(
                    f"refactor: `ALTER TABLE {catalog} ALTER COLUMN {name} {action} NOT NULL;`"
                )
        if dropped:
            print("### Breaking changes")
            for name in dropped:
                print(f"BREAKING CHANGE: `ALTER TABLE {catalog} DROP COLUMN {name};`")
        print("\n")
    return "TODO"


def make_specific_view_changelog(
    view: str, prev: List[Column], current: List[Column]
) -> None:
    """
    Write a changelog for a specific view to stdout
    """
    prev_names = {row.name: row for row in prev}
    current_names = {row.name: row for row in current}
    dropped = {row.name: row for row in prev if row.name not in current_names}
    added = {row.name: row for row in current if row.name not in prev_names}
    shared = {row.name: row for row in current if row.name in prev_names}
    type_changed: Dict[str, Column] = {}
    null_changed: Dict[str, Column] = {}
    for name, row in shared.items():
        if row.type_ != prev_names[name].type_:
            type_changed[name] = row
        if row.nullable != prev_names[name].nullable:
            null_changed[name] = row
    if added or dropped or type_changed or null_changed:
        print(f"## view `{view}`")
        if added:
            print("### Features")
            for name, row in added.items():
                print(
                    f"feat: add column `{name} {row.type_} {'NOT ' if row.nullable == 'true' else ''}NULL`"
                )
        if type_changed or null_changed:
            print("### Non-Breaking Changes")
            for name, row in type_changed.items():
                print(f"refactor: column `{name}` type set to `{row.type_}`")
                if name in null_changed:
                    null_changed.pop(name)
                    action = "???"
                    if row.nullable == "true":
                        action = "DROP"
                    elif row.nullable == "false":
                        action = "SET"
                    else:
                        ...  # ?
                    print(f"refactor: column `{name}` `{action} NOT NULL`")
            for name, row in null_changed.items():
                action = "???"
                if row.nullable == "true":
                    action = "DROP"
                elif row.nullable == "false":
                    action = "SET"
                else:
                    ...  # ?
                print(f"refactor: column `{name}` `{action} NOT NULL`")
        if dropped:
            print("### Breaking changes")
            for name in dropped:
                print(f"BREAKING CHANGE: alter view {view} drop column {name}")
        print("\n")


def get_relations(
    data_dir: Path, version: str, kind: _RelationKind
) -> Dict[str, List[Column]]:
    result: Dict[str, List[Column]] = {}
    relation_kind_dir = data_dir / "combined" / version / kind
    if not relation_kind_dir.exists():
        return result
    for catalog_tsv in os.listdir(relation_kind_dir):
        if catalog_tsv.endswith(".tsv"):
            catalog = strip_tsv(catalog_tsv)
            result[catalog] = interpret_column_tsv(relation_kind_dir / catalog_tsv)
    return result


def get_view_def(data_dir: Path, version: str, view_name: str) -> Optional[str]:
    path = data_dir / "observed" / version / "view" / (view_name + ".sql")
    if not path.exists():
        return None
    with path.open() as f:
        return f.read()


def render_doc_comment(*, comment: str, url: str = "", prefix: str = "  ") -> str:
    if not comment:
        return ""
    prefix = prefix + "--- "  # use `---` to make it a doc comment
    if url:
        comment = comment + f"\n\nsee{url}"
    return "\n" + "\n".join(
        wrap_text(
            comment,
            width=80,
            initial_indent=prefix,
            subsequent_indent=prefix,
        )
    )


def render_table_creation(catalog: str, cols: List[Column]) -> str:
    result = f"CREATE TABLE {catalog} (" f"\n  "
    prefix = "    "
    result += "\n  , ".join(
        [
            ""
            + f"{column.name} {column.type_} "
            + ("NOT " if column.nullable == "false" else "")
            + "NULL"
            + render_doc_comment(comment=column.description, prefix=prefix)
            for column in cols
        ]
    )
    result += "\n);"
    return result


def pad_version(version: str) -> str:
    """
    >>> version_as_migration("16")
    "160"
    >>> version_as_migration("7.8")
    "078"
    """
    return "{:0>3}".format(version.replace(".", ""))


def main() -> None:
    migrations_dir = repo_root / "temp" / "migrations"
    if not migrations_dir.exists():
        migrations_dir.mkdir(parents=True)
    version_dirs = get_all_version_dirs()
    versions = [d.name for d in version_dirs]
    version_catalogs: List[Dict[str, List[Column]]] = []  # zipped with versions
    version_views: List[Dict[str, List[Column]]] = []
    for version in versions:
        version_catalogs.append(get_relations(data_dir, version, "catalog"))
        version_views.append(get_relations(data_dir, version, "view"))

    current_version = versions[0]

    print(f"# {current_version}")
    version = versions[0]
    with open(migrations_dir / f"{pad_version(version)}.up.sql", "w") as f:
        # TODO: unset restrictions like pg_dump does
        for catalog in version_catalogs[0]:
            cols = version_catalogs[0][catalog]
            print("feat:\n```sql")
            sql = render_table_creation(catalog, cols)
            f.write(sql + "\n")
            print(sql)
            print("```")
    for prev_index, current_version in enumerate(versions[1:]):
        prev_catalogs = version_catalogs[prev_index]
        current_catalogs = version_catalogs[prev_index + 1]
        prev_views = version_views[prev_index]
        current_views = version_views[prev_index + 1]
        dropped_catalogs = [
            catalog for catalog in prev_catalogs if catalog not in current_catalogs
        ]
        dropped_views = [view for view in prev_views if view not in current_views]
        added_catalogs = [
            catalog for catalog in current_catalogs if catalog not in prev_catalogs
        ]
        added_views = [view for view in current_views if view not in prev_views]
        shared_catalogs = [
            catalog for catalog in current_catalogs if catalog in prev_catalogs
        ]
        shared_views = [view for view in current_views if view in prev_views]

        print(f"# {current_version}")
        if dropped_catalogs or dropped_views:
            print("## Breaking changes")
            for catalog in dropped_catalogs:
                print(f"BREAKING CHANGE: `DROP TABLE {catalog};`")
            for view in dropped_views:
                print(f"BREAKING CHANGE: `DROP VIEW {view};`")
            print()
        if added_catalogs or added_views:
            print("## Features")
            for catalog in added_catalogs:
                cols = current_catalogs[catalog]
                print("feat:\n```sql")
                print(render_table_creation(catalog, cols))
                print("```")

            for added_view in added_views:
                view_def = get_view_def(data_dir, current_version, added_view)
                print("feat:\n```sql")
                if view_def:
                    print(f"CREATE VIEW {added_view}")
                    print(view_def)
                else:
                    # TODO: _
                    print(
                        f"CREATE VIEW {added_view} AS (SELECT $MISSING$...$MISSING$);"
                    )
                print("```")
            print()
        if shared_catalogs:
            for catalog in shared_catalogs:
                make_specific_catalog_changelog(
                    catalog, prev_catalogs[catalog], current_catalogs[catalog]
                )
            for view in shared_views:
                make_specific_view_changelog(
                    view, prev_views[view], current_views[view]
                )


if __name__ == "__main__":
    main()
