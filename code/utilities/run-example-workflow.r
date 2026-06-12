###############################
# run example workflow
#
# This script runs the example workflow in the documented order.
# It is intentionally simple. It does not hide the steps in functions or loops
# so that a beginning user can see exactly what happens.
#
# Important reproducibility idea:
# "Automated" does not mean everything has to happen in one giant script.
# It means that data cleaning, figure creation, table creation, and analysis
# are done by documented code rather than by undocumented manual edits.
#
# How to run this script:
# 1. Open this project folder in Positron or another editor, such as RStudio or VS Code.
# 2. Run this command from the project root:
#      Rscript code/utilities/run-example-workflow.r
# 3. Read the messages. If a step fails, fix the problem and rerun the script.
###############################

cat("\nRunning the example workflow...\n\n")

# First check that required files, folders, and packages are available.
# If the setup check fails, this workflow stops before doing any analysis.
cat("Step 0: checking project setup\n")
source("code/utilities/check-project-setup.r", local = TRUE)

# Step 1: processing.
# This reads the raw Excel file, cleans the data, and saves processed data.
cat("\nStep 1: processing raw data\n")
source("code/processing/processing-code.r", local = TRUE)

# Step 2: exploration.
# This reads the processed data and creates exploratory tables and figures.
cat("\nStep 2: creating exploratory summaries and figures\n")
source("code/exploration/eda-code.r", local = TRUE)

# Step 3: analysis.
# This reads the processed data, fits simple example models, and saves tables.
cat("\nStep 3: running statistical analysis\n")
source("code/analysis/statistical-analysis.r", local = TRUE)

cat("\nExample workflow completed.\n")
cat("Generated outputs should now be in data/processed-data/, results/figures/, and results/tables/.\n")
cat("If you changed report, manuscript, or presentation files, render those products separately as described in usage.md.\n\n")
