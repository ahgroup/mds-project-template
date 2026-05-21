# TODO

## Future: Language-Agnostic / Multi-Language Project Setup

Next time this template is revisited, discuss how to make the project structure
more language agnostic and better suited for projects that use multiple
programming languages in the same repository, such as R, Python, and Julia.

Questions to address:

- Should `code/` stay organized by workflow stage (`processing-code`,
  `eda-code`, `analysis-code`) or shift toward language-neutral names such as
  `processing/`, `exploration/`, `analysis/`, and `utilities/`?
- Should language-specific code live in subfolders like `code/r/`,
  `code/python/`, and `code/julia/`, or should workflow-stage folders contain
  mixed-language scripts?
- How should `run-all` be made language agnostic?
  Possibilities include a simple `Makefile`, a `justfile`, Quarto project
  commands, or a small cross-language driver script.
- How should package/environment guidance be documented for each language while
  keeping `renv`, virtual environments, Conda, Poetry, Julia environments, and
  containers optional rather than mandatory?
- How should generated outputs stay standardized across languages, especially
  tables, figures, model outputs, and logs?
- How should `AGENTS.md`, `project-metadata.yml`, and local checks describe
  multi-language workflows clearly enough for AI assistants and novice users?
- Should examples include a minimal Python or Julia script, or should the
  default template remain R-only with documented extension patterns?

Preferred direction for now: keep the default template simple and approachable,
but document a clear extension pattern for multi-language projects.

## Future: Other Loose Ends

These are not urgent, but they would be useful future improvements.

- Decide whether generated example products should be committed by default.
  Examples include `products/report/report.html`, `results/figures/*.png`,
  `results/tables/*.rds`, and `results/tables/*.csv`. Committing them helps
  novice users see expected outputs; not committing them makes the repository
  cleaner and emphasizes full regeneration from code.
- Revisit naming conventions. The template currently uses names like
  `processing-code` and `eda-code`; future versions might use simpler,
  language-neutral names such as `processing`, `exploration`, and `analysis`.
- Consider adding a short `CHANGELOG.md` or `template-notes.md` so users can
  see what changed in the template over time without reading the full Git
  history.
- Decide whether to add a lightweight `LICENSE` and citation metadata file
  (`CITATION.cff`) so users know how to reuse and cite the template.
- Add a short "how to start a new project" checklist for students and research
  group members after creating a repository from the template.
- Add optional guidance for GitHub issue templates, pull-request checklists, and
  GitHub Actions, while keeping those features disabled by default.
- Revisit whether `code/check-project.R` should check for unresolved template
  placeholders such as `NAME`, `LINK-GOES-HERE`, and example author details.
- Consider adding optional session/software reporting to products, for example
  an appendix chunk with `sessionInfo()` or `sessioninfo::session_info()`.
- Decide how much AI-use documentation is appropriate for class assignments
  versus research manuscripts, since those contexts may need different levels of
  detail.
