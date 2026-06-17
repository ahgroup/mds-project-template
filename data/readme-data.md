# Data

This folder contains project data at different stages.

The default folders are:

- `raw-data/`: original data files. Do not edit these by hand.
- `processed-data/`: cleaned or processed data created by code.
- `private-data/`: local data files that should not be committed to GitHub.
- `large-files/`: local data files that are too large to track with GitHub.

Data should be loaded, changed, and saved by code from the `code/` folder
whenever possible.

## Raw Data

Place raw data in `data/raw-data/`. Raw data is the starting point for the
project and should generally not be edited.

Sometimes files arrive in a format that is hard to read directly, such as a
messy Excel file. If you must make manual edits, make a copy first, edit only
the copy, and document what changed.

## Processed Data

Save cleaned or processed data in `data/processed-data/`.

Processed data can be sensitive even if the raw data are not committed. Cleaning,
filtering, joining, summarizing, de-identifying, or transforming data does not
automatically make it safe to share. Before committing processed data, check
whether it still contains private records, identifiers, small groups, precise
locations, restricted variables, or other information that should stay private.

For R-only projects, RDS or RDA/RData files can preserve information like
factors, characters, and numeric types. For multi-language projects, consider
also saving processed data in a language-neutral format such as CSV, TSV, JSON,
Parquet, or Feather. CSV is easy to inspect and share, but it can lose type
information. If you save CSV files, document what each variable is.

## Bundled Example Data

This template includes a small synthetic example dataset so users can run the
workflow immediately.

- Data source: synthetic example data created for this template.
- Data owner or provider: template maintainer.
- Raw data location: `data/raw-data/example-data.xlsx`.
- Processed data location: `data/processed-data/processed-data.rds`.
- Codebook or metadata location: the `Codebook` sheet in
  `data/raw-data/example-data.xlsx`.

## Project Data Summary

When creating a new project from the template, replace this section with
project-specific information.

- Data source:
- Data owner or provider:
- Date obtained:
- Raw data location: `data/raw-data/`
- Processed data location: `data/processed-data/`
- Codebook or metadata location:

## Sensitivity And Access

Treat all non-example data as potentially sensitive until the project owner has
documented otherwise.

- Sensitivity level: example data / public / internal / sensitive / regulated
- Contains identifiable information: yes / no / unknown
- Covered by IRB, DUA, license, or other restrictions: yes / no / unknown
- Who may access the raw data:
- Where large or private files are stored:
- Instructions for obtaining access:

For sensitive or large local-only files, use ignored folders such as
`data/private-data/` or `data/large-files/`. Add enough documentation so
users know how to obtain the data, but do not commit files that should
remain private or are too large for GitHub. To commit a file means to add it to
the recorded Git history; once committed and pushed, sensitive data can be hard
to fully remove from shared copies of the repository.

## AI Tool Use

- May AI tools inspect raw data? yes / no / only synthetic or de-identified data
- May AI tools inspect processed data? yes / no / only aggregated summaries
- Approved AI tools or environments:
- Data that must never be shared with external AI tools:

Do not paste private, regulated, or identifiable data into external AI tools
unless that workflow has been explicitly approved.

## Cleaning And Processing Notes

Document major data-cleaning decisions here or point to the relevant scripts.

- Raw data files should not be edited by hand.
- Any manual edits to copies of raw files should be documented.
- Processing code should save recreated outputs to `data/processed-data/`.

## Sharing Notes

Document what can be shared publicly and what should remain local/private.

- Publicly shareable files:
- Private/local-only files:
- Citation or attribution requirements:

See `raw-data/readme-raw-data.md`, `processed-data/readme-processed-data.md`,
`private-data/readme-private-data.md`, and `large-files/readme-large-files.md`
for folder-specific notes.
