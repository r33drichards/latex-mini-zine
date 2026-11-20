#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: build.sh SOURCE.tex OUTPUT-BASENAME" >&2
  exit 2
fi

source_file=$1
basename=$2
if [[ ! -f "$source_file" || "$basename" == */* || -z "$basename" ]]; then
  echo "Provide an existing source and a basename with no directory." >&2
  exit 2
fi

build() {
  local job=$1
  local options=$2
  local pass
  for pass in 1 2 3; do
    if ! pdflatex -halt-on-error -interaction=nonstopmode "-jobname=$job" \
      "\def\ZineLetter{1}$options\input{$source_file}" > "$job.build.txt"; then
      tail -40 "$job.build.txt" >&2
      return 1
    fi
  done
  if grep -E 'exceeds the safe height|Overfull|Label\(s\) may have changed' "$job.build.txt"; then
    return 1
  fi
}

build "$basename" '\def\ZinePreview{1}'
build "$basename-print-letter" ''
