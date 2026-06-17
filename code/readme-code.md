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

The example code files are organized by workflow stage.

### Processing

- `code/processing/processing-code.r` reads
  `data/raw-data/example-data.xlsx`, inspects the raw data, cleans problematic
  values, and saves `data/processed-data/processed-data.rds`.
- `code/processing/processing-file-v1.qmd` is a Quarto version of the processing
  workflow with code and explanation in one file. It reads
  `data/raw-data/example-data.xlsx` and saves
  `data/processed-data/processed-data.rds`.
- `code/processing/processing-file-v2.qmd` is another Quarto version of the
  processing workflow. It pulls labeled chunks from
  `code/processing/processing-code.r`, uses the raw example data, and saves
  `data/processed-data/processed-data.rds`.

### Exploration

- `code/exploration/eda-code.r` loads
  `data/processed-data/processed-data.rds` and creates summary tables in
  `results/tables/summary-table.*` and exploratory figures in
  `results/figures/`.
- `code/exploration/eda.qmd` is a Quarto version of the exploratory analysis
  with code and explanation in one file. It uses the processed data and writes
  the same kinds of summary tables and figures.
- `code/exploration/eda-v2.qmd` is another Quarto version of the exploratory
  analysis. It pulls labeled chunks from `code/exploration/eda-code.r`, uses the
  processed data, and writes the same kinds of summary tables and figures.

### Analysis

- `code/analysis/statistical-analysis.r` loads
  `data/processed-data/processed-data.rds`, fits example linear models, and saves
  model-result tables in `results/tables/result-table-1.*` and
  `results/tables/result-table-2.*`.

### Utilities

The `code/utilities/` folder is available for optional helper scripts, shared
functions, or small workflow utilities. The default example does not require a
utility script.

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
AI tools helped write or modify meaningful code, the AI tool should add a short
note to `../ai/ai-use-log.md` when the project owner wants that work logged.
