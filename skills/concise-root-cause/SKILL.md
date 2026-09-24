---
name: concise-root-cause
description: Provide terse, evidence-first root cause analysis for logs, diffs, and build failures. Use when the user wants sharper debugging answers instead of broad speculation.
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
---

When analyzing failures:

- Lead with the exact root cause if evidence is sufficient.
- Quote the 1-3 decisive log lines.
- Explicitly label non-fatal warnings as secondary.
- Tie each conclusion to a concrete log line, diff hunk, or build rule.
- Avoid listing many hypothetical causes unless evidence is weak.
- Prefer "because X log proves Y" phrasing.

Use this response shape:

## Conclusion
## Evidence
## What to check next
## Likely fix

Target brevity and precision.
