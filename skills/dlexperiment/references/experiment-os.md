# dlexperiment-skill reference

## Intended use

Use this skill for deep learning experiments where reproducibility and research memory matter: anomaly detection, transfer learning, ablations, architecture changes, loss/config changes, evaluation-only runs, and failure analysis.

## Status values

Use one of:

- `planned`: directory created, run not launched
- `running`: command launched or actively being prepared
- `blocked`: missing data, dependency, command, or environment issue
- `analyzing`: outputs exist and are being interpreted
- `done`: conclusion recorded
- `abandoned`: intentionally stopped
- `superseded`: replaced by another experiment

## Good experiment names

- `visa_transfer`
- `response_gap`
- `fusion_ablation`
- `mvtec_eval`
- `selector_fix`
- `patchcore_baseline`

## Best practices

- Keep one primary variable per experiment.
- Record why a change was made, not only what changed.
- Prefer structured metrics files over copied terminal text.
- Store reproduction commands under `scripts/run.sh`.
- Do not overwrite prior experiment directories.
- Mark inconclusive results honestly.

## Seeds and variance

- One experiment point = one config; each seed is a separate launch under `runs/run_NNN/seed_N/`.
- Default to 1 seed (`seed_0`); label single-seed results `preliminary (1 seed)`.
- For claims that survive scrutiny, run ≥ 2 seeds and report mean ± std with the per-seed breakdown.
- Do not claim a point "beats baseline" when the delta is within the seed spread; mark it `inconclusive`.
- Record the seed list and seed strategy in `plan.md` and `run_meta.yaml`.

## Active experiment

- `experiments/ACTIVE.md` points to the current experiment slug.
- `exp-start` sets it; `exp-wrap` clears it.
- When the pointer is missing or stale, scan `experiments/index.md` or ask once.

## Duplicate check

- Before `exp-start`, scan `experiments/index.md` and existing directories for the same goal + variable.
- If found, prefer continuing the existing experiment over creating a duplicate; record related slugs in `plan.md`.
