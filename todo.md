# TODO

## Current Status

The template is in a good working state for continued review. Major AI-friendly
reorganization has been implemented: naming is lower-case and hyphenated,
Quarto YAML is standardized, the example workflow has setup/runner utilities,
student AI guidance and reusable prompts are present, generated-output policy is
documented, GitHub/private-repository cautions are included, the readme explains
how `.gitignore` prevents files from being committed, Positron is listed as the
first-choice editor/IDE, AI file roles are explained, scientific coding
guidelines are documented in `code-guidelines.md`, and `.gitignore` is
intentionally simple while allowing HTML outputs to be committed. The concise
AI-readable project summary now lives at `ai/project-summary.yml` and is
documented as secondary to the human-facing documentation rather than as a
human-facing source of truth.

If returning later, next likely discussion items are generated-output edge cases,
AI-use logging expectations, license/citation choices, dependency-management
levels, whether to add a start-a-new-project checklist, and whether to add a
changelog or template-notes file.

## Completed

These items have been addressed in the current template.

### Language-Agnostic / Multi-Language Setup

The template keeps the default example simple and R-based, while documenting a
clear extension pattern for multi-language projects.

- `code/` is organized by workflow stage with language-neutral folders:
  `processing/`, `exploration/`, `analysis/`, and `utilities/`.
- Mixed-language scripts can live together in the relevant workflow-stage
  folder. Language-specific subfolders are optional for larger projects.
- The default template remains R-only at runtime. Python, Julia, shell scripts,
  and other tools are documented as extension patterns rather than required
  examples.
- `readme.md`, `usage.md`, `agents.md`, `ai/project-summary.yml`, and the
  folder-specific readmes describe the default R/Quarto example as one
  supported path rather than the only possible path.

### Documented Semi-Automated Reproducibility Workflow

The example project is run in documented pieces. This supports reproducibility
without requiring a single large run-all file.

- `usage.md` provides the practical workflow inventory with steps, inputs,
  outputs, language, and run-order information.
- The main example run order is documented as:
  `code/processing/processing-code.r`,
  `code/exploration/eda-code.r`, and
  `code/analysis/statistical-analysis.r`.
- `code/utilities/check-project-setup.r` checks required files, folders, and R
  packages without changing anything.
- `code/utilities/run-example-workflow.r` optionally runs the setup check and
  the three example scripts in order.
- Product rendering is documented as a manual step after affected results have
  been regenerated.
- `agents.md` and `ai/review-checklist.md` explain that reproducibility means
  code-generated data, figures, tables, and analysis outputs rather than
  undocumented manual edits.

### Filename And Documentation Reorganization

The project now follows lower-case, hyphen-separated names more consistently.

- The main human-facing overview is `readme.md`.
- The top-level run instructions are in `usage.md`.
- AI/collaborator instructions are in `agents.md`.
- Product source files now use names such as `manuscript.qmd` and
  `supplementary-material.qmd`.
- Example data and output files now use names such as `example-data.xlsx`,
  `processed-data.rds`, `summary-table.rds`, and `result-table-1.csv`.
- Folder readmes use names such as `readme-code.md`, `readme-processing.md`,
  `readme-data.md`, and `readme-results.md`.
- Stale references to old file names have been updated in project docs and code.

### AI Collaboration Guidance

The AI-facing guidance has been updated for the current template.

- `agents.md` explains the semi-automated workflow, privacy rules, dependency
  expectations, placeholder checks, and review expectations for AI tools.
- `agents.md` tells AI tools to propose a Git commit and push when a coherent
  set of changes is complete and sharing the work would be useful.
- `ai/ai-policy-for-students.md` gives student-facing guidance on acceptable AI
  use, privacy, required understanding, and disclosure.
- `ai/ai-use-log.md` now explains how humans should read the log and how AI
  assistants/project maintainers should add concise entries.
- `ai/review-checklist.md` includes a template-placeholder checklist.
- `code-guidelines.md` documents coding expectations for humans and AI tools in
  scientific/research projects, including comments, hard failures, simplicity,
  dependency choices, R/tidyverse style, and reproducibility expectations.

### Generated Output Policy And Ignore Rules

Generated outputs are generally committed when they are reasonably small and do
not contain sensitive information. Large files and sensitive/restricted outputs
are exceptions.

- `readme.md`, `usage.md`, `agents.md`, `ai/project-summary.yml`, and
  `results/readme-results.md` document the generated-output policy.
- `.gitignore` keeps HTML files commit-able, while ignoring local caches,
  secrets, editor state, local Python/R environment folders, large data folders,
  private data folders, large result folders, and local AI/tool state.
- `results/large-files/`, `data/large-files/`, and `data/private-data/` keep
  committed readmes/placeholders but ignore local file contents by default.

### AI Prompt Templates

The `ai/prompts/` folder now contains prompt templates for:

- starting a project from the template;
- drafting or reviewing an analysis plan;
- reviewing a modeling plan;
- reviewing changed code;
- auditing reproducibility;
- reviewing final products such as reports, manuscripts, presentations, posters,
  or websites.

### Quarto YAML

The Quarto source files now use Quarto-style `format:` YAML rather than older
R Markdown `output:` YAML. HTML-oriented examples use embedded resources where
appropriate.

## Future

These are not urgent, but they would be useful future improvements.

- Run a full reproducibility pass in a clean environment with the required R
  packages installed. Regenerate the example processed data, figures, tables,
  and product files, then confirm that the committed outputs match the current
  code.
- Discuss details of the generated-output policy for specific project types only
  if future projects need stricter sensitive-output examples, Git LFS, or another
  large-file workflow.
- Discuss AI-use logging expectations further, especially which parts should be
  handled by human students, AI assistants, project maintainers, or course-site
  instructions.
- Discuss whether the new `code-guidelines.md` needs additional testing guidance
  or examples after it has been used in real projects.

- Add a short "how to start a new project" checklist for students and research
  group members after creating a repository from the template.
- Consider adding a small helper-function example under `code/utilities/` if
  future users need a concrete pattern for shared code.
- Consider adding a short `changelog.md` or `template-notes.md` so users can see
  what changed in the template over time without reading the full Git history.
- Decide whether to add a lightweight license and citation metadata file, and
  whether a non-commercial license is appropriate for this repository.
- Revisit dependency-management guidance later. Possible levels include manual
  package lists for class projects, lockfiles such as `renv` for stronger
  research reproducibility, and CI/containers for advanced long-term projects.
- Add optional guidance for GitHub issue templates, pull-request checklists,
  pre-commit hooks, and GitHub Actions, while keeping those features disabled by
  default.
- Consider adding optional session/software reporting to products, for example
  an appendix chunk with `sessionInfo()` or `sessioninfo::session_info()`.
- Decide how much AI-use documentation is appropriate for class assignments
  versus research manuscripts, since those contexts may need different levels of
  detail.
