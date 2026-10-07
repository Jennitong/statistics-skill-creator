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

This is the hidden section not shown for general use of the generated skill. When the person who created the skill wants to check the validity of the skill, they could call on this section. In this section, some verified examples are recorded, so when the developer wants to test whether the skill is accurate and returns what is expected, the developer could test the correctness by saying "tell me the correctness of this skill". The AI Agent then evaluates all the examples in `references/validation.md`, and checks whether the answers generated by AI relying on this skill match the expected answers to the examples. A correctness of 100%, meaning all examples match, is expected.

In the skill creation process, AI Agent is able to name some examples, and users also have the option to add some other examples.


## Hierarchical

Apart from general output format, this skill provides three output options of differing levels of detail to best meet varying statistical needs. The options are as follows:

- **Brief**: reports only the most crucial figures and results. Best suited for professionals and practitioners who are already familiar with the relevant statistical methods and need results, not explanations.

- **Moderate**: includes everything in Brief, along with an explanation of the test assumptions and supporting tables where relevant. Best suited for users who have studied the relevant statistical concepts but are not deeply experienced with them in practice.

- **Detailed**: includes everything in Moderate, plus a comprehensive summary on the methods used, definitions of all key terms, and step-by-step interpretations. Best suited for users without a formal statistical background who need conceptual grounding alongside the results.

## Demonstrations

Under the `\Demonstration` folder, there are a few skill files aimed at conducting two-sample t-test, survival analysis, poisson regression, and linear regression. Users could download the zippped files and use them in Claude, and conduct the test on any data set. All of the skills are included for demonstarion purposes. If user would like to use these tools, they should proof read the relevant skill, and see if certain methodologies and result meet their expectations. The user could feel free to customize the zipped skills, as long as it better assists with their needs.

Specifically, the skills for survival analysis and two-sample t-test comes in two versions: a skill package created by author manually, and a skill package created using `statistics-skill-creator`. These two versions are included for usage and comparison purposes.

`skill-procedure-binary` vs `two-sample-t-test`: The manually created two-sample t-test skill package, `skill-procedure-binary`, and the `statistics-skill-creator`-created skill file, `two-sample-t-test`, will return the user bar plots comparing both groups, input verification, contingency table, test choice between Fisher's Exact test and Chi-squared test based on sample size, assumption checking, inferences, hierarchical response levels, and validation. The structures presented (such as the order and format) are slightly deviated, but the core methodology is the same. This could show that when the same methodologies are used, the core test result will be similar, whether the skill package is human-generated or LLM-agent-generated.

`skill-procedure-survival` vs `kaplan-meier-logrank`: The manually created survival analysis file, `skill-procedure-survival`, has some differences compared to the skill generated using `statistics-skill-creator` , `kaplan-meier-logrank`. The latter would generate reports that contain more plots, such as the log-log plot and histogram for distribution over follow-up times for categorical variable, and a Schoenfeld residual plot for assessing proportional-hazards assumption. However, the general report still follow the same structure will similar core contents, as well as the validation step. Thus, we can see that although both are built for the same purpose, if methodologies are different or if design are complicated to different levels, user will end up with skills that may be similar in the core concepts but differ in details. Thus, it is still important to keep in mind that users are highlyh recommended to go though the detailed in the generated skill file, and should verify the usage by using it on LLM agents. If anything undesirable happens, the user should be able to edit or let LLM agent to do the correction. The important details might deviated from what the users expect and what the LLM agents understand. Thus, the generated skills should be treated with caution and be supervised.

`linear-reg`: this skill aims at fitting a continuous variable on a single or multiple covariates using linear regression. Both main effects and interaction effects can be assesed, for multiple covairates. Its procedure are as expected: input verification, EDA, assumption diagnostics, inferences, and report.

`poisson-regression`: this skill aims at fitting a binary variable on a single or multiple covariates using poisson regression. It also goes through input verification, EDA, assumption diagnostics, inferences, report, with an additional refernce section, which was added during the skill-creation process.

## Disclaimer
During the preparation of this skill, the authors utilized Claude AI to assist with structure optimization, debugging, and language clarity of the developed skill. The core conceptual logic, idea, and system design were independently conceived by the authors. All AI-modified snippets were thoroughly reviewed, verified, and tested by the authors.
The author is not responsible for any furthur customization of the skills. The skills listed are for demonstration propurses only, and should be used when the user fully understand their usage.

---
Maintained by [Jennitong](https://github.com/Jennitong).
