# statistics-skill-creator: A Meta-Skill for Generating Reusable, Reference-Grounded Analytical Workflows for LLM Agents

This `statistics-skill-creator` does not run statistical analyses itself. Instead, it helps users generate their own SKILL.md packages for statistical tasks with only a few prompts and minimal information. Once the user describes the task, the skill creator generates a reusable skill package designed to solve that specific task. The creator follows a consistent procedure for any kind of statistical task. Each generated skill package asks for the references that support the task, and it can validate inputs, conduct exploratory data analysis, check assumptions, and generate full reports.

The skill creator is flexible: it can handle a wide range of statistical tasks and accepts user input throughout the creation process. It is also structured: every skill it creates goes through the same procedure and follows the same templates. It is beginner-friendly, offering suggestions based on standard textbooks, while remaining open to other methodologies and textbooks the user provides.

## Features

- Interviews the user about the details and methodologies to be used for the task (see the `Resources` section for more details).
- Supports a general (single-format) or hierarchical (brief / moderate / detailed) report output (see the `Hierarchical` section for more details).
- Relies on user-provided references: it collects references first, so every generated skill grounds its methods, code, and interpretation in sources the user supplies.
- If the references do not cover a certain section, Claude offers suggestions, and the user may also provide that information manually.
- Always confirms key details (test choice, significance level, power) and never assumes them.
- Self-checks the generated files (valid frontmatter, no dangling paths, no leftover placeholders) before returning them to the user.
- Lets the user choose where the generated package is stored (Desktop, Downloads, or a specific folder).

## Installation

**Method 1**:
Clone this repository:

```bash
git clone https://github.com/Jennitong/statistics-skill-creator.git
```

**Method 2**:

1. Download this `statistics-skill-creator` from GitHub.

2. Zip this downloaded package.

3. Go to `claude.ai` or `Claude`'s desktop app and open the sidebar, then select `customize`.

4. Under the `Skills` tab, select `Add` and then `Upload` this zipped folder.

5. This skill will be named `statistics-skill-creator` automatically.

**Note**: The user could choose to zip the entire downloaded folder and upload it as a skill. Alternatively, the user could manually delete the `statistics-skill-creator.Rproj` file before zipping for efficiency and smaller digital storage size. Either way, the skill package will run smoothly.

Tip: After installing the skill, the user can read all of its content in Claude instead of opening each file on laptop.

## Usage

To use this skill:

1. Choose the `Code` option in `Claude`.

2. Enter your statistical scenario or question with the **triggering words**, and any relevant dataset.

3. If prompted, allow Claude to run or install any packages.

4. After the new skill package is created, make sure to go through the details in the package. Users might need to correct discrepancies in the files.

### Triggering Words

To use this skill, users can explicitly ask Claude Code to use the `statistics-skill-creator` skill to conduct the analysis. Otherwise, users can trigger tasks through task-specific phrases.

- "new skill"
- "skill-procedure"
- "make this a skill"

## Resources

AI Agent has a massive database and knowledge base to solve most problems; however, the methodologies AI suggests might not be the specific ones we would like to apply. Therefore, during the skill creation process, users have the option to provide specific papers, documents, or websites they want AI to refer to when completing certain tasks. These resources could provide information on how and which assumptions need to be confirmed, how to properly conduct exploratory data analysis, which codes to use, how to compute important numerical values, etc. However, these resources need to be publicly available and accessible to AI Agents. If not, the user could manually upload texts, PDFs, or images, provided such use **does not** infringe on any copyright. The user is responsible for the files they upload.

## Structure

This skill relies on progressive disclosure. All the files will be filled in by AI Agent, and are in the following format:
```
<generated-skill>/
├── SKILL.md                  # Main skill definition: YAML front matter, skill description, and the high-level workflow the AI agent follows
├── references/
│   ├── assumptions.md        # Defines the assumptions relevant to the statistical procedure and the evidence used to assess them
│   ├── eda.md                # Specifies the exploratory data analysis to perform before formal modeling or testing
│   ├── guide.md              # Provides methodological guidance and interpretation rules for the assumptions and analytical steps
│   ├── hierarchical.md       # Defines the optional hierarchical report structure and the information included at each output level
│   ├── paper.md              # Records the methodological references (textbooks, articles, documentation, websites) used to build the skill
│   ├── skill-procedure.md    # Defines the standardized structure and construction procedure for a generated skill package
│   └── validation.md         # Stores validation instructions, worked examples, simulations, expected outputs, and comparison criteria
├── scripts/
│   ├── diagnostics.R         # Code for assumption checks and model diagnostics
│   ├── eda_code.R            # Code for the exploratory data analysis
│   ├── task_code1.R          # Code for the first procedure-specific analytical task
│   ├── task_code2.R          # Code for the second procedure-specific analytical task
│   └── task_code3.R          # Code for the third procedure-specific analytical task
├── data/
│   └── data.csv              # Optional dataset for examples, simulations, or validation during skill development
└── README.md                 # Human-readable documentation describing the purpose and use of the skill package
```
## Validation

