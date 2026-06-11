# Processing

This folder contains code for importing, cleaning, and processing data.

The example shows the same processing steps in three formats:

- `processing-code.r`: an R script that does the cleaning.
- `processing-file-v1.qmd`: a Quarto file with code and explanation in one file.
- `processing-file-v2.qmd`: a Quarto file that pulls labeled chunks from
  `processing-code.r`.

The third approach keeps code in one place for writing and debugging, while
still allowing a Quarto file to show text, commentary, and selected code.

Each approach is reasonable. Pick the one that makes the most sense for your
project. You can also mix and match.

If a project uses another language for part of processing, place that script
here too, for example `02-geocode-data.py` or `03-clean-records.jl`. Move to
language-specific subfolders only when the project becomes large enough to need
that extra organization.

Whichever approach you choose, add enough documentation or comments that others
can understand what is happening.
