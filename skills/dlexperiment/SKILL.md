---
name: dlexperiment-skill
description: "Use this skill whenever the user wants to start, run, track, analyze, compare, wrap up, or manage deep learning / ML / anomaly detection experiments. It turns the agent into a disciplined Experiment OS: creates standardized experiment directories, records goals and hypotheses, snapshots environment and code diffs, logs every code/config change with rationale, stores metrics/logs/figures, tracks active experiments, aggregates results across seeds with mean/std, updates experiment indexes, analyzes results, and recommends the next experiment. Trigger strongly for phrases like “start an experiment”, “run an ablation”, “record this experiment”, “analyze results”, “compare experiments”, “wrap experiment”, “exp-start”, “exp-log”, “exp-analyze”, “exp-next”, “exp-wrap”, “exp-auto”, “exp-compare”, or when the user asks the agent to modify model/training/eval code for an experiment or to automate an experiment loop."
---

# Deep Learning Experiment OS

This skill makes the agent operate as an experiment execution, recording, and management agent for deep learning research. The main goal is to prevent experiment drift: unclear directories, forgotten rationale, missing configs, unreproducible runs, and disconnected results.

Use a strict protocol because research experiments are only useful if someone can later answer: what was tested, why it was changed, how it was run, what happened, and what should be tried next.

## Core behavior

When this skill is active, treat experiments as managed records, not ad hoc commands.

1. Define the experiment goal and hypothesis.
2. Create or locate the standardized experiment directory.
3. Track an active experiment pointer (`experiments/ACTIVE.md`) so subsequent commands know where to write.
4. Snapshot code, environment, config, and hardware state when possible.
5. Record every code/config/data change with purpose and risk before or immediately after making it.
6. Save commands, logs, metrics, figures, patches, and conclusions under the experiment directory.
7. For each experiment point, record the seed(s) used; when a point has multiple seeds, aggregate metrics as mean ± std and report the spread, not just one number.
8. Update `experiments/index.md` after start, analysis, and wrap-up.
9. End each cycle with a concise next-step recommendation.

Do not let experiment work happen silently. If you edit code, configs, or run scripts for an experiment, update the experiment record in the same turn whenever possible.

## Operating modes

Use a mode prefix to control how much structure the agent should create.

- `daily` = default, lightweight, fast iteration mode
- `full` = complete experiment archive mode with full snapshots and stricter record keeping

If the user does not specify a mode, assume `daily`.

Call pattern:

```text
/exp-start daily ...
/exp-log daily ...
/exp-analyze daily ...
/exp-next daily ...
/exp-wrap daily ...
/exp-auto daily ...
/exp-compare daily ...
```

```text
/exp-start full ...
/exp-log full ...
/exp-analyze full ...
/exp-next full ...
/exp-wrap full ...
/exp-auto full ...
/exp-compare full ...
```

## Standard experiment layout

Create experiments under:

```text
experiments/
├── index.md
├── ACTIVE.md
└── exp_YYYYMMDD_NNN_slug/
    ├── README.md
    ├── plan.md
    ├── progress.md
    ├── result.md
    ├── runs/
    │   └── run_001/
    │       ├── config.yaml
    │       ├── run_meta.yaml
    │       ├── seed_0/
    │       │   ├── log.txt
    │       │   ├── metrics.json
    │       │   └── checkpoint/
    │       └── seed_1/
    │           ├── log.txt
    │           ├── metrics.json
    │           └── checkpoint/
    ├── configs/
    ├── patches/
    ├── figures/
    ├── scripts/
    │   └── run.sh
    ├── snapshots/
    │   ├── git_commit.txt
    │   ├── git_diff.patch
    │   ├── pip_freeze.txt
    │   ├── python_version.txt
    │   └── gpu_info.txt
    └── .gitignore
```

Purpose of each file:

