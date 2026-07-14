###############################
# table-generation script
#
# This script loads computed result objects from results/output/ and turns them
# into finalized tables saved in results/tables/. Products such as the report,
# manuscript, and supplement load the tables from results/tables/.
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
###############################

#load needed packages. make sure they are installed.
library(here) #for data loading/saving
library(dplyr) #for selecting columns

## ---- summary-table --------
# Load the exploratory summary result and save it as a finalized table.
summary_df = readRDS(here::here("results", "output", "summary-table.rds"))
saveRDS(summary_df, file = here::here("results", "tables", "summary-table.rds"))
# The skimr summary carries mini-histogram columns that do not survive a plain
# CSV, so we drop them for the CSV companion used for sharing/review.
summary_df_csv = summary_df %>% dplyr::select(-dplyr::ends_with(".hist"))
utils::write.csv(summary_df_csv,
                 file = here::here("results", "tables", "summary-table.csv"),
                 row.names = FALSE)

## ---- result-tables --------
# Load each model result object and save finalized RDS + CSV tables.
result_table_1 = readRDS(here::here("results", "output", "result-table-1.rds"))
saveRDS(result_table_1, file = here::here("results", "tables", "result-table-1.rds"))
utils::write.csv(result_table_1,
                 file = here::here("results", "tables", "result-table-1.csv"),
                 row.names = FALSE)

result_table_2 = readRDS(here::here("results", "output", "result-table-2.rds"))
saveRDS(result_table_2, file = here::here("results", "tables", "result-table-2.rds"))
utils::write.csv(result_table_2,
                 file = here::here("results", "tables", "result-table-2.csv"),
                 row.names = FALSE)
