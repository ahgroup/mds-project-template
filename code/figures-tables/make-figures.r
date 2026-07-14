###############################
# figure-generation script
#
# This script loads the processed data and creates the exploratory and result
# figures saved in results/figures/. Products such as the report, manuscript,
# and supplement load the figures from results/figures/.
#
# The individual-level processed data is needed to draw these figures, so this
# script reads data/processed-data/processed-data.rds directly. Summary results
# used for tables are handled separately by make-tables.r.
#
# Inputs:
#   data/processed-data/processed-data.rds
#
# Outputs:
#   results/figures/height-distribution.png
#   results/figures/weight-distribution.png
#   results/figures/height-weight.png
#   results/figures/height-weight-stratified.png
###############################

#load needed packages. make sure they are installed.
library(here) #for data loading/saving
library(dplyr) #for data handling and the pipe
library(ggplot2) #for plotting

## ---- loaddata --------
#Path to data. Note the use of the here() package and not absolute paths
data_location <- here::here("data", "processed-data", "processed-data.rds")
mydata <- readRDS(data_location)

## ---- height --------
p1 <- mydata %>% ggplot(aes(x=Height)) + geom_histogram(bins = 10)
if (interactive()) print(p1)
figure_file = here::here("results", "figures", "height-distribution.png")
ggsave(filename = figure_file, plot=p1, width = 7, height = 7, units = "in")

## ---- weight --------
p2 <- mydata %>% ggplot(aes(x=Weight)) + geom_histogram(bins = 10)
if (interactive()) print(p2)
figure_file = here::here("results", "figures", "weight-distribution.png")
ggsave(filename = figure_file, plot=p2, width = 7, height = 7, units = "in")

## ---- fitfig1 --------
p3 <- mydata %>% ggplot(aes(x=Height, y=Weight)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
if (interactive()) print(p3)
figure_file = here::here("results", "figures", "height-weight.png")
ggsave(filename = figure_file, plot=p3, width = 7, height = 7, units = "in")

## ---- fitfig2 --------
p4 <- mydata %>% ggplot(aes(x=Height, y=Weight, color = Gender)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, formula = y ~ x)
if (interactive()) print(p4)
figure_file = here::here("results", "figures", "height-weight-stratified.png")
ggsave(filename = figure_file, plot=p4, width = 7, height = 7, units = "in")
