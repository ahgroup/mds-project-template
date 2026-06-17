# Usage

This file explains how to run and reproduce the example project. It is meant
for humans. Run the commands yourself, inspect messages and warnings, and adjust
the workflow as the project changes.

The default example uses R and Quarto. Projects can add Python, Julia, shell
scripts, or other tools later without changing the overall folder structure.

## Before You Start

Work from the project root folder. In Positron, open this repository as a
project or folder so the project root is set automatically. Other editors, such
as RStudio or VS Code, are also fine. If you use a terminal or another editor,
make sure your working directory is the folder that contains `readme.md`,
`usage.md`, and the main project folders.

Install the example R packages before running the example workflow:

```r
install.packages(c("broom", "dplyr", "ggplot2", "here", "knitr",
                   "readxl", "skimr", "tidyr"))
```

Install Quarto if you want to render reports, manuscripts, presentations, or
other Quarto products.

## Example Code Files

The example workflow is organized by stage.

| Stage | File | What It Does | Main Inputs | Main Outputs |
| --- | --- | --- | --- | --- |
| Processing | `code/processing/processing-code.r` | Reads the example Excel file, inspects the raw data, cleans problematic values, and saves processed data. | `data/raw-data/example-data.xlsx` | `data/processed-data/processed-data.rds` |
| Processing | `code/processing/processing-file-v1.qmd` | Quarto version of the processing workflow with code and explanation in one file. | `data/raw-data/example-data.xlsx` | `data/processed-data/processed-data.rds` |
| Processing | `code/processing/processing-file-v2.qmd` | Quarto version that pulls labeled chunks from `processing-code.r`. | `code/processing/processing-code.r` and raw data | `data/processed-data/processed-data.rds` |
| Exploration | `code/exploration/eda-code.r` | Loads processed data and creates summary tables and exploratory figures. | `data/processed-data/processed-data.rds` | `results/tables/summary-table.*`, `results/figures/*.png` |
| Exploration | `code/exploration/eda.qmd` | Quarto version of the exploratory analysis with code and explanation in one file. | `data/processed-data/processed-data.rds` | `results/tables/summary-table.*`, `results/figures/*.png` |
| Exploration | `code/exploration/eda-v2.qmd` | Quarto version that pulls labeled chunks from `eda-code.r`. | `code/exploration/eda-code.r` and processed data | `results/tables/summary-table.*`, `results/figures/*.png` |
| Analysis | `code/analysis/statistical-analysis.r` | Fits example linear models and saves model-result tables. | `data/processed-data/processed-data.rds` | `results/tables/result-table-1.*`, `results/tables/result-table-2.*` |

The Quarto files in `code/processing/` and `code/exploration/` are alternative
ways to run and document the same work. You do not need to run both an R script
and its matching Quarto version unless you want to compare them.

## Run The Example Workflow

This template uses a documented, semi-automated workflow. That means the work is
reproducible from code, but you can still run the code in understandable pieces.
You should not manually edit raw Excel files, generated tables, or generated
figures to make the results look right. Instead, update the code and rerun the
affected step.

Before running the workflow, you can check whether the required files, folders,
and R packages are available:

```sh
Rscript code/utilities/check-project-setup.r
```

For the example project, the simplest path is to run the R scripts manually in
this order:

1. `code/processing/processing-code.r`
2. `code/exploration/eda-code.r`
3. `code/analysis/statistical-analysis.r`

From Positron or another editor such as RStudio or VS Code, open each script and
run or source it in that order.

From a terminal, run the scripts one at a time:

```sh
Rscript code/processing/processing-code.r
Rscript code/exploration/eda-code.r
Rscript code/analysis/statistical-analysis.r
```

If you want to run the complete example workflow in one command, use the
optional runner. The runner simply performs the setup check and then sources the
three example scripts in the same documented order:

```sh
Rscript code/utilities/run-example-workflow.r
```

If a script fails because a package is missing, install that package
deliberately and rerun the script. Do not silently install packages inside
analysis scripts.

## Render Products

After the results have been regenerated, render only the products you need.

```sh
quarto render products/report/report.qmd
quarto render products/manuscript/manuscript.qmd
quarto render products/presentation/presentation.qmd
```

The supplementary material renders to PDF and may require a TeX installation:

```sh
quarto render products/manuscript/supplement/supplementary-material.qmd
```

## Review And Reproducibility Checks

Generated outputs are generally committed if they are reasonably small and do
not contain sensitive information. Do not commit large generated files or outputs
that contain sensitive, private, regulated, identifiable, or otherwise restricted
information. Instead, put those files in a documented ignored location such as
`results/large-files/` or `data/private-data/`.

Before sharing work or accepting AI-assisted changes, review the project
manually:

- Confirm that files in `data/raw-data/` were not edited.
- Confirm that generated outputs in `results/` can be traced to code in
  `code/`.
- Confirm that no credentials, tokens, private data, or local-only paths were
  added.
- Confirm that package and software requirements are documented in `readme.md`
  or another human-facing documentation file.
- For reports or manuscripts, decide whether to keep, remove, or adapt optional
  software/session information such as `sessionInfo()` based on the project needs.
- Confirm that code follows `code-guidelines.md`, especially documentation,
  hard-failure behavior, simplicity, mature dependency choices, and
  project-relative paths.
- If code changed generated outputs, rerun the affected scripts manually.
- If product text or results changed, rerender the affected product files.
- If AI tools helped with meaningful work, follow the disclosure guidance in
  `ai/ai-use-policy.md`. The AI tool should update `ai/ai-use-log.md` when
  logging is appropriate; human users may read that log as needed.
- Check for unresolved template placeholders such as `NAME`, `LINK-GOES-HERE`,
  sample email addresses, and example author details. Replace them with
  project-specific information or document why they remain.


## Adding Another Language

Place scripts in the workflow-stage folder where they belong. For example:

```text
code/processing/02-geocode-data.py
code/analysis/03-run-simulation.jl
```

Then update this file with:

- the new script name;
- what it does;
- what inputs it needs;
- what outputs it creates;
- when it should be run;
- any package or environment setup required.

Follow `code-guidelines.md` when adding or editing code. In particular, keep
scientific code simple, thoroughly commented, strict about unexpected inputs,
and runnable in a clean session.

Create language-specific folders only if the project becomes large enough that
separate `code/r/`, `code/python/`, or `code/julia/` folders would make the code
easier to maintain.
