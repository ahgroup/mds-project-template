# Starting A New Project From This Template

This document provides brief instructions for starting a new project from this
template. Hopefully, the content and examples in this template are documented
well enough to make it clear how to use and adapt the template.

## Create The New Repository

This is a GitHub template repository. The best way to start a new project is to
[create a repository from this template](https://help.github.com/en/articles/creating-a-repository-from-a-template).

For many projects, the safest default is to make the new
repository private at first. A private repository can be made public later after
the project team has checked the data, outputs, license, authorship, and sharing
goals. Do not treat a private GitHub repository as approved storage for
sensitive, identifiable, regulated, restricted, or license-protected data.

After creating the repository, clone it to your computer and open the project
folder in Positron or another editor. Make sure the editor or terminal is
working from the project root, the folder that contains `readme.md`, `usage.md`,
and the main project folders.



## Explore the template

The template contains example files and code to illustrate the whole setup and workflow. Follow the information provided in `usage.md` to explore the different example components.



## Rename The Project Materials

Update the project identity before doing much analysis work. At minimum, review
`readme.md`, `data/readme-data.md`, and the main files in `products/` for
placeholder text such as `NAME`, example titles, and other generic project descriptions.

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
`data/private-data/` for local-only data, and commit a
readme or placeholder explaining what belongs there and who is allowed to access
it.

Do not manually edit raw data files to make an analysis work. Keep raw data
unchanged and write code that creates processed data in `data/processed-data/`.


## Adapt The Workflow To The Project

Use the existing example workflow as a starting pattern, not as a required
scientific structure. Put code in the workflow-stage folder where it belongs.

Based on your specific needs, you can change the folder names and structure. The main important aspects are that you come up with a consistent and logical structure, and that you document and explain your structure.

Update `usage.md` regularly. A new user should be
able to open `usage.md` and understand which scripts to run, what inputs they
need, what outputs they create, and which products should be rendered afterward.

## Update Software And Package Requirements

Document the software and packages needed for the project in a human-facing file
such as `readme.md`, `usage.md`, or a language-specific setup file.

Use the dependency management approach that is best for your project.


## Check The Project Setup

After adapting the folder structure, input files, or required packages, review
`usage.md` and the relevant folder readme files to make sure they still describe
how to run the project. Then run the project scripts manually in the documented
order.

After running code, render any products that depend on changed results.
For example:

```sh
quarto render products/report/report.qmd
quarto render products/manuscript/manuscript.qmd
quarto render products/presentation/presentation.qmd
```

## Review AI-Use Expectations

If AI tools will be used, review `agents.md` and contents in the `ai/` folder. The readme file in that folder provides further details.


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