This is the hidden section not shown for general use of the generated skill. When the person who created the skill wants to check the validity of the skill, they could call on this section. In this section, some verified examples are recorded, so when the developer wants to test whether the skill is accurate and returns what is expected, the developer could test the correctness by saying "tell me the correctness of this skill". The AI Agent then evaluates all the examples in `references/validation.md`, and checks whether the answers generated by AI relying on this skill match the expected answers to the examples. A correctness of 100%, meaning all examples match, is expected.

In the skill creation process, AI Agent is able to name some examples, and users also have the option to add some other examples.


## Hierarchical

Apart from general output format, this skill provides three output options of differing levels of detail to best meet varying statistical needs. The options are as follows:

- **Brief**: reports only the most crucial figures and results. Best suited for professionals and practitioners who are already familiar with the relevant statistical methods and need results, not explanations.

- **Moderate**: includes everything in Brief, along with an explanation of the test assumptions and supporting tables where relevant. Best suited for users who have studied the relevant statistical concepts but are not deeply experienced with them in practice.

- **Detailed**: includes everything in Moderate, plus a comprehensive summary on the methods used, definitions of all key terms, and step-by-step interpretations. Best suited for users without a formal statistical background who need conceptual grounding alongside the results.

## Demonstrations

The `Demonstration/` folder contains example skills covering two-group comparisons, survival analysis, linear regression, and Poisson regression. Each is provided as a zipped package that can be uploaded to Claude and run on any suitable dataset.

These skills are included for demonstration purposes. Before using one in practice, review its contents to confirm that the methodology, assumptions, and output meet your needs. Users are free to customize any of the packages.

### Manual vs. generated skills

Two of the demonstrations come in pairs: one written manually by the author and one generated with `statistics-skill-creator`. Comparing each pair shows how closely a generated skill reproduces a hand-built one.

**`skill-procedure-binary` (manual) vs. `two-sample-t-test` (generated).** Both skills compare two independent groups, and both follow the same workflow: input validation, group comparison plots, assumption checks, inference, hierarchical response levels, and validation. They differ slightly in the order and formatting of their output. The comparison suggests that when the same overall procedure is specified, a generated skill follows it as faithfully as a manually written one.

**`skill-procedure-survival` (manual) vs. `kaplan-meier-logrank` (generated).** Both skills estimate Kaplan–Meier survival curves and compare groups with the log-rank test, and both produce reports with the same overall structure and a validation step. The generated skill goes further in its diagnostics, adding a log–log plot, a histogram of follow-up times by group, and a Schoenfeld residual plot for assessing the proportional-hazards assumption. This pair shows that skills built for the same purpose can agree on core concepts while differing in detail, depending on the methodology and design choices made during creation.

### Generated skills

**`linear-reg`** fits a continuous response on one or more covariates using linear regression. With multiple covariates, it can assess both main effects and interactions. Its workflow covers input validation, exploratory data analysis, assumption diagnostics, inference, and reporting.

**`poisson-regression`** fits a count response on one or more covariates using Poisson regression. It follows the same workflow as `linear-reg`, with an additional references section that was requested during the skill-creation process.

### A note on using generated skills

As the comparisons above show, a generated skill may not match the user's expectations in every detail, because the user's intent and the LLM agent's interpretation can differ. Treat generated skills as drafts that need supervision: read through the files, test the skill on known data, and correct anything undesirable, either directly or by asking the LLM agent to revise it.

## Disclaimer
During the preparation of this skill, the author used Claude AI to assist with structural optimization, debugging, and language clarity. The core concepts, ideas, and system design were independently conceived by the author. All AI-modified content was thoroughly reviewed, verified, and tested by the author.

The author is not responsible for any further customization of the skills. The skills listed are for demonstration purposes only and should be used only when the user fully understands their usage.

---
Maintained by [Jennitong](https://github.com/Jennitong).
