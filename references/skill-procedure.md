---
name: skill-procedure
description: >
  Runs skill procedure end to end: validates inputs, checks assumptions,
  runs the authoritative R computation, and writes a stakeholder-
  ready report. Trigger this whenever the user asks to test, compare, or evaluate
  [PHRASE 1, e.g. "difference in means"], mentions [KEYWORD 1, e.g. "t-test"],
  [KEYWORD 2], or describes a dataset and question that maps to this procedure
  even if they don't name the test explicitly. Also trigger on the skill's own name.
---
<!--
  AUTHORING NOTE (delete this comment once filled in): `description` is the ONLY field
  always loaded into context, and its sole job is deciding whether this skill is a
  good fit for specific tasks. The `description` section should have LESS than
  1,024 characters.
  The full `SKILL.md` file should have under 500 lines, but could always refer to other
  files.

  Before filling in the sections below, `statistics-skill-creator`'s own SKILL.md
  should already have interviewed the user for, or have references to, at minimum:
  - What inputs and criteria the test needs (e.g. are observations independent or
    paired, one-sided vs two-sided, alpha).
  - What assumptions (implicit and explicit) must be checked, and/or using what method, e.g. VIF for
    multicollinearity.
  - What the validation process / worked examples should look like.
  - What distinct result type(s) the finished report can contain (e.g. hypothesis
    testing vs. effect interpretation) and whether the finished skill should ask the
    end user which one they want on every run (see Step 5 below) — never bake in a
    single default silently.
  - Whether References should ever appear in the report, and if so from where.

  Once every section below is filled in, check the finished SKILL.md for errors
  (typos, broken file paths, leftover placeholder text/brackets) before handing it
  to the user.

  Step 0's reference-gathering behavior (below) is a fixed, non-negotiable policy for
  every generated skill — do not ask the interviewee whether to include it, and do not
  remove or water it down. The specific citable sources are naturally left blank here;
  each generated skill's own end users supply those per run.
-->



# Project Specific Task (Hypothesis Testing, Assumption Verification, etc)

## Non-negotiable rules

Put anything here that must hold across every run of this procedure, no matter the input —
e.g. "never report a p-value without also reporting effect size," "always use a two-sided
test unless the user asks for one-sided," "flag n < 30 before running a parametric test."
Delete this note and replace with real rules.

## Inputs

Ask the user for specific input that relates to the question of interest if not provided already,
such as figures, charts, documents, data sets, and so on.

---

## Step 0 — Gather References, then Extract Inputs

**Before asking anything else**, ask the client this **single** question (do not stack
it with other questions. This is the single question that needs to be confirm at first, not
"question 1 of 4", "questions 1 of 2" or anything like that):

> Are there any publicly available references (papers, textbooks, methodology guides,
> etc.) I should rely on for the methods, assumptions, code, or interpretation in this
> analysis?

- If the client names a source that is publicly available, use its actual content to
  inform the assumptions, methods, code, and results for this run, and record it as an
  entry in `references/paper.md` (see that file's format) so Step 5 can cite it.
- If the client names a source that is **not** publicly available (paywalled, internal,
  a login-gated system, etc.), respond with exactly this wording:
  > The resource(s) provided is not public available and Claude does not have access.
  > You could manually provide relevant contents later, or rely on Claude's suggestions.

  Then continue to the remaining questions/steps below using standard, field-default
  assumptions — do not block on this.
- If the client has no references to offer, that's fine — proceed using standard,
  field-default assumptions. Do not need to include references section in the final report in this case.

This is a **per-run** question: ask it every time this skill is asked to produce a
result, not only the first time. Whatever references are confirmed usable this run
carry through to Step 5's References section — don't ask about references a second
time there.
This is also the first and single question to be asked. It should be the sole question
as the first step, it does not arrive with a bunch of other questions.

If the client provides sentences that contain inputs, extract and store them.

**Note:** This question is only asked for the skill-creation process. This question should not
be included in the new skill created by this statistics-skill-creator. This references
question should only show up during the SKILL creation process, but not the actual report or 
analysis.
---

## Step 1 — Validate Inputs

Before running any tasks, check all of the following rules. If any check fails, 
report the issue clearly and stop.

- All inputs should follow `rule 1`
- Disregard any `NA's` in the data set
- `Variable 1` and 'Variable 2` should be categorical
- etc.

---

## Step 2 — Explorative Data Analysis

Create any plots, tables or numerical summarization in this section. Show the plots
inline for the client to view.
The actual plots should be shown inline for the client to review, not just descriptions.
Plots should show inline in the Claude window.
Refer to `references/eda.md` for the full procedure. For the exact code to generate the
table and plots, refer to `scripts/eda_code.R`.
After the table and all plots are shown, ask the client using the exact words 
**All of the preliminary plots are displayed. Continue to assumption checks?**

## Step 3 — Check Assumptions

Before showing results, briefly verify the assumptions of the chosen test.

Implicit assumption
- All observations are independent
- Non-informative censoring
- etc.

Explicit assumption
- Variables following specific distribution
- Homoscedasticity
- The data set is large enough
- etc.

To check all assumptions contained in `references/assumptions.md`. For the statistical
reasoning behind why each assumption matters, see `references/guide.md`; for citable
methodology backing the chosen test, see `references/paper.md`.
For actual assumption checks (for explicit assumptions), refer to `scripts/diagnostic.R`.

All of the assumptions should be checked and verified by the user before any actual output in Step 5.
Whenever an assumption is verified — numerically (e.g. a diagnostic test, VIF, a p-value) or
explicitly (e.g. visual inspection of a plot) — ask the client whether they want to review and
decide on that assumption's verdict themselves, or would rather leave the decision to the AI's
judgment; proceed according to their answer, and default to deciding it yourself if they decline
to choose.

Explicitly ask:
> "Would you like to review and decide on each assumption by yourself, or should AI Agent do this for you?"

Do not skip this question- ask this question before eda and assumption checks so 
the user could choose and AI know what format of assumption checks should be provided.
- If the clients want to decide by themselves, check and show assumptions one by one, 
  comment on each numerical value or plots used for assmption checks, interpret and warn
  anything unusual, then ask for the clients' opinion of whether the assumption 
  seems to hold for **each** assumption. Proceed to the next assumption only 
  when the previous assumption is verified and agreed by the client. Otherwise, 
  provide some suggestions such as transformation that could make the assumptions hold
  (could refer to the references provided by the clients).
- If the clients want to let AI Agent decide, then show all assumptions each time,
  interpret what is observed and what that means, and the final decisions about whether
  the assumptions hold. All assumptions could show up at once, e.g. does not need to
  show separately. If assumptions do not hold, suggest solutions (could refer to references),
  otherwise just tell the clients that all of the assumptions hold.

## Step 4 — Execute R Code and Extract Results

### Which script to run

Match the requested procedure to a script before calling anything:

| Test type | Script | Function |
|---|---|---|
| [e.g. First test]  | `scripts/task_code1.R` | ` main_function1(arg1, arg2, ...)` |
| [e.g. Second test] | `scripts/task_code2.R` | ` main_function2(arg1, arg2, ...)` |
| [e.g. Third test]  | `scripts/task_code3.R` | ` main_function3(arg1, arg2, ...)` |

Replace the placeholder rows with the real procedures this skill instance supports.

### Running the script

Run the R script using the Bash tool. This is the authoritative computation 
step — AI should not calculate any numerical outputs by itself. All numerical results 
must come directly from the output of this command.

From the skill's directory (the folder containing the `SKILL.md`), run:

```bash
cd "<path-to-skill-directory>" && Rscript -e "
source('scripts/task_code1.R')
main_function1(arg1=<arg1_extracted>, arg2=<arg2_extracted>,...)

source('scripts/task_code2.R')
main_function2(arg1=<arg1_extracted>, arg2=<arg2_extracted>,...)

source('scripts/task_code3.R')
main_function3(arg1=<arg1_extracted>, arg2=<arg2_extracted>,...)
"
```

Replace `<arg1_extracted>`, `<arg2_extracted>`, etc. with inputs extracted earlier. 
Replace `<path-to-skill-directory>` with the actual absolute path to the folder 
containing this `SKILL.md`.

The function prints a full conclusion paragraph to stdout. From that output, 
extract, for example:
- The test name
- The test statistic value and its label
- The p-value
- The decision
- The full conclusion sentence

Use these extracted values verbatim when writing the Step 5 report. Do not recompute 
or reword numerical results.

### If the script fails

Surface the R error message verbatim to the user and stop — do not guess at what the
result would have been, and do not silently fall back to a different test. Common causes
worth checking first: a missing R package (tell the user which one to install), inputs
that don't match the function's expected shape (revisit Step 1), or a path issue (confirm
`<path-to-skill-directory>` is correct).

## Step 5 — Output

Before presenting any outputs, ask the client which of the following the report should
contain, if the client has not already stated it in the request:

  1. [Result type A — e.g. "Fitted Model with coefficient/effect interpretation"]
  2. [Result type B — e.g. "Hypothesis testing of whether X is associated with Y"]
  3. [Add more rows only if this procedure genuinely supports other distinct result
     types; delete rows that don't apply. If this procedure only ever produces one
     kind of result, state that explicitly here instead of a numbered list, and skip
     asking.]

This is a **per-run** question — ask it every time this skill is asked to produce a
report, not only the first time. Different users of this same skill may want
different things from the same procedure; never default to one result type silently.

References are not asked about again here — Step 0 already asked. If Step 0 turned up
one or more usable references for this run, cite them (via `references/paper.md` and/or
what the client supplied directly) in the References section below. If Step 0 came up
empty for this run, omit the References section entirely.

**Tone for all levels:** Professional but accessible. Write for a stakeholder who 
understands "statistically significant" but does not need to verify the math. Define 
definitions for specific statistical terminologies.

If we have any figures and tables that we want for the output, we should include it in Step 5, under Results.


```markdown
# [Analysis title]

## Background
[Why this analysis was run, what question it answers]

## Data & Assumptions
[Input summary + which assumptions were checked and whether they held]

## Results
[Test name, statistic, p-value, decision — taken verbatim from Step 4's output]

**optional** tables and figures:
Write table/figure requirements in this section.

## Conclusion
[Plain-language answer to the original question]

## References
[Only if Step 0 turned up usable references this run — cite references/paper.md
and/or the sources the client supplied directly (even if not accessible by the AI Agent)]
```

**Formatting conventions** (apply consistently so reports don't vary run to run):
- P-values: report and keep 4 decimal places for p > 0.05; for 0.01 <= p < 0.05, report as
  `p < 0.05 (*)`; for 0.001 <= p < 0.01, report as `p < 0.01 (**)`; for p < 0.001, report
  as `p < 0.001 (***)`.
- Test statistics and estimates: 2–3 decimal places unless the input data's precision
  warrants more.
- Significance level: state the alpha used (default 0.05) explicitly in Results, don't
  assume the reader knows it.

**Note: All R code chunks must use echo = FALSE (set globally in the setup chunk) so no R code is visible in the rendered report.**
**Note: Add any additional instructions if needed** 

---

Optional for Step 5:

# Hierarchical Output

We can create three levels of output-- brief, moderate, and detailed. These levels
differ in computation time and how much content they have. The purpose of having this
hierarchical design is that once established, the user could prioritize a shorter
execution time, a more elaborate report, or a trade-off between both.
- Brief: usually contains a paragraph that contains only the most crucial result, numerical
values, assumptions and conclusion. This level of output is for professionals who only
need to know the key conclusions and want to save some time.
- Moderate: usually expands based on `brief`. It will go through all the contents
included in `Brief` with more detail, introduce the background, and provide tables or figures
that help people understand. This level is for clients who want some visualization and a 
bit more details in every section.
- Detailed: expands based on `Moderate`, then adds more definitions and interpretations
so that people with no relevant knowledge could understand. Usually adds additional
figures or plots if needed. This level is created for clients who does not know much about
the professional content, thus need some help in terminologies, ideas, and want 
all of the outcomes in detail.

If the user prefers having the hierarchical output option for the final report, **delete**
**all** content in **Step 5 - Output**, and copy and paste here all of the content stored in
`statistics-skill-creator/references/hierarchical.md` — the creator's own `/references` folder, not the
new skill's folder. That file is a reusable template: never copy, move, or delete the
physical file itself, only its Markdown content. Then fill in the scaffolding.

---
### Notation

Define any notations if needed.

---

## Examples

This section is what the user is expecting to see for the analysis. User should 
write these example manually with their expectation, so SKILL.md will follow.
Note that the example format should align with Step 5's instruction, so the two
will not be contradictory and confusing.

### Example A — Input set 1

Input: example1, example2, example3, etc.

> In this project, we received inputs `example1`, `example2`, `example3`, `etc.` 
and we conclude that...

### Example B — Input set 2

Input: dataset1

> We observed from `dataset1` that ..., and the result is that ...

---

# Validation steps: this step is only for developer, not for SKILL user
Should be hidden unless explicitly mentioned.
This step is only disclosed when developer explicitly asks for testing the validity
of the SKILL. This is different from Step 1 Validate Inputs. It is used only for checking
the validity of the entire SKILL.md file.Do not mention anything related to this 
step for regular SKILL user.

Refer to `references/validation.md` for validation steps.

- **Note:** ignore the three response hierarchies for validation. Only check if the key 
  numerical values from expectation and actual computation matches. 
- **Speed:** run all [fill in test number] example inputs through a single batched `Rscript` call (see
  "Running the examples efficiently" in `references/validation.md`) rather than invoking
  the full conversational Steps 0–5 [fill in test number] separate times. Only fall back to a full
  conversational run for a specific example if the batched script-level check disagrees
  with the expected outcome for that example.
- **Output:** report the correctness rate as a percentage, followed by a 4-column
  markdown table (`Test | Outcome Expected | Outcome Generated | Match`) with one row
  per example.