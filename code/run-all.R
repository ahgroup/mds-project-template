#!/usr/bin/env Rscript

###############################
# run all example analysis code
#
# This script reproduces the example data processing, exploratory analysis, and
# statistical analysis outputs from a clean R session. Product rendering is
# optional because it requires Quarto and, for some outputs, additional system
# tools.
###############################

find_script_path <- function(default_path) {
  args <- commandArgs(trailingOnly = FALSE)
  file_arg <- grep("^--file=", args, value = TRUE)

  if (length(file_arg) > 0) {
    return(normalizePath(sub("^--file=", "", file_arg[1]), mustWork = FALSE))
  }

  normalizePath(default_path, mustWork = FALSE)
}

script_path <- find_script_path(file.path("code", "run-all.R"))
project_root <- normalizePath(file.path(dirname(script_path), ".."), mustWork = FALSE)

if (!file.exists(file.path(project_root, "README.md"))) {
  project_root <- normalizePath(getwd(), mustWork = FALSE)
}

old_wd <- setwd(project_root)
on.exit(setwd(old_wd), add = TRUE)

args <- commandArgs(trailingOnly = TRUE)
render_products <- "--render-products" %in% args
render_supplement <- "--render-supplement" %in% args
skip_checks <- "--skip-checks" %in% args
strict_checks <- "--strict" %in% args

run_script <- function(path) {
  if (!file.exists(path)) {
    stop("Cannot find script: ", path, call. = FALSE)
  }

  message("\nRunning ", path)
  plot_file <- tempfile(fileext = ".pdf")
  grDevices::pdf(file = plot_file)

  tryCatch(
    source(path, local = new.env(parent = globalenv())),
    finally = {
      if (grDevices::dev.cur() > 1L) {
        grDevices::dev.off()
      }
      unlink(plot_file)
    }
  )
}

render_qmd <- function(path) {
  if (!file.exists(path)) {
    stop("Cannot find Quarto file: ", path, call. = FALSE)
  }

  quarto <- Sys.which("quarto")
  if (!nzchar(quarto)) {
    stop(
      "Quarto was not found on PATH. Install Quarto or rerun without ",
      "--render-products.",
      call. = FALSE
    )
  }

  message("\nRendering ", path)
  status <- system2(quarto, c("render", path))

  if (!identical(status, 0L)) {
    stop("Quarto render failed for ", path, call. = FALSE)
  }
}

message("Reproducing example analysis from: ", project_root)

run_script("code/processing-code/processingcode.R")
run_script("code/eda-code/edacode.R")
run_script("code/analysis-code/statistical-analysis.R")

if (render_products) {
  render_qmd("products/report/report.qmd")
  render_qmd("products/manuscript/Manuscript.qmd")
  render_qmd("products/presentation/presentation.qmd")
}

if (render_supplement) {
  render_qmd("products/manuscript/supplement/Supplementary-Material.qmd")
}

if (!skip_checks) {
  rscript <- file.path(R.home("bin"), "Rscript")
  check_args <- "code/check-project.R"
  if (strict_checks) {
    check_args <- c(check_args, "--strict")
  }

  message("\nRunning project checks")
  status <- system2(rscript, check_args)

  if (!identical(status, 0L)) {
    stop("Project checks failed.", call. = FALSE)
  }
}

message("\nDone.")
