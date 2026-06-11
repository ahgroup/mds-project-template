# Code

This folder and its subfolders contain project code. The default example uses R
and Quarto, but projects may add Python, Julia, shell scripts, or other
languages as needed.

The default folders are organized by workflow stage rather than by programming
language:

- `processing/`: import, clean, and transform raw data.
- `exploration/`: exploratory summaries, checks, tables, and figures.
- `analysis/`: statistical modeling, simulations, prediction, or other main
  analyses.
- `utilities/`: optional helper functions shared across stages.

Place scripts where they fit in the workflow. For most projects,
mixed-language scripts can live side by side in the relevant stage folder.
Create language-specific subfolders only if the project becomes large enough
that this would make the code easier to maintain.

## Run Order

The practical run order for the example project is documented in
`../usage.md`.

## Example Code Files

| Stage | File | What It Does | Main Inputs | Main Outputs |
| --- | --- | --- | --- | --- |
| Processing | `code/processing/processing-code.r` | Reads the example Excel file, inspects the raw data, cleans problematic values, and saves processed data. | `data/raw-data/example-data.xlsx` | `data/processed-data/processed-data.rds` |
| Processing | `code/processing/processing-file-v1.qmd` | Quarto version of the processing workflow with code and explanation in one file. | `data/raw-data/example-data.xlsx` | `data/processed-data/processed-data.rds` |
| Processing | `code/processing/processing-file-v2.qmd` | Quarto version that pulls labeled chunks from `processing-code.r`. | `code/processing/processing-code.r` and raw data | `data/processed-data/processed-data.rds` |
| Exploration | `code/exploration/eda-code.r` | Loads processed data and creates summary tables and exploratory figures. | `data/processed-data/processed-data.rds` | `results/tables/summary-table.*`, `results/figures/*.png` |
| Exploration | `code/exploration/eda.qmd` | Quarto version of the exploratory analysis with code and explanation in one file. | `data/processed-data/processed-data.rds` | `results/tables/summary-table.*`, `results/figures/*.png` |
| Exploration | `code/exploration/eda-v2.qmd` | Quarto version that pulls labeled chunks from `eda-code.r`. | `code/exploration/eda-code.r` and processed data | `results/tables/summary-table.*`, `results/figures/*.png` |
| Analysis | `code/analysis/statistical-analysis.r` | Fits example linear models and saves model-result tables. | `data/processed-data/processed-data.rds` | `results/tables/result-table-1.*`, `results/tables/result-table-2.*` |
| Utility | `code/utilities/check-project-setup.r` | Checks required files, folders, and R packages without changing anything. | Project files and installed R packages | Console messages only |
| Utility | `code/utilities/run-example-workflow.r` | Runs the setup check and then runs the processing, exploration, and analysis scripts in order. | Example scripts and data | Regenerated processed data, figures, and tables |

The Quarto files in `processing/` and `exploration/` are alternative ways to
run and document the same work. You do not need to run both an R script and its
matching Quarto version unless you want to compare them.

## Notes

The workflow is reproducible because data processing, figure creation, table
creation, and analysis are done by code. Do not manually edit raw data files,
generated tables, or generated figures to change results. If something needs to
change, update the relevant code and rerun the affected step.

Scripts should load data, perform actions, and save results in the appropriate
folders. Document the inputs each script takes and where outputs are placed.

If scripts need to be run in a specific order, document that here and, where
useful, in comments in the scripts themselves.

For AI-assisted work, keep scripts reviewable and make dependencies explicit.
Avoid code that relies on objects already loaded in an interactive session. If
AI tools helped write or modify meaningful code, add a short note to
`../ai/ai-use-log.md`.
