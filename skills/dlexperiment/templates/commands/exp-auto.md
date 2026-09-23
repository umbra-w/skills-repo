# `/exp-auto` command template

Copy this file to a project as `.claude/commands/exp-auto.md` if you want a project-local slash command.

Use `dlexperiment-skill` and run an automated deep learning experiment loop.

Mode:
- `daily` = lightweight loop with minimal record keeping
- `full` = fully archived loop with full snapshots and richer logging
- If omitted, default to `daily`

Requirements:

1. Ensure an active experiment exists, or start one with `/exp-start`.
2. Write the current hypothesis, baseline, variable, dataset/split, metrics, seed plan, stopping rule, and loop cap (default 10 iterations) into the experiment files.
3. Prepare the reproducible command in `scripts/run.sh`.
4. Run one iteration at a time.
5. After each iteration, record a `/exp-log` entry.
6. Archive each iteration under `runs/run_NNN/` with `config.yaml`, `run_meta.yaml`, and one `seed_N/` subdirectory per launch (config.yaml, seed_N/log.txt, seed_N/metrics.json). Summarize the metrics across seeds in `result.md` (mean ± std where a point has multiple seeds).
7. Update the conclusion section of `result.md` with the current judgment.
8. Recommend exactly one next change unless the user asks for broader exploration.
9. Stop when the user-defined stop condition is reached, the loop cap is hit, the result is clearly saturated, or the run is blocked.

Use this when the point is not just to execute one experiment, but to keep the experiment memory coherent across multiple iterations.

User arguments:

```text
$ARGUMENTS
```
