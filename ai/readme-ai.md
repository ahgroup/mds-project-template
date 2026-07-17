# AI-Supported Workflow

This folder contains lightweight guidance for using AI tools in this project.
The goal is to make AI assistance useful without weakening reproducibility,
privacy, or human review.


## Privacy Rules

- Do not paste sensitive, private, regulated, or identifiable data into external
  AI tools.
- Check `../data/readme-data.md` before asking an AI tool to inspect data.
- If in doubt, ask the project owner before sharing raw data, unpublished
  analysis details, credentials, IRB materials, or DUA-covered files.
- Prefer asking AI about code structure, synthetic examples, or summarized
  outputs rather than raw records.

## AI-Use Policy

The file `ai-use-policy.md` gives user-facing guidance on acceptable AI use,
required human understanding, data privacy, and disclosure. The same basic
expectations apply to projects created from this template. Project owner, funder,
journal, or institutional rules take priority when they are more specific.

## Logging AI Use

The file `ai-use-log.md` is a transparency record for meaningful AI-assisted
work. It is written by AI tools and may also be read by AI tools when past
AI-use context is useful. Human users may read it as needed, but are not
expected to write or edit it.

In a project created from the template, the AI tool should add entries when it
meaningfully helps with project-specific work. Updates to the template itself should not be logged. As long as the repository is named mds-project-template, it can be assumed that work happens on the template itself, and no logging is needed. Once the repository name changes, it is assumed that a new project is started and logging is enabled by default. Logging stays enabled unless the project owner explicitly asks to turn it off.

A practical entry is written as a short text section rather than a table row and
records:

- what AI tool was used;
- what it helped with;
- which files were edited or reviewed;
- which checks were run;
- what human review remains.

Do not add full chat transcripts by default.

## File Roles

Different files in this folder have different expected readers and writers:

- `readme-ai.md` and `ai-use-policy.md`: human-facing AI guidance files. Human
  users may edit them when project policy changes; AI should read and follow them, and may suggest or make updates when asked.
- `ai-use-log.md`: a transparency record written by AI tools. AI tools may also
  read it when they need past AI-use context. Human users may read it as needed,
  but are not expected to write or edit it.
- Local AI/tool state folders such as `.ai-local/`, `.ai-cache/`, `.codex/`, and
  local Claude settings are not committed. AI tools may read and write those
  files for their own operation, and humans usually do not need to inspect them. Anything of importance to the project and its state should not be logged in these folders, but instead some of the existing documentation markdown files.
- `project-summary.yml`: a concise summary file for AI tools to read and write.
  Human users are not expected to read, write, or maintain it. It is not
  authoritative; if it disagrees with human-facing documentation, follow the
  human-facing documentation.


## Suggested Workflow

1. Read `../readme.md`, `../usage.md`, `../agents.md`,
   `../code-guidelines.md`, and `../data/readme-data.md`.
2. AI tools may read `project-summary.yml` for a concise orientation summary, but
   should treat it as secondary to the human-facing documentation.
3. Check data-use limits before exposing data to an AI tool.
4. Ask for small, reviewable changes.
5. Rerun affected scripts or rerender affected products.
6. Confirm generated outputs are traceable to code.
7. Check whether generated outputs should be committed, ignored as large files,
   or kept private because they contain sensitive information.
8. Review the changes manually.
9. When meaningful AI-assisted project-specific work occurred, the AI tool should
   add a concise text entry to `ai-use-log.md`.
