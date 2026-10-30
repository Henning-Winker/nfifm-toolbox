# Build the NFIFM Toolbox website locally into _site/ (not published), from R or RStudio.
# Run from the repository root:  source("scripts/build-local.R")
# Optional, once: enable automatic builds after every git pull
#   system("git config core.hooksPath .githooks")
if (Sys.which("quarto") == "") stop("Quarto not found on PATH. Install it from https://quarto.org")
source("scripts/install-packages.R")
status <- system2("quarto", c("render", "--quiet"))
if (status == 0) {
  index <- normalizePath(file.path("_site", "index.html"))
  message("Done: ", index)
  if (interactive()) utils::browseURL(index)
}
