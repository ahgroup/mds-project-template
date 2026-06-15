# Prompt: Review Code for Reproducibility

Use this prompt when asking an AI tool to review project code.

```text
Please review the changed project code and Quarto files for reproducibility problems.
Use code-guidelines.md as the coding-standard reference. Focus on:

- raw data being modified by hand or overwritten;
- absolute paths or hidden local dependencies;
- generated outputs that are not saved or documented;
- generated outputs that should be committed, ignored as large files, or kept
  private because they contain sensitive/restricted information;
- missing package dependencies;
- code that depends on an interactive session state;
- inconsistencies with the manual run order in usage.md;
- scientific-code issues such as insufficient comments, unclear assumptions,
  unnecessary complexity, overly deep structure, hidden error handling, or
  avoidable new dependencies;
- statistical or data-cleaning choices that need human review;
- outputs that should be regenerated.

Do not rewrite the code unless I ask. Report findings with file paths and line
numbers when possible, then suggest the smallest useful fixes.
```
