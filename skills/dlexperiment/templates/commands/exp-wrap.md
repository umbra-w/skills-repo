# `/exp-wrap` command template

Copy this file to a project as `.claude/commands/exp-wrap.md` if you want a project-local slash command.

Use `dlexperiment-skill` and finalize a deep learning experiment.

Mode:
- `daily` = concise wrap-up
- `full` = archival wrap-up with stronger record keeping
- If omitted, default to `daily`

Requirements:

1. Use the active experiment (`experiments/ACTIVE.md`), or ask which one to wrap.
2. Ensure `result.md` (including its conclusion section) is updated.
3. Save the final git state:
   - `git rev-parse HEAD` → `snapshots/git_commit_final.txt`
   - `git diff` → `patches/final_change.patch`
4. Mark status as `done`, `abandoned`, or `superseded` in `experiments/index.md`.
5. Add a final summary to `README.md` with final status, best metric, conclusion, artifact paths, and follow-up.
6. Clear `experiments/ACTIVE.md`; if a follow-up experiment is planned, point it to that slug.
7. If the user wants a project-level report, route the narrative to the `results-report` skill.
8. Reply with final status, best metric, conclusion, and recommended next step.

User arguments:

```text
$ARGUMENTS
```
