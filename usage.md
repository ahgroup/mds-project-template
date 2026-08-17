# Usage

This file is meant to explain how to run and reproduce the project. 

The default example uses R and Quarto. Projects can add Python, Julia, shell
scripts, or other tools later without changing the overall folder structure.

## Before You Start

Work from the project root folder. In Positron, open this repository as a
project or folder so the project root is set automatically. Other editors, such
as RStudio or VS Code, are also fine. If you use a terminal or another editor,
make sure your working directory is the folder that contains `readme.md`,
`usage.md`, and the main project folders.

Install the example R packages listed in `readme.md` before running the example
workflow. The example products render tables with `flextable`, so that package
is needed for rendering as well as for running the scripts.

Install Quarto if you want to render reports, manuscripts, presentations, or other Quarto products.

Install MS Word or LibreOffice if you want to be able to open word documents created from Quarto source documents.

Install a TeX system if you want to generate pdf files from Quarto. TinyTex is recommended. It can be installed by typing `quarto install tinytex` into the console/terminal.

## Example Code Files

The example workflow is organized by stage, with a deliberate split between
*computing* results and *presenting* them: the processing, exploration, and
analysis stages only compute and save results, and the figures-tables stage
turns those results into figures and tables.

For a description of each example code file, including its inputs and outputs,
see `code/readme-code.md`. The run order is given below.


## Run The Example Workflow

This template uses a documented, semi-automated workflow. That means the work is
reproducible from code, but you can still run the code in understandable pieces.
You should not manually edit raw Excel files, generated tables, or generated
figures. Instead, update the code and rerun the affected step.

For the example project, the simplest path is to run the R scripts manually in this order:

1. `code/data-processing/processing-code.r`
2. `code/data-exploration/eda-code.r`
3. `code/modeling-analysis/statistical-analysis.r`
4. `code/figures-tables/make-tables.r`
5. `code/figures-tables/make-figures.r`

Steps 1–3 compute and save results (the processing step writes processed data to
`data/processed-data/`; the exploration and analysis steps write computed results
to `results/output/`). Steps 4–5 read those results and produce the finalized
tables in `results/tables/` and figures in `results/figures/`. Steps 4 and 5 can
be run in either order, but both must run after steps 1–3.

If a script fails because a package is missing, install that package and rerun the script. Do not silently install packages inside
analysis scripts.

## Render Products

After the results have been regenerated, render the products you need.

```sh
quarto render products/report/report.qmd
quarto render products/manuscript/manuscript.qmd
quarto render products/presentation/example/presentation.qmd
```

The supplementary material renders to PDF and may require a TeX installation:

```sh
quarto render products/manuscript/supplement/supplementary-material.qmd
```

The template also ships a tutorial presentation that introduces the template
itself. It does not depend on the example results, so it only needs to be
rerendered if you edit it:

```sh
quarto render products/presentation/tutorial/tutorial-presentation.qmd
```

The rendered products (`report.html`, `manuscript.docx`,
`supplementary-material.pdf`, and the presentation HTML files) are committed to
the repository so users can see the expected output without rendering
everything first. Rerender and recommit them when the results or the product
sources change.

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
- If AI tools helped with meaningful work, follow the disclosure guidance in
  `ai/ai-use-policy.md`. The AI tool should update `ai/ai-use-log.md`; see
  `ai/readme-ai.md` for when logging applies. Human users may read that log as
  needed.
- Check for unresolved template placeholders such as `NAME`, `LINK-GOES-HERE`,
  sample email addresses, and example author details. Replace them with
  project-specific information or document why they remain.


## Adding Another Language

Place scripts in the workflow-stage folder where they belong. For example:

```text
code/data-processing/02-geocode-data.py
code/modeling-analysis/03-run-simulation.jl
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
