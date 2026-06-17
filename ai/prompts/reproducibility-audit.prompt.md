# Prompt: Reproducibility Audit

Use this prompt before submitting, sharing, or accepting a project update.

```text
Please audit this repository as a reproducible data-analysis project. Read
readme.md, usage.md, agents.md, code-guidelines.md, data/readme-data.md,
code/readme-code.md and results/readme-results.md. You may also read
ai/project-summary.yml as a concise AI-oriented summary, but treat
the human-facing documentation as the source of truth.

Focus on whether the project can be regenerated from documented code rather than
undocumented manual edits. Check for:

- raw data files that appear to have been edited or overwritten;
- generated figures, tables, processed data, or model outputs that are not
  traceable to code;
- required inputs, packages, or software that are not documented;
- absolute paths or hidden local dependencies;
- outputs that should be committed, ignored as large files, or treated as
  sensitive/private;
- inconsistent file names or stale references to renamed files;
- unresolved template placeholders such as NAME, LINK-GOES-HERE, sample emails,
  and example author details;
- checks or render steps that should be rerun.

Do not rewrite files unless I ask. Report findings with file paths and line
numbers when possible, then suggest the smallest useful fixes.
```
