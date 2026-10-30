# R packages needed to render the site (the same light set the GitHub build uses)
pkgs <- c("knitr", "rmarkdown", "DT", "ggplot2", "tibble", "dplyr", "htmltools", "jsonlite")
miss <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(miss)) install.packages(miss, repos = "https://cloud.r-project.org")
