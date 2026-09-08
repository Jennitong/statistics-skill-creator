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

...

- open/publicly available sources
- assumption checking
- hierarchical
- why choose this


This skill relies on progressie disclosure. All the files will be filled in by AI Agent, and is in the underneath format:

statistics-skill-creator/
├── SKILL.md                  # contains YAML frontmatter, description, and general steps for AI Agent to go through
├── references/
│   ├── assumptions.md        (lists all assumptions to be verified)
│   ├── eda.md                
│   ├── guide.md
│   ├── hierarchical.md
│   ├── paper.md
│   ├── skill-procedure.md
│   └── validation.md/
├── scripts/
│   ├── diagnostics.R
│   ├── eda_code.R
│   ├── task_code1.R
│   ├── task_code2.R
│   └── task_code3.R
└── README.md

```
skill-name/
├── SKILL.md (required)
│   ├── YAML frontmatter (name, description required)
│   └── Markdown instructions
└── Bundled Resources (optional)
    ├── scripts/    - Executable code for deterministic/repetitive tasks
    ├── references/ - Docs loaded into context as needed
    └── assets/     - Files used in output (templates, icons, fonts)
```

validation

Relies on R code as a back up. this folder is a scafolding and AI agents help fill them up with task-specific inputs.
Note: User would still need to manually adjust details and need to go through the SKILL for verification and correction.

use of ai

## Hierarchical
