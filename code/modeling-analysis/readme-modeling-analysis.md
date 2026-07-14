# Modeling and analysis

This folder contains code for the main statistical analysis or modeling.

The example is implemented as an R script, but projects can also use Quarto,
Python, Julia, or another language here.

Analysis code in this template only *computes and saves results*; it does not
draw figures or write final tables. Save generated model results, summaries, and
intermediate outputs as RDS or CSV files under `results/output/` so that the
figure- and table-generation scripts in `code/figures-tables/` can load them
from a standard location. In the example project,
`statistical-analysis.r` fits two linear models and saves the tidied model
results to `results/output/result-table-1.rds` and
`results/output/result-table-2.rds`.

If the analysis depends on outputs from processing or exploration, document that
order in `../readme-code.md` and in comments where helpful.
