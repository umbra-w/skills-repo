# `/exp-next` command template

Copy this file to a project as `.claude/commands/exp-next.md` if you want a project-local slash command.

Use `dlexperiment-skill` and propose the next controlled deep learning experiment.

Mode:
- `daily` = short, practical, one-next-step recommendation
- `full` = richer comparison and artifact-aware recommendation
- If omitted, default to `daily`

Base the proposal on the active experiment (`experiments/ACTIVE.md`) so the follow-up stays in the same lineage.

Recommend 1–3 next experiments. For each one include:

- goal
- hypothesis
- variable to change
- controls to keep fixed
- expected metric movement
- risk / confounder
- estimated cost
- what to record

Prefer one primary variable per experiment unless the user explicitly asks for exploratory search.

When multiple candidates are proposed, rank them by expected value per cost and name the one you would run first and why.

User arguments:

```text
$ARGUMENTS
```
