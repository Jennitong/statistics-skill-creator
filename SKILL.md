---
name: statistics-skill-creator
description: >
  Interviews the user and builds a brand-new statistics-analysis SKILL folder
  (SKILL.md, references/, scripts/) by filling in the template at
  references/skill-procedure.md section by section with details specific to the
  statistical test or procedure requested. The created SKILL validates inputs,
  checks assumptions, runs the authoritative R computation, and writes a
  stakeholder-ready report. Trigger this skill creator whenever the user asks to
  create, build, or scaffold a SKILL for a statistical test or procedure, wants to
  turn a stats method into a reusable Claude skill, or says things like "new
  skill", "skill-procedure", "make this a skill". Also trigger on the skill's own
  name, statistics-skill-creator.
---

# Statistics Skill Creator

This skill does not itself run any statistical test. It builds a **new, standalone**
SKILL folder for one — matching the shape of `references/skill-procedure.md` — by
interviewing the user for the procedure-specific details that template leaves as
placeholders, then writing the filled-in files to disk.

Never invent the statistical substance (assumptions, non-negotiable rules, which test
to use, alpha) and numerical values (output) on your own. Formatting-only choices 
may get a stated default. See "How to ask" below.

## Step 0 — Identify the procedure

Read the user's request for what test/procedure this skill is for (e.g. "paired
t-test", "linear regression", "one-way ANOVA", "model selection"). If it isn't stated, ask.

The underneath question is only asked during the skill-creation process, but not in
the new skill.
**Before asking anything else**, ask the client:

> Are there any publicly available references (papers, textbooks, methodology guides,
> etc.) I should rely on for the methods, assumptions, code, or interpretation in this
> analysis?

This question is shown as the first question for the SKILL-creation process.
After getting the user's response, AI should access and read the references before 
asking any other questions regarding specific methodologies or details for 
the task.

If the client names one or more usable references, follow up (still before moving on
to anything else) with:

> What citation format would you like these listed in — APA, MLA, Chicago, or another
> style? And could you give me the author(s), year, title, and publisher/journal/URL
> for each, for whatever isn't already implied by what you gave me?

Format every citation exactly in the style the client picks, filling in only the
fields they confirm — never invent an author, year, or venue that wasn't given or
confirmed. Record the finished, formatted citations in the new skill's
`references/paper.md` now, at creation time — this is a one-time step, not something
the finished skill repeats per run.

Because the references are now fixed at creation time, the generated skill must
**not** re-ask its own end users the references question at all when it later runs —
see "Building in the references question" below for exactly how Step 0 and Step 5
change in that case. If the client has no references to offer, skip the
citation-format question entirely and keep the generated skill's standard per-run
references question (unchanged, see Branch B below).

Also, read [`references/skill-procedure.md`](references/skill-procedure.md) in full before
proceeding — it is the master template every generated skill is built from.

**Note**: read through both references and `references/skill-procedure.md` before asking 
any other qustions.

## Step 1 — Interview the user, section by section

Walk the sections of `references/skill-procedure.md` in order. For each, use what the user has
already provided, e.g. references; for anything missing, give a concrete suggestion 
and ask a direct question before writing that section. Do not silently assume 
anything that changes the statistical result.

