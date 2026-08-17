# Presentation

This folder contains slide presentations using Quarto and the
`revealjs` output format.

`presentation.qmd` is an example presentation for the example data analysis
project. If your project needs more than one presentation, give each its own
sub-folder with its own `media/` folder.

The general suggestion is to place figures, tables, RDS files, and other files
used in the presentation in a `media/` sub-folder.

The advantage of copying them into a dedicated `media/` folder, instead of pulling it from the `result` folders is that everything related to the presentation is in one place and is time-stamped. If results keep changing, this helps preserve the version you used in a specific presentation.
