###############################
# check project setup
#
# This script checks whether the example project is ready to run.
# It does not change files, install packages, or fix anything automatically.
#
# How to run this script:
# 1. Open this project folder in Positron or another editor, such as RStudio or VS Code.
# 2. Run this command from the project root:
#      Rscript code/utilities/check-project-setup.r
# 3. Read the messages. If anything says MISSING, fix that item and run again.
###############################

cat("\nChecking the example project setup...\n\n")

# Keep track of whether we find any problems.
# The script stops with an error at the end if something important is missing.
problems_found <- FALSE

# Small helper function for printing easy-to-read status messages.
print_check <- function(ok, message) {
  if (ok) {
    cat("OK:      ", message, "\n", sep = "")
  } else {
    cat("MISSING: ", message, "\n", sep = "")
  }
}

# The script should be run from the project root.
# The project root is the folder that contains readme.md and usage.md.
root_files <- c("readme.md", "usage.md")
root_files_present <- file.exists(root_files)

for (i in seq_along(root_files)) {
  print_check(root_files_present[i], paste0("project root file ", root_files[i]))
}

if (!all(root_files_present)) {
  problems_found <- TRUE
  cat("\nThis script is probably not being run from the project root.\n")
  cat("Move to the folder that contains readme.md and usage.md, then run it again.\n")
}

# Check folders used by the example workflow.
needed_folders <- c(
  "code/processing",
  "code/exploration",
  "code/analysis",
  "data/raw-data",
  "data/processed-data",
  "results/figures",
  "results/tables"
)

for (folder in needed_folders) {
  ok <- dir.exists(folder)
  print_check(ok, paste0("folder ", folder))
  if (!ok) problems_found <- TRUE
}

# Check input data and example scripts.
needed_files <- c(
  "data/raw-data/example-data.xlsx",
  "code/processing/processing-code.r",
  "code/exploration/eda-code.r",
  "code/analysis/statistical-analysis.r"
)

for (file in needed_files) {
  ok <- file.exists(file)
  print_check(ok, paste0("file ", file))
  if (!ok) problems_found <- TRUE
}

# Check the R packages used by the example workflow.
# This script only checks for packages. It does not install them.
needed_packages <- c(
  "broom",
  "dplyr",
  "ggplot2",
  "here",
  "knitr",
  "readxl",
  "skimr",
  "tidyr"
)

cat("\nChecking required R packages...\n")

for (package in needed_packages) {
  ok <- requireNamespace(package, quietly = TRUE)
  print_check(ok, paste0("R package ", package))
  if (!ok) problems_found <- TRUE
}

# Finish with a clear message.
if (problems_found) {
  cat("\nOne or more required items are missing.\n")
  cat("Install missing R packages or restore missing files/folders, then run this script again.\n")
  stop("Project setup check failed.", call. = FALSE)
}

cat("\nAll setup checks passed. The example workflow should be ready to run.\n")
cat("Next, run: Rscript code/utilities/run-example-workflow.r\n\n")
