#!/usr/bin/env node
const path = require("path");
const https = require("https");
let fs = require("fs");
let os = require("os");
let { promisify } = require("util");
let repo = "skalt/pg_doc_archive";
let siteDir = path.resolve(__dirname, "../data/site/");
let outputTar = path.resolve(siteDir, "site.tar.gz");
async function getDownloadUrl() {
  let url = `https://api.github.com/repos/${repo}/releases/latest`;
  return fetch(url)
    .then((r) => {
      if (!r.ok) {
        throw new Error(`${r.status}: ${r.statusText}`);
      }
      return r.json();
    })
    .then(
      /** @returns {string} */
      (r) => r.assets[0].browser_download_url
    );
}
/**
 * @param {string} url
 */
async function get(url) {
  return new Promise((resolve, reject) => {
    https.get(url, async (msg) => {
      if (msg.statusCode == 200) resolve(msg);
      else if (msg.statusCode == 302)
        resolve(await get(msg.headers.location ?? "missing"));
      else reject(`${msg.statusCode}: ${msg.statusMessage}`);
    });
  });
}
async function main() {
  let url = await getDownloadUrl();
  await get(url).then(async (res) => {
    let output = await fs.promises.open(outputTar, "w", 0o666);
    // 0o666: anyone can read/write this file
    let stream = output.createWriteStream();
    res.on(
      "data",
      /**
       * @param {any} d
       * @returns {boolean}
       */
      (d) => stream.write(d)
    );
    res.on("end", () => stream.end());
  });
  // todo: clean up old copy of site, unpack new copy
}

main();
