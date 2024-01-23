#!/usr/bin/env bash
if [[ "${BASH_SOURCE[0]}" = */* ]]; then this_dir="${BASH_SOURCE[0]%/*}"; else this_dir=.; fi
repo_root="$this_dir/.."
repo_root="$(cd "$repo_root" && pwd)"

get_unsorted_versions() {
  for version_path in "$repo_root/data"/*; do
    if test -d $version_path; then
      echo "${version_path##*/}"
    fi
  done
}
get_sorted_versions() {
  get_unsorted_versions | sort -n
}

table="$1"
prev_version=
for version in $(get_sorted_versions); do
  if test -n "$prev_version"; then
    if ! diff "$repo_root/data/$prev_version/$table" "$repo_root/data/$version/$table" &>/dev/null; then
      code --wait --diff "$repo_root/data/$prev_version/$table" "$repo_root/data/$version/$table"
    fi
  fi
  prev_version="$version"
done
