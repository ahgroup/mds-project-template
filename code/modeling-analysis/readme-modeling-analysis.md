# Modeling and analysis

This folder contains code for the main statistical analysis or modeling.

The example is implemented as an R script, but projects can also use Quarto,
Python, Julia, or another language here.

For substantial code, like code to run modeling and analysis pipeline, it is usually not a good idea to wrap it inside Quarto documents. Instead, you want stand-alone code that is well-documented and that generates output that can eventually be turned into figures, tables and numbers to be used in Quarto documents such as your manuscript file.

Modeling and analysis code should focus on computing whatever it is you want to compute, and save the generated model results, summaries, and
intermediate outputs as RDS or CSV files under `results/output/`. These files are then later processed by the figure- and table-generation scripts in `code/figures-tables/`. In the example project, `statistical-analysis.r` fits two linear models and saves the tidied model
results to `results/output/result-table-1.rds` and
`results/output/result-table-2.rds`.

If the analysis depends on outputs from processing or exploration, document that
order in `../readme-code.md` and in comments where helpful.
