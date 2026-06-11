# agents.md

This repository is a template for reproducible data analysis projects. The
default example uses R, Quarto, Git, and GitHub, but the structure is meant to
support additional languages such as Python or Julia without major
reorganization. It is used for research group projects and for teaching
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

- `readme.md`: human-facing project overview and getting-started notes.
- `usage.md`: human-facing instructions for manually running the example
  workflow, rendering products, and reviewing reproducibility.
- `assets/`: static non-code project materials, including references, CSL files,
  manually created schematics, PDFs, and other supporting files.
- `code/`: all analysis code. The example project is split into workflow-stage
  folders: `processing/`, `exploration/`, and `analysis/`.
- `data/`: data at different stages. Raw data should not be edited by hand.
- `products/`: final or near-final deliverables such as reports, manuscripts,
  supplements, presentations, posters, and apps.
- `results/`: code-generated outputs such as figures, tables, model objects, and
  intermediate analysis outputs.
- `ai/`: AI workflow notes, prompt templates, AI-use logs, student AI-use
  policy, and review checklists.

## Core Rules

- Do not modify files in `data/raw-data/` unless explicitly asked. Raw data is
  the immutable source.
- Do not place manually edited results in `results/`. If a manually created file
  is needed, place it in `assets/` and document its source.
- Use project-relative paths. Prefer `here::here()` in R code and comparable
  project-root helpers in other languages.
- Keep code and outputs synchronized. If code changes generated results, rerun
  the affected scripts and update generated outputs when appropriate.
- Keep edits scoped to the task. Avoid unrelated cleanup in template files.
- Fix obvious small typos or mistakes you encounter and report what you fixed.
  If a possible issue is unclear, scientific, statistical, or larger in scope,
  report it without changing it.
- Use lower-case, descriptive file and folder names with words separated by `-`
  unless a standard file name requires otherwise.
- Do not introduce hidden dependencies on a local R session, local file paths, or
  private environment variables.
- Check for unresolved template placeholders such as `NAME`, `LINK-GOES-HERE`,
  sample email addresses, and example author details when reviewing a project.
  Report them rather than silently guessing replacements.

## Privacy and Sensitive Data

- Treat all non-example data as potentially sensitive until the project owner has
  documented otherwise.
- Do not paste sensitive, regulated, or private data into external AI tools.
- Do not upload private data, API keys, credentials, IRB materials, DUAs, or
  unpublished identifiable data to third-party services unless the project owner
  has explicitly approved that workflow.
- Use `data/readme-data.md` to document data source, sensitivity, access
  limits, and whether AI tools may inspect the data.
- Use ignored folders such as `data/private-data/` or `data/large-files/` for
  local-only files that should not be committed.

## Generated Output Policy

Generated outputs are generally committed when they are reasonably small and do
not contain sensitive information. This helps students and collaborators see
expected results, render products, and compare their regenerated outputs.

Do not commit generated outputs when they are too large for ordinary Git/GitHub
use or when they contain sensitive, private, regulated, identifiable, or
otherwise restricted information. Put large outputs in `results/large-files/` or
another documented ignored location. For sensitive outputs, commit documentation
that explains how authorized collaborators can regenerate or obtain them without
exposing the restricted content.

## Reproducibility Workflow

This template uses a documented, semi-automated workflow. Reproducible means
that data processing, figure creation, table creation, and analysis are done by
code rather than by undocumented manual edits. It does not mean every project
must have one giant run-all script. Use `usage.md` to understand which scripts
to run and in what order.

For the example project, the intended order is:

- optionally run `code/utilities/check-project-setup.r`;
- run `code/processing/processing-code.r`;
- run `code/exploration/eda-code.r`;
- run `code/analysis/statistical-analysis.r`;
- alternatively run `code/utilities/run-example-workflow.r` to perform the
  setup check and the three example scripts in order;
- render only the products that need to be updated.

If required software or packages are missing, report that clearly. Do not
silently install packages.

## Dependency Policy

The template does not enable `renv`, virtual environments, Conda, Poetry, Julia
environments, or containers by default. Environment managers are recommended for
research projects that need stronger long-term reproducibility, but they remain
optional because they add complexity for new users and classroom settings.

If a project chooses to use an environment manager, document that decision in
`readme.md` or `project-metadata.yml`, commit the appropriate lock or project
files, and make sure local package libraries or virtual environments are not
committed.

## AI Assistance Documentation

When AI tools are used for meaningful project work, record a short summary in
`ai/ai-use-log.md` when maintaining or updating the project. The log should
capture what AI helped with, which files were changed or reviewed, and what
human checks were performed. Student-facing AI-use expectations are summarized
in `ai/ai-policy-for-students.md`. Do not store full chat transcripts unless the
project owner explicitly wants that and privacy has been checked.

## Review Expectations

Before handing work back to a human collaborator:

- Follow `usage.md` to rerun affected scripts when code or generated outputs
  changed. Use `Rscript code/utilities/check-project-setup.r` when checking
  project readiness.
- Render affected Quarto products when product source files or generated results
  changed.
- Mention any checks that could not be run.
- Verify that raw data was not edited.
- Verify that generated outputs are traceable to code.
- Verify that no obvious secrets, local paths, or private data were added.

## Git Commit and Push Suggestions

When a coherent set of changes is complete, the AI assistant should propose a
Git commit and push to the user if that would help preserve the work or share it
with collaborators. This is especially appropriate after reproducibility
updates, documentation changes, analysis-code changes, regenerated outputs, or
reviewed fixes.

Before proposing a commit and push:

- Check `git status` and summarize the changed files.
- Confirm that checks were run, or clearly state why they were not.
- Confirm that raw data, private data, credentials, and local-only files were
  not added.
- Suggest a concise commit message.

Do not commit or push automatically unless the user explicitly asks for it or
approves the proposal. If the user approves, commit only the intended changes
and push to the appropriate GitHub remote/branch.

## Optional Future Enhancements

GitHub Actions, pre-commit hooks, and stricter dependency locking can improve
research reproducibility. They are intentionally not enabled by default in this
template so that it remains approachable for Git/GitHub novices.
