# TODO

## Completed

These items have been addressed in the current template.

### Language-Agnostic / Multi-Language Setup

The template now keeps the default example simple and R-based, while documenting
a clear extension pattern for multi-language projects.

- `code/` is organized by workflow stage with language-neutral folders:
  `processing/`, `exploration/`, `analysis/`, and `utilities/`.
- Mixed-language scripts can live together in the relevant workflow-stage
  folder. Language-specific subfolders are optional for larger projects.
- The default template remains R-only at runtime. Python, Julia, shell scripts,
  and other tools are documented as extension patterns rather than required
  examples.
- `readme.md`, `usage.md`, `AGENTS.md`, `project-metadata.yml`, and the
  folder-specific readmes describe the default R/Quarto example as one
  supported path rather than the only possible path.

### Manual Reproducibility Workflow

The project no longer has a `run-all` or `check-project` script. Users run
workflow steps manually.

- `usage.md` now provides the practical workflow inventory with steps, inputs,
  outputs, language, and run-order information.
- The main example run order is documented as:
  `code/processing/processingcode.R`,
  `code/exploration/edacode.R`, and
  `code/analysis/statistical-analysis.R`.
- Product rendering is documented as a manual step after affected results have
  been regenerated.
- `AGENTS.md` and `ai/review-checklist.md` now point AI tools toward the manual
  workflow instead of assuming an automated runner.

### Readme And Documentation Reorganization

The readme files have been renamed and reorganized around folder context.

- The main human-facing overview is now `readme.md`.
- The top-level run instructions are now in `usage.md`.
- Folder readmes now use names such as `readme-code.md`,
  `readme-processing.md`, `readme-data.md`, and `readme-results.md`.
- Extra standalone notes such as the old data-use notes were folded into the
  relevant folder readmes, especially `data/readme-data.md`.
- Stale references to old runner/check files and old top-level readme names have
  been removed from the project docs.

### AI Collaboration Guidance

The AI-facing guidance has been updated for the current template.

- `AGENTS.md` now explains the manual workflow, privacy rules, dependency
  expectations, and review expectations for AI tools.
- `AGENTS.md` now tells AI tools to propose a Git commit and push when a
  coherent set of changes is complete and sharing the work would be useful.
- AI-use logging and review guidance remain in `ai/ai-use-log.md` and
  `ai/review-checklist.md`.

## Future

These are not urgent, but they would be useful future improvements.

- Run a full manual reproducibility pass in a clean environment with the
  required R packages installed. Regenerate the example processed data, figures,
  tables, and product files, then confirm that the committed outputs match the
  current code.
- Decide on a consistent policy for generated example outputs. The rendered
  report HTML is no longer committed, but generated files still exist in
  `data/processed-data/`, `results/figures/`, `results/tables/`, and
  `products/presentation/media/`. Committing them helps novice users see
  expected outputs; not committing them makes the repository cleaner and
  emphasizes regeneration from code.
- Decide whether to rename remaining non-lowercase product source files, such
  as `products/manuscript/Manuscript.qmd` and
  `products/manuscript/supplement/Supplementary-Material.qmd`, to match the
  lower-case naming convention.
- Add a short "how to start a new project" checklist for students and research
  group members after creating a repository from the template.
- Consider adding guidance to `readme.md`, `usage.md`, or
  `ai/review-checklist.md` for checking unresolved template placeholders such as
  `NAME`, `LINK-GOES-HERE`, and example author details.
- Consider adding a small helper-function example under `code/utilities/` if
  future users need a concrete pattern for shared code.
- Consider adding a short `CHANGELOG.md` or `template-notes.md` so users can see
  what changed in the template over time without reading the full Git history.
- Decide whether to add a lightweight `LICENSE` and citation metadata file
  (`CITATION.cff`) so users know how to reuse and cite the template.
- Add optional guidance for GitHub issue templates, pull-request checklists,
  pre-commit hooks, and GitHub Actions, while keeping those features disabled by
  default.
- Consider adding optional session/software reporting to products, for example
  an appendix chunk with `sessionInfo()` or `sessioninfo::session_info()`.
- Decide how much AI-use documentation is appropriate for class assignments
  versus research manuscripts, since those contexts may need different levels of
  detail.
