# Utilities

This optional folder is for helper functions, setup checks, or shared code used
by more than one workflow stage.

The current example includes two beginner-friendly utility scripts:

- `check-project-setup.r`: checks required folders, files, and R packages
  without changing anything.
- `run-example-workflow.r`: optionally runs the setup check and then runs the
  processing, exploration, and analysis scripts in the documented order.

Keep this folder small. If a helper is only used by one processing,
exploration, or analysis script, it can usually stay next to that script
instead.
