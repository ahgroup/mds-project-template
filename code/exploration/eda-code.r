## ---- packages --------
#load needed packages. make sure they are installed.
library(here) #for data loading/saving
library(dplyr)
library(skimr)
library(ggplot2)

## ---- loaddata --------
#Path to data. Note the use of the here() package and not absolute paths
data_location <- here::here("data","processed-data","processed-data.rds")
#load data
mydata <- readRDS(data_location)

## ---- table1 --------
summary_df = skimr::skim(mydata)
print(summary_df)
# save to file
summary_table_file = here("results","tables", "summary-table.rds")
saveRDS(summary_df, file = summary_table_file)
summary_df_csv = summary_df %>% dplyr::select(-dplyr::ends_with(".hist"))
summary_table_csv_file = here("results", "tables", "summary-table.csv")
utils::write.csv(summary_df_csv, file = summary_table_csv_file, row.names = FALSE)

## ---- height --------
p1 <- mydata %>% ggplot(aes(x=Height)) + geom_histogram(bins = 10)
if (interactive()) print(p1)
figure_file = here("results", "figures", "height-distribution.png")
ggsave(filename = figure_file, plot=p1, width = 7, height = 7, units = "in")

## ---- weight --------
p2 <- mydata %>% ggplot(aes(x=Weight)) + geom_histogram(bins = 10)
if (interactive()) print(p2)
figure_file = here("results", "figures", "weight-distribution.png")
ggsave(filename = figure_file, plot=p2, width = 7, height = 7, units = "in")

## ---- fitfig1 --------
p3 <- mydata %>% ggplot(aes(x=Height, y=Weight)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
if (interactive()) print(p3)
figure_file = here("results","figures", "height-weight.png")
ggsave(filename = figure_file, plot=p3, width = 7, height = 7, units = "in")

## ---- fitfig2 --------
p4 <- mydata %>% ggplot(aes(x=Height, y=Weight, color = Gender)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
if (interactive()) print(p4)
figure_file = here("results","figures", "height-weight-stratified.png")
ggsave(filename = figure_file, plot=p4, width = 7, height = 7, units = "in")


