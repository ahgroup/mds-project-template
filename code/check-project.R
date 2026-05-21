#!/usr/bin/env Rscript

###############################
# project checks
#
# This script runs lightweight checks for the template structure, package
# availability, privacy-related ignore rules, and example generated outputs.
# It is intentionally local and simple; no GitHub Actions or renv setup is
# required.
###############################

find_script_path <- function(default_path) {
  args <- commandArgs(trailingOnly = FALSE)
  file_arg <- grep("^--file=", args, value = TRUE)

  if (length(file_arg) > 0) {
    return(normalizePath(sub("^--file=", "", file_arg[1]), mustWork = FALSE))
  }

  normalizePath(default_path, mustWork = FALSE)
}

script_path <- find_script_path(file.path("code", "check-project.R"))
project_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = FALSE)

if (!file.exists(file.path(project_root, "README.md"))) {
  project_root <- normalizePath(getwd(), mustWork = FALSE)
}

old_wd <- setwd(project_root)
on.exit(setwd(old_wd), add = TRUE)

args <- commandArgs(trailingOnly = TRUE)
strict <- "--strict" %in% args

failures <- character()
warnings <- character()

add_failure <- function(message) {
  failures <<- c(failures, message)
}

add_warning <- function(message) {
  warnings <<- c(warnings, message)
}

check_files_exist <- function(paths, label) {
  missing <- paths[!file.exists(paths)]
  if (length(missing) > 0) {
    add_failure(paste0("Missing ", label, ": ", paste(missing, collapse = ", ")))
  }
}

check_dirs_exist <- function(paths, label) {
  missing <- paths[!dir.exists(paths)]
  if (length(missing) > 0) {
    add_failure(paste0("Missing ", label, ": ", paste(missing, collapse = ", ")))
  }
}

required_dirs <- c(
  "assets",
  "code",
  "code/analysis-code",
  "code/eda-code",
  "code/processing-code",
  "data",
  "data/raw-data",
  "data/processed-data",
  "data/private-data",
  "data/large-files",
  "products",
  "results",
  "results/figures",
  "results/tables",
  "ai"
)

required_files <- c(
  "README.md",
  "AGENTS.md",
  "project-metadata.yml",
  "data/data-use-notes.md",
  "ai/README.md",
  "ai/ai-use-log.md",
  "ai/review-checklist.md",
  "code/run-all.R",
  "code/check-project.R",
  "code/processing-code/processingcode.R",
  "code/eda-code/edacode.R",
  "code/analysis-code/statistical-analysis.R",
  "products/report/report.qmd",
  "products/manuscript/Manuscript.qmd",
  "products/presentation/presentation.qmd"
)

check_dirs_exist(required_dirs, "required folder(s)")
check_files_exist(required_files, "required file(s)")

required_packages <- c(
  "broom",
  "dplyr",
  "ggplot2",
  "here",
  "knitr",
  "readxl",
  "skimr",
  "tidyr"
)

missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_packages) > 0) {
  add_failure(
    paste0(
      "Missing required R package(s): ",
      paste(missing_packages, collapse = ", "),
      ". Install them before running the example workflow."
    )
  )
}

example_outputs <- c(
  "data/processed-data/processeddata.rds",
  "results/tables/summarytable.rds",
  "results/tables/summarytable.csv",
  "results/tables/resulttable1.rds",
  "results/tables/resulttable1.csv",
  "results/tables/resulttable2.rds",
  "results/tables/resulttable2.csv",
  "results/figures/height-distribution.png",
  "results/figures/weight-distribution.png",
  "results/figures/height-weight.png",
  "results/figures/height-weight-stratified.png"
)

missing_outputs <- example_outputs[!file.exists(example_outputs)]
if (length(missing_outputs) > 0) {
  add_warning(
    paste0(
      "Example generated output(s) are missing: ",
      paste(missing_outputs, collapse = ", "),
      ". Run Rscript code/run-all.R or adjust this check for your project."
    )
  )
}

if (file.exists(".gitignore")) {
  gitignore <- readLines(".gitignore", warn = FALSE)
  expected_ignore_rules <- c(
    ".Renviron",
    ".env",
    "data/private-data/*",
    "data/large-files/*"
  )
  missing_rules <- expected_ignore_rules[
    !vapply(
      expected_ignore_rules,
      function(rule) any(trimws(gitignore) == rule),
      logical(1)
    )
  ]

  if (length(missing_rules) > 0) {
    add_warning(
      paste0(
        ".gitignore is missing recommended privacy/local-data rule(s): ",
        paste(missing_rules, collapse = ", ")
      )
    )
  }
} else {
  add_failure("Missing .gitignore.")
}

local_secret_files <- c(".Renviron", ".env")
present_secret_files <- local_secret_files[file.exists(local_secret_files)]
if (length(present_secret_files) > 0) {
  add_warning(
    paste0(
      "Local secret/environment file(s) are present: ",
      paste(present_secret_files, collapse = ", "),
      ". Confirm they are ignored and do not commit them."
    )
  )
}

text_files <- list.files(
  c("code", "products"),
  pattern = "\\.(R|qmd|md)$",
  recursive = TRUE,
  full.names = TRUE,
  ignore.case = TRUE
)

text_files <- setdiff(text_files, file.path("code", "check-project.R"))

absolute_path_pattern <- "[A-Za-z]:\\\\|/Users/|/home/"
path_hits <- character()

for (path in text_files) {
  lines <- readLines(path, warn = FALSE)
  hit_index <- grep(absolute_path_pattern, lines)

  if (length(hit_index) > 0) {
    hit_lines <- lines[hit_index]
    explanatory <- grepl(
      "absolute path|you never want|C:\\\\yourname|C:\\\\ahandel",
      hit_lines,
      ignore.case = TRUE
    )
    hit_index <- hit_index[!explanatory]
  }

  if (length(hit_index) > 0) {
    path_hits <- c(path_hits, paste0(path, ":", hit_index))
  }
}

if (length(path_hits) > 0) {
  add_warning(
    paste0(
      "Potential absolute local path reference(s): ",
      paste(path_hits, collapse = ", ")
    )
  )
}

if (strict && length(warnings) > 0) {
  failures <- c(failures, paste0("Strict-mode warning: ", warnings))
}

cat("Project check\n")
cat("Working directory: ", project_root, "\n", sep = "")

if (length(warnings) > 0) {
  cat("\nWarnings:\n")
  for (warning in warnings) {
    cat("- ", warning, "\n", sep = "")
  }
}

if (length(failures) > 0) {
  cat("\nFailures:\n")
  for (failure in failures) {
    cat("- ", failure, "\n", sep = "")
  }
  quit(status = 1)
}

cat("\nOK: project checks passed.\n")
