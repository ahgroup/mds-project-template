# Prompt: Review Code for Reproducibility

Use this prompt when asking an AI tool to review project code.

```text
Please review the changed R and Quarto files for reproducibility problems.
Focus on:

- raw data being modified by hand or overwritten;
- absolute paths or hidden local dependencies;
- generated outputs that are not saved or documented;
- missing package dependencies;
- code that depends on the current R session state;
- statistical or data-cleaning choices that need human review;
- outputs that should be regenerated.

Do not rewrite the code unless I ask. Report findings with file paths and line
numbers when possible, then suggest the smallest useful fixes.
```
