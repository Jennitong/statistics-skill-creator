# Validation

Checks the validity and correctness of the SKILL. There will be examples of [numerous] inputs
and outcomes expected. The actual output that will be generated using Claude would be compared
with expected outcomes, and if the correctness rate is equal to 100%, the SKILL is overall
valid. Report the exact correctness.

Triggered when developer explicitly asks for the validity of the skill, the accuracy and
correctness of the test result, or anything similar.

## Input

All examples take the following inputs

- `variable 1` : description
- `variable 2` : description
- `variable 3` : description
- `variable 4` : description
- ...

## Running the examples efficiently

Do **not** invoke the full conversational skill (Steps 0–5) separately for each of the
examples below — that requires numerous separate `Rscript` process starts plus [numerous] rounds of
prose/plot generation and is unnecessarily slow. Since Step 4 of `SKILL.md` requires
every numerical result to come verbatim from `scripts/task_code1.R` /
`scripts/task_code2.R`, `scripts/task_code3.R`, the numerical/decision
path is fully deterministic. To validate it quickly:

1. Write a single `Rscript` file for all examples.
2. Compare each generated result against the expected outcome for that example.
   Exact wording does not need to match.
3. Only fall back to running the full conversational skill end-to-end with necessary plots, tables,
   or paragraphs if this script-level check reveals a discrepancy, to determine whether the bug 
   is in the R scripts, in `SKILL.md`'s instructions, or in how the assistant is following them.
   

- Example 1 (Edge Cases)
Input:
Output expected:

- Example 2 (Invalid inputs on purpose)
Input:
Output expected:

- Example 3 (Valid Inputs)
Input:
Output expected:

- Example 4
Input:
Output expected:

- Example 5
Input:
Output expected:

- Example 6
Input:
Output expected:

- Example 7
Input:
Output expected:

...

---
# Correctness Rate
Generate the actual output using the SKILL (see "Running the examples efficiently"
above for how to do this without separate full skill invocations), then verify if the
key values in the actual output are equivalent to the expected output shown above — 
wording does not have to match exactly, and numerical values can be rounded. 
Check whether the correctness rate is 100%; report the exact rate even if it is lower.

Report:
1. The correctness rate as a percentage
2. A markdown table with exactly these four columns: `Test | Outcome Expected | Outcome
   Generated | Match`, one row per example. Keep each cell terse, not a full paragraph.
3. If any example does not match, name it and explain the discrepancy in one sentence.
