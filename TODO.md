# TODO

## Completed: Language-Agnostic / Multi-Language Project Setup

The template now keeps the default example simple and R-based, while documenting
a clear extension pattern for multi-language projects.

Implemented decisions:

- `code/` is organized by workflow stage with language-neutral folders:
  `processing/`, `exploration/`, and `analysis/`.
- Mixed-language scripts can live together in the relevant workflow-stage
  folder. Language-specific subfolders are optional for larger projects.
- The project no longer has a `run-all` or `check-project` script. Users run
  workflow steps manually.
- `USAGE.md` provides the practical workflow inventory with steps, inputs,
  outputs, language, and run-order information.
- README, AGENTS, project metadata, AI guidance, and result/data documentation
  now describe the default R/Quarto example as one supported path rather than
  the only possible path.
- The default template remains R-only at runtime. Python and Julia are documented
  as extension patterns rather than required examples.

## Future: Other Loose Ends

These are not urgent, but they would be useful future improvements.

- Decide whether generated example products should be committed by default.
  Examples include `products/report/report.html`, `results/figures/*.png`,
  `results/tables/*.rds`, and `results/tables/*.csv`. Committing them helps
  novice users see expected outputs; not committing them makes the repository
  cleaner and emphasizes full regeneration from code.
- Consider adding a small helper-function example under `code/utilities/` if
  future users need a concrete pattern for shared code.
- Consider adding a short `CHANGELOG.md` or `template-notes.md` so users can
  see what changed in the template over time without reading the full Git
  history.
- Decide whether to add a lightweight `LICENSE` and citation metadata file
  (`CITATION.cff`) so users know how to reuse and cite the template.
- Add a short "how to start a new project" checklist for students and research
  group members after creating a repository from the template.
- Add optional guidance for GitHub issue templates, pull-request checklists, and
  GitHub Actions, while keeping those features disabled by default.
- Consider adding guidance to `USAGE.md` or the AI review checklist for checking
  unresolved template placeholders such as `NAME`, `LINK-GOES-HERE`, and
  example author details.
- Consider adding optional session/software reporting to products, for example
  an appendix chunk with `sessionInfo()` or `sessioninfo::session_info()`.
- Decide how much AI-use documentation is appropriate for class assignments
  versus research manuscripts, since those contexts may need different levels of
  detail.
