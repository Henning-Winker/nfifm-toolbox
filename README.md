# NFIFM Toolbox (working title)

Shared method library and code for stock assessment, from data to management advice. Development version of the toolbox for the FAO Global Stock Assessment Capacity Programme; **not an official FAO product**.

**Website:** https://henning-winker.github.io/nfifm-toolbox

## What's inside

| Folder | Content |
|---|---|
| `select/` | FishPath-style method selector with misuse warnings (Observable JS, runs in the browser) |
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

Pushing to `main` publishes to GitHub Pages via `.github/workflows/publish.yml` (needs a `gh-pages` branch; it exists after the first setup).

## Licence

Text and figures: CC BY 4.0. Code: MIT. See `LICENSE.md`.
