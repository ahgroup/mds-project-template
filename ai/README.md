# AI-supported workflow

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
- Check `data/data-use-notes.md` before asking an AI tool to inspect data.
- If in doubt, ask the project owner before sharing raw data, unpublished
  analysis details, credentials, IRB materials, or DUA-covered files.
- Prefer asking AI about code structure, synthetic examples, or summarized
  outputs rather than raw records.

## Logging AI Use

For meaningful project work, add a short entry to `ai/ai-use-log.md`. Keep the
entry practical:

- what AI tool was used;
- what it helped with;
- which files were edited or reviewed;
- which checks were run;
- what human review remains.

Do not add full chat transcripts by default.

## Suggested Workflow

1. Read `README.md`, `project-metadata.yml`, and `AGENTS.md`.
2. Check `data/data-use-notes.md` before exposing data to an AI tool.
3. Ask for small, reviewable changes.
4. Run `quarto render code/check-project.qmd`.
5. If code changed generated outputs, run `quarto render code/run-all.qmd`.
6. Review the changes manually.
7. Add a concise entry to `ai/ai-use-log.md`.
