# Prompt: Review a Modeling Plan

Use this prompt before implementing or revising the main statistical or machine
learning analysis.

```text
Please review this modeling plan for a reproducible data-analysis project. Use
readme.md, usage.md, data/readme-data.md, code/readme-code.md, and any existing
analysis-plan notes as context. You may also use ai/project-summary.yml as a
concise AI-oriented summary, but treat the human-facing documentation as the
source of truth.

Evaluate whether the proposed modeling approach fits the question and data.
Focus on:

- the research question, outcome, predictors, and target population;
- whether the data are suitable for the proposed model;
- missing data, measurement issues, confounding, clustering, time/order effects,
  leakage, or other design problems;
- assumptions that should be checked;
- model diagnostics and sensitivity/robustness checks;
- validation strategy, especially for predictive or machine-learning models;
- what figures, tables, and generated outputs should be produced;
- what choices require human or subject-matter review.

Do not claim a method is appropriate just because it is common. Explain why each
major analysis choice fits or does not fit the question and data. Do not write
or change code unless I ask.
```
