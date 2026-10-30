# NFIFM Toolbox (working title)

Shared method library and code for stock assessment, from data to management advice. Development version of the toolbox for the FAO Global Stock Assessment Capacity Programme; **not an official FAO product**.

**Website:** https://henning-winker.github.io/nfifm-toolbox

## What's inside

| Folder | Content |
|---|---|
| `select/` | FishPath-style method selector with misuse warnings (plain JavaScript, runs in the browser, also offline) |
| `framework/` | Hierarchy, crosswalk, catalogue structure |
| `methods/` | Assessment methods: biomass dynamic, length-based and per-recruit, age-structured, multispecies |
| `data-tools/` | CPUE standardisation, joint indices, length data |
| `advice/` | Reference points, advice tables, MSE |
| `guidance/` | Misuse prevention, diagnostics, sensitivity |
| `regions/` | Regional hubs (first: CECAF assessment catalogue) |
| `data/methods.csv` | Single source of truth: tool attributes and data requirements (drives selector, crosswalk, method pages) |
| `data/misuse_rules.csv` | Warning rules shown by the selector and on method pages |
| `methods/_template.qmd` | Template for a new catalogue entry |

## Build

```bash
quarto preview      # local live preview
quarto render       # full build into _site/
```

### Develop in RStudio

Open `nfifm-toolbox.Rproj`, then run `source("scripts/preview.R")`. The site opens in the Viewer and each page re-renders when you save it (also after edits to `data/*.csv`). Alternatively use the **Build** pane → *Render Website*, or the **Render** button on a single `.qmd`. Stop the preview with `quarto::quarto_preview_stop()`. Nothing is published until you push to `main`.

### Local build after every pull (not published)

Enable once per clone, so that every `git pull` rebuilds the site into `_site/` on your machine:

```bash
git config core.hooksPath .githooks
```

Then open `_site/index.html` in a browser; it works from disk, including the method selector. `_site/` is ignored by git, so nothing is pushed. To build by hand: `sh scripts/build-local.sh` (terminal or Git Bash), or `source("scripts/build-local.R")` in R/RStudio, which also installs the R packages needed. Skip one build with `NFIFM_SKIP_BUILD=1 git pull`. Requires [Quarto](https://quarto.org) and R on the PATH.

Pushing to `main` publishes to GitHub Pages via `.github/workflows/publish.yml` (needs a `gh-pages` branch; it exists after the first setup).

## Licence

Text and figures: CC BY 4.0. Code: MIT. See `LICENSE.md`.