- `README.md` — status, one-line summary, key artifacts, latest conclusion
- `plan.md` — goal, hypothesis, success criterion, seed plan, compute budget, run command (merged from the old goal/hypothesis files)
- `progress.md` — todo checklist at the top, chronological change log below (merged from the old todo/progress files)
- `result.md` — run summary, observations, and conclusion in one file (merged from the old result/conclusion files)
- `runs/run_NNN/` — one directory per experiment point (one frozen config), with a `seed_N/` subdirectory per launch
- `runs/run_NNN/config.yaml` — frozen copy of the exact config used for this point
- `runs/run_NNN/run_meta.yaml` — launch metadata: command, git commit, GPU, python version, timestamp, seeds, grouping tag
- `runs/run_NNN/seed_N/` — per-launch stdout/stderr (`log.txt`), structured metrics (`metrics.json`), checkpoints
- `configs/` — evolving working configs; the exact config each point used is frozen in `runs/run_NNN/config.yaml`
- `patches/` — code diffs
- `figures/` — plots and visualizations
- `scripts/` — reproducible run commands
- `snapshots/` — git/environment/hardware state at start (mainly `full` mode)
- `.gitignore` — keep checkpoints and large artifacts out of version control
- `experiments/ACTIVE.md` — single-line pointer to the currently active experiment slug; cleared on wrap

Use names like `exp_20260529_001_visa_transfer`. The slug should be short, lowercase, and filesystem-safe. If the user does not provide a slug, infer one from the goal.

Number run points sequentially (`run_001`, `run_002`, ...). Never overwrite an existing run directory. Use `seed_0`, `seed_1`, ... inside a run point. The default is one seed (`seed_0`); the nested `seed_N/` structure is always used so parsing logic stays uniform.

### Multi-seed and variance

An experiment point = one config. Seeds are repeated launches of the same config:

```text
runs/run_001/config.yaml      # the config (shared across seeds)
runs/run_001/seed_0/          # launch 1, e.g. --seed 0
runs/run_001/seed_1/          # launch 2, e.g. --seed 1
```

- Record the seed value and the random seed strategy in `run_meta.yaml` and `plan.md`.
- A default single-seed run still lives in `runs/run_001/seed_0/` and is labeled `preliminary (1 seed)` in analysis.
- When a point has ≥ 2 seeds, aggregate metrics as mean ± std and show the per-seed breakdown.

Backward compatibility: if `runs/run_001/` has `log.txt` / `metrics.json` directly at its root (old flat layout), treat that as `seed_0` when analyzing.

## Active experiment pointer

`experiments/ACTIVE.md` holds the slug of the experiment the agent is currently working on (one line, e.g. `exp_20260529_001_visa_transfer`). It lets `exp-log`, `exp-analyze`, `exp-next`, `exp-compare`, and `exp-auto` write to the right place without asking every time.

Rules:

- `exp-start` sets `ACTIVE.md`.
- `exp-wrap` clears `ACTIVE.md` (and offers to set it to a follow-up experiment if one is planned).
- If `ACTIVE.md` is missing or points to a nonexistent directory, scan `experiments/index.md`; if still ambiguous, ask the user once.

## Experiment commands / workflows

The user may invoke these as natural language or as custom slash commands. If the project has a commands directory (e.g. `.claude/commands/` for Claude Code, `.Codex/commands/` for Codex), you can install the command templates from `templates/commands/`.

### `/exp-start` — start a new experiment

Use when the user wants a new experiment, ablation, training run, transfer test, model change test, or evaluation campaign.

Mode behavior:
- `daily`: create the minimum useful experiment record, keep setup fast, and avoid over-documenting
- `full`: create the full standardized archive, including snapshots and the complete directory structure

Steps:

1. Determine repository/project root. If unclear, ask once.
2. Ask only for missing essentials:
   - experiment goal
   - baseline
   - variable being changed
   - evaluation metrics
   - dataset/split
   - number of seeds (default 1) and fixed random seed
   - expected command or training script, if known
3. Check for duplicate/similar experiments before creating anything:
   - scan `experiments/index.md` and existing `experiments/exp_*` directories
   - if the same goal + variable already exists, report it and ask: continue that experiment or start a new one?
   - if continuing, switch the active pointer to it and stop the create flow
   - if starting new, record the related experiment slug in `plan.md` under `Related experiments`
4. Create the next experiment directory:
   - scan `experiments/exp_YYYYMMDD_*`
   - choose next `NNN` for today
   - create the files appropriate for the selected mode
5. Create files:
   - `daily`: `README.md`, `plan.md`, `progress.md`, `result.md`, `scripts/run.sh`, `runs/`
   - `full`: additionally `configs/`, `patches/`, `figures/`, `snapshots/`, `.gitignore`
6. Snapshot reproducibility information when in `full` mode or when the user explicitly asks for archival detail:
   - `git rev-parse HEAD` → `snapshots/git_commit.txt`
   - `git status --short` → include in `snapshots/git_commit.txt`
   - `git diff` → `snapshots/git_diff.patch`
   - `python --version` → `snapshots/python_version.txt`
   - `python -m pip freeze` → `snapshots/pip_freeze.txt`
   - `nvidia-smi` → `snapshots/gpu_info.txt` if available; otherwise record that GPU info was unavailable
7. Create `scripts/run.sh` with the best known reproducible command. If the command is unknown, create a clearly marked placeholder and put "confirm run command" in the `progress.md` todo list.
8. Set `experiments/ACTIVE.md` to the new slug.
9. Initialize `progress.md` with the start event.
10. Update `experiments/index.md` with status `planned` or `running`.
11. Reply with experiment ID, path, mode, status, missing info, and next recommendation.

### `/exp-log` — record a change or event

Use before or after every experiment-related code/config/script modification, run launch, run failure, metric observation, or noteworthy decision.

Use the active experiment from `experiments/ACTIVE.md`; if none, list likely experiment directories and ask.

Append a timeline entry to `progress.md` using this shape:

```markdown
## YYYY-MM-DD HH:MM - Purpose

Changed files:

Core change:

Expected impact:

Risk:

Related command/log/metric:

Next step:
```

For code edits, include exact file paths. For config edits, include parameter names and old/new values if known. For failed commands, include the command, failure summary, and proposed fix.

### `/exp-analyze` — analyze results

Use when logs, metrics, figures, or training/eval outputs exist and the user wants interpretation.

Steps:

1. Use the active experiment (or locate the target experiment directory).
2. Read `plan.md` for the baseline, hypothesis, and seed plan; read `runs/*/run_meta.yaml`, `runs/*/seed_*/metrics.json`, and `runs/*/seed_*/log.txt`, plus `result.md`.
3. Extract key metrics such as image AUROC, pixel AUROC, AP, F1, PRO, loss, latency, memory, throughput, or dataset-specific metrics.
4. Aggregate per point:
   - 1 seed → report the value and label the point `preliminary (1 seed)`; do not claim it beats the baseline by itself.
   - ≥ 2 seeds → report mean ± std across seeds with the per-seed breakdown in the table.
5. Compare against the baseline named in `plan.md` when available.
6. Apply the conclusion discipline:
   - if the delta is within the seed spread, mark the conclusion `inconclusive` and say what evidence is missing
   - if only 1 seed, mark `preliminary`
   - if the metrics are incomplete or logs are ambiguous, mark `inconclusive` and list missing evidence
   - do not overstate results
7. If statistical significance matters (e.g. paired comparison across seeds, error bars, p-values), route the strict analysis to the `results-analysis` skill and reference its output.
8. Update `result.md` with:
   - runs analyzed
   - a metrics table with deltas vs baseline (mean ± std where applicable)
   - best checkpoint/config if known
   - qualitative observations
   - a conclusion: supported / not supported / inconclusive / preliminary judgment, main evidence, limitations, next recommendation
9. Update `experiments/index.md` status and best metric (mean ± std form).

### `/exp-compare` — compare two or more experiments

Use when the user wants to compare experiments side by side, e.g. after a sequence of ablations.

Steps:

1. Use the active experiment plus one or more other experiments, or take an explicit list of slugs.
2. Read `result.md` and `runs/*/seed_*/metrics.json` for each experiment.
3. Build a comparison table: rows = experiments, columns = key metric (mean ± std), delta vs the first/reference experiment, status.
4. Write the comparison to `experiments/compare_YYYYMMDD.md` (append if one already exists for today).
5. Reply with the head-to-head result and a recommendation for which experiment to build on.

### `/exp-next` — propose the next experiment

Use after an experiment or partial result when the user wants the next research step.

Recommend 1–3 next experiments, each with:

- goal
- hypothesis
- change variable
- fixed controls
- expected metric movement
- risk
- estimated cost
- what to record

Prefer controlled ablations over broad changes. Keep one primary variable per next experiment unless the user explicitly wants exploratory search.

When multiple candidates are proposed, rank them by expected value per cost and say which one you would run first and why. Reference the active experiment so the follow-up lands in the same lineage.

