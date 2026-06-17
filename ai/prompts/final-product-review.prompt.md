# Prompt: Review a Final Report or Product

Use this prompt before submitting or sharing a report, manuscript, presentation,
poster, website, or other project product.

```text
Please review this project product for clarity, reproducibility, and consistency
with the project files. Use readme.md, usage.md, data/readme-data.md,
results/readme-results.md, and the product source file as context. You may also
use ai/project-summary.yml as a concise AI-oriented summary, but treat the
human-facing documentation as the source of truth.

Focus on:

- whether the research question, data source, methods, results, and conclusions
  are clearly explained;
- whether claims in the product are supported by generated figures, tables, or
  other outputs;
- whether figures and tables are loaded from documented project paths rather than
  manually copied or edited without explanation;
- whether interpretations are appropriately cautious and match the analysis;
- whether limitations, missing data, and uncertainty are discussed;
- whether citations are present where needed and should be verified by a human;
- whether AI use should be disclosed according to ai/ai-use-policy.md
  or project-specific rules;
- whether unresolved template placeholders remain.

Fix only obvious small typos if asked to edit. For unclear scientific,
statistical, citation, privacy, or authorship issues, report the concern without
changing the text.
```
