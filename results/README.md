# results

This folder and subfolders contain results produced by the code, such as figures and tables, and other files.

A special folder for large files exists. This folder is set in .gitignore to be ignored when pushing/pulling. See the readme in that folder for details.

Structure the folders inside `results` such that they make sense for your specific analysis. Provide enough documentation that someone can understand what you are doing and what goes where. `readme.md` files inside each folder are a good idea.

Files in this folder should be reproducible from code. If an AI tool helps
generate or revise analysis code, rerun the relevant scripts and make sure the
updated outputs here match the code.

For outputs that need to move across languages or be reviewed outside the tool
that created them, prefer widely readable formats such as `.csv`, `.tsv`,
`.json`, `.png`, `.svg`, `.pdf`, or `.md`. Language-specific serialized objects
such as `.rds`, `.pkl`, or `.jld2` are fine when they are useful, but consider
also saving a plain-text or widely readable companion file.
