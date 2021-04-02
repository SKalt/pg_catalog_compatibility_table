const https = require("https");
const fs = require("fs");
const { promisify } = require("util");

const cheerio = require("cheerio");
const { AssertionError } = require("assert");
const versions = [
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
const index = "https://www.postgresql.org/docs/current/catalogs.html";

// sorting
/** @param {string} a @param {string} b */
const byFloat = (a, b) =>
  parseFloat(a) > parseFloat(b) ? 1 : parseFloat(b) > parseFloat(a) ? -1 : 0;
/** @param {string} a @param {string} b */
const byString = (a, b) => (a > b ? 1 : b > a ? -1 : 0);
/**
 * @param {string[]} arr
 */
const last = (arr) => arr[arr.length - 1];

/** @param {string} f */
const fileExists = (f) =>
  promisify(fs.stat)(f)
    .then(() => true)
    .catch(() => false);
const writeFile = promisify(fs.writeFile);
const readFile = promisify(fs.readFile);
const ls = promisify(fs.readdir);
const mkdir = promisify(fs.mkdir);

/**
 * @param {string} url
 * @returns {Promise<string>}
 */
const get = async (url) => {
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

/**
 * @param {string} dest
 * @returns {(d: string) => string}
 */
const tee = (dest) => (data) => {
  writeFile(dest, data, { encoding: "utf8" });
  return data;
};
/**
 * @param {string} version
 */
const makeIndex = (version) => index.replace("current", version);
/**
 * @param {string} version
 * @returns {Promise<string>}
 */
const getIndex = async (version) => {
  const f = `./data/${version}/catalogs.html`;
  if (await fileExists(f)) return await readFile(f, "utf8");
  return await get(makeIndex(version)).then(tee(f));
};

/**
 * @param {string} html
 * @returns {string[]}
 */
const getTableDocUrlsFromIndex = (html) => {
  const $ = cheerio.load(html);
  return Array.from($("div.toc a[href], div.TOC a[href]"))
    .map((el) => $(el).attr("href") || "")
    .filter(Boolean);
};
/**
 * @param {string} version
 * @returns {Promise<string[]>}
 */
const getUrls = async (version) => {
  const f = `./data/${version}/urls.txt`;
  console.log(`[debug] getting urls for v${version}`);
  if (fs.existsSync(f)) return (await readFile(f, "utf8")).split("\n");
  else {
    const html = await getIndex(version);
    const results = getTableDocUrlsFromIndex(html).map(
      (page) => `https://www.postgresql.org/docs/${version}/${page}`
    );
    console.log({ results });
    tee(f)(results.join("\n"));
    return results;
  }
};
/** @param {string} s */
const tsvEscape = (s) =>
  s
    .replace("\t", "\\t")
    .replace("\n", "\\n")
    .replace("\r", "")
    .replace(/\s+/g, " ");
/** @param {string[][]} rows */
const toTsv = (rows) => [...rows].map((row) => row.join("\t")).join("\n");
/**
 * @param {import("cheerio")} $
 * @returns {string}
 */
const tableToTsv = ($) => {
  const table = $("table.table, table.CALSTABLE").first();
  if (typeof $ !== "function") throw new Error(`$ is a ${typeof $}: ${$}`);
  // some files are inexplicable stripped of their wrapping <table></table>
  const headers = Array.from(
    $(table).find("thead").first().find("th")
  ).map((el) => tsvEscape($(el).text()));
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

/**
 * pg 13 changed the table format
 * @param {import("cheerio")} $
 * @returns {string}
 */
const thirteenTableToCsv = ($) => {
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
    const colnames = $(row).find(".structfield");
    const name = $(colnames).first().text();
    const type_ = $(row).find(".type").first().text();
    const ref =
      colnames.length > 1
        ? `${$(".structname").first().text()}.${$(colnames[1]).text()}`
        : "";
    const desc = Array.from($(row).nextAll("p"))
      .map((p) => $(p).text())
      .join("\n");
    return [name, type_, ref, desc].map((t) => tsvEscape(t));
  });
  return [headers.join("\t"), toTsv(rows)].filter(Boolean).join("\n");
};
/** @param {string} s @returns {string} */
const tsvName = (s) => {
  let match = /^(catalog|view)-pg-([\w-_]+).html$/i.exec(s);
  if (!match) throw new Error(`unable to parse '${s}'`);
  let [, cv, name] = match;
  return `${cv}:${name.replace("-", "_")}.tsv`;
};

/** @param {string} version */
const processVersion = async (version) => {
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
          tee(tsvFile)((version === "13" ? thirteenTableToCsv : tableToTsv)($));
      })(url);
    }
  });
};

/**
 * @typedef {object} PgCatRow
 * @property {string} relation
 * @property {string} column
 * @property {string} type
 * @property {string} references
 * @property {string} description
 * @property {string} version
 */

/**
 * @function
 * @param {string} text
 * @returns {string[][]}
 */
const splitTsv = (text) => text.split("\n").map((row) => row.split("\t"));

/**
 * @function
 * @param {string[][]} rawRows
 * @param {string} relation
 * @param {string} version the postgres version
 * @returns {PgCatRow[]}
 */
const parseTsv = (rawRows, relation, version) => {
  let [header, ...rows] = rawRows;
  header = header.map((m) => m.toLowerCase());
  /**
   * @param {string} h the header-cell value to lookup
   * @returns {(cells: string[]) => string}
   */
  const lookup = (h) => {
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
     * @returns {PgCatRow} */
    (cells) => ({
      relation,
      version,
      column: getCol(cells),
      type: getType(cells),
      references: getRefs(cells),
      description: getDesc(cells),
    })
  );
};

/**
 * @typedef {object} PgCatRel
 * @property {string} relation
 * @property {string} type view or catalog
 * @property {string} version the version name
 */

/** @param {string} fn */
const parseFileName = (fn) => {
  const parsed = /^(view|catalog):([a-z_-]+)\.tsv$/.exec(fn);
  if (parsed === null) throw new Error(`unable to parse '${fn}'`);
  let [relType, relation] = parsed.slice(1);
  return { relType, relation };
};
const gatherRelTable = () => {
  /** @type {Record<string, PgCatRel[]>} */
  const index = {};
  /** @type {Array<"relation" | "type" | "version">} */
  const cols = ["relation", "type", "version"];
  /** @param {string[]} tsvs @param {string} version */
  const insert = (tsvs, version) => {
    tsvs.forEach((f) => {
      let { relType, relation } = parseFileName(f);
      const id = `${tsvEscape(relation)}\t${tsvEscape(relType)}`;
      let pgCatRel = { relation, type: relType, version };
      index[id] = [...(index[id] || []), pgCatRel];
    });
  };
  /** @returns {string} */
  const serialize = () =>
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
  /** @type {Record<string, PgCatRow[]>} */
  const index = {};
  /** @param {PgCatRow} row */
  const insert = (row) => {
    const id = `${row.relation}\t${row.column}\t${row.type}`;
    index[id] = [...(index[id] || []), row];
  };
  /** @returns {string} */
  const serialize = () => {
    return [
      ["relation", "column", "type", "version"].join("\t"),
      ...Object.entries(index)
        .sort(([a], [b]) => byString(a, b))
        .map(([relColAndType, rows]) => {
          const versions = rows
            .map((row) => row.version)
            .sort(byFloat)
            .join(",");
          return `${relColAndType}\t${versions}`;
        }),
    ].join("\n");
  };
  return { insert, index, serialize };
};
/**
 * @param {string[]} versions
 */
const main = async (versions) => {
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
