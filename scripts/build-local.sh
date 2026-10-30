#!/bin/sh
# Build the NFIFM Toolbox website locally into _site/ (not published).
# Usage: sh scripts/build-local.sh        (from anywhere inside the repository)
# Open _site/index.html in a browser afterwards; the method selector works offline.
cd "$(git rev-parse --show-toplevel)" || exit 1
if ! command -v quarto >/dev/null 2>&1; then
  echo "NFIFM Toolbox: Quarto not found on PATH; skipping local build (install from https://quarto.org)." >&2
  exit 0
fi
echo "NFIFM Toolbox: rendering the site into _site/ ..."
if quarto render --quiet; then
  echo "NFIFM Toolbox: done. Open $(pwd)/_site/index.html"
else
  echo "NFIFM Toolbox: render failed; see messages above (missing R packages? run: Rscript scripts/install-packages.R)." >&2
fi
exit 0
