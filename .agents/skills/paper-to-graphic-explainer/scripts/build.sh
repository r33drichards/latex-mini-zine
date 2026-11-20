#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 || ! -f "$1" || ! "$2" =~ ^[a-zA-Z0-9][a-zA-Z0-9_-]*$ ]]; then
  echo "Usage: build.sh SOURCE.tex BASENAME" >&2
  exit 2
fi

skill_dir=$(cd -- "$(dirname -- "$0")/.." && pwd)
export TEXINPUTS="$skill_dir/assets/:$PWD/:"
source_file=$1
basename=$2
scratch=$(mktemp -d)
trap 'rm -rf -- "$scratch"' EXIT

build() {
  local job=$1 input=$2
  if ! pdflatex -halt-on-error -interaction=nonstopmode \
      -output-directory="$scratch" "-jobname=$job" "$input" > "$scratch/$job.build"; then
    tail -40 "$scratch/$job.build" >&2
    return 1
  fi
}

check_pages() {
  local job=$1 expected=$2 pages
  pages=$(pdfinfo "$scratch/$job.pdf" | awk '/^Pages:/ {print $2}')
  if [[ "$pages" != "$expected" ]]; then
    echo "Expected $expected pages for $job, found $pages." >&2
    return 1
  fi
}

reading="$basename-reading"
printing="$basename-a4"
build "$reading" "$source_file"
build "$reading" "$source_file"
if grep -E 'Overfull|Label\(s\) may have changed' "$scratch/$reading.build"; then
  exit 1
fi
check_pages "$reading" 8

cat > "$scratch/impose.tex" <<TEX
\documentclass[a4paper,landscape]{article}
\usepackage{pdfpages}
\begin{document}
\includepdf[pages=-,nup=2x1,noautoscale,signature=8]{$scratch/$reading.pdf}
\end{document}
TEX
build "$printing" "$scratch/impose.tex"
check_pages "$printing" 4

pdftoppm -r 100 -png "$scratch/$reading.pdf" "$scratch/page"
montage "$scratch"/page-*.png -tile 4x2 -geometry +6+6 \
  -background '#dce4df' "$scratch/$basename-preview.png"
cp "$scratch/$reading.pdf" "$scratch/$printing.pdf" "$scratch/$basename-preview.png" .