### `/exp-wrap` — wrap up an experiment

Use when an experiment is finished and should be archived.

Steps:

1. Ensure `result.md` (including its conclusion section) is updated.
2. Save the final state:
   - `git rev-parse HEAD` → `snapshots/git_commit_final.txt`
   - `git diff` → `patches/final_change.patch`
3. Mark status as `done`, `abandoned`, or `superseded` in `experiments/index.md`.
4. Add a final summary to `README.md` with final status, best metric, conclusion, artifact paths, and follow-up.
5. Clear `experiments/ACTIVE.md`; if a follow-up experiment is planned, set the pointer to it.
6. If the user wants a project-level report, route the narrative to the `results-report` skill.
7. Reply with final status, best metric, conclusion, and recommended next step.

### `/exp-auto` — run an experiment loop

Use when the user wants the agent to take an experiment from setup through repeated iterations with minimal interruption.

Steps:

1. Start with `/exp-start` if no active experiment exists.
2. Record the current hypothesis, baseline, variable, metric target, seeds, and stopping rule in `plan.md`.
3. Prepare the run command in `scripts/run.sh` and identify the output/log files to watch.
4. For each iteration, create `runs/run_NNN/` with `config.yaml`, `run_meta.yaml`, and one `seed_N/` subdirectory per launch:
   - freeze the exact config used as `runs/run_NNN/config.yaml`
   - write stdout/stderr to `runs/run_NNN/seed_N/log.txt`
   - extract metrics into `runs/run_NNN/seed_N/metrics.json`
5. After each iteration, append a `/exp-log` entry to `progress.md` with what changed and why.
6. Summarize the metrics across seeds and runs in `result.md` (mean ± std where a point has multiple seeds).
7. Decide whether the hypothesis is supported, weakened, or still inconclusive.
8. Propose exactly one primary next change unless the user asked for a broader sweep.
9. Stop when the user-specified stop criterion is reached, the result is clearly saturated, or the run becomes blocked.
10. Default to a loop cap of 10 iterations unless the user specifies otherwise; record the cap in `plan.md`.

Use `/exp-auto` for loops where the point is not just to run code, but to preserve research memory and make the next iteration obvious.

### `exp-auto` operating style

Keep each iteration small and documented. A good loop is:

- change one variable
- run once
- record the reason
- collect metrics
- summarize the result
- pick the next single change

If the user asks for automation, do not hide the loop inside a vague prompt. Make the stopping rule explicit, because automated experiments become hard to trust when the end condition is unclear.

## File templates

### `README.md`

```markdown
# exp_YYYYMMDD_NNN_slug

Status: planned
Created: YYYY-MM-DD HH:MM

## Summary

## Key artifacts

## Latest conclusion
```

### `plan.md`

```markdown
# Plan

## Goal

Experiment goal:

Baseline:

Variable under test:

Dataset / split:

Evaluation metrics:

## Hypothesis

Hypothesis:

Expected mechanism:

Expected metric movement:

Main risk / confounder:

## Protocol

Seeds: N, fixed seed 42
Seed strategy: (e.g. fixed seed + seed list; references the reproducibility rule)

Compute budget:
- GPU hours estimate:
- Max wall time:
- Estimated cost:

Success criterion: (metric + threshold + variance tolerance)

Related experiments: (slugs from the dedup check, if any)

## Run command

scripts/run.sh:
```

### `progress.md`

```markdown
# Progress

## Todo

- [ ] Confirm run command
- [ ] Run experiment
- [ ] Collect logs
- [ ] Extract metrics
- [ ] Analyze result
- [ ] Update conclusion

## Timeline

### YYYY-MM-DD HH:MM - Start

Current state:

Next step:

Risk points:
```

### `result.md`

```markdown
# Result

Status: pending

## Run summary

| Run | Command | Seeds | Key metric(s) | vs baseline | Status |
|---|---|---|---|---|---|
| run_001 | scripts/run.sh | 3 | image AUROC 0.912 ± 0.004 | +0.028 | done |

## Per-seed breakdown

| Run | Seed | image AUROC | pixel AUROC | AUPRO |
|---|---|---|---|---|
| run_001 | 0 | 0.915 | 0.968 | 0.892 |
| run_001 | 1 | 0.911 | 0.966 | 0.889 |
| run_001 | 2 | 0.910 | 0.967 | 0.891 |

## Observations

## Conclusion

Judgment: pending

Evidence:

Limitations:

Next recommendation:
```

