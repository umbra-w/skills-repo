---
name: cryogenian-shared
description: Internal shared support for the Cryogenian research suite. Do not invoke as a standalone workflow.
---

# Cryogenian Shared

Load this package only when another `cryogenian-*` Skill requests an exact file.
Do not preload the package and do not answer the user from this package alone.
Task logic, evidence acquisition, output format, and QA remain owned by the
requesting Skill.
