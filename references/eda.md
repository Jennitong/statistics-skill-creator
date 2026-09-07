# Exploratory Data Analysis (EDA) 

**Rule**: The relevant plots need to be displayed inline for the clinet to review,
with brief interpretations. The plots should show inline directly.

**Rule**: The exact R code should be run by the AI Agent. Any plots or tables should be
generated using the R code directly. Refer to `scripts/eda_code.R` for the code.

**Rule**: Every plot below is the literal PNG/JPEG file R rendered, displayed inline
with its own Read tool call immediately after it is generated — never redrawn with a
charting library from re-extracted data points. All the relevant plots shown show for
the client to review. **Do not** just write interpretations/ descriptions; the client
should be able to see the plots themselves.Plots should be inline in the chat window.

**Rule**: Display each plot/table with the Read tool only, directly in the chat
window — one large inline image per plot, readable without clicking. Issue Read calls
**one at a time**, each with a sentence of text immediately before or after it — never
two or more Read calls back to back with nothing in between, since the client collapses
consecutive Read calls into a hidden "Read N files" accordion that hides the images. Do
not also send the file via `SendUserFile`, and never publish plots/tables as a separate
Artifact/hosted page — everything must render inline in the chat window itself.


## 1. Establish Context

Before touching code, determine and state:
- What one row represents (unit of observation).
- The provenance and collection method of the data, if known.
- The time period / scope covered.
- The question the analysis is meant to answer.

If this context is not available from the user or accompanying documentation, note the gap explicitly rather than assuming.

## 2. Data Quality Checks

Report as findings, not just output:
- Which columns have missing data, what percentage, and whether the pattern looks random or structural (e.g., missing only for a particular category).
- Any duplicated rows or key violations.
- Any categorical values that look like typos, inconsistent casing, or should be collapsed (e.g., "NY" / "New York" / "ny").
- Any values outside a plausible range (negative ages, future dates, etc.).


## 3. Initial Inspection

- Summary statistics table
Before plotting, produce a descriptive summary table for the response and all
covariates (continuous and categorical) using `gtsummary::tbl_summary()`. Refer to
`scripts/eda_code.R` for the exact code. Do not hand-type means, SDs, or counts —
they must come from this table.
The table is rendered to `summary_table.png` in `plot_dir` by the same script (via
`flextable::save_as_image()`) — it is not printed as text. Display that PNG inline with
its own Read tool call directly under the "Summary Statistics" heading, the same way
every other plot in this step is displayed. If `flextable` fails to install or render,
surface the R error verbatim and stop — do not fall back to a hand-typed table.

## 4. Visual Inspection (Plots)

Any plots we would like to show as a preliminary check.
Refer to `scripts/eda_code.R` for plotting.

## 5. Pitfalls to Avoid

- Do not drop missing data without characterizing why it's missing first.
- Do not treat outliers as errors without investigating them.
- Do not report correlation as causation.
- Do not perform cleaning or imputation steps that were not requested or confirmed by the user.

# Format: the table and plots should be shown in the underneath format

```markdown

# Exploratory Data Analysis

## Context
[...]

## Data Quality Checks
[...]

## Summary Statistics Table
[Generate tables using appropriate code]

## Plots
[Generate plots using appropriate code]

...

```