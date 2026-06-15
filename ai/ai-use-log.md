# AI-use log

This file records meaningful AI-assisted work on the project. It is meant to be
read by humans who want to understand how AI contributed and what was checked.

## For human readers

Read this log to understand whether AI helped with project setup, code,
documentation, analysis planning, troubleshooting, or review. Do not treat the
log as proof that the work is correct. It is a transparency record. The actual
work still needs human review and reproducibility checks.

Students usually do not need to edit this file manually unless the instructor or
project owner asks them to. Student-facing AI-use expectations are summarized in
`ai-policy-for-students.md`.

## For AI assistants and project maintainers

Add a concise entry when AI meaningfully helps with project work, especially
when files are changed or reviewed. Keep entries practical and privacy-aware.
Do not include full chat transcripts by default, and do not include sensitive
or private data.

A useful entry should say:

- what AI tool was used;
- what it helped with;
- which files were changed or reviewed;
- which checks were run, or why checks were not run;
- what human review remains.

## Log table

| Date | Person | AI tool | Purpose | Files changed or reviewed | Checks run | Human review notes |
| --- | --- | --- | --- | --- | --- | --- |
| YYYY-MM-DD | NAME | TOOL | Brief description | `path/to/file` | Scripts/products rerun, or reason not run | What was checked manually |
| 2026-06-15 | Andreas Handel / Herman | Hermes Agent | Added prose instructions for starting a new project from the template and updated the to-do notes. | `new-project-instructions.md`, `readme.md`, `todo.md`, `ai/project-summary.yml`, `ai/ai-use-log.md` | Ran `git diff --check`; documentation-only change, so workflow rerun was not needed. | Human review of wording and recommendations remains welcome. |

## Example entries

| Date | Person | AI tool | Purpose | Files changed or reviewed | Checks run | Human review notes |
| --- | --- | --- | --- | --- | --- | --- |
| 2026-05-20 | NAME | ChatGPT/Codex | Drafted a first version of a data-cleaning function and suggested review checks. | `code/processing/processing-code.r` | Reran affected processing and analysis scripts listed in `usage.md` | Verified cleaning logic against codebook; confirmed raw data was unchanged. |
| 2026-05-21 | NAME | ChatGPT/Codex | Reviewed project for reproducibility problems before submission. | `readme.md`, `usage.md`, `code/`, `products/report/report.qmd` | Ran `Rscript code/utilities/check-project-setup.r`; rerendered affected report | Confirmed outputs were produced by code and no private data were added. |
| 2026-05-22 | NAME | ChatGPT/Codex | Suggested possible exploratory plots and model diagnostics. | `code/exploration/eda-code.r`, `code/analysis/statistical-analysis.r` | Reran the example workflow after edits | Human author chose which suggestions were appropriate for the question and data. |
