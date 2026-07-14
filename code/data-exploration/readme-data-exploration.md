# Data exploration

This folder contains code for exploratory data analysis, often called EDA.

Exploration code loads the processed data, checks what is in it, and computes
early summary results. In this template, exploration code only *computes and
saves results*; it does not draw figures or write final tables. In the example
project, `eda-code.r` saves a summary result to `results/output/` as an RDS
file. The finalized tables and figures are then produced by the scripts in
`code/figures-tables/`, which read the saved results and the processed data.

The example shows the exploration in three formats:

- `eda-code.r`: an R script that computes and saves the summary result.
- `eda.qmd`: a Quarto file with code and explanation in one file.
- `eda-v2.qmd`: a Quarto file that pulls labeled chunks from `eda-code.r`.

Different ways of using R and Quarto are shown. Projects can also place Python,
Julia, or other exploratory scripts here when those tools are useful.

Exploration is often iterative. You may notice something during exploration that
requires more data cleaning. If that happens, update the processing code and
rerun the needed steps.