| Section in the template | What you need | If missing, ask | Suggestion you may offer |
|---|---|---|---|
| Frontmatter (`name`, `description`) | Skill name (kebab-case) and 3–5 trigger phrases/keywords | "What should the skill be called, and what phrases should trigger it?" | Derive name from the test (e.g. `paired-t-test`); propose trigger keywords from common synonyms for the test |
| Non-negotiable rules | Hard rules that must hold on every run | "Any rules that must always hold — e.g. always report effect size, two-sided unless stated, flag small n?" | Suggest 1–2 field-standard rules for that test family, but confirm before locking them in |
| Inputs | What data/arguments the test needs, and their roles (response vs. predictor, paired vs. independent, raw vectors vs. a data frame) | "What inputs does this test take, and what format are they in?" | Infer the minimal argument set from the test's standard R implementation, then confirm |
| Assumption decisions| Whether the client or AI Agent need to verify the assumptions| "Would you like to review and decide on each assumption by yourself, or should AI Agent do this for you?" | If all assumptions could be verified using numerical values computed, then AI Agent could be a better decision maker, however, if plots are more important, then it is better to let clients/users decide |
| Step 1 — Validate Inputs | Hard requirements: data types, NA handling, minimum sample size, variable coding | "How should invalid input be handled — reject, or coerce/warn?" | Default: reject with a clear message; disregard `NA`s unless told otherwise |
| Step 2 — EDA | Which tables/plots are relevant given the variable types | Usually derivable from variable types already gathered; ask only if variable roles are still unclear | Continuous covariate → scatterplot vs. response; categorical covariate → boxplot vs. response (see `references/eda.md`) |
| Step 3 — Assumptions | The full list of implicit and explicit assumptions for this specific test, and how each explicit one is checked | "What assumptions does this test require, and how should each be checked?" — **never invent this list; statistical correctness depends on it; relevant details might appear in references provided** | Offer the textbook list for that test family (e.g. t-test: independence, normality, equal variance) — user confirms or corrects |
| Step 4 — Execute R Code | Which R function/package implements the test, and how many distinct task scripts are needed | "Which R function implements this (e.g. `stats::t.test`, `survival::coxph`)? Does this skill need more than one variant (e.g. one test path per assumption outcome)?" | Default to one `task_codeN.R` per distinct decision branch (e.g. Fisher's exact vs. chi-square) |
| Step 5 — Output | Single-level (general) report, or hierarchical (brief/moderate/detailed)? What extra tables/plots (beyond EDA) belong in Results? | Always give the explanation below *before* asking, then ask: "Do you want a general output level, or hierarchical output?" | If hierarchical is wanted, use `references/hierarchical.md`'s content instead of the template's flat Step 5 — see Step 2 below |
| Step 5 — Result type(s) | The distinct kinds of result this test's report can present (e.g. hypothesis-testing decision, effect/coefficient interpretation, predicted values) | "For this procedure, what output should the report contain — a hypothesis-testing decision, an effect/coefficient interpretation, or should the finished skill ask the end user each time it runs?" | Offer the standard options for that test family, around two to three suggestions (e.g. regression: fitted-model interpretation vs. hypothesis testing)|
| References | Whether the client has real, citable references to bake in now, and if so, which citation format (APA/MLA/Chicago/...) and what author/year/title/venue details to format them with | Step 0's opening question, then (only if references were offered) the citation-format follow-up | If references are supplied, format and store them now in `references/paper.md` and drop the generated skill's per-run references question entirely; if not, the generated skill keeps asking its own end users every run — see "Building in the references question" below |
| Examples | 1–2+ worked examples with the input and the expected conclusion; if the client supplies an actual data file (CSV, etc.) for one, that file itself | "Can you give an example input and what conclusion it should produce?" — user-supplied examples are preferred, since they reflect real cases this skill needs to get right | If the user has none ready, don't block on it — propose your own (see below) for them to confirm or edit. If a real data file is supplied, save it into the new skill's `data/` folder and reference it by path (`data/<name>.csv`) instead of inlining values; skip the `data/` folder entirely if no file was ever supplied |
| Validation | Whether validation should be built from worked examples, simulated data, or both, and the specific cases within that (edge case, deliberately invalid input, at least one valid/true-effect case) (refer to `references/validation.md`'s scaffold); reuse any data file(s) from Examples where applicable | "For validation of the skill, would you like to suggest some examples, or would you like to suggest some simulations? I can do either for you." — then follow "Choosing between examples and simulations for validation" below | Suggest one of each missing category, in whichever mode (examples or simulations) the user picked. Point validation inputs at `data/<name>.csv` rather than restating raw values whenever a data file already exists in the new skill's `data/` folder |
| Folder Storage| Where the newly created SKILL folder should be saved (e.g. desktop/doanloades, etc.)| "Where in your device would you like the SKILL folder to be saved?" | ".../Downloades", ".../Desktop", etc.) |

### Suggesting examples when the user has none

Worked examples are optimally user-supplied — they reflect real cases the skill must
handle correctly. But don't let a blank answer stall the interview: propose your own,
grounded in the procedure and inputs already agreed on, and ask the user to confirm,
edit, or swap them out. For each suggested example, state the input values and the
conclusion you'd expect the finished skill to produce, so the user can sanity-check it
rather than invent one from scratch. Cover, where relevant:

- A typical/valid case (feeds both `## Examples` and validation's "valid inputs" row).
- An edge case (small sample size, a boundary value, a tie, near-zero variance, 
  zero-value in some levels of the categorical variable if permitted, etc. —
  whatever is relevant to this test).
- A deliberately invalid input (wrong type, missing required field, mismatched
  lengths) to confirm Step 1's validation behavior.

Never mark a suggested example as accepted without the user confirming it — an
unconfirmed guess at the "expected outcome" would make `references/validation.md`'s
correctness check meaningless.

### Choosing between examples and simulations for validation

Before drafting anything for `references/validation.md`, ask the client which mode
they want validation built from:

> For validation of the skill, would you like to suggest some examples, or would you
> like to suggest some simulations? I can do either for you.

**If the client picks examples** — proceed exactly as in "Suggesting examples when the
user has none" above: reuse the Examples answers wherever they already cover a case,
and suggest/confirm the rest (edge case, invalid input, valid case).

**If the client picks simulations** — propose 1–2 simulated datasets appropriate to
this procedure's statistical logic, each with a known ground truth built into how it's
generated, and also ask the client whether they have their own simulation scenario(s)
to provide instead. Ground every suggested simulation in what should or shouldn't be
detected, e.g.:

- For a test of association/effect (regression, ANOVA, proportion tests, etc.):
  simulate data with **no true relationship** (e.g., an outcome drawn independently of,
  or randomly permuted against, the predictor) — the test should correctly fail to
  detect an effect — and simulate data with a **known, injected effect** of a stated
  size — the test should correctly detect it.
- For assumption checks specifically (normality, equal variance, independence, etc.):
  simulate data that **violates** the assumption on purpose (e.g., heavy-tailed errors
  for a normality check, an AR(1) structure for an independence check) so the skill's
  assumption-check step is confirmed to flag it, alongside data that **satisfies** the
  assumption so it's confirmed not to false-flag.
- State the generating process precisely enough to be reproducible: sample size,
  distributions/parameters, injected effect size, and a fixed random seed. Record this
  description (not just the realized numbers) in `references/validation.md`'s Input
  field for that example.
- Never present a simulated "expected outcome" as ground truth without the user
  confirming it — same rule as user-supplied or AI-suggested examples.

Either way, the comparison step at the bottom of `references/validation.md`
("Correctness Rate") does not change: it always compares the actual output the
finished skill produces against the expected/true answer for that example or
simulation, and reports the correctness rate and per-case table exactly as scaffolded.

### Explaining the output-level choice

Every time you reach the Step 5 question, explain it in these terms (adapt the wording,
keep the substance) before asking which the user wants — don't just name the two options:

> Hierarchical output aims to trade off depth against speed at the moment the user 
> request a result, instead of being locked into one fixed report. The user would
> pick from three levels: **brief** (one paragraph — method, assumptions, 
> key numbers, and the decision, no tables or plots), **moderate** (keep all from brief, adds
> background, a key plot, and a key table), or **detailed** (keep all from moderate, 
> adds a plain-language interpretation, term definitions, and caveats for a 
> non-statistical reader). A **general** output level skips this choice entirely 
> and always returns one fixed report format.

Then ask which one they want. If hierarchical, confirm the content should still follow
`references/hierarchical.md`'s scaffolding (don't invent a different leveling scheme).

### Building in the result-type question

Different users of the same finished skill often want different things from the same
procedure — one wants a formal hypothesis-testing decision, another just wants the
fitted model and coefficient interpretation, another wants both. Never bake in one
fixed result type as a silent default. Unless the test family genuinely has only one
kind of result to report (confirm this with the user rather than assuming it), the
generated `SKILL.md`'s own Step 5 must open with an explicit question to *its* end
user, e.g.:

> Before presenting any outputs, ask the client which of the following the report
> should contain, if not already stated: (1) [effect/coefficient interpretation], (2)
> [hypothesis-testing decision], ... — fill in with the real options for this
> procedure, agreed on with the user during this interview. Suggest two to three options.

This is a per-run question the finished skill asks every time it produces a report,
not a one-time choice made now. Confirm with the user during this interview which
options belong in that list.

### Building in the references question

Whether the generated skill asks its own end users for references depends on what
happened in **this** creation interview — pick one branch, not both.

**Branch A — the client supplied usable references during this interview.** Do not
carry any references question into the new skill — its end users are never asked.
Instead:
- The citations, already formatted in the client's chosen style, live in the new
  skill's `references/paper.md` (filled in per the citation-format follow-up above).
- The new `SKILL.md`'s Step 0 uses `skill-procedure.md`'s **Variant A** wording (skip
  straight to "Extract Inputs" — no question asked).
- The new `SKILL.md`'s Step 5 References section is unconditional: it always lists
  the pre-baked citations from `references/paper.md`, since they're fixed and don't
  depend on anything happening at run time.

**Branch B — the client had no references to offer.** Keep the current, unchanged
behavior: the generated skill must ask its own end user for references **before
anything else**, as the opening of its Step 0 (`skill-procedure.md`'s **Variant B**).
Carry the wording through verbatim:

> Are there any publicly available references (papers, textbooks, methodology guides, websites, PDFs,
> etc.) I should rely on for the methods, assumptions, code, or interpretation in this
> analysis?

- Publicly available source named or url provided → use its actual content for 
  assumptions, methods, code, and results this run, and record it in `references/paper.md`.
- Named source is not publicly available → reply with exactly: "The resource(s)
  provided is not public available and Claude does not have access. You could
  manually provide relevant contents later, or rely on Claude's suggestions." Then
  continue with the rest of the run using standard, field-default assumptions.
- No references offered → continue using standard, field-default assumptions.

This is a per-run ask in Branch B only, not one-time. Whatever is confirmed usable that
run flows straight into that run's Step 5 References section (or the hierarchical
moderate/detailed levels' References section, if hierarchical output was chosen) —
Step 5 does not ask about references a second time.

In **both** branches, include `references/paper.md` in the new skill's `references/`
folder (even close to empty in Branch B) so there's somewhere to record citations.

## Step 2 — Generate the files

Create a new folder named after the skill (e.g. `paired-t-test/`), sibling to
`statistics-skill-creator/`, containing:

- `SKILL.md` — copy `references/skill-procedure.md`'s structure verbatim, with every
  section from Step 1 filled in. If hierarchical output was requested, delete that
  template's flat **Step 5 — Output** and paste in `references/hierarchical.md`'s content instead
  (per the instructions inside that file); otherwise keep the flat version and delete
  the "Optional for Step 5" block. For Step 0, keep exactly one of the two variants
  per "Building in the references question": **Variant A** (no question, References
  section always shown) if the client supplied usable references this interview,
  otherwise **Variant B** (today's per-run question, unchanged). Delete the
  `<!-- AUTHORING NOTE -->` comments and the variant you didn't use, and the
  `# Validation steps` section is kept (it's meant to ship with the finished skill, just
  hidden from regular users, per its own text).
- `references/eda.md`, `references/assumptions.md`, `references/guide.md`,
  `references/validation.md` — filled in for this procedure. `references/paper.md` is
  always included (per the fixed references policy above) — pre-populate it with any
  real citable methodology sources the user names during this interview, formatted in
  their chosen citation style; do not include this section if the user did not provide any 
  specific references.
- `data/` — only if the client supplied an actual data file (CSV or similar) used for
  a worked example or a validation case. Copy the file(s) in as provided, keeping the
  given filename (e.g. `data/patient_outcomes.csv`), and point `## Examples` and
  `references/validation.md`'s example inputs at that relative path (e.g. "Input:
  `data/patient_outcomes.csv`") instead of restating raw values inline. If no data
  file was ever supplied, skip this folder entirely — don't create an empty one.
- `scripts/eda_code.R`, `scripts/diagnostic.R`, `scripts/task_code1.R` (renumber/add
  more as decided in Step 1) — real, runnable R code implementing what was discussed,
  not placeholder comments. Each `task_codeN.R` follows the
  `validate_inputs` → `check_assumptions` → `run_test` → `report_conclusion`
  structure already scaffolded in the template, with a `main_functionN` that prints a
  full conclusion paragraph to stdout.

Use the *existing* scaffold files in this folder as the literal source for what to
copy and adapt — do not re-derive their structure from scratch.

## Step 3 — Self-check before delivering

Before telling the user the skill is ready, verify:

- Every `references/...`, `scripts/...`, and `data/...` path mentioned inside the new
  `SKILL.md` and its reference files actually exists in the new folder (open each file
  and grep for `references/`, `scripts/`, and `data/` to confirm — this exact class of
  bug, a path pointing at a file that doesn't exist, is what shipped in this template
  before it was fixed).
- If no data file was ever supplied during the interview, confirm no `data/` folder
  was created and no `data/...` path was left in any file.
- Exactly one references variant survives: if references were supplied this
  interview, `references/paper.md` has the formatted citations, Step 0 asks no
  question, and Step 5's References section is unconditional; otherwise Step 0 keeps
  its per-run question and Step 5's References section stays conditional on it. No
  leftover trace of the other branch (e.g. an unused question, or a hard-coded
  References section with nothing behind it).
- No leftover placeholder text remains (`[...]`, `TODO`, `e.g.` scaffolding, bracketed
  instructions).
- The YAML frontmatter is valid (opens and closes with `---`, has `name` and
  `description` keys) and `description` is under 1,024 characters.
- `SKILL.md` is under 500 lines.
- Every assumption and non-negotiable rule traces back to something the user actually
  confirmed in Step 1, not something assumed.

Report back concisely: the new folder's path, what was created, and anything the user
should double check (e.g. an R package to install).

## Step 4 — Self-check before delivering

Do not randomly save the created folder in the device. Ask the client where the 
folder should be saved, so the client knows where exactly to find the folder.
## How to ask

- Batch related questions together rather than one at a time.
- Lead with a concrete suggestion, then ask for confirmation or correction — don't
  present an open-ended blank.
- The suggestions should base on the contents in references if provided.
- Skip questions the user's original request already answered.
- Formatting-only defaults (decimal places, table style, alpha = 0.05) may proceed
  with a stated default unless the user objects — these don't need to block progress
  the way statistical substance does.
