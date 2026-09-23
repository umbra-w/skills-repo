#!/usr/bin/env python3
import argparse
import subprocess
import time

def check_job_status(job_id):
    """Check if a Slurm job is still in the queue."""
    try:
        # squeue -h omits the header. If stdout is empty, the job is gone (finished or failed).
        result = subprocess.run(
            ["squeue", "-j", str(job_id), "-h"],
            capture_output=True, text=True
        )
        return len(result.stdout.strip()) > 0
    except Exception as e:
        print(f"Error checking squeue: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description="Watch a Slurm job and wake up Claude when done.")
    parser.add_argument("--job-id", required=True, help="Slurm Job ID to watch")
    parser.add_argument("--exp-dir", required=True, help="Experiment directory path (e.g., experiments/exp_001)")
    parser.add_argument("--interval", type=int, default=60, help="Polling interval in seconds")
    
    args = parser.parse_args()
    
    print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] Watching Slurm Job {args.job_id}...")
    
    # Block and wait until the job finishes
    while True:
        is_running = check_job_status(args.job_id)
        if not is_running:
            print(f"\n[{time.strftime('%Y-%m-%d %H:%M:%S')}] Job {args.job_id} is no longer in squeue.")
            break
        time.sleep(args.interval)
        
    # The job is done. Wake up a NEW Claude process to continue the work!
    prompt = (
        f"Slurm Job {args.job_id} has finished. "
        f"The experiment directory is {args.exp_dir}. "
        "Please read the logs under runs/*/seed_*/log.txt, extract metrics from "
        "runs/*/seed_*/metrics.json, and update result.md (mean ± std across seeds if a "
        "point has multiple seeds). "
        "If the stopping criterion is not met, automatically generate the next config and submit the next job."
    )
    
    try:
        print("Launching Claude to resume automation...")
        # Note: If your command is 'claude-code', change it here.
        subprocess.run(["claude", "-p", prompt])
    except FileNotFoundError:
        print("Error: 'claude' command not found. Make sure the CLI is in your PATH.")

if __name__ == "__main__":
    main()
