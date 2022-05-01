import * as https from "https";
import * as fs from "fs";
import { promisify } from "util";
import type { CheerioAPI } from "cheerio";
import * as cheerio from "cheerio";
const versions = [
  "14",
  "13",
  "12",
  "11",
  "10",
  "9.6",
  "9.5",
  "9.4",
  "9.3",
  "9.2",
  "9.1",
  "9.0",
  "8.4",
  "8.3",
  "8.2",
  "8.1",
  "8.0",
  "7.4",
  "7.3",
  "7.2",
  "7.1",
];

const pgCatalogIndex = "https://www.postgresql.org/docs/current/catalogs.html";

// sorting
const byFloat = (a: string, b: string) =>
  parseFloat(a) > parseFloat(b) ? 1 : parseFloat(b) > parseFloat(a) ? -1 : 0;
const byString = (a: string, b: string) => (a > b ? 1 : b > a ? -1 : 0);

const last = (arr: string[]) => arr[arr.length - 1];

const fileExists = (f: string): Promise<boolean> =>
  promisify(fs.stat)(f)
    .then(() => true)
    .catch(() => false);
const writeFile = promisify(fs.writeFile);
const readFile = promisify(fs.readFile);
const ls = promisify(fs.readdir);
const mkdir = promisify(fs.mkdir);

/** http GET a url, return its body */
const get = async (url: string): Promise<string> => {
  return new Promise((resolve) => {
    https.get(url, (res) => {
      console.log(`[info]: GET ${url}\t${res.statusCode}`);
      let result = "";
      res.on("data", (d) => {
        result += d;
      });
      res.on("close", () => {
        if (!result.trim()) throw new Error(`empty response from ${url}`);
        resolve(result);
      });
    });
  });
};

/** write a string to a path, then continue using the data */
const tee =
  (dest: string): ((d: string) => string) =>
  (data) => {
    writeFile(dest, data, { encoding: "utf8" });
    return data;
  };

/** construct a postgres url */
const makeIndex = (version: string, page = "catalogs") =>
  `https://www.postgresql.org/docs/${version}/${page}.html`;

/** ... */
const getIndex = async (
  version: string,
  page: string = "catalogs"
): Promise<string> => {
  const f = `./data/${version}/${page}.html`;
  if (await fileExists(f)) return await readFile(f, "utf8");
  return await get(makeIndex(version, page)).then(tee(f));
};

/** find all links in the TOC page */
const getTableDocUrlsFromIndex = (html: string): string[] => {
  const $ = cheerio.load(html);
  return Array.from($("div.toc a[href], div.TOC a[href]"))
    .map((el) => $(el).attr("href") || "")
    .filter(Boolean);
};

/**
 * @param {string} version
 * @param {string} page
 * @returns {Promise<string[]>}
 */
const getUrls = async (
  version: string,
  page: string = "catalogs"
): Promise<string[]> => {
  const f = `./data/${version}/${page}_urls.txt`;
  console.log(`[debug] getting urls for v${version}`);
  if (fs.existsSync(f)) return (await readFile(f, "utf8")).split("\n");
  else {
    const html = await getIndex(version, page);
    const results = getTableDocUrlsFromIndex(html).map(
      (page) => `https://www.postgresql.org/docs/${version}/${page}`
    );
    console.log({ results });
    tee(f)(results.join("\n"));
    return results;
  }
};

const normalizeStr = (s: string) => s.normalize().replace(/[“”]/g, '"');

const tsvEscape = (s: string) => {
  let result = normalizeStr(s.replace(/\s+/g, " "));
  return result.includes('"') ? `"${result.replace(/"/g, '\\"')}"` : result;
};

const toTsv = (rows: string[][]) =>
  [...rows].map((row) => row.join("\t")).join("\n"); // TODO: quote cells

