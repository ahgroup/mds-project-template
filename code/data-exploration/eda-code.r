###############################
# exploratory analysis script
#
# This script loads the processed, cleaned data and computes exploratory
# summary results. It computes and saves results as an RDS file in
# results/output/. It does not create any figures or final tables. Those are
# produced by the scripts in code/figures-tables/, which read the results
# saved here.
#
# Note the ## ---- name ---- notation. It lets the labeled chunks be pulled
# into the Quarto document eda-v2.qmd.
# see here: https://bookdown.org/yihui/rmarkdown-cookbook/read-chunk.html
###############################


## ---- packages --------
#load needed packages. make sure they are installed.
library(here) #for data loading/saving
library(skimr) #for a quick data summary

## ---- loaddata --------
#Path to data. Note the use of the here() package and not absolute paths
data_location <- here::here("data","processed-data","processed-data.rds")
#load data
mydata <- readRDS(data_location)

## ---- table1 --------
# Compute a summary of the data with skimr.
# We only compute and save the summary object here, as an RDS file in
# results/output/. The polished summary table is generated later by
# code/figures-tables/make-tables.r, which reads this file.
summary_df = skimr::skim(mydata)
print(summary_df)
# save the computed summary result (not a final table) to results/output
summary_result_file = here::here("results", "output", "summary-table.rds")
saveRDS(summary_df, file = summary_result_file)
