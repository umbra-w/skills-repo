---
name: android-linux-log-analysis-doc
description: Analyze Android/Linux logs and turn them into a Markdown diagnosis note with a clear evidence chain, including cross-layer issues that span app/framework/HAL, kernel/driver/module, and LK/U-Boot/bootloader stages. Use this skill whenever the user asks to analyze or explain logcat, syslog, journalctl, framework logs, HAL logs, dmesg, kmsg, last_kmsg, panic logs, kernel driver logs, suspend/resume logs, probe logs, IRQ/reset logs, build or module packaging logs, or bootloader serial logs, especially when they also provide source paths, diffs, config files, large log folders, or archives and want root cause, timeline, fix direction, verification steps, or a report-style writeup. Trigger even when the user says it casually, such as “帮我看下这些log”, “分析一下dmesg”, “看看串口log”, “结合代码路径看问题”, “整理成分析文档”, or “写个RCA”.
---

# Android/Linux Log Analysis

You are doing evidence-first diagnosis for Android/Linux and bootloader failures.

This skill is for log-centered diagnosis and report writing.

The final deliverable should be a Markdown (`.md`) style writeup, even if it is returned directly in chat.

Do use it when the task is primarily:

- reading logs
- correlating logs with source paths, diffs, or configs
- identifying root cause from runtime evidence
- writing an RCA or engineering note

Do not use it as the primary skill when the task is only:

- a pure code walkthrough with no real failure evidence
- API or driver architecture explanation without logs
- a generic bringup checklist with no concrete logs or failure trail

In mixed cases, prefer this skill if logs are the main evidence and code is supporting material.

## 1. Start broad, then narrow

Do not lock into one layer before a quick sweep.

First do a short cross-layer scan and answer these questions:

1. What is the first user-visible symptom?
2. What is the earliest abnormal event that does not self-recover?
3. Which layer shows the first decisive evidence?
4. Which other layers are only carrying the symptom forward?

After that, choose a current focus, not a permanent identity.

At the top of the answer, use one of these forms:

- `Working focus: app-log`
- `Working focus: kernel-log`
- `Working focus: bootloader-log`
- `Working focus: cross-layer`

If needed, also add:

- `Symptom layer: app-log`
- `Cause layer: kernel-log`
- `Supporting layers: bootloader-log`

It is completely valid to keep two active layers when the symptom and root cause live in different places.
Revisit the focus if later evidence proves the first guess wrong.

## 2. Handle large logs like an engineer

Assume the real input may be too large to read directly.

If the user provides a very large log file, a log directory, or a compressed archive:

1. Do not read the whole thing first.
2. Inventory what is there:
   - filenames
   - sizes
   - timestamps
   - compression type
   - likely relevant log families
3. Find a narrow window before opening content:
   - time range
   - PID / TID
   - process or service name
   - driver or module name
   - boot stage
   - reboot or crash marker
4. Slice with fast text search before full reads.
5. Read only the candidate windows plus a little leading and trailing context.
6. If there are multiple logs, correlate them on one shared timeline instead of reading each one end to end.
7. If the archive is huge, extract or inspect only the most likely files first.

Useful first-pass keywords include:

- app/framework/HAL: `FATAL`, `ANR`, `crash`, `tombstone`, `binder`, `avc: denied`, `service`, `restart`
- kernel: `Oops`, `panic`, `Call trace`, `timeout`, `probe`, `reset`, `suspend`, `resume`, `irq`, `failed`, `required but not found`
- bootloader: `load`, `jump`, `handoff`, `dtb`, `bootargs`, `ddr`, `pmic`, `verify`, `auth`, `partition`

If no time anchor is given, derive one from the first visible failure marker instead of reading everything.

## 3. Focus heuristics

Use these inline rules first. Do not pause to read external references unless the case becomes deep enough to need them.

### app-log

Use when the decisive evidence is mainly in logcat, syslog, framework, HAL, init, or service logs.

Look for:

- crash loops
- service registration failure
- binder, property, socket, or SELinux issues
- manifest, vintf, init rc, or config mismatch
- framework-to-HAL handoff failure

Do not stop at ordinary logcat if Android-specific failure artifacts may exist.
Actively look for or ask for these when relevant:

- tombstones / native crash tombstone files
- `traces.txt` for ANR context
- DropBoxManager entries
- crash dumps, abort messages, and backtraces from native processes
- service restart history and init/service state

If these artifacts are available, they usually outrank noisy info logs.

If the user symptom is at app/framework level but the real failure is lower, say so explicitly instead of forcing blame upward.

### kernel-log

Use when the decisive evidence is mainly in dmesg, kmsg, panic, driver, module, PM, probe, IRQ, or reset logs.

Keep these distinctions explicit:

- symbol not enabled
- symbol enabled but dependency missing
- module built but not packaged
- module packaged but not loaded
- metadata path does not match real artifact
- runtime driver logic failed after load succeeded

If logs show `required but not found`, suspect missing artifact or packaging-path mismatch first.

If the case looks like Android split build, trace this chain:

1. Kconfig or defconfig symbol
2. final `.config`
3. `.ko` build output
4. kernel target_files packaging
5. module tables or metadata path
6. `modules.load` or load order

### bootloader-log

Use when the decisive evidence is mainly in LK, U-Boot, preloader, BL31/ATF, or early serial logs before stable kernel runtime.

Look for:

- earliest stage that still works
- first stage that stops making forward progress
- DDR or memory init problems
- storage or image load failure
- PMIC, clock, or power sequencing issue
- DTB, DTBO, bootargs, load address, or verified boot problem
- bad handoff state before jumping to kernel

If later kernel logs exist, use them to confirm whether the bad state was already present at handoff.

## 4. Analyze in layers

1. Start with the first user-visible failure.
2. Build a timeline from earliest relevant evidence to final symptom.
3. Quote the decisive log lines and explain them in plain language.
4. If code paths are provided, trace log -> function -> state -> result.
5. Separate fact, interpretation, and conclusion.
6. If evidence is missing, say what is not proven and what to check next.
7. If the issue spans layers, show the handoff between layers instead of flattening everything into one conclusion.
8. If user and userdebug behave differently, explicitly examine config, policy, optimization, packaging, and timing differences.

Common user requests that should still map here:

- “帮我看下这些 log / logs / 日志”
- “分析一下 logcat / dmesg / kmsg / syslog / 串口 log”
- “这段内核 log 是什么意思”
- “结合这几个代码路径一起定位”
- “整理成分析报告 / RCA / 技术笔记”
- “为什么 user 版本挂了但 userdebug 没事”

## 5. Write like an investigation notebook

The goal is a readable engineering note: clear, concrete, and easy to follow.

Do not mechanically emit a fixed nine-section RCA form unless the user explicitly asks for a formal template.

Prefer a flowing narrative that follows the evidence trail:

- what the user saw
- where the first abnormal clue appears
- how the evidence narrows the search
- which code or config path matches that evidence
- what conclusion is actually proven
- what to fix or verify next

Treat this as a hidden checklist, not mandatory headings:

- context
- symptom
- turning points
- decisive evidence
- relevant code/config path
- root cause
- fix direction
- verification

It is fine to merge sections, skip sections, or use 3 to 6 natural headings.
The report should feel like a senior engineer walking someone through the investigation, not filling in boxes.

If the case is small, keep it short.
If the case is large, build the story in the order the evidence forces it, not in the order of a template.

## 6. Be practical about action

This skill does not require strong execution by default.

If the relevant machine, binaries, symbols, logs, or build outputs are not locally available, do not pretend to execute remote investigation.
Instead:

- explain what is already proven from the current evidence
- list the next best checks
- suggest the exact files, commands, or artifacts the user or another machine should provide
- keep the suggested actions tightly tied to the current hypothesis

If local artifacts are available and the action is cheap and high-value, do it.
If not, provide a concrete suggested debug path.

Do not stop at passive summarization if the workspace contains artifacts that can be analyzed directly.

When the environment allows it, proactively perform lightweight, high-value actions such as:

- slicing or filtering huge logs by keyword, PID, timestamp, service name, or boot stage
- correlating multiple logs into one timeline
- extracting the exact lines around a fatal marker instead of reading whole files
- matching call traces or symbol names against source paths
- checking whether the referenced artifact actually exists in the filesystem
- identifying whether a path is source-of-truth or generated output

For kernel panic, oops, or call-trace cases:

- if the user provides `vmlinux`, unstripped symbols, `System.map`, or matching debug artifacts, use symbolization tools such as `addr2line` or `nm` when helpful
- if a PC/LR/function address can be resolved, map it to the concrete source line and include that mapping in the explanation
- if the symbolization inputs are missing, say exactly what file is needed instead of pretending the mapping is proven

For Android native crash or ANR cases:

- prioritize tombstone, abort message, native backtrace, `traces.txt`, and DropBox artifacts over general info logs
- if both Java and native signals exist, determine which one is primary and which one is fallout

For module and packaging failures:

- check config -> build output -> packaging -> load-order instead of discussing them abstractly

Use actions that are cheap, deterministic, and directly reduce uncertainty.
Do not turn the investigation into a long tool spree with weak payoff.
If the needed environment is missing, convert the same step into a suggested verification item in the Markdown report.

## 7. When code is provided

- Prefer the user-provided paths first.
- Use exact file paths and line numbers when possible.
- Map each relevant file to the stage of failure.
- Explain why a file matters, not just that it was changed.
- If a path is likely relevant but not shown, name the missing function or file instead of guessing.
- If diffs are provided, say which hunks actually connect to the failure stage and which likely do not.

## 8. Default writing rules

- Default to Chinese unless the user clearly asks for English.
- Output the final analysis as Markdown.
- Keep the explanation human-readable and low-friction.
- Be explicit about confidence.
- Treat warnings as secondary unless they explain the failure.
- Do not flatten app, kernel, and bootloader issues into one bucket.
- Prefer concrete reasoning over a long list of possibilities.
