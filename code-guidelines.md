# Code Guidelines For Scientific Projects

This repository is designed for scientific and reproducible projects. The
code should therefore be optimized for transparency, reproducibility, and human
review rather than for cleverness or production-software architecture.

These guidelines apply to code written by humans and to code drafted or edited
by AI tools. They are defaults, not rigid laws. If a project needs to depart
from them, document the reason so future users understand the decision.

## Overall Principles

Code in this project should be:

- **understandable** to current and future users;
- **reproducible** from documented inputs to documented outputs;
- **transparent** about assumptions and analysis decisions;
- **simple** enough that the main workflow can be reviewed without reconstructing
  a complicated dependency graph;
- **strict** about unexpected inputs, missing files, missing packages, and other
  signs that something may be wrong.

Scientific code is often read long after it was written. Write code for the next
user who needs to understand, rerun, modify, or review the analysis.

## Documentation And Comments

Main analysis scripts should be thoroughly documented with comments. As a rough
guide, aim for at least half of each main script to be explanatory comments or
other documentation.

Useful comments explain:

- **why** a step is being done;
- **what** the step does;
- **which assumptions** the step relies on;
- **which inputs** are expected;
- **which outputs** are created;
- **how** non-obvious lines of code work.

Avoid filler comments that only repeat obvious syntax. For example, `# load
package` before `library(dplyr)` is usually not helpful unless there is a reason
that package choice needs explanation.

At the top of each main script, include a short header such as:

```r
# Purpose:
#   Clean the raw example data and create the processed analysis dataset.
#
# Inputs:
#   data/raw-data/example-data.xlsx
#
# Outputs:
#   data/processed-data/processed-data.rds
#
# How to run:
#   Rscript code/processing/processing-code.r
```

Use section comments to make long scripts easy to scan:

```r
###############################
# Load packages and input files
###############################
```

Place comments close to important analysis decisions, such as variable recoding,
missing-data handling, inclusion/exclusion criteria, transformations, model
formulas, reference levels, grouping choices, and units.

## Failure Behavior

Code should hard fail by default. If something unexpected happens, the workflow
should usually stop with a clear error rather than continue with possibly wrong
results.

Do not catch, suppress, or silently ignore errors unless the expected failure
mode is understood, intentional, and documented.

Avoid patterns such as:

```r
tryCatch(..., error = function(e) NULL)
```

unless there is a specific documented reason.

Prefer explicit checks that fail early with useful messages:

```r
required_columns <- c("id", "group", "outcome")

if (!all(required_columns %in% names(raw_data))) {
  stop("Raw data is missing one or more required columns.")
}
```

Hard failure is especially important for:

- missing files or folders;
- missing packages;
- unexpected column names;
- unexpected values or factor levels;
- failed joins or changed row counts;
- impossible dates or units;
- missing outputs required by later steps.

Do not silently convert unexpected values to `NA`, drop records, change factor
levels, or continue after a failed check unless that behavior is explicitly part
of the documented analysis plan.

## Simplicity And Structure

Code should be as simple as possible. Ruthlessly remove anything that is not
needed for the analysis to run, be understood, or be reproduced.

Follow the DRY principle where it improves clarity, but do not create an
abstraction that makes the workflow harder to understand. A little visible
repetition is often better than a helper function that hides important project
logic.

Prefer a flat, understandable structure:

- main scripts should be readable from top to bottom;
- helper functions are useful when they remove clear repetition or isolate a
  well-defined task;
- avoid deep chains of functions that call other functions across many files;
- avoid hidden side effects;
- avoid clever metaprogramming unless it solves a real and documented problem.

A future user should be able to open a main script and understand the
workflow without first reconstructing a complicated map of dependencies across
many files.

## Inputs, Outputs, And Paths

Use project-relative paths. Do not use personal absolute paths such as
`C:/Users/...`, `D:/GitHub/...`, or machine-specific network paths in committed
code.

For R, prefer `here::here()` or another clearly documented project-root approach:

```r
raw_data_file <- here::here("data", "raw-data", "example-data.xlsx")
```

Keep raw data immutable. Code should not overwrite files in `data/raw-data/`
unless the project owner explicitly asks for that. Processed data should usually
be written to `data/processed-data/`, generated figures and tables to `results/`,
and manually created static materials to `assets/`.

Generated outputs may be overwritten when that is the documented workflow, but
code should not unexpectedly delete folders or overwrite unrelated files.

## Packages And Dependencies

Prefer mature, robust, well-developed, and actively maintained packages or
libraries. Avoid adding obscure dependencies for small conveniences.

Any package or library used by the project should be documented in a
human-facing file such as `readme.md`, `usage.md`, or a language-specific setup
or environment file.

Do not install packages inside analysis scripts. If a package is missing, the
script should fail and tell the user what needs to be installed.

If an unusual or specialized package is necessary, document why it is needed and
what part of the workflow depends on it.

## R-Specific Guidance

For R code, prefer the tidyverse style and stable tidyverse packages when they
fit the task. This includes packages such as `dplyr`, `tidyr`, `ggplot2`,
`readr`, `purrr`, and related well-maintained tools.

Use readable object names:

```r
processed_data <- raw_data |>
  dplyr::mutate(...)
```

Avoid vague names such as `df2`, `tmp`, `x`, or `m1` except for very small local
uses where the meaning is immediately obvious.

Pipes are encouraged when they make the workflow easier to read. Avoid pipelines
so long or complex that intermediate objects would be clearer.

Avoid mixing base R and tidyverse styles unnecessarily. Use the style that makes
the script most understandable for the intended users.

## Reproducibility Expectations

Scripts should be runnable in a clean session. They should load the packages they
need, read the inputs they need, create the objects they use, and write their
outputs without depending on objects that happen to exist in an interactive
console.

If code uses randomness, set and document a seed:

```r
set.seed(12345) # Makes simulated example results reproducible.
```

Make important assumptions explicit in comments and checks. Examples include
units, date formats, missing-value codes, factor reference levels, inclusion and
exclusion criteria, transformations, model formulas, grouping variables, and join
keys.

## AI-Assisted Coding

AI tools may help draft, explain, review, or simplify code, but human review is
required for scientific, statistical, privacy, and interpretation decisions.

AI-generated or AI-edited code should follow the same standards as human-written
code:

- document why and how the code works;
- hard fail on unexpected conditions;
- keep the structure simple and reviewable;
- use mature dependencies;
- avoid hidden package installation or environment changes;
- rerun affected scripts or explain why they could not be run.

When AI suggests analysis decisions, model choices, data exclusions,
transformations, or interpretation, treat those suggestions as proposals for
human review rather than final decisions.