/** tsv-ify HTML tables */
const tableToTsv = ($: CheerioAPI): string => {
  const table = $("table.table, table.CALSTABLE").first();
  if (typeof $ !== "function") throw new Error(`$ is a ${typeof $}: ${$}`);
  // some files are inexplicable stripped of their wrapping <table></table>
  const headers = Array.from($(table).find("thead").first().find("th")).map(
    (el) => tsvEscape($(el).text())
  );
  let _rows = $(table).find("table tbody tr");
  if (!_rows.length) {
    console.log(`no rows found in\n${_rows.html}`);
    throw new Error("no rows");
  }
  const rows = Array.from(_rows).map((tr) => {
    const cells = $(tr).find("td");
    if (!cells.length) {
      console.log($(tr).html());
      throw new Error(`no cells found`);
    }
    return Array.from(cells).map((el) => tsvEscape($(el).text()));
  });
  return [headers.join("\t"), toTsv(rows)].filter(Boolean).join("\n");
};

/** parse pg docs >= 13; the table format changed */
const thirteenTableToCsv = ($: CheerioAPI): string => {
  const table = $("table.table, table.CALSTABLE").first();
  if (typeof $ !== "function") throw new Error(`$ is a ${typeof $}: ${$}`);
  const headers = ["Name", "Type", "References", "Description"]; // no way to parse that >:(
  let _rows = $(table).find("table tbody tr");
  if (!_rows.length) {
    console.log(`no rows found in\n${_rows.html}`);
    throw new Error("no rows");
  }
  const rows = Array.from(_rows).map((tr) => {
    const row = $(tr).find(".column_definition").first();
    // console.log({ row });
    const colNames = $(row).find(".structfield");
    const name = $(colNames).first().text();
    const type_ = $(row).find(".type").first().text();
    const ref =
      colNames.length > 1
        ? `${$(".structname").first().text()}.${$(colNames[1]).text()}`
        : "";
    const desc = Array.from($(row).nextAll("p"))
      .map((p) => $(p).text())
      .join("\n");
    return [name, type_, ref, desc].map((t) => tsvEscape(t));
  });
  return [headers.join("\t"), toTsv(rows)].filter(Boolean).join("\n");
};

/** generate a tsv name from a page name */
const tsvName = (s: string): string => {
  let match = /^(catalog|view)-pg-([\w-_]+).html$/i.exec(s);
  if (!match) throw new Error(`unable to parse '${s}'`);
  let [, cv, name] = match;
  return `${cv}:${name.replace("-", "_")}.tsv`;
};

/** scrape all catalog docs for a given postgres version */
const processVersion = async (version: string) => {
  console.log(`[info] processing postgres v${version}`);
  const dir = `./data/${version}`;
  if (!(await fileExists(dir))) await mkdir(`./data/${version}`);
  return getUrls(version).then(async (urls) => {
    let _pages = urls
      .filter((url) => !/catalogs.html/.test(url))
      .filter((url) => !/catalogs(-overview)?/.test(url))
      .filter((url) => !/views-(overview)?/.test(url));
    for (let url of _pages) {
      await (async (url) => {
        const htmlName = last(url.split("/"));
        const f = `${dir}/${htmlName}`;
        const tsvFile = `${dir}/${tsvName(htmlName)}`;
        const $ = cheerio.load(
          (await fileExists(f))
            ? await readFile(f, "utf8")
            : tee(f)(await get(url))
        );
        if ($("table.table, table.CALSTABLE").length == 0) {
          throw new Error(
            `found ${$("table.table, table.CALSTABLE").length} tables in ${f}`
          );
        }
        if (!(await fileExists(tsvFile)))
          tee(tsvFile)((+version >= 13 ? thirteenTableToCsv : tableToTsv)($));
      })(url);
    }
  });
};

type PgCatalogRow = {
  relation: string;
  column: string;
  type: string;
  references: string;
  description: string;
  version: string;
};

const splitTsv = (text: string): string[][] =>
  text.split("\n").map((row) => row.split("\t"));

