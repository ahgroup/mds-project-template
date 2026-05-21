# AGENTS.md

This repository is a template for reproducible data analysis projects using R,
Quarto, Git, and GitHub. It is used for research group projects and for teaching
modeling/data science workflows.

These instructions are for AI coding agents and human collaborators who use AI
tools in this repository.

## Project Goals

- Keep the project reproducible from raw data to final products.
- Keep raw data unchanged.
- Keep generated outputs traceable to code.
- Keep AI assistance transparent, reviewed, and privacy-aware.
- Keep the template approachable for students and collaborators who are new to
  Git/GitHub.

## Repository Structure

- `assets/`: static non-code project materials, including references, CSL files,
  manually created schematics, PDFs, and other supporting files.
- `code/`: all analysis code. The example project is split into processing,
  exploratory analysis, and statistical analysis code.
- `data/`: data at different stages. Raw data should not be edited by hand.
- `products/`: final or near-final deliverables such as reports, manuscripts,
  supplements, presentations, posters, and apps.
- `results/`: code-generated outputs such as figures, tables, model objects, and
  intermediate analysis outputs.
- `ai/`: AI workflow notes, prompt templates, AI-use logs, and review checklists.

## Core Rules

- Do not modify files in `data/raw-data/` unless explicitly asked. Raw data is
  the immutable source.
- Do not place manually edited results in `results/`. If a manually created file
  is needed, place it in `assets/` and document its source.
- Use project-relative paths. Prefer `here::here()` in R code.
- Keep code and outputs synchronized. If code changes generated results, rerun
  the affected scripts and update generated outputs when appropriate.
- Keep edits scoped to the task. Avoid unrelated cleanup in template files.
- Use lower-case, descriptive file and folder names with words separated by `-`
  unless a standard file name requires otherwise.
- Do not introduce hidden dependencies on a local R session, local file paths, or
  private environment variables.

## Privacy and Sensitive Data

- Treat all non-example data as potentially sensitive until the project owner has
  documented otherwise.
- Do not paste sensitive, regulated, or private data into external AI tools.
- Do not upload private data, API keys, credentials, IRB materials, DUAs, or
  unpublished identifiable data to third-party services unless the project owner
  has explicitly approved that workflow.
- Use `data/data-use-notes.md` to document data source, sensitivity, access
  limits, and whether AI tools may inspect the data.
- Use ignored folders such as `data/private-data/` or `data/large-files/` for
  local-only files that should not be committed.

## Reproducibility Workflow

From a clean R session, the example project should be reproducible with:

```sh
Rscript code/run-all.R
```

To also render Quarto products when Quarto is installed:

```sh
Rscript code/run-all.R --render-products
```

To run local project checks:

```sh
Rscript code/check-project.R
```

If a required R package is missing, report it clearly. Do not silently install
packages.

## Dependency Policy

The template does not enable `renv` by default. `renv` is recommended for
research projects that need stronger long-term reproducibility, but it remains
optional because it adds complexity for new users and classroom settings.

If a project chooses to use `renv`, document that decision in the README or
`project-metadata.yml`, commit the lockfile, and make sure the package library
itself is not committed.

## AI Assistance Documentation

When AI tools are used for meaningful project work, record a short summary in
`ai/ai-use-log.md`. The log should capture what AI helped with, which files were
changed or reviewed, and what human checks were performed. Do not store full chat
transcripts unless the project owner explicitly wants that and privacy has been
checked.

## Review Expectations

Before handing work back to a human collaborator:

- Run `Rscript code/check-project.R` when R is available.
- Run `Rscript code/run-all.R` if code or generated outputs changed.
- Mention any checks that could not be run.
- Verify that raw data was not edited.
- Verify that generated outputs are traceable to code.
- Verify that no obvious secrets, local paths, or private data were added.

## Optional Future Enhancements

GitHub Actions, pre-commit hooks, and stricter dependency locking can improve
research reproducibility. They are intentionally not enabled by default in this
template so that it remains approachable for Git/GitHub novices.
