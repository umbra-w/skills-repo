# `/exp-compare` command template

Copy this file to a project as `.claude/commands/exp-compare.md` if you want a project-local slash command.

Use `dlexperiment-skill` and compare two or more deep learning experiments side by side.

Mode:
- `daily` = concise head-to-head comparison of key metrics
- `full` = richer comparison including per-seed detail and qualitative notes
- If omitted, default to `daily`

Requirements:

1. Determine the experiments to compare:
   - use the active experiment (`experiments/ACTIVE.md`) plus one or more others, or
   - take an explicit list of slugs from the arguments.
2. Read `result.md` and `runs/*/seed_*/metrics.json` for each experiment.
3. Build a comparison table: rows = experiments, columns = key metric (mean ± std where multi-seed), delta vs the first/reference experiment, status, best run.
4. Write the comparison to `experiments/compare_YYYYMMDD.md` (append if one already exists for today).
5. Reply with the head-to-head result and a recommendation for which experiment to build on.

User arguments:

```text
$ARGUMENTS
```
