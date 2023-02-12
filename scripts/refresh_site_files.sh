#!/usr/bin/env bash
set -euo pipefail
if [[ "${BASH_SOURCE[0]}" = */* ]]; then this_dir="${BASH_SOURCE[0]%/*}"; else this_dir=.; fi
repo_root="$this_dir/.."
repo_root="$(cd "$repo_root" && pwd)"
site_dir="$repo_root/data/site"
cd "$site_dir"
for i in ./*; do
  if test "${i##*/}" != "site.tar.gz"; then rm -rf "$i"; fi
done
tar -xf ./site.tar.gz
