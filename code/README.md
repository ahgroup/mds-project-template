# code

This folder and sub-folders should contain all your code. This can be R or Quarto files (or files for other programming languages). 

Place your files in the appropriate sub-folders. You can structure the folders as appropriate.

The file `run-all.R` is a local entry point for reproducing the example
workflow. It runs the processing, EDA, and analysis scripts in order. The file
`check-project.R` runs lightweight local checks. These scripts are intentionally
simple and editable; adjust them as the project changes.

You can either have fewer large scripts, or multiple scripts that do only specific actions. Those can be R or Quarto files (or some other language/format). In either case, document the scripts and what goes on in them so well that someone else (including future you) can easily figure out what is happening.

The scripts should load the appropriate data (e.g. raw or processed), perform actions, and save results (e.g. processed data, figures, computed values) in the appropriate folders. Document somewhere what inputs each script takes and where output is placed. 

If scripts need to be run in a specific order, document this. Either as comments in the script, or in a separate text file such as this readme file. Ideally of course in both locations.

For AI-assisted work, keep scripts reviewable and make dependencies explicit.
Avoid code that relies on objects already loaded in the current R session. If AI
tools helped write or modify meaningful code, add a short note to
`../ai/ai-use-log.md`.