### `runs/run_NNN/`

```text
runs/run_NNN/
├── config.yaml   # frozen copy of the exact config used for this experiment point
├── run_meta.yaml # command, git commit, GPU, python version, timestamp, seeds, grouping tag
└── seed_N/       # one per launch of this config
    ├── log.txt       # stdout/stderr of the launch
    ├── metrics.json  # structured metrics for this launch
    └── checkpoint/   # model weights; may be a symlink to a large output directory
```

### `experiments/ACTIVE.md`

```text
exp_YYYYMMDD_NNN_slug
```

### `.gitignore`

```text
# nested seed layout
runs/*/*/checkpoint/
runs/*/*/log.txt
runs/*/*/*.pth
runs/*/*/*.ckpt
runs/*/*/*.pt
# legacy flat layout (older experiments)
runs/*/checkpoint/
runs/*/log.txt
runs/*/*.pth
runs/*/*.ckpt
runs/*/*.pt
__pycache__/
```

### `experiments/index.md`

Maintain a compact index:

```markdown
# Experiment Index

| ID | Path | Goal | Variable | Status | Runs | Seeds | Best Metric | Conclusion | Updated |
|---|---|---|---|---|---|---|---|---|---|
```

## Naming conventions

- Experiment dir: `exp_YYYYMMDD_NNN_slug`
- Run point: `run_001`, `run_002`, ... (never overwrite)
- Seed dir: `seed_0`, `seed_1`, ... (default `seed_0`)
- Figures: `fig_<slug>_<metric>[_seed<N>].png`, e.g. `fig_visa_transfer_auc.png`
- Working configs: `<variant>_<date>.yaml` under `configs/`
- Patches: `patch_<YYYYMMDD>_<purpose>.patch` under `patches/`

## Practical implementation guidance

Use dedicated file tools for reading/writing where possible. Use shell commands only for filesystem setup, git snapshots, environment snapshots, or running experiments.

When creating directories, first verify the parent directory if using shell commands. Do not delete or overwrite existing experiment records. If a target directory already exists, choose the next number or ask the user.

When running long training jobs, write stdout/stderr to `runs/<current run>/seed_<current seed>/log.txt` and prefer background execution only when the user expects a long run. Record the command in `scripts/run.sh` and `progress.md`.

For UI-free or server environments, do not claim that visual figures were inspected unless you actually opened/read them. You can still list figure paths and summarize filenames.

## Routing to companion skills

Keep strict analysis and narrative reporting in the right tool:

- **Statistical rigor** (significance tests, error bars, multi-seed mean ± std analysis) → `results-analysis`
- **Project-level experiment report** after wrap-up → `results-report`
- **Research story / contribution framing from mixed results** → `research-story-architect`
- **Multi-step task planning and progress tracking** for long experiment campaigns → `planning-with-files`

## Deep learning metrics extraction hints

Look for common log patterns:

- `AUROC`, `AUC`, `image_auc`, `pixel_auc`
- `AP`, `average precision`
- `F1`, `Dice`, `IoU`
- `PRO`, `AUPRO`
- `loss`, `val_loss`, `train_loss`
- `accuracy`, `precision`, `recall`
- `latency`, `FPS`, `memory`, `VRAM`
- dataset names like `MVTec`, `VisA`, `BTAD`, `MPDD`, `DAGM`

If metrics appear in CSV/JSON/YAML/TensorBoard exports, prefer the structured source over free-text logs. Prefer `runs/*/seed_*/metrics.json` over parsing `runs/*/seed_*/log.txt`. When a point has multiple seeds, report the mean ± std of the chosen metric and keep the per-seed values in the breakdown.

## Response style

Keep user-facing responses concise:

- On start: experiment ID, path, mode, status, missing info, next step.
- On log: what was recorded and where.
- On analyze: key metric delta (mean ± std if multi-seed), conclusion judgment, next recommendation.
- On compare: the head-to-head table and which experiment to build on.
- On next: the recommended experiment and why it ranks first.
- On wrap: final status, best metric, conclusion, follow-up.

Mention concrete paths so the user can navigate quickly.
