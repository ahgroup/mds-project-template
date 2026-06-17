# AI-Supported Workflow

This folder contains lightweight guidance for using AI tools in this project.
The goal is to make AI assistance useful without weakening reproducibility,
privacy, or human review.

## Recommended Use

Use AI tools for tasks such as:

- explaining unfamiliar code or project structure;
- drafting analysis plans or checklists;
- writing first-pass R, Quarto, Python, Julia, or other project code;
- improving documentation;
- finding likely bugs or reproducibility gaps;
- checking whether outputs are traceable to code.

Avoid using AI tools as the final authority for:

- scientific conclusions;
- statistical model choice;
- interpretation of p-values, effect sizes, or uncertainty;
- citation accuracy;
- data privacy or compliance decisions.

Those need human review.

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
meaningfully helps with project-specific work. Routine maintenance of the
template itself does not need extra logging beyond existing entries unless the
project owner asks for more detail.

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

- `prompts/`: prompt templates are mainly read and copied by humans or AI tools.
  They may be edited by humans or AI maintainers when the project workflow
  changes.
- `project-summary.yml`: a concise summary file for AI tools to read and write.
  Human users are not expected to read, write, or maintain it. It is not
  authoritative; if it disagrees with human-facing documentation, follow the
  human-facing documentation.
- `readme-ai.md` and `ai-use-policy.md`: human-facing AI guidance files. Human
  users may edit them when project policy changes; AI may suggest or make updates
  when asked.
- `ai-use-log.md`: a transparency record written by AI tools. AI tools may also
  read it when they need past AI-use context. Human users may read it as needed,
  but are not expected to write or edit it.
- Local AI/tool state folders such as `.ai-local/`, `.ai-cache/`, `.codex/`, and
  local Claude settings are not committed. AI tools may read and write those
  files for their own operation, and humans usually do not need to inspect them.

## Prompt Templates

The `prompts/` folder contains reusable prompts for common project tasks:

- `start-project.prompt.md`: review a new project created from this template.
- `analysis-plan.prompt.md`: draft or review an analysis plan.
- `modeling-plan-review.prompt.md`: review statistical or machine-learning
  modeling choices before implementation.
- `code-review.prompt.md`: review changed code for reproducibility problems.
- `reproducibility-audit.prompt.md`: audit a project before submission,
  sharing, or accepting changes.
- `final-product-review.prompt.md`: review reports, manuscripts,
  presentations, posters, websites, or other products.

These files are prompt templates, not scripts. They are not discovered or run
automatically by default. Human users can copy the prompt text into an AI tool
and adapt it to the project. If the AI tool has access to the repository files,
the user can instead ask the tool to read and apply a specific prompt file, for
example: "Read `ai/prompts/reproducibility-audit.prompt.md` and use it to audit
this project." AI tools may also read these prompt files when orienting
themselves to the project, but users should not assume that prompts are found or
used unless they point the tool to the relevant file.

Adapt the prompts to the specific project and any project owner, funder,
journal, or institutional requirements.

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
9. When meaningful AI-assisted project-specific work occurred and the project
   owner wants it logged, the AI tool should add a concise text entry to
   `ai-use-log.md`.
