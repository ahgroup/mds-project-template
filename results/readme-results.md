# Results

This folder contains outputs produced by code, such as figures, tables, model
objects, and other analysis results.

Files in this folder should be reproducible from code. If code changes, rerun
the affected scripts and make sure the outputs here match the current code.

Organize this folder in a way that makes sense for your project. Add readme
files inside subfolders when they help future readers understand what goes
where.

For outputs that need to move across languages or be reviewed outside the tool
that created them, prefer widely readable formats such as `.csv`, `.tsv`,
`.json`, `.png`, `.svg`, `.pdf`, or `.md`.

Language-specific serialized objects such as `.rds`, `.pkl`, or `.jld2` are
fine when they are useful, but consider also saving a plain-text or widely
readable companion file.

Use `large-files/` for output files that are too large for GitHub.
