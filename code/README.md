# code

This folder and subfolders contain project code. The default example uses R and
Quarto, but projects may add Python, Julia, shell scripts, or other languages as
needed.

The default folders are organized by workflow stage rather than by programming
language:

- `processing/`: import, clean, and transform raw data.
- `exploration/`: exploratory summaries, checks, tables, and figures.
- `analysis/`: statistical modeling, simulations, prediction, or other main
  analyses.
- `utilities/`: optional helper functions shared across stages.

Place scripts where they fit in the workflow. For most projects, mixed-language
scripts can live side by side in the relevant stage folder. Create
language-specific subfolders only if the project becomes large enough that this
would make the code easier to maintain.

The file `run-all.qmd` is the local entry point for reproducing the example
workflow. It runs processing, exploration, and analysis in order and can
optionally render products. The file `check-project.qmd` runs lightweight local
checks. Both files are Quarto documents so they can combine explanatory text
with code chunks.

The file `workflow.md` is a compact inventory of the workflow. Keep it current
as scripts are added, removed, or reordered.

You can either have fewer large scripts or multiple scripts that do specific
actions. Those files can be R, Quarto, Python, Julia, or another format. In any
case, document the scripts and what goes on in them well enough that someone
else, including future you, can follow the workflow.

Scripts should load the appropriate data, perform actions, and save results in
the appropriate folders. Document the inputs each script takes and where outputs
are placed.

If scripts need to be run in a specific order, document this in `workflow.md`,
in `run-all.qmd`, and, where useful, in comments in the scripts themselves.

For AI-assisted work, keep scripts reviewable and make dependencies explicit.
Avoid code that relies on objects already loaded in an interactive session. If
AI tools helped write or modify meaningful code, add a short note to
`../ai/ai-use-log.md`.

