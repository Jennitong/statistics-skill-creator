This file is a reusable template that lives permanently in `statistics-skill-creator/references`
— do not move, copy, or delete the physical file when creating a new skill. 
When the user wants hierarchical (brief/moderate/detailed) output:
delete the placeholder **Step 5 — Output** section in the *new* skill's `SKILL.md`, copy
the Markdown content below (from "# Step 5 - Output" onward) in as its replacement, and
fill in the blanks for that specific procedure.

# Step 5 - Output

Ask for the response level using the exact wording as below:

> Would you like a **brief** (key result, assumptions, numerical values), 
> **moderate** (adds context and supporting tables and plots), or **detailed** 
> (full background, definitions, and step-by-step interpretation) response?

Output **exactly** the above sentence — nothing before it, nothing after except 
waiting for the user's reply. Do not show formulas, intermediate tables, or any other text.

**Tone:** Professional but accessible. Write for a stakeholder who understands
"statistically significant" but does not need to verify the math. Never show R code in
the output; any exported report must use `echo = FALSE` in its setup chunk.

**Table formatting:** use bold headers, alignment markers, and a section break between
tables.

---

### Brief

Exactly one paragraph covering: the method used, all of the assumptions 
for that method being checked, numerical outputs, the key result, and the decision.

No table or plot displayed.
---

### Moderate

A single cohesive paragraph covering all elements in exact order:

1. **Background** — dimension of the dataset, variable introduction, etc.
2. **Method chosen and assumptions** — method name, why it was selected, all key assumptions met.
3. **Key result and numerical outputs supporting it**
4. **Decision** 
5. **Key plot and tables**
6. ...

---
### Detailed

The full **Moderate** paragraph, table and plot, then:

A short **Plain-language interpretation** written for 
a non-statistical audience: what does this result mean practically, what can and 
cannot be concluded, and any relevant caveats, the definition of key terminologies, 
the correct interpretation of the key results, etc.
---
Return the following based on the response brief/moderate/detailed level, in order:

**Background**
The context of the problem: ...
 
**The assumptions held**

Refer to Step 3 and briefly state the assumptions made.

**key result**

Refer to Step 4 and interpret.

**decision**

Refer to Step 4 and interpret.

**plot 1** (in EDA)

Only shown for `detailed` or `moderate` response levels. Rendered inline via `show_widget`.
Refer to Step 2 and interpret the plot.

**table 1** (in EDA)

Only shown for `detailed` or `moderate` response levels.
Refer to Step 2 and interpret the table.

**plot 2** (not in EDA)

Only shown for `detailed` or `moderate` response levels. Rendered inline via `show_widget`.
It must show:
- 
- Axis labels: x = "", y = ""
- A title indicating the variables
- Annotation
- Color

**table 2** (not in EDA)

Only shown for `detailed` or `moderate` response levels.

A m by n table with head (`Column1 | Column2 | ...| Column m`). Each row has numerical
values that summarizes...

**References**

Only shown for `detailed` or `moderate` response levels, and only if Step 0 turned up
one or more usable references for this run (Step 0 already asked — do not ask again
here). Cite them via `references/paper.md` and/or the sources the client supplied
directly. Omit this section entirely if Step 0 came up empty for this run.

---