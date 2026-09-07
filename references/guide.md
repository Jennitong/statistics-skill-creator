# Guide

This file contains guidelines and conventions the model should follow when running the
procedure in this skill — the "why" and "how to interpret" behind the checks in
`assumptions.md`, not the checks themselves.

Fill in for the specific procedure this skill covers, for example:

## How to interpret assumption failures

- If an assumption is violated, name which one and explain in plain language what that
  means for the reliability of the result.
- State whether variable transformation could help.

## Common pitfalls to avoid

- Choose one of Fisher' Exact Test or Chi-squared Test based on expected sample size
  (less or greater than 5). Do not show both.
- Don't drop outliers without flagging it in the report and explaining why.