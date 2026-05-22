# Raw Data

This folder contains raw data. Add subfolders if that makes sense for your
project.

The example project includes a small made-up dataset in an Excel file. It has
the variables `Height`, `Weight`, and `Gender` for a few imaginary individuals.
The dataset intentionally includes some faulty entries that need to be cleaned.

In general, every dataset should include metadata explaining what each variable
means. This is often called a codebook. For the example data, the codebook is a
second sheet in the Excel file.

Raw data should generally not be edited by hand. Load it and clean it with code
so the process is reproducible.
