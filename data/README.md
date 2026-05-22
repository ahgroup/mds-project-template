# data

The folders inside this folder should contain all data at various stages.

This data is loaded, manipulated, changed, and saved with code from the `code` folders.

You should place the raw data in the `raw-data` folder and not edit it. Ever!

Before using AI tools with project data, review and update
`data/data-use-notes.md`. Treat all non-example data as potentially sensitive
until the project owner documents otherwise. Do not paste private, regulated, or
identifiable data into external AI tools unless that workflow has been
explicitly approved.

Ideally, load the raw data into your analysis language and do all changes there with code, so everything is automatically reproducible and documented.

Sometimes, you need to edit the files in the format you got. For instance, Excel files are sometimes so poorly formatted that it's close to impossible to read them into R, or the persons you got the data from used color to code some information, which of course won't import into R. In those cases, you might have to make modifications in a software other than R. If you need to make edits in whatever format you got the data (e.g. Excel), make a copy and place those copies in a separate folder, AND ONLY EDIT THOSE COPIES. Also, write down somewhere the edits you made.

Add as many sub-folders as suitable. If you only have a single processing step, one sub-folder for processed data is enough. If you have multiple stages of cleaning and processing, additional sub-folders might be useful. Adjust based on the complexity of your project.

For R-only projects, RDS or RDA/Rdata files can preserve information like factors, characters, and numeric types. For multi-language projects, consider also saving processed data in a language-neutral format such as CSV, TSV, JSON, Parquet, or Feather. CSV is easy to inspect and share, but it can lose type information. If you save CSV files, document what each variable is.

For sensitive or large local-only files, use ignored folders such as
`data/private-data/` or `data/large-files/`. Add enough documentation so
collaborators know how to obtain the data, but do not commit files that should
remain private or are too large for GitHub.

See here for some suggestions on how to store your processed data:

http://www.sthda.com/english/wiki/saving-data-into-r-data-format-rds-and-rdata
