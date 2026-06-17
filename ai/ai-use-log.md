# AI-use log

This file records meaningful AI-assisted work on the project. It is written by
AI tools. AI tools may also read it when past AI-use context is useful. Human
users may read it as needed, but they are not expected to write or edit it.

The log is a transparency record, not proof that the work is correct. Do not
include full chat transcripts by default. Do not include sensitive, private,
regulated, identifiable, restricted, unpublished, or license-protected data.

Routine maintenance of this template does not need to be logged beyond existing
entries unless the project owner asks for more detail. In a project created from
the template, the AI tool should update this log when it meaningfully helps with
project-specific work.

## What AI Tools Should Log

AI tools should add an entry when they meaningfully help with project-specific
work, such as:

- drafting, editing, or reviewing analysis code;
- designing or reviewing a data-processing workflow;
- suggesting data-cleaning checks, exploratory plots, or model diagnostics;
- helping troubleshoot errors that affect the project workflow;
- reviewing whether outputs are traceable to code;
- drafting or reviewing report, manuscript, presentation, or documentation text;
- checking for reproducibility, privacy, citation, or placeholder problems.

AI tools do not need to log every small interaction. For example, they usually do
not need to log quick grammar fixes, generic explanations, minor formatting help,
or routine template-maintenance edits that do not affect project-specific work.

## What Each Entry Should Include

A useful entry should be short and readable. It should explain:

- when the AI-assisted work happened;
- which AI tool was used;
- what the tool helped with;
- which files, code, outputs, or project materials were changed or reviewed;
- which checks were run, or why checks were not run;
- what human review remains.

Write entries as short sections of text rather than as a table. That makes the
log easier for AI tools to update and easier for human users to read when needed.

## Log Entries

The first entry below records template-maintenance history. When starting a new
project from this template, an AI tool may keep it for provenance, move it
elsewhere, or replace the log entries with project-specific AI-use notes if the
project owner wants that.

### 2026-06-15 — New project instructions

Andreas Handel and Herman used Hermes Agent to add prose instructions for
starting a new project from the template and to update the to-do notes.

Files changed or reviewed: `new-project-instructions.md`, `readme.md`,
the then-existing `todo.md`, `ai/project-summary.yml`, and
`ai/ai-use-log.md`.

Checks run: `git diff --check`. This was a documentation-only change, so the
example workflow was not rerun.

Human review notes: wording and recommendations should still be reviewed by the
project owner before being treated as final guidance.

## Example Entries

### YYYY-MM-DD — Short description

AI tool: TOOL.

Purpose: Briefly describe what AI helped with.

Files changed or reviewed: `path/to/file`, `another/path`, or a short prose
description if many files were involved.

Checks run: Describe scripts, products, or manual checks that were run. If no
checks were run, briefly say why.

Human review notes: Describe what the human checked or what still needs human
review.

### 2026-05-20 — Drafted data-cleaning code

AI tool: ChatGPT/Codex.

Purpose: Drafted a first version of a data-cleaning function and suggested
review checks.

Files changed or reviewed: `code/processing/processing-code.r`.

Checks run: Reran affected processing and analysis scripts listed in `usage.md`.

Human review notes: Verified cleaning logic against the codebook and confirmed
that raw data were unchanged.

### 2026-05-21 — Reproducibility review before submission

AI tool: ChatGPT/Codex.

Purpose: Reviewed the project for reproducibility problems before submission.

Files changed or reviewed: `readme.md`, `usage.md`, `code/`, and
`products/report/report.qmd`.

Checks run: Reran the affected scripts and rerendered the affected report.

Human review notes: Confirmed outputs were produced by code and no private data
were added.

### 2026-05-22 — Exploratory analysis suggestions

AI tool: ChatGPT/Codex.

Purpose: Suggested possible exploratory plots and model diagnostics.

Files changed or reviewed: `code/exploration/eda-code.r` and
`code/analysis/statistical-analysis.r`.

Checks run: Reran the example workflow after edits.

Human review notes: Human author chose which suggestions were appropriate for
the question and data.
