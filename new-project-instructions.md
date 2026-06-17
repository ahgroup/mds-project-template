# Starting A New Project From This Template

This document provides brief instructions for starting a new project from this
template. Hopefully, the content and examples in this template are documented well enough to make it clear how to go about using and adapting the template..

## Create The New Repository

This is a GitHub template repository. The best way to start a new project is to
[create a repository from this template](https://help.github.com/en/articles/creating-a-repository-from-a-template).
After creating a new repository, follow .

For the example project, run the code in documented pieces. The workflow is
reproducible because data processing, figure creation, table creation, and
analysis are done by code rather than by undocumented manual edits to data files
or figures. See `usage.md` for the run order, setup checks, optional example
workflow runner, and product-rendering instructions.


Start by creating a new GitHub repository from this template rather than copying
files by hand. GitHub's template-repository workflow preserves the folder
structure while giving the new project its own Git history.

For many projects, the safest default is to make the new
repository private at first. A private repository can be made public later after
the project team has checked the data, outputs, license, authorship, and sharing
goals. Do not treat a private GitHub repository as approved storage for
sensitive, identifiable, regulated, restricted, or license-protected data.

After creating the repository, clone it to your computer and open the project
folder in Positron or another editor. Make sure the editor or terminal is
working from the project root, the folder that contains `readme.md`, `usage.md`,
and the main project folders.

## Rename The Project Materials

Update the project identity before doing much analysis work. At minimum, review
`readme.md`, `data/readme-data.md`, and the main files in `products/` for
placeholder text such
as `NAME`, example titles, example author details, sample dates, sample email
addresses, and generic project descriptions.

Replace placeholders with the real project title, project owner, contributors,
and a short description of the project. If some information is not known yet,
leave a clear placeholder that says what needs to be decided rather than
guessing.

Keep file and folder names lower-case and descriptive, with words separated by
hyphens. Avoid spaces, underscores, and CamelCase unless a standard file name or
file extension requires otherwise.

## Decide What Data May Be Stored In The Repository

Before adding project data, decide what can safely be committed to GitHub and
what must stay local or in an approved storage location.

Use `data/readme-data.md` to document the data source, sensitivity level, access
limits, and whether AI tools may inspect the data. Treat all real project data
as potentially sensitive until the project owner has documented otherwise.

Raw data should go in `data/raw-data/` only if it is appropriate to store in the
repository. Private, restricted, identifiable, regulated, or license-protected
data should usually stay out of Git. Use ignored folders such as
`data/private-data/` or `data/large-files/` for local-only data, and commit a
readme or placeholder explaining what belongs there and who is allowed to access
it.

Do not manually edit raw data files to make an analysis work. Keep raw data
unchanged and write code that creates processed data in `data/processed-data/`.

## Review The Generated-Output Plan

Decide which generated outputs should be committed. For many example projects
and public projects, it is useful to commit small, non-sensitive outputs such as
processed example data, figures, tables, rendered HTML reports, and slides.
These files help users see what the workflow should produce.

Large outputs, local-only outputs, and outputs derived from sensitive or
restricted data should not be committed by default. Put them in documented
ignored locations such as `results/large-files/`, or document another approved
workflow.

Generated outputs should be traceable to code. If a figure, table, model
summary, or report output changes, rerun the code that produces it rather than
editing the generated file by hand.

## Adapt The Workflow To The Project

Use the existing example workflow as a starting pattern, not as a required
scientific structure. Put code in the workflow-stage folder where it belongs:

- data-cleaning and data-preparation scripts in `code/processing/`;
- exploratory summaries and figures in `code/exploration/`;
- statistical, modeling, or simulation analyses in `code/analysis/`;
- shared setup checks, helper functions, or workflow runners in
  `code/utilities/`.

If the project uses Python, Julia, shell scripts, or other tools, place those
scripts in the relevant workflow-stage folder. Create language-specific folders
only if the project becomes large enough that separate folders would make the
code easier to maintain.

Update `usage.md` whenever the run order changes. A new user should be
able to open `usage.md` and understand which scripts to run, what inputs they
need, what outputs they create, and which products should be rendered afterward.

## Update Software And Package Requirements

Document the software and packages needed for the project in a human-facing file
such as `readme.md`, `usage.md`, or a language-specific setup file.

Use the simplest dependency approach that honestly supports the project. A
manual package list is usually enough for this template, short projects,
simple examples, and many work-related projects. If exact package versions matter
for longer-term reproducibility, consider tools such as `renv` for R, virtual
environments or Conda for Python, Julia project files, Poetry, or containers.
Use those tools only when they solve a real project need, and do not commit local
package libraries or virtual environments.

Analysis scripts should fail clearly if required packages are missing. They
should not silently install packages while running.

For reports or manuscripts, consider adding a short software/session information
section if readers or users need to know the computing environment. Base
R's `sessionInfo()` is a lightweight option; `sessioninfo::session_info()` is an
optional alternative if the project already uses that package.

## Check The Project Setup

Before doing substantive work, run the setup check if it still applies to the
project:

```sh
Rscript code/utilities/check-project-setup.r
```

If you have adapted the folder structure, input files, or required packages,
update the setup check so it reflects the new project. The setup check should
inspect the project and report problems; it should not change data or results.

For the default example workflow, you can run all example steps with:

```sh
Rscript code/utilities/run-example-workflow.r
```

After running analysis code, render any products that depend on changed results.
For example:

```sh
quarto render products/report/report.qmd
quarto render products/manuscript/manuscript.qmd
quarto render products/presentation/presentation.qmd
```

## Review AI-Use Expectations

If AI tools will be used, review `agents.md` and `ai/ai-use-policy.md` early in
the project. Human users may also read `ai/ai-use-log.md` if they need to review
past AI-assisted work.

AI tools can help draft code, improve documentation, review for reproducibility
issues, and troubleshoot errors. They should not be treated as final authority
for scientific claims, statistical decisions, citations, data privacy, or
interpretation.

Do not paste sensitive, private, regulated, or identifiable data into external
AI tools unless the project owner has explicitly approved that workflow. For
meaningful AI-assisted project work, the AI tool should add a concise entry to
`ai/ai-use-log.md` if that is appropriate for the project.

## Make An Initial Project-Specific Commit

After the project title, ownership information, data policy, software
requirements, and basic workflow notes have been updated, review the changed
files with Git.

Before committing, check that no private data, credentials, local paths, editor
state, or unnecessary large files have been added. Also check that raw data has
not been edited accidentally.

Make a small initial commit that records the project-specific setup. After that,
continue working in small, reviewable commits. This makes it easier to see how
the project changed and to undo mistakes if needed.
