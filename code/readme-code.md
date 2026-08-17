# Code

This folder and its subfolders contain project code. The default example uses R
and Quarto, but projects may add Python, Julia, shell scripts, or other
languages as needed.

The default folders are organized by workflow stage rather than by programming
language:

- `data-processing/`: import, clean, and transform raw data.
- `data-exploration/`: exploratory summaries and checks.
- `modeling-analysis/`: statistical modeling, simulations, prediction, or other
  main analyses.
- `figures-tables/`: turn computed results into presentation-ready figures and
  tables.
- `utilities/`: optional helper functions shared across stages.

A key idea in this template is the split between *computing* results and
*presenting* them. Code in `data-processing/`, `data-exploration/`, and
`modeling-analysis/` only computes and saves results (as RDS or CSV files). The
processing stage writes the cleaned dataset to `data/processed-data/`, and the
exploration and analysis stages write their computed results to
`results/output/`. The scripts in `figures-tables/` then read those results (and
the processed data where individual-level data is needed) and generate the
figures and tables that go into `results/figures/` and `results/tables/`. This
keeps a single, clear place where every figure and table is generated.

Place scripts where they fit in the workflow. For most projects,
mixed-language scripts can live side by side in the relevant stage folder.
Create language-specific subfolders only if the project becomes large enough
that this would make the code easier to maintain.

## Run Order

The practical run order for the example project is documented in
`../usage.md`.

## Example Code Files

The example code files are organized by workflow stage.

### Data processing

- `code/data-processing/processing-code.r` reads
  `data/raw-data/example-data.xlsx`, inspects the raw data, cleans problematic
  values, and saves `data/processed-data/processed-data.rds`.
- `code/data-processing/processing-file-v1.qmd` is a Quarto version of the
  processing workflow with code and explanation in one file. It reads
  `data/raw-data/example-data.xlsx` and saves
  `data/processed-data/processed-data.rds`.
- `code/data-processing/processing-file-v2.qmd` is another Quarto version of the
  processing workflow. It pulls labeled chunks from
  `code/data-processing/processing-code.r`, uses the raw example data, and saves
  `data/processed-data/processed-data.rds`.

### Data exploration

- `code/data-exploration/eda-code.r` loads
  `data/processed-data/processed-data.rds`, computes a data summary, and saves
  the computed result to `results/output/summary-table.rds`. It does not create
  figures or final tables.
- `code/data-exploration/eda.qmd` is a Quarto version of the exploratory
  analysis with code and explanation in one file. It uses the processed data and
  writes the same computed summary result.
- `code/data-exploration/eda-v2.qmd` is another Quarto version of the
  exploratory analysis. It pulls labeled chunks from
  `code/data-exploration/eda-code.r`, uses the processed data, and writes the
  same computed summary result.

### Modeling and analysis

- `code/modeling-analysis/statistical-analysis.r` loads
  `data/processed-data/processed-data.rds`, fits example linear models, and saves
  the tidied model results to `results/output/result-table-1.rds` and
  `results/output/result-table-2.rds`. It does not create figures or final
  tables.

### Figures and tables

- `code/figures-tables/make-tables.r` loads the computed results from
  `results/output/` and writes finalized tables to `results/tables/` as RDS
  files with CSV companions (`summary-table.*`, `result-table-1.*`,
  `result-table-2.*`). For the data summary this means real work: the raw
  `skimr` object is reduced to the columns a reader needs, with plain column
  names, instead of being passed through unchanged.
- `code/figures-tables/make-figures.r` loads
  `data/processed-data/processed-data.rds` and writes the exploratory and result
  figures to `results/figures/` (`height-distribution.png`,
  `weight-distribution.png`, `height-weight.png`,
  `height-weight-stratified.png`).

### Utilities

The `code/utilities/` folder is available for optional helper scripts, shared
functions, or small workflow utilities. The default example does not require a
utility script.

The Quarto files in `data-processing/` and `data-exploration/` are alternative
ways to run and document the same work. You do not need to run both an R script
and its matching Quarto version unless you want to compare them.

## Notes

The workflow is reproducible because data processing, result computation, figure
creation, table creation, and analysis are done by code. Do not manually edit
raw data files, generated tables, or generated figures to change results. If
something needs to change, update the relevant code and rerun the affected step.

Scripts should load data, perform actions, and save results in the appropriate
folders. Document the inputs each script takes and where outputs are placed.

If scripts need to be run in a specific order, document that here and, where
useful, in comments in the scripts themselves.

For AI-assisted work, keep scripts reviewable and make dependencies explicit.
Avoid code that relies on objects already loaded in an interactive session. If
AI tools helped write or modify meaningful code, the AI tool should add a short
note to `../ai/ai-use-log.md`. See `../ai/readme-ai.md` for when logging applies.
