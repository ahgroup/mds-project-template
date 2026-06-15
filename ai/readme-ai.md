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

## Student AI Policy

The file `ai-policy-for-students.md` gives student-facing guidance on acceptable
AI use, required human understanding, data privacy, and disclosure. Course,
instructor, project-owner, journal, funder, or institutional rules take priority
when they are more specific.

## Logging AI Use

The file `ai-use-log.md` is a transparency record for meaningful AI-assisted
work. Humans should be able to read it to understand what AI helped with and
what was checked.

Students usually do not need to edit the log manually unless the instructor or
project owner asks them to. AI assistants and project maintainers should add
concise entries when AI meaningfully changes or reviews project materials.

A practical entry records:

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
- `project-summary.yml`: a concise AI-readable summary of information already
  documented elsewhere. Humans usually do not need to edit it directly. AI
  assistants may read or update it for efficiency, but it is not authoritative.
  If it disagrees with human-facing documentation, follow the human-facing
  documentation.
- `readme-ai.md`, `ai-policy-for-students.md`, and `review-checklist.md`: these
  guidance files should be read by humans and AI tools. Humans may edit them
  when course or project policy changes; AI may suggest or make updates when
  asked.
- `ai-use-log.md`: this is mainly a human-readable transparency record. Humans
  usually read it rather than editing it. AI assistants or project maintainers
  may add concise entries when meaningful AI-assisted work occurs.
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

Adapt the prompts to the specific project and any course, collaborator, funder,
journal, or institutional requirements.

## Suggested Workflow

1. Read `../readme.md`, `../usage.md`, `../agents.md`,
   `../code-guidelines.md`, and `../data/readme-data.md`.
2. Optionally read `project-summary.yml` for a concise AI-oriented summary, but
   treat it as secondary to the human-facing documentation.
3. Check data-use limits before exposing data to an AI tool.
4. Ask for small, reviewable changes.
5. Rerun affected scripts or rerender affected products.
6. Confirm generated outputs are traceable to code.
7. Check whether generated outputs should be committed, ignored as large files,
   or kept private because they contain sensitive information.
8. Review the changes manually.
9. Add a concise entry to `ai-use-log.md` when meaningful AI-assisted project
   maintenance or review occurred.
