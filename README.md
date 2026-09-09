# statistics-skill-creator

This SKILL.md does not itself run any statistical tasks - its aim is to help users generate their own SKILL.md packages that evaluate statistical tasks with only a few prompts and information. Once the user describes what task should be done, this skill creator is able to generate a reusable skill package for you that aims at solving that specific task. This skill creator follows a specific procedure for any kind of statistical task. The generated SKILL.md package will ask for the references that support the tasks, and it is able to verify inputs, conduct exploratory data analysis, check assumptions, and generate the full reports.

This skill creator is flexible as it is able to deal with any kind of task and accepts user inputs during the creation process. It is structural in the sense that for any skills to be created, it goes through a specific procedure and holds certain templates. This creator is user-friendly and beginner-friendly, as it is able to provide suggestions based on standardized textbooks, but is open to new methodologies, textbooks, as long as provided.

## Features

- Interviews the user for details and methodologies that will be used for the task (Read the `Resources` section for more details)
- Supports general (one format) or hierarchical (brief / moderate / detailed) report output (Read the `Hierarchical` section for more details)
- Relies on references the user provides - it collects references first so every generated skill grounds its methods, code, and interpretation in sources the end user supplies.
- If the references do not contain information in a certain section, Claude would offer suggestions, while the user is able to provide that information manually as well.
- Always confirms the details (test choice, significance level, power) — never assumes.
- Self-checks generated files (valid frontmatter, no dangling paths, no leftover placeholders) before returning to the user
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

3. Go to `claude.ai` or `Claude`'s desktop app and open the sidebar, then select `customize`.

4. Under the `Skills` tab, select `Add` and then `Upload` this zipped folder.

5. This skill will be named statistica-skill-creator automatically.

**Note**: The user could choose to zip the entire downloaded folder and upload it as a skill. Alternatively, the user could manually delete the `statistics-skill-creator.Rproj` file before zipping for efficiency and smaller digital storage size. Either way, the skill package will run smoothly.

## Usage

To use our SKILL.md statistical assistant:

1. Choose the `Code` option.

2. Enter your statistical scenario or question with the **triggering words**, and any relevant dataset.

3. If prompted, allow Claude to run or install any packages.

4. After the new skill package is created, make sure to go through the details in the package. Users might need to correct discrepancies in the files.

### Triggering Words

To use this SKILL.md, users can explicitly ask Claude Code to use the `statistical-skill-creator` skill to conduct the analysis. Otherwise, users can trigger tasks through task-specific phrases.

- "new skill"
- "skill-procedure"
- "make this a skill"

## Resources

AI Agent has a massive database and knowledge base to solve most problems; however, the methodologies AI suggests might not be the specific ones we would like to apply. Therefore, during the skill creation process, users have the option to provide specific papers, documents, or websites they want AI to refer to when completing certain tasks. These resources could provide information on how and which assumptions need to be confirmed, how to properly conduct exploratory data analysis, which codes to use, how to compute important numerical values, etc. However, these resources need to be publicly available and accessible to AI Agents. If not, the user could manually upload texts, PDFs, or images, provided such use **does not** infringe on any copyright. The user is responsible for the files they upload.

## Structure

This skill relies on progressive disclosure. All the files will be filled in by AI Agent, and are in the following format:

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
│   └── validation.md         # provides instructions and verified examples for the user to verify the correctness of the skill.
├── scripts/
│   ├── diagnostics.R         # contains codes to check the explicit assumptions
│   ├── eda_code.R            # contains codes to complete the exploratory data analysis section
│   ├── task_code1.R          # contains codes to complete task 1
│   ├── task_code2.R          # contains codes to complete task 2
│   └── task_code3.R          # contains codes to complete task 3
└── README.md                 # provides documentary for this skill creator
```

## Validation

This is the hidden section not shown for general use of the generated skill. When the person who created the skill wants to check the validity of the skill, they could call on this section. In this section, some verified examples are recorded, so when the developer wants to test whether the skill is accurate and returns what is expected, the developer could test the correctness by saying "tell me the correctness of this skill". The AI Agent then evaluates all the examples in `references/validation.md`, and checks whether the answers generated by AI relying on our skill match the expected answers to the examples. A correctness of 100%, meaning all examples match, is expected.

In the skill creation process, AI Agent is able to name some examples, and users also have the option to add some other examples.


## Hierarchical

Apart from general output format, our SKILL.md provides three output options of differing levels of detail to best meet varying statistical needs. The options are as follows:

- **Brief**: reports only the most crucial figures and results. Best suited for professionals and practitioners who are already familiar with the relevant statistical methods and need results, not explanations.

- **Moderate**: includes everything in Brief, along with an explanation of the test assumptions and supporting tables where relevant. Best suited for users who have studied the relevant statistical concepts but are not deeply experienced with them in practice.

- **Detailed**: includes everything in Moderate, plus a comprehensive summary on the methods used, definitions of all key terms, and step-by-step interpretations. Best suited for users without a formal statistical background who need conceptual grounding alongside the results.


## Disclaimer
During the preparation of this skill, the authors utilized Claude AI to assist with structure optimization, debugging, and language clarity of the developed skill. The core conceptual logic, idea, and system design were independently conceived by the authors. All AI-modified snippets were thoroughly reviewed, verified, and tested by the authors.

---
Maintained by [Jennitong](https://github.com/Jennitong).
