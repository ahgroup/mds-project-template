# AI policy for students

This file gives temporary student-facing guidance for using AI tools with this
project template. Course-specific instructions from the instructor, syllabus, or
assignment page always take priority over this file.

This repository is also used as a starting point for research projects. Some
research projects may need stricter rules than a class project, especially if
private, identifiable, regulated, unpublished, or otherwise sensitive data are
involved.

## Short version

You may use AI tools to help you learn, code, debug, document, and review your
work. You may not use AI tools as a substitute for understanding your own
project, checking your results, or making your own scientific and statistical
decisions.

If AI meaningfully helps with your project, disclose that use in the way the
course or project owner requests.

## Acceptable AI use

AI tools can be useful for tasks such as:

- explaining unfamiliar code or error messages;
- suggesting possible project organization;
- drafting first-pass code that you then read, test, and revise;
- suggesting data-cleaning checks;
- suggesting exploratory plots or summary tables;
- suggesting possible modeling approaches for you to evaluate;
- improving comments, documentation, and report wording;
- reviewing code for reproducibility problems;
- checking whether outputs are traceable to code.

## Things AI should not decide for you

Do not treat AI output as final authority for:

- whether a research question is scientifically meaningful;
- whether a dataset is appropriate for the question;
- whether private or sensitive data may be shared;
- which observations should be removed or changed;
- which model is scientifically appropriate;
- whether assumptions are satisfied;
- whether a result is important or causal;
- whether citations are real and correctly represented;
- what the final interpretation or conclusion should be.

Those decisions require human judgment and review.

## What you must understand yourself

You should be able to explain every important part of the project you submit,
including:

- where the data came from;
- what each main code file does;
- what cleaning decisions were made and why;
- what figures and tables show;
- what model or analysis was used and why;
- what limitations remain;
- which parts were helped by AI and how you checked them.

If AI gives you code that you do not understand, ask it to explain the code,
then simplify or revise the code until you can explain it yourself.

## Data privacy and sensitive information

Before using AI with data, read `data/readme-data.md` and any project-specific
privacy or data-use instructions from the instructor or project owner.

Do not paste private, identifiable, regulated, unpublished, restricted, or
otherwise sensitive data into external AI tools unless the project owner has
explicitly approved that workflow.

When in doubt, ask about code structure, synthetic examples, or aggregated
summaries instead of sharing raw records.

## How to disclose AI use

For a class project, follow the course instructions. If no more specific
instructions are available, include a short disclosure in your project materials
or final report. For example:

> I used [AI tool name] to help with [task, such as debugging R code, drafting
> plot code, or reviewing reproducibility]. I reviewed the output by [checks,
> such as reading the code, rerunning scripts, comparing outputs to expectations,
> and revising the text]. Final data-cleaning, modeling, interpretation, and
> writing decisions were made by [me/us].

For research projects, follow the norms of the project, funder, journal,
institution, and collaborators.

## AI-use logs

This template includes `ai/ai-use-log.md`. The log is meant to be read by humans
and updated by AI assistants or project maintainers when meaningful AI-assisted
work occurs.

Students usually do not need to manually edit the log unless the instructor or
project owner asks them to. Instead, students should be ready to disclose and
explain AI use in the required course or project format. AI assistants or project
maintainers may update the log when meaningful AI-assisted work occurs.

## Good and bad examples

Good use:

- Ask AI to explain an R error, then fix the code and rerun the script.
- Ask AI to suggest checks for missing data, then decide which checks are
  relevant and document the results.
- Ask AI to review whether code uses relative paths and whether outputs are
  saved in the right folders.

Problematic use:

- Submit AI-generated code you cannot explain.
- Let AI choose a model without checking whether it fits the question and data.
- Paste private or identifiable data into an unapproved external AI service.
- Copy AI-generated citations without verifying that the sources exist and say
  what the AI claims they say.
- Let AI write the final interpretation without human review.
