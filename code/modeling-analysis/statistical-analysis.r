###############################
# modeling / analysis script
#
# Purpose:
#   Load the processed, cleaned data and fit simple linear models with Height
#   as the outcome. This script only computes and saves results; it does not
#   create any figures or final tables. Those are produced by the scripts in
#   code/figures-tables/, which read the results saved here.
#
# Inputs:
#   data/processed-data/processed-data.rds
#
# Outputs:
#   results/output/result-table-1.rds
#   results/output/result-table-2.rds
#
# How to run:
#   Rscript code/modeling-analysis/statistical-analysis.r
###############################

#load needed packages. make sure they are installed.
library(broom) #for cleaning up output from lm()
library(here) #for data loading/saving

#path to data
#note the use of the here() package and not absolute paths
data_location <- here::here("data","processed-data","processed-data.rds")

# Stop early if the input is missing, and name the script that creates it.
if (!file.exists(data_location)) {
  stop("Processed data not found at:\n  ", data_location,
       "\nRun code/data-processing/processing-code.r first. See usage.md.")
}

#load data.
mydata <- readRDS(data_location)


######################################
#Data fitting/statistical analysis
######################################

############################
#### First model fit
# fit linear model using height as outcome, weight as predictor

lmfit1 <- lm(Height ~ Weight, mydata)

# Place results from the fit into a data frame. Confidence intervals are saved
# here with the computed results so the table-generation stage can present them
# without refitting the model.
lmtable1 <- broom::tidy(lmfit1, conf.int = TRUE)

#look at fit results
print(lmtable1)

# save the model result object (not a final table) to results/output
result_file1 = here::here("results", "output", "result-table-1.rds")
saveRDS(lmtable1, file = result_file1)

############################
#### Second model fit
# fit linear model using height as outcome, weight and gender as predictor

lmfit2 <- lm(Height ~ Weight + Gender, mydata)

# Include confidence intervals for the same reason as in the first model.
lmtable2 <- broom::tidy(lmfit2, conf.int = TRUE)

#look at fit results
print(lmtable2)

# save the model result object (not a final table) to results/output
result_file2 = here::here("results", "output", "result-table-2.rds")
saveRDS(lmtable2, file = result_file2)
