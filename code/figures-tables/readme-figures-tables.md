# Figures and tables

This folder contains the code that turns computed results into presentation-ready
figures and tables.

In this template, the other code stages (`data-processing/`,
`data-exploration/`, `modeling-analysis/`) only compute and save results. They
do not create figures or final tables. This folder is the single place where
figures and tables are generated, which makes it easy to see and rerun
everything that produces a presentation-ready output.

The example uses two R scripts:

- `make-tables.r` loads the computed result objects from `results/output/`
  (`summary-table.rds`, `result-table-1.rds`, `result-table-2.rds`) and writes
  finalized tables to `results/tables/` as RDS files with CSV companions.
- `make-figures.r` loads the processed data from
  `data/processed-data/processed-data.rds` and writes the exploratory and result
  figures to `results/figures/` as PNG files. The figures need individual-level
  data, so this script reads the processed data directly rather than a summary
  result.

Run these scripts after the processing, exploration, and analysis code has
produced its outputs. See `../../usage.md` for the full run order.

Projects can add more scripts here (or use Quarto, Python, Julia, or another
language) as the number of figures and tables grows. Keep each script focused
and documented, and have it read its inputs from `results/output/` or
`data/processed-data/` and write its outputs to the relevant subfolders of
`results/`.
