---
name: cluster-scheduler
description: Use when submitting or managing experiments on the shared SLURM cluster (<SLURM_HEAD_NODE_IP>, partition q_ai8, SLURM 19.05.8). Applies to job-array design, concurrency sizing, dependency handling, result isolation, and end-of-run verification. Trigger whenever a task involves running or scheduling cluster jobs.
version: 0.1.0
---

# Cluster Scheduler

Operational policy for the shared SLURM cluster at `<SLURM_HEAD_NODE_IP>` (login `head_node`, partition `q_ai8`, nodes ai01/ai02, 36 cores / 1 TB RAM / 8x Tesla V100 per node, shared GPFS). Follow these rules when scheduling or managing cluster work.

## Core Principle

Grow overall throughput by parallelizing independent units, bound by what the node actually runs out of first. On this cluster that is almost always **CPU cores and RAM**, not GPUs. Do not let agent habit serialize independent experiments, and do not let "parallel == many" cause resource abuse.

## Job Submission

1. **Split into minimal independent units.** For a matrix like `Dataset x Category x Seed`, each combination is one array element. Never write one script that loops internally over independent units.
2. **Prefer a Job Array** when units share the same executable and differ only in parameters. Map the index explicitly:
   ```bash
   #SBATCH --array=0-19
   ...
   declare -a D=(aebad_s MetalParts PCB PiledBags)
   declare -a S=(0 1 2 3 4)
   i=$SLURM_ARRAY_TASK_ID
   ds=${D[$((i/5))]}      # dataset index
   sd=${S[$((i%5))]}      # seed index
   ```
   Log the mapping table (dataset/seed per `$SLURM_ARRAY_TASK_ID` and each `$SLURM_JOB_ID`) in the submission record so results map back to parameters.
3. **Serialize only on a real dependency:** output checkpoint, generated data, or statistics that the next job consumes.
4. **SLURM 19.05 syntax only.** `--gpus=` is not parsed on 19.05 (`srun --gpus ...` fails with an argument-parse error). Use `--gres=gpu:<n>` when a GPU is required. `sbatch` works; interactive `srun --gpus` does not.

## Resource Physics (read before sizing concurrency)

- faiss (IndexFlatL2), MiniBatchKMeans, numpy/scipy least-squares and IRLS run on **CPU** and scale with OpenMP. GPU is used only for brief steps such as coreset memory sampling.
- Therefore **cap concurrency by cores**, not GPU count. Use `--cpus-per-task=4` (5 for margin) and run about `cores_per_node / cpus_per_task` concurrent array elements per node; Slurm queues the rest.
- **Pin both thread pools**: set `OMP_NUM_THREADS` and `MKL_NUM_THREADS` to the same value (`4`). If only OMP is set, MKL-backed paths spawn their own pool and tasks on the same node steal cores from each other.
- GPUs may be shared by multiple array elements when GPU load per element is small. Do not artificially limit concurrency to the GPU count in that case.
- Do not oversubscribe CPU or memory against node capacity to chase parallel numbers; overall throughput wins over element count.

## Parameters and Result Isolation

- All parameters must be explicit per unit (dataset, category, seed, config, shift/augmentation, memory fraction, etc.). No implicit cross-task state; read them from config/CLI, never by editing code per run.
- Each array element writes only its own result directory, e.g. `results/<experiment>/{dataset}/{category}/seed_{seed}/`; never share or overwrite a checkpoint/log/result file across elements or across reruns.
- If the executable already has a completed-mark file (e.g. `COMPLETED.json`), submit the full array again to rerun failures: completed units are skipped automatically, so rerunning the array only executes what is missing. Do not hand-restart a subset if the whole array is cheap to re-submit.

## Agent Execution Flow

1. Analyze which experiments are independent and split them into per-unit tasks.
2. Prefer a Job Array when parameter structure is uniform.
3. Derive concurrency from node cores/RAM (see Resource Physics), not from GPU count.
4. Submit, then record array/job IDs.
5. Track status with `squeue -u <user>` (or `sacct` for finished jobs) — never block the terminal waiting for a single job.
6. After completion, collect and aggregate results; rerun only failed elements.
7. Mark failed elements explicitly instead of silently dropping them.

## End-of-Run Verification

Before any final statistics or conclusions, confirm and report:

```
Expected: N
Completed: X
Failed:   Y
Pending:  Z
```

And verify:
- every expected unit ran; no abnormal exit due to resource limits;
- no result file was overwritten;
- parameters map one-to-one to results (use the saved array-index mapping);
- failures are labeled, not silently ignored.

Count Completed by scanning the completed-mark files on shared storage (e.g. `find ... -name COMPLETED.json | wc -l`) instead of eyeballing directories.

## Pre-flight Checklist (this cluster)

- Use the DL env python explicitly: `/home/lab/user/DATA/project_data/envs/DL/bin/python`. The default shell python is Python 2.7 (leftover base conda) — do not use it.
- Tilde expansion in non-interactive commands is unreliable (remote shell is ksh-like); use hardcoded absolute paths under `/home/lab/user/DATA/project_data/`.
- `faiss` import is broken in the DL env (numpy 2.2.6 ABI). Fix in a cloned env with a compatible numpy/faiss-cpu before jobs that use faiss. Backbone weights already exist under `~/.cache/torch/hub/checkpoints`.
- Transfer large cached feature dirs rather than rerunning offline feature extraction on the cluster; if a pipeline consumes only cached arrays (not raw images), the raw dataset trees can be recreated as empty placeholder files with identical paths and names.
