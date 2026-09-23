# `/exp-log` command template

Copy this file to a project as `.claude/commands/exp-log.md` if you want a project-local slash command.

Use `dlexperiment-skill` and append a structured experiment progress entry.

Mode:
- `daily` = keep the record short and operational
- `full` = include the full change rationale and relevant artifacts
- If omitted, default to `daily`

Record the event in the active experiment's `progress.md` timeline (use `experiments/ACTIVE.md`) using:

```markdown
## YYYY-MM-DD HH:MM - Purpose

Purpose:

Changed files:

Core change:

Expected impact:

Risk:

Related command/log/metric:

Next step:
```

If the active experiment is unclear, list likely experiment directories and ask the user to choose one.

User arguments:

```text
$ARGUMENTS
```
