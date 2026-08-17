###############################
# table-generation script
#
# Purpose:
#   Load computed result objects from results/output/ and turn them into
#   finalized tables saved in results/tables/. Products such as the report,
#   manuscript, and supplement load the tables from results/tables/.
#
# Inputs:
#   results/output/summary-table.rds
#   results/output/result-table-1.rds
#   results/output/result-table-2.rds
#
# Outputs:
#   results/tables/summary-table.rds, results/tables/summary-table.csv
#   results/tables/result-table-1.rds, results/tables/result-table-1.csv
#   results/tables/result-table-2.rds, results/tables/result-table-2.csv
#
# How to run:
#   Rscript code/figures-tables/make-tables.r
###############################

#load needed packages. make sure they are installed.
library(here) #for data loading/saving
library(dplyr) #for selecting and reshaping columns

# Stop early if any expected input is missing, and name the scripts that create
# them. This stage runs last, so a missing input almost always means an earlier
# stage has not been run yet.
input_files = c(
  summary  = here::here("results", "output", "summary-table.rds"),
  result_1 = here::here("results", "output", "result-table-1.rds"),
  result_2 = here::here("results", "output", "result-table-2.rds")
)
missing_inputs = input_files[!file.exists(input_files)]
if (length(missing_inputs) > 0) {
  stop("Missing input file(s):\n  ", paste(missing_inputs, collapse = "\n  "),
       "\nRun the exploration and analysis scripts first. See usage.md.")
}

## ---- summary-table --------
# Turn the raw skimr summary into a table meant to be read by a person.
#
# The object saved by the exploration step is a skimr summary. That is a good
# object to look at in the console, but it is not a finished table: it has 15
# columns, most of them empty for any given variable, and a mini-histogram
# column made of block characters that does not survive being placed in a
# document or written to a CSV file.
#
# Turning it into a finished table is exactly the job of this stage, so we keep
# the columns a reader actually needs and give them plain names.
summary_result = readRDS(input_files[["summary"]])

summary_table = summary_result %>%
  dplyr::select(
    Variable   = skim_variable,
    Type       = skim_type,
    Missing    = n_missing,
    Mean       = numeric.mean,
    SD         = numeric.sd,
    Min        = numeric.p0,
    Median     = numeric.p50,
    Max        = numeric.p100,
    Categories = factor.top_counts
  ) %>%
  # Round the numeric summaries. Full floating-point precision is not
  # meaningful for a summary table and makes it harder to read.
  # The numeric columns are empty for categorical variables and the Categories
  # column is empty for numeric ones. That is expected for a mixed-type summary.
  dplyr::mutate(dplyr::across(c(Mean, SD, Min, Median, Max),
                              function(x) round(x, 1)))

# Numeric columns are kept numeric so the CSV companion stays useful for
# further work rather than being formatted text.
saveRDS(summary_table, file = here::here("results", "tables", "summary-table.rds"))
utils::write.csv(summary_table,
                 file = here::here("results", "tables", "summary-table.csv"),
                 row.names = FALSE)

## ---- result-tables --------
# The model results from broom::tidy() are already in a tidy, readable shape,
# so they only need to be written out in both formats.
result_table_1 = readRDS(input_files[["result_1"]])
saveRDS(result_table_1, file = here::here("results", "tables", "result-table-1.rds"))
utils::write.csv(result_table_1,
                 file = here::here("results", "tables", "result-table-1.csv"),
                 row.names = FALSE)

result_table_2 = readRDS(input_files[["result_2"]])
saveRDS(result_table_2, file = here::here("results", "tables", "result-table-2.rds"))
utils::write.csv(result_table_2,
                 file = here::here("results", "tables", "result-table-2.csv"),
                 row.names = FALSE)
