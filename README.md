# statistics-skill-creator

This SKILL.md does not itself run any statistical tasks - its aim is to help user generate their own SKILL.md packages that evaluate statistical tasks with only a few prompts and information. This skill creator follows specific procedure, for any kinds statistical tasks. The generated SKILL.md package will ask for the references that supports the tasks, and it is able to verify inputs, conduct exploratory data analysis, check assumptions, and generate the full reports.
This skill creator is flexible as it is able to deal with any kinds of tasks and accepts user inputs during the creation process. It is structural in the sense that for any skills to be created, it goes through specific procdure and holds certain templates. This creator is user friendly and beginner friendly, as it is able to provide sugggestions based on standardized textbooks, but is open to new methodologies, textbooks, as long as provided.

## Features

- Interviews the user for details and methodologies that will be used for the task
- Supports general (one format) or hierarchical (brief / moderate / detailed) report output (Read `Hierarchical` section for more details)
- Relies on references the user provide - it collects references first so every generated skill grounds its methods, code, and interpretation in sources the end user supplies.
- If the references do not contain information in certain section, Claude would offer suggestions, while the user is able to provide that information manually as well.
- Always confirms the details (test choice, significance level, power) — never assumes.
- Self-checks generated files (valid frontmatter, no dangling paths, no leftover placeholders) before returning to user
- Allows the user to choose where the generated package should be stored (desktop, downloads, specific folders)

## Installation

Clone this repository:
   ```bash
   git clone https://github.com/Jennitong/statistics-skill-creator.git
   ```


- open/publicly available sources

- why choose this


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
│   └── validation.md         # provides instructions and verified examples for user to verify the correctness of the skill. It does not show for regular reports due to progressive disclosure
├── scripts/
│   ├── diagnostics.R         # contains codes to check the explicit assumptions
│   ├── eda_code.R            # contains codes to complete the exploratory data analysis section
│   ├── task_code1.R          # contains codes to complete task 1
│   ├── task_code2.R          # contains codes to complete task 2
│   └── task_code3.R          # contains codes to complete task 3
└── README.md                 # provides documentary for this skill creator
```

## validation

Relies on R code as a back up. this folder is a scafolding and AI agents help fill them up with task-specific inputs.
Note: User would still need to manually adjust details and need to go through the SKILL for verification and correction.

use of ai

## Hierarchical


## Author

Maintained by [Jennitong](https://github.com/Jennitong).
