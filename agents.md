# agents.md

This repository is a template for reproducible data analysis projects. The
default example uses R, Quarto, Git, and GitHub, but the structure is meant to
support additional languages such as Python or Julia without major
reorganization. It is intended for reproducible modeling and data science
workflows.

These instructions are for AI coding agents working in this repository and for
human users who want to understand how AI tools should work here.

## Project Goals

- Keep the project reproducible from raw data to final products.
- Keep raw data unchanged.
- Keep generated outputs traceable to code.
- Keep AI assistance transparent, reviewed, and privacy-aware.
- Keep the template approachable for users who are new to
  Git/GitHub.

## Repository Structure

- `readme.md`: human-facing project overview and getting-started notes.
- `usage.md`: human-facing instructions for manually running the example
  workflow, rendering products, and reviewing reproducibility.
- `code-guidelines.md`: human- and AI-facing coding guidelines for reproducible
  scientific code.
- `assets/`: static non-code project materials, including references, CSL files,
  manually created schematics, PDFs, and other supporting files.
- `code/`: all analysis code. The example project is split into workflow-stage
  folders: `processing/`, `exploration/`, and `analysis/`.
- `data/`: data at different stages. Raw data should not be edited by hand.
- `products/`: final or near-final deliverables such as reports, manuscripts,
  supplements, presentations, posters, and apps.
- `results/`: code-generated outputs such as figures, tables, model objects, and
  intermediate analysis outputs.
- `ai/`: AI workflow notes, prompt templates, an AI-use policy, an AI-use log,
  and an AI-oriented project summary.

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
- Follow `code-guidelines.md` for code written or edited in this project.
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
- A private GitHub repository is not a guarantee that sensitive or restricted
  material is safe to commit. Treat private repositories as a collaboration and
  version-control tool, not as a substitute for approved secure storage.

## Generated Output Policy

Generated outputs are generally committed when they are reasonably small and do
not contain sensitive information. This helps users see
expected results, render products, and compare their regenerated outputs.

Do not commit generated outputs when they are too large for ordinary Git/GitHub
use or when they contain sensitive, private, regulated, identifiable,
license-protected, or otherwise restricted information. Put large outputs in
`results/large-files/` or another documented ignored location. For sensitive
outputs, commit documentation that explains how authorized users can
regenerate or obtain them without exposing the restricted content.

## Reproducibility Workflow

This template uses a documented, semi-automated workflow. Reproducible means
that data processing, figure creation, table creation, and analysis are done by
code rather than by undocumented manual edits. It does not mean every project
must have one giant run-all script. Use `usage.md` to understand which scripts
to run and in what order.

For the example project, the intended order is:

- run `code/processing/processing-code.r`;
- run `code/exploration/eda-code.r`;
- run `code/analysis/statistical-analysis.r`;
- render only the products that need to be updated.

If required software or packages are missing, report that clearly. Do not
silently install packages.

## Dependency Policy

The template does not enable `renv`, virtual environments, Conda, Poetry, Julia
environments, containers, or GitHub Actions by default. Keep the default
dependency approach lightweight and beginner-friendly.

Use the lowest dependency-management level that honestly supports the project:

- Manual package lists documented in human-facing files are the default for this
  template and are suitable for many small or straightforward projects.
- Lockfiles or environment managers such as `renv`, Conda, Python virtual
  environments, Poetry, or Julia project files are optional when exact versions
  matter for longer-term reproducibility.
- CI or containers are advanced options for long-term, multi-user,
  multi-language, publication, or regulated workflows that need controlled reruns
  across machines.

Do not add `renv`, containers, CI, or new environment files unless the user asks
for them or the project documentation clearly calls for them. If a project uses
an environment manager, document that decision in `readme.md` or another
human-facing documentation file, commit the appropriate lock or project files,
and make sure local package libraries or virtual environments are not committed.

## AI Assistance Documentation

AI-related files have different expected readers and writers:

- `ai/prompts/`: reusable prompts, read/copied by humans and AI tools, and
  edited by humans or AI maintainers when workflows change.
- `ai/project-summary.yml`: a concise summary file for AI tools to read and
  write. Human users are not expected to read, write, or maintain it. It is not
  authoritative; if it disagrees with human-facing documentation, follow the
  human-facing documentation and update the summary when maintaining the repo.
- `ai/readme-ai.md` and `ai/ai-use-policy.md`: human-facing AI guidance files
  that may be edited when project policy changes.
- `ai/ai-use-log.md`: a transparency record written by AI tools. AI tools may
  also read it when they need past AI-use context. Human users may read it as
  needed, but are not expected to write or edit it.
- Local AI/tool state folders such as `.ai-local/`, `.ai-cache/`, `.codex/`, and
  local Claude settings are ignored and should not be committed. AI tools may
  read and write those files for their own operation; humans usually do not need
  to inspect them.

When AI tools are used for meaningful project-specific work, the AI tool should
record a short summary in `ai/ai-use-log.md` if the project owner wants the log
maintained. Use short text sections rather than table rows. The log should
capture what AI helped with, which files were changed or reviewed, and what
human checks were performed. Routine template maintenance does not need extra logging beyond
existing entries unless the project owner asks for more detail. AI-use expectations are summarized in `ai/ai-use-policy.md` and apply uniformly
to projects created from this template. Do not store full chat
transcripts unless the project owner explicitly wants that and privacy has been
checked.

## Review Expectations

Before handing work back to a human user:

- Follow `usage.md` to rerun affected scripts when code or generated outputs
  changed.
- Check code changes against `code-guidelines.md`, especially documentation,
  hard-failure behavior, simplicity, dependency choices, project-relative paths,
  and clean-session reproducibility.
- Render affected Quarto products when product source files or generated results
  changed.
- Mention any checks that could not be run.
- Verify that raw data was not edited.
- Verify that generated outputs are traceable to code.
- Verify that no obvious secrets, local paths, or private data were added.


## Git Commit and Push Suggestions

When a coherent set of changes is complete, the AI assistant should commit the
intended changes automatically. This helps preserve useful checkpoints without
requiring the user to ask after every small but meaningful update. Automatic
commits are especially appropriate after reproducibility updates, documentation
changes, analysis-code changes, regenerated outputs, or reviewed fixes.

Before committing:

- Check `git status` and make sure only intended files are included.
- Confirm that checks were run, or clearly state why they were not.
- Confirm that raw data, private data, credentials, and local-only files were
  not added.
- Use a concise commit message.
- Commit messages should start with "AI: " to make it clear that this commit was
  AI generated.

Do not push automatically unless the user explicitly asks for a push. Instead,
mention the local commit hash when reporting the completed work. After several
useful local commits, or when the work reaches a natural sharing/review point,
suggest that pushing to the GitHub remote might be useful. If the user approves
or asks for a push, push to the appropriate GitHub remote/branch.