###############################
# modeling / analysis script
#
# This script loads the processed, cleaned data, fits simple linear models,
# and saves the model result objects as RDS files in results/output/.
# It only computes and saves results; it does not create any figures or final
# tables. Those are produced by the scripts in code/figures-tables/, which read
# the results saved here.
###############################

#load needed packages. make sure they are installed.
library(broom) #for cleaning up output from lm()
library(here) #for data loading/saving

#path to data
#note the use of the here() package and not absolute paths
data_location <- here::here("data","processed-data","processed-data.rds")

#load data.
mydata <- readRDS(data_location)


######################################
#Data fitting/statistical analysis
######################################

############################
#### First model fit
# fit linear model using height as outcome, weight as predictor

lmfit1 <- lm(Height ~ Weight, mydata)

# place results from fit into a data frame with the tidy function
lmtable1 <- broom::tidy(lmfit1)

#look at fit results
print(lmtable1)

# save the model result object (not a final table) to results/output
result_file1 = here::here("results", "output", "result-table-1.rds")
saveRDS(lmtable1, file = result_file1)

############################
#### Second model fit
# fit linear model using height as outcome, weight and gender as predictor

lmfit2 <- lm(Height ~ Weight + Gender, mydata)

# place results from fit into a data frame with the tidy function
lmtable2 <- broom::tidy(lmfit2)

#look at fit results
print(lmtable2)

# save the model result object (not a final table) to results/output
result_file2 = here::here("results", "output", "result-table-2.rds")
saveRDS(lmtable2, file = result_file2)
