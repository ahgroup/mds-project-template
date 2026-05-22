# Workflow Inventory

Keep this file short and current. It helps students, collaborators, and AI
assistants understand which scripts run, in what order, and what each script
produces.

The default workflow is also encoded in `run-all.qmd`.

| Step | Stage | Language | Command or file | Inputs | Outputs |
| --- | --- | --- | --- | --- | --- |
| 1 | processing | R | `code/processing/processingcode.R` | `data/raw-data/exampledata.xlsx` | `data/processed-data/processeddata.rds` |
| 2 | exploration | R | `code/exploration/edacode.R` | `data/processed-data/processeddata.rds` | `results/tables/summarytable.*`, `results/figures/*.png` |
| 3 | analysis | R | `code/analysis/statistical-analysis.R` | `data/processed-data/processeddata.rds` | `results/tables/resulttable*.rds`, `results/tables/resulttable*.csv` |

## Adding Another Language

Place scripts in the workflow-stage folder where they belong. For example:

```text
code/processing/02-geocode-data.py
code/analysis/03-run-simulation.jl
```

Then add the command to `run-all.qmd` and update the table above. Keep package
or environment setup documented in the project README or `project-metadata.yml`.
