# `/exp-analyze` command template

Copy this file to a project as `.claude/commands/exp-analyze.md` if you want a project-local slash command.

Use `dlexperiment-skill` and analyze a deep learning experiment's logs, metrics, figures, and outputs.

Mode:
- `daily` = summarize the key result and next step quickly
- `full` = update the full archive with a richer analysis
- If omitted, default to `daily`

Requirements:

1. Locate the target experiment directory (use `experiments/ACTIVE.md` if present).
2. Read `plan.md`, `runs/*/run_meta.yaml`, `runs/*/seed_*/metrics.json`, `runs/*/seed_*/log.txt`, `result.md`, and relevant artifact names.
3. Extract key metrics and aggregate per experiment point:
   - 1 seed → report the value, label the point `preliminary (1 seed)`
   - ≥ 2 seeds → report mean ± std with a per-seed breakdown
   - old flat runs (`runs/run_NNN/metrics.json` without `seed_*` subdirs) count as `seed_0`
4. Compare against the baseline when available.
5. Apply conclusion discipline: if the delta is within the seed spread, or only 1 seed exists, or metrics are incomplete, mark the conclusion `inconclusive` / `preliminary` and say what evidence is missing. Do not overstate.
6. If statistical significance matters (paired comparison across seeds, p-values), route the strict analysis to the `results-analysis` skill and reference its output.
7. Update `result.md` with a run summary, metrics table (mean ± std where applicable), per-seed breakdown, and observations.
8. Update the conclusion section of `result.md` with judgment, evidence, limitations, and next recommendation.
9. Update `experiments/index.md` with status and best metric.
10. Reply with the main metric delta, conclusion judgment, and next experiment suggestion.

User arguments:

```text
$ARGUMENTS
```
