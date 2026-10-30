# Live preview of the NFIFM Toolbox while developing (nothing is published).
# Open nfifm-toolbox.Rproj in RStudio, then:  source("scripts/preview.R")
# The site opens in the Viewer/browser and each page re-renders when you save its .qmd or a CSV in data/.
# Stop the preview with:  quarto::quarto_preview_stop()
source("scripts/install-packages.R")
if (!requireNamespace("quarto", quietly = TRUE)) install.packages("quarto", repos = "https://cloud.r-project.org")
if (!nzchar(quarto::quarto_path())) stop("Quarto CLI not found. Install it from https://quarto.org")
quarto::quarto_preview()

# Render a single page instead (faster when working on one entry):
# quarto::quarto_render("advice/fpat.qmd")
# Full build into _site/ (open _site/index.html, also works offline):
# source("scripts/build-local.R")