const parseTsv = (
  rawRows: string[][],
  relation: string,
  version: string
): PgCatalogRow[] => {
  let [header, ...rows] = rawRows;
  header = header.map((m) => m.toLowerCase());
  /**
   * @param {string} h the header-cell value to lookup
   * @returns {(cells: string[]) => string}
   */
  const lookup = (h: string): ((cells: string[]) => string) => {
    const i = header.indexOf(h);
    return i === -1 ? () => "" : (cells) => cells[i] || "";
  };
  const getCol = lookup("name");
  const getType = lookup("type");
  const getRefs = lookup("references");
  const getDesc = lookup("description");
  return rows.map(
    /**
     * @param {string[]} cells
     * @returns {PgCatalogRow} */
    (cells: string[]): PgCatalogRow => ({
      relation,
      version,
      column: getCol(cells),
      type: getType(cells),
      references: getRefs(cells).trim(),
      description: getDesc(cells).replace(/\.*$/, ""), //.replace(/\.*$/g, "."),
    })
  );
};

type PgCatRel = {
  /** */
  relation: string;
  /**  view or catalog */
  type: string;
  /**  the version name */
  version: string;
};
/**
 * @typedef {object} PgCatRel
 * @property {string} relation
 * @property {string} type view or catalog
 * @property {string} version the version name
 */

/** @param {string} fn */
const parseFileName = (fn: string) => {
  const parsed = /^(view|catalog):([a-z_-]+)\.tsv$/.exec(fn);
  if (parsed === null) throw new Error(`unable to parse '${fn}'`);
  let [relType, relation] = parsed.slice(1);
  return { relType, relation };
};
const gatherRelTable = () => {
  /** @type {Record<string, PgCatRel[]>} */
  const index: Record<string, PgCatRel[]> = {};
  /** @type {Array<"relation" | "type" | "version">} */
  const cols: Array<"relation" | "type" | "version"> = [
    "relation",
    "type",
    "version",
  ];
  /** ??? */
  const insert = (tsvs: string[], version: string) => {
    tsvs.forEach((f) => {
      let { relType, relation } = parseFileName(f);
      const id = `${tsvEscape(relation)}\t${tsvEscape(relType)}`;
      let pgCatRel = { relation, type: relType, version };
      index[id] = [...(index[id] || []), pgCatRel];
    });
  };
  /** write _ to an on-disk TSV */
  const serialize = (): string =>
    [
      cols.join("\t"),
      ...Object.entries(index)
        .sort(([a], [b]) => byString(a, b))
        .map(([relAndType, rows]) => {
          const versions = rows
            .map((row) => row.version)
            .sort(byFloat)
            .join(",");
          return `${relAndType}\t${tsvEscape(versions)}`;
        }),
    ].join("\n");
  return { insert, index, serialize };
};

const gatherRows = () => {
  /** @type {Record<string, PgCatalogRow[]>} */
  const index: Record<string, PgCatalogRow[]> = {};
  /** @param {PgCatalogRow} row */
  const f = (row: PgCatalogRow) =>
    [row.relation, row.column, row.type, row.references, row.description].join(
      "\t"
    );
  /** @param {PgCatalogRow} row */
  const insert = (row: PgCatalogRow) => {
    const id = f(row).toLowerCase();
    index[id] = [...(index[id] || []), row];
  };
  /** @returns {string} */
  const serialize = (): string => {
    return [
      [
        "relation",
        "column",
        "type",
        "references",
        "description",
        "version",
      ].join("\t"),
      ...Object.entries(index)
        .sort(([a], [b]) => byString(a, b))
        .map(([_, rows]) => {
          const versions = rows
            .map((row) => row.version)
            .sort(byFloat)
            .join(",");
          return `${f(rows[0])}\t${versions}`;
        }),
    ].join("\n");
  };
  return { insert, index, serialize };
};
/**
 * @param {string[]} versions
 */
const main = async (versions: string[]) => {
  for await (let version of versions) {
    await processVersion(version);
  }
  const tables = gatherRelTable();
  const columns = gatherRows();
  for await (let version of versions) {
    let files = await ls(`./data/${version}`);
    let tsvs = files.filter((f) => f.endsWith(".tsv"));
    tables.insert(tsvs, version);
    for await (let fileName of tsvs) {
      const { relation } = parseFileName(fileName);
      const tsvText = await readFile(`./data/${version}/${fileName}`, "utf8");
      parseTsv(splitTsv(tsvText), relation, version).forEach(columns.insert);
    }
    await writeFile(`./data/tables.tsv`, tables.serialize());
    await writeFile(`./data/columns.tsv`, columns.serialize());
  }
};

main(versions);
