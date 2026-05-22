## ---- packages --------
#load needed packages. make sure they are installed.
library(here) #for data loading/saving
library(dplyr)
library(skimr)
library(ggplot2)

## ---- loaddata --------
#Path to data. Note the use of the here() package and not absolute paths
data_location <- here::here("data","processed-data","processeddata.rds")
#load data
mydata <- readRDS(data_location)

## ---- table1 --------
summary_df = skimr::skim(mydata)
print(summary_df)
# save to file
summarytable_file = here("results","tables", "summarytable.rds")
saveRDS(summary_df, file = summarytable_file)
summary_df_csv = summary_df %>% dplyr::select(-dplyr::ends_with(".hist"))
summarytable_csv_file = here("results", "tables", "summarytable.csv")
utils::write.csv(summary_df_csv, file = summarytable_csv_file, row.names = FALSE)

## ---- height --------
p1 <- mydata %>% ggplot(aes(x=Height)) + geom_histogram(bins = 10)
plot(p1)
figure_file = here("results", "figures", "height-distribution.png")
ggsave(filename = figure_file, plot=p1, width = 7, height = 7, units = "in")

## ---- weight --------
p2 <- mydata %>% ggplot(aes(x=Weight)) + geom_histogram(bins = 10)
plot(p2)
figure_file = here("results", "figures", "weight-distribution.png")
ggsave(filename = figure_file, plot=p2, width = 7, height = 7, units = "in")

## ---- fitfig1 --------
p3 <- mydata %>% ggplot(aes(x=Height, y=Weight)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
plot(p3)
figure_file = here("results","figures", "height-weight.png")
ggsave(filename = figure_file, plot=p3, width = 7, height = 7, units = "in")

## ---- fitfig2 --------
p4 <- mydata %>% ggplot(aes(x=Height, y=Weight, color = Gender)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
plot(p4)
figure_file = here("results","figures", "height-weight-stratified.png")
ggsave(filename = figure_file, plot=p4, width = 7, height = 7, units = "in")


