# Results

This folder contains outputs produced by code, such as figures, tables, model
objects, and other analysis results.

Files in this folder should be reproducible from code. If code changes, rerun
the affected scripts and make sure the outputs here match the current code.

Generated outputs are generally committed to Git so users and
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
what the file is, how it is generated, and how authorized users can get
or recreate it.

Generated results can still be sensitive. Treat outputs derived from private,
restricted, identifiable, or otherwise sensitive data as potentially sensitive
until they have been checked. This includes processed tables, small cell counts,
row-level predictions, maps or geocoded results, figures with identifiable
outliers, rendered reports, and saved model objects.

Saved model objects deserve special caution. Some model objects contain the
original data, model frame, residuals, predictions, identifiers, or enough
information to reveal sensitive values. Treat them as sensitive until you know
what they contain.

As a default:

- Commit small non-sensitive figures, tables, reports, and rendered HTML
  products.
- Usually commit small processed example outputs or small processed public
  outputs.
- Check outputs derived from sensitive data carefully. Usually do not commit them
  unless the project owner has approved that workflow.
- Do not commit large outputs by default. Use `results/large-files/` or discuss
  Git LFS or another large-file workflow.
- Commit readme or placeholder files that explain local-only outputs.

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
