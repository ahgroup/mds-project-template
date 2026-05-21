# AI-assisted work review checklist

Use this checklist before accepting AI-assisted changes.

## Project and Data Safety

- [ ] Raw data in `data/raw-data/` was not edited.
- [ ] Sensitive or private data was not pasted into an external AI tool.
- [ ] Data-use limits in `data/data-use-notes.md` were followed.
- [ ] No credentials, tokens, API keys, or private paths were added.
- [ ] New local-only data belongs in an ignored folder such as
      `data/private-data/` or `data/large-files/`.

## Reproducibility

- [ ] Code uses project-relative paths, preferably via `here::here()`.
- [ ] Required input files are documented.
- [ ] Generated outputs are saved under `results/` or the relevant product
      folder.
- [ ] Generated outputs can be recreated from code.
- [ ] `Rscript code/check-project.R` was run, or a reason is documented.
- [ ] `Rscript code/run-all.R` was run after code changes that affect outputs,
      or a reason is documented.

## Scientific and Statistical Review

- [ ] The analysis matches the research question or assignment prompt.
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
