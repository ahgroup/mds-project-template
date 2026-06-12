# Results

This folder contains outputs produced by code, such as figures, tables, model
objects, and other analysis results.

Files in this folder should be reproducible from code. If code changes, rerun
the affected scripts and make sure the outputs here match the current code.

Generated outputs are generally committed to Git so collaborators, students, and
reviewers can see the expected results and render products without rebuilding
everything first. To commit a file means to add it to the recorded project
history. Before committing generated outputs, check whether they are appropriate
to include in that history. There are two main exceptions:

- large generated files that are too big for ordinary Git/GitHub use should go
  in `results/large-files/` and stay untracked unless the project uses a tool
  such as Git LFS;
- outputs that contain sensitive, private, regulated, identifiable,
  license-protected, or otherwise restricted information should not be committed
  unless the project owner has explicitly approved that workflow.

For sensitive or large outputs, commit a readme or placeholder that explains
what the file is, how it is generated, and how authorized collaborators can get
or recreate it.

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
