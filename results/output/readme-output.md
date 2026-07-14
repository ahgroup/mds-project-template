# Output

This folder holds computed results saved by the exploration and analysis code,
stored as RDS or CSV files.

In this template, the code in `code/data-exploration/` and
`code/modeling-analysis/` only computes and saves results here; it does not
create figures or final tables. The scripts in `code/figures-tables/` then read
these files and turn them into the presentation-ready figures and tables that go
in `results/figures/` and `results/tables/`.

For the example project, this folder receives:

- `summary-table.rds`: the data summary computed by
  `code/data-exploration/eda-code.r`.
- `result-table-1.rds` and `result-table-2.rds`: the tidied linear-model results
  computed by `code/modeling-analysis/statistical-analysis.r`.

These files are regenerated whenever the exploration and analysis code is rerun.
