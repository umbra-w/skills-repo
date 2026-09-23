# `/exp-start` command template

Copy this file to a project as `.claude/commands/exp-start.md` if you want a project-local slash command.

Use `dlexperiment-skill` and start a new standardized deep learning experiment.

Mode:
- `daily` = lightweight, fast iteration mode
- `full` = complete archive mode
- If omitted, default to `daily`

Requirements:

1. Ask for missing essentials only: goal, baseline, variable under test, dataset/split, evaluation metrics, number of seeds (default 1) and fixed random seed, and expected run command.
2. Check for duplicate or similar experiments before creating anything: scan `experiments/index.md` and existing `experiments/exp_*` directories for the same goal + variable. If found, report it and ask whether to continue the existing experiment or start a new one. If continuing, switch `experiments/ACTIVE.md` to it and stop the create flow.
3. Create `experiments/exp_YYYYMMDD_NNN_slug/` with the appropriate Experiment OS layout for the selected mode.
4. Initialize `README.md`, `plan.md`, `progress.md`, `result.md`, `scripts/run.sh`, and `runs/`. Use nested seed directories (`runs/run_001/seed_0/`) in the run layout.
5. In `full` mode, also create `configs/`, `patches/`, `figures/`, `snapshots/`, and `.gitignore`, and capture git/environment state when available.
6. Create `scripts/run.sh`.
7. Write the seed plan, compute budget, and success criterion (metric + threshold + variance tolerance) into `plan.md`.
8. Set `experiments/ACTIVE.md` to the new slug.
9. Update `experiments/index.md`.
10. Reply with experiment ID, path, mode, current status, missing information, and next recommendation.

User arguments:

```text
$ARGUMENTS
```
