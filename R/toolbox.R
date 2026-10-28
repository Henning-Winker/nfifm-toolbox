# Helper functions shared by the toolbox pages.
# Single source of truth: data/methods.csv (one row per tool), data/misuse_rules.csv
# Paths are relative to the repo root because _quarto.yml sets execute-dir: project.

read_methods <- function(path = "data/methods.csv") {
  read.csv(path, check.names = FALSE, stringsAsFactors = FALSE)
}

read_catalogue_fields <- function(path = "data/catalogue_fields.csv") {
  read.csv(path, check.names = FALSE, stringsAsFactors = FALSE)
}

read_misuse <- function(path = "data/misuse_rules.csv") {
  read.csv(path, check.names = FALSE, stringsAsFactors = FALSE)
}

link_name <- function(m, site_root) {
  sprintf('<a href="%s%s">%s</a>', site_root, sub("\\.qmd$", ".html", m$page), m$name)
}

# Filterable crosswalk; `category` selects Assessment / Data and CPUE tools / Advice and MSE.
crosswalk_table <- function(site_root = "../", category = NULL) {
  m <- read_methods()
  if (!is.null(category)) m <- m[m$category %in% category, ]
  out <- data.frame(
    Class = m$class, `Sub-class` = m$subclass, Application = m$application,
    Tool = link_name(m, site_root), Status = ifelse(m$showcase == "", m$status, paste0(m$status, " (showcase", ifelse(m$showcase == "candidate", " candidate", ""), ")")),
    Bayesian = m$bayesian, `State space` = m$state_space,
    `Error structure` = m$error_structure, `Multiple indices` = m$multiple_indices,
    `Multi-gear` = m$multi_gear, `Dome selectivity` = m$dome_selectivity,
    Outputs = m$outputs, `Advice role` = m$advice_role, Software = m$software,
    `No-code app` = m$app,
    check.names = FALSE)
  DT::datatable(out, rownames = FALSE, escape = FALSE, filter = "top",
                options = list(pageLength = 25, scrollX = TRUE, dom = "tip"),
                class = "compact stripe hover")
}

# Attribute row for one method page, pulled from the registry.
method_attributes <- function(id) {
  m <- read_methods()
  m <- m[m$id %in% id, , drop = FALSE]
  if (nrow(m) == 0) stop("Tool not found in data/methods.csv: ", paste(id, collapse = ", "))
  knitr::kable(data.frame(
    Application = m$application, Bayesian = m$bayesian, `State space` = m$state_space,
    `Error structure` = m$error_structure, `Multi-gear` = m$multi_gear,
    `Dome selectivity` = m$dome_selectivity, Outputs = m$outputs,
    `Advice role` = m$advice_role, `No-code app` = ifelse(m$app == "", "None yet", m$app),
    check.names = FALSE), row.names = FALSE)
}

# Misuse warnings that apply to a method (from data/misuse_rules.csv), as a callout list.
method_warnings <- function(id) {
  r <- read_misuse()
  hit <- vapply(strsplit(r$methods, "|", fixed = TRUE),
                function(x) id %in% x || "*" %in% x, logical(1))
  r <- r[hit, ]
  if (nrow(r) == 0) return(invisible(NULL))
  icon <- ifelse(r$severity == "stop", "**Do not use:**", "**Caution:**")
  cat("::: {.callout-warning}\n## Misuse warnings shown by the method selector\n\n")
  cat(paste0("- ", icon, " when *", r$question, " = ", r$value, "*: ", r$message, collapse = "\n"), "\n")
  cat("\nRules are maintained in `data/misuse_rules.csv`.\n:::\n")
}
