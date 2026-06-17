# AI-assisted work review checklist

Use this checklist before accepting AI-assisted changes.

## Project and Data Safety

- [ ] Raw data in `data/raw-data/` was not edited.
- [ ] Sensitive or private data was not pasted into an external AI tool.
- [ ] Data-use limits in `data/readme-data.md` were followed.
- [ ] No credentials, tokens, API keys, or private paths were added.
- [ ] New local-only data belongs in an ignored folder such as
      `data/private-data/` or `data/large-files/`.

## Reproducibility

- [ ] Code uses project-relative paths, preferably via `here::here()`.
- [ ] Required input files are documented.
- [ ] Generated outputs are saved under `results/` or the relevant product
      folder.
- [ ] Generated outputs can be recreated from code.
- [ ] Generated outputs that are reasonably small and non-sensitive are committed
      when useful for review or rendering products.
- [ ] Large or sensitive/restricted outputs are kept in documented ignored
      locations rather than committed.
- [ ] Affected scripts listed in `usage.md` were rerun after code changes that
      affect outputs, or a reason is documented.
- [ ] Affected Quarto products were rerendered after source or result changes,
      or a reason is documented.
- [ ] If appropriate, `Rscript code/utilities/check-project-setup.r` was run
      from the project root, or a reason is documented.
- [ ] No results depend on undocumented manual edits to raw data files,
      generated tables, or generated figures.

## Template Placeholder Checklist

- [ ] Replace or explain project owner placeholders such as `NAME`.
- [ ] Replace or explain link placeholders such as `LINK-GOES-HERE`.
- [ ] Replace example author names, affiliations, ORCIDs, and email addresses in
      product templates.
- [ ] Replace example dates, titles, and project metadata where needed.
- [ ] Remove example-only wording that does not apply to the current project.

## Scientific and Statistical Review

- [ ] The analysis matches the research question or project goal.
- [ ] Cleaning decisions are justified and documented.
- [ ] Model choices are justified and not treated as automatically correct
      because AI suggested them.
- [ ] Claims in products are supported by generated results.
- [ ] Citations were checked against the source literature.

## Code Review

- [ ] Changes are small enough to review.
- [ ] Code is readable and documented where needed.
- [ ] No unrelated refactoring was introduced.
- [ ] Error messages and warnings were reviewed.
- [ ] AI-use summary was added to `ai/ai-use-log.md` when appropriate.
