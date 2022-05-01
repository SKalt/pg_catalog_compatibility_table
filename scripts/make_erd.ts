// TODO!
import { promisify } from "util";
import * as fs from "fs";
const writeFile = promisify(fs.writeFile);
const readFile = promisify(fs.readFile);

const latest = "14";

const enum Col {
  relation = 0,
  column,
  type,
  ref,
  description,
  versions,
}

const main = async () => {
  const rawTsv = await readFile("./data/columns.tsv", { encoding: "utf-8" });
  let [header, ...lines] = rawTsv
    .split("\n")
    .map((line) =>
      line
        .split("\t")
        .map((cell) =>
          cell.startsWith('"')
            ? cell.slice(1, cell.length - 1).replace(/""/, '"')
            : cell
        )
    );
  // filter to columns in postgres 14
  lines = lines.filter((line) => line[line.length - 1].endsWith(latest));

  const relationData = lines.reduce((relations, col) => {
    const name = col[Col.relation];
    const rel = relations[name] || [];
    rel.push([col[Col.column], col[Col.type]]);
    relations[name] = rel;
    return relations;
  }, {} as Record<string, string[][]>);

  const relations = Object.keys(relationData)
    .sort()
    .map((relName) => [relName, relationData[relName]] as [string, string[][]])
    .reduce((a, [name, cols]) => {
      return (
        a +
        `  ${name} {\n    ${cols
          .map(([name, kind]) => `${name} ${kind.replace(/\[\]/g, "Slice")}\n`)
          .join("    ")}  }\n`
      );
    }, "");
  const edges = lines
    .filter((col) => !!col[Col.ref])
    .map(
      (col) =>
        [[col[Col.relation], col[Col.column]], col[Col.ref].split(".")] as [
          [string, string],
          [string, string]
        ]
    )
    .map(([src, dst]) => `${src[0]} ||--|{ ${dst[0]} : ${dst[1]}`)
    .join("\n  ");

  console.log(`erDiagram\n  ${relations}\n\n  ${edges}`);
};

main().then(() => process.exit(0));
