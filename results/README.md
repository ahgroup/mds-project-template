# results

This folder and subfolders contain results produced by the code, such as figures and tables, and other files.

A special folder for large files exists. This folder is set in .gitignore to be ignored when pushing/pulling. See the readme in that folder for details.

Structure the folders inside `results` such that they make sense for your specific analysis. Provide enough documentation that someone can understand what you are doing and what goes where. `readme.md` files inside each folder are a good idea.

Files in this folder should be reproducible from code. If an AI tool helps
generate or revise analysis code, rerun the relevant scripts and make sure the
updated outputs here match the code. For tables that need to be reviewed outside
R, consider saving both an `.rds` version and a plain-text `.csv` or `.md`
version.
