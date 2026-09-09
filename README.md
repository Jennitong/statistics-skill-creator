# statistics-skill-creator

This SKILL.md does not itself run any statistical tasks - its aim is to help user generate their own SKILL.md packages that evaluate statistical tasks with only a few prompts and information. This skill creator follows specific procedure, for any kinds statistical tasks. The generated SKILL.md package will ask for the references that supports the tasks, and it is able to verify inputs, conduct exploratory data analysis, check assumptions, and generate the full reports.
This skill creator is flexible as it is able to deal with any kinds of tasks and accepts user inputs during the creation process. It is structural in the sense that for any skills to be created, it goes through specific procdure and holds certain templates. This creator is user friendly and beginner friendly, as it is able to provide sugggestions based on standardized textbooks, but is open to new methodologies, textbooks, as long as provided.

## Features

- Interviews the user for details and methodologies that will be used for the task (Read `Resources` section for more details)
- Supports general (one format) or hierarchical (brief / moderate / detailed) report output (Read `Hierarchical` section for more details)
- Relies on references the user provide - it collects references first so every generated skill grounds its methods, code, and interpretation in sources the end user supplies.
- If the references do not contain information in certain section, Claude would offer suggestions, while the user is able to provide that information manually as well.
- Always confirms the details (test choice, significance level, power) — never assumes.
- Self-checks generated files (valid frontmatter, no dangling paths, no leftover placeholders) before returning to user
- Allows the user to choose where the generated package should be stored (desktop, downloads, specific folders)

## Installation

**Method 1**:
Clone this repository:
   ```bash
   git clone https://github.com/Jennitong/statistics-skill-creator.git
   ```
**Method 2**:

1. Download this `statistics-skill-creator` from GitHub.

2. Zip this downloaded package.

3. Go to claude.com or Claude's desktop app and open the sidebar, then select `customize`.

4. Under the `Skills` tab, select `Add` and then `Upload` this zipped folder.

5. This skill will be named statistica-skill-creator automatically.

**Note**: The user could choose to zip the entire downloaded folder and upload as skill. Alternatively, the user could manually delete the `statistics-skill-creator.Rproj` file before zipping for efficiency and smaller digital storage size. Either way, the skill package could smoothly execute.

## Usage

To use our SKILL.md statistical assistant:

1. Choose the `Code` option.

2. Enter your clinical scenario or question with the **triggering words**, and any relevant dataset.

3. If prompted, allow Claude to run or install any packages.

4. After the new skill package is created, make sure to go through the details in the package. Users might need to correct discrepancies in the files.

### Triggering Words

To use this SKILL.md, users can explicitly ask Claude Code to use the `statistical-skill-creator` skill to conduct the analysis. Otherwise, users can trigger tasks through task-specific phrases.

- "new skill"
-  "skill-procedure"
-  "make this a skill"

## Resources

AI Agent has massive database and knowledge to solve most problems, however, the methodologies AI suggests might not be the specific ones we would like to apply. Therefore, during the skill creation process, users have the option to provide specific papers, documents or website they want AI to refer to when completing certain tasks. These resources could provide information on how and which assumptions need to be confirmed, how to properly conduct exploratory data analysis, which codes to use, how to compute important numerical values, etc. However, these resources need to be publicly available and accessible for AI Agents. If not, user could manually upload texts, PDFs or images provided such use **does not** infringe on any copyright. The user is responsible for the files they upload.


## Structure

This skill relies on progressie disclosure. All the files will be filled in by AI Agent, and is in the underneath format:

```
statistics-skill-creator/
├── SKILL.md                  # main skill definition- contains YAML frontmatter, description, and general steps for AI Agent to go through
├── references/
│   ├── assumptions.md        # lists and explains all assumptions to be verified; provides interpretations
│   ├── eda.md                # provides instructions on how the exploratory data analysis should be completed
│   ├── guide.md              # provides instructions and interpretations for each assumptions listed in `assumptions.md`
│   ├── hierarchical.md       # provides instructions on how hierarchical outputs are conducted; deleted for general format
│   ├── paper.md              # lists all the documents, textbooks and websites the use choose as references
│   ├── skill-procedure.md    # contains instructions and the actual structure that the generated skill package should follow
│   └── validation.md         # provides instructions and verified examples for user to verify the correctness of the skill.
├── scripts/
│   ├── diagnostics.R         # contains codes to check the explicit assumptions
│   ├── eda_code.R            # contains codes to complete the exploratory data analysis section
│   ├── task_code1.R          # contains codes to complete task 1
│   ├── task_code2.R          # contains codes to complete task 2
│   └── task_code3.R          # contains codes to complete task 3
└── README.md                 # provides documentary for this skill creator
```

## Validation

Relies on R code as a back up. this folder is a scafolding and AI agents help fill them up with task-specific inputs.
Note: User would still need to manually adjust details and need to go through the SKILL for verification and correction.

this step is only for developer, not for SKILL user
Should be hidden unless explicitly mentioned.
This step is only disclosed when developer explicitly asks for testing the validity
of the SKILL. This is different from Step 1 Validate Inputs. It is used only for checking
the validity of the entire SKILL.md file.Do not mention anything related to this 
step for regular SKILL user.
100% correctness rate with efficient executing speed.

## Hierarchical

Our SKILL.md provides three output options of differing levels of detail to best meet varying statistical and clinical needs. The options are as follows:

- **Brief**: reports only the test statistic, p-value, hypothesis testing decision, and a one-line outcome summary. Best suited for professionals and practitioners who are already familiar with the relevant statistical methods and need results, not explanations.

- **Moderate**: includes everything in Brief, along with an explanation of the test assumptions and supporting tables where relevant. Best suited for users who have studied the relevant statistical concepts but are not deeply experienced with them in practice.

- **Detailed**: includes everything in Moderate, plus a comprehensive summary on the statistical method, definitions of all key terms, and step-by-step interpretations. Best suited for users without a formal statistical background who need conceptual grounding alongside the results.


## Disclaimer
During the preparation of this work, the authors utilized Claude AI to assist with structure optimization, debugging, and language clarity of the developed skill. The core conceptual logic, idea, and system design were independently conceived by the authors. All AI-modified snippets were thoroughly reviewed, verified, and tested by the authors.

---
Maintained by [Jennitong](https://github.com/Jennitong).
