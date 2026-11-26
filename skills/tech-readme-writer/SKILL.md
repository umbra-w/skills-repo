---
name: tech-readme-writer
description: "Draft, refactor, and review distribution-grade technical READMEs, deployment guides, and operation manuals. Bridges maintainer and newcomer reader perspectives with concrete file mappings, physical requirements, compact Mermaid diagrams, and high-signal tables without theoretical verbosity, bureaucratic jargon, or meta-skill leakage."
---

# Technical README & Deployment Guide Writer

## Purpose

Write and refactor distribution-grade engineering READMEs, deployment guides, and system operation manuals. 

This skill enforces two primary goals:
1. **Bridge Maintainer & Newcomer Perspectives**: Deliver clear engineering context (architecture, file trees, file mappings, code snippets) while ensuring zero-friction onboarding for newcomers (hardware prerequisites, pass/fail verification commands, one-line launch scenarios).
2. **Eliminate Academic & Bureaucratic AI Jargon**: Prevent the common AI anti-patterns of using pseudo-academic, bureaucratic, or meta-skill jargon (e.g., "调优策略", "基准表", "矩阵", "因果链条", "决策树"), replacing them with natural, pragmatic phrasing used by top human open-source engineers (Linux, ROS, OpenCV, GitHub).

---

## Deliverable Contract: Finished Document, Not a Work Log

The output is a document the reader can use directly, not a record of how it was produced.

- The body contains only what the reader needs: facts, steps, decision criteria, conclusions, verification commands.
- Investigation timelines, command-by-command transcripts, and "I checked X and found Y" narration stay out of the body. Compress process detail into a single conclusion when it matters.
- No writing instructions ("let us build a mental model", "below we introduce") and no commands aimed at the reader's thinking process.
- Test: hand the document to a colleague who was not involved. They should be able to follow it end to end, and should not be able to tell how it was produced.

---

## Core Tenets (Mandatory Rules)

### Tenet 1: Grounded in Engineering Entities (No Abstract Theorizing)
- **Forbidden**: Writing long theoretical analyses (e.g. comparing protocol A vs protocol B, or analyzing voltage drop mechanics) without pointing to the exact code or config.
- **Required**: Whenever explaining a configuration choice, parameter setting, or bug fix:
  1. Specify the **exact file path** (relative to project root).
  2. Provide a **concrete code snippet** showing the implementation.
  3. Provide a clean **Before vs. After Comparison Table** containing:
     - `参数名` (`Parameter`)
     - `默认值` (`Default`)
     - `修改值` (`Tuned`)
     - `修改原因` (`Rationale`)

### Tenet 2: Zero AI Bureaucratic Jargon (Use Natural Human-Engineer Phrasing)
- **Forbidden**: Using academic, bureaucratic, or AI-hallucinated pseudo-professional phrasing in document titles, headings, or prose:
  - ❌ `驱动调优策略` / `关键物理特性` / `Tuning Strategy`
  - ❌ `核心性能基准表` / `验收台账` / `Benchmark Ledger`
  - ❌ `软硬件接口参数矩阵` / `版本对齐矩阵` / `Alignment Matrix`
  - ❌ `分层拓扑架构图` / `Layered Topology Diagram`
  - ❌ `标准操作命令集` / `Standard Operational Command Suite`
  - ❌ `因果链条解析` / `Causal Chain Analysis`
  - ❌ `决策树规范` / `排查决策树` / `Decision Tree Specification`
  - ❌ `判定口径` / `三段式代码说明` / `质量闸门`
- **Required**: Use natural, pragmatic, concise phrasing typical of top human open-source maintainers (e.g. Linux, ROS, OpenCV, GitHub):
  - ✅ `相机驱动与参数设置` (NOT 驱动调优策略)
  - ✅ `实测性能` 或 `测试结果` (NOT 核心性能基准表)
  - ✅ `硬件连接 (需接 USB 3.0)` (NOT 硬件连接规范与检查重要提示)
  - ✅ `设备与接口` (NOT 软硬件接口参数矩阵)
  - ✅ `安装依赖` (NOT 核心依赖组件版本对齐矩阵)
  - ✅ `常用命令` 或 `快速开始` (NOT 标准操作命令集)
  - ✅ `常见问题` 或 `排错` (NOT 故障排查与决策树规范)

### Tenet 3: Mermaid Diagram Safety & Visual Compactness
- **Syntax Safety**:
  - **Never use unescaped parentheses inside edge text**: `-->|text (note)|` causes parsing failure in Mermaid.js (`Parse error: got 'PS'`).
  - Always quote edge labels: `-->|"text [note]"|` or `-->|"text"|`.
  - Ensure all node labels with brackets, HTML breaks, or colons are wrapped in double quotes: `ID["Node Label<br/>Detail"]`.
- **Visual Compactness (Prevent Dense Sequence Diagrams)**:
  - Avoid dense, multi-participant sequence diagrams with dozens of overlapping lifelines and tiny unreadable text.
  - Prefer clean, modular, top-down or left-to-right flowcharts (`graph TD` or `graph LR`) showing: Input Sensor Data $\rightarrow$ Processing Stages $\rightarrow$ Hardware Acceleration $\rightarrow$ Output Topics / Endpoints.

### Tenet 4: High-Signal, Concise Tables (No Text Dumps)
- **Forbidden**: Cramming paragraphs of discursive prose into table cells.
- **Required**: Tables must be clean, structured, and instantly readable:
  - **Parameter Tables**: `参数名` | `默认值` | `类型` | `说明` | `修改示例`
  - **Performance Tables**: `测试项目` | `目标要求` | `实测数值` | `结果`

### Tenet 5: Dual-Perspective Document Structure
Every technical README / deployment guide must address both:
1. **Newcomer / Consumer View**:
   - Hardware & physical cable requirements (e.g. blue USB 3.0, 9-pin cable with SS logo).
   - Fast verification command with expected output (e.g. `lsusb -t` showing `5000M`).
   - One-line automated setup (`install_deps.sh`) and build command.
   - Three standard launch scenarios (Full Stack, Standalone Driver, Custom Parameter Override).
2. **Maintainer / Contributor View**:
   - Complete project directory tree (`gemini/` layout).
   - Component dependency list (Built-in vs. Added).
   - Algorithm pipeline logic and coordinate transforms.
   - Verification and diagnostics commands (`echo`, `hz`, sample extraction).

---
## Anti-AI & Humanizing Workflow (Step-by-Step Refactoring)

When authoring or refactoring a technical README or deployment guide, execute this 5-step humanizing pass:

### Step 1: Jargon Sweep (Scrub Academic & Bureaucratic Fluff)
Scan every heading and paragraph. Immediately replace pseudo-academic AI phrases with human maintainer language:
- Change `驱动调优策略` $\rightarrow$ `相机驱动与参数设置` (或 `参数配置`)
- Change `核心性能基准表` / `验收台账` $\rightarrow$ `实测性能` (或 `测试结果`)
- Change `软硬件接口参数矩阵` $\rightarrow$ `设备与接口`
- Change `核心依赖组件版本对齐矩阵` $\rightarrow$ `安装依赖` (或 `环境依赖`)
- Change `标准操作命令集` $\rightarrow$ `常用命令` (或 `快速开始`)
- Change `故障诊断与排查决策树` $\rightarrow$ `常见问题` (或 `排错`)
- Change `因果链条解析` / `判定口径` / `三段式说明` $\rightarrow$ 剔除元词汇，直接讲客观原因与结论。

### Step 2: Grounding Inspection (Anchor to Concrete Repository Files)
Check every configuration decision or architectural selection:
- Does it name the exact file path (e.g. `gemini/launch/gemini_camera.launch.py`)?
- Does it show the actual code snippet?
- Does it provide a clean 4-column comparison table (`参数名`, `默认值`, `修改值`, `修改原因`)?
If any of these are missing, anchor them immediately. Never leave abstract theory unanchored.

### Step 3: Mermaid Syntax & Visual Density Audit
- Check all arrow labels: ensure `-->|"text"|` has quotes and zero unescaped parentheses `(...)` to prevent `got 'PS'` syntax parser crashes.
- Inspect diagram size: if a sequence diagram has dozens of lifelines and unreadable micro-text, replace it with a clean, top-down flowchart (`graph TD`).

### Step 4: Table De-cluttering (High-Signal Data Only)
- Ensure no table cell contains multi-sentence paragraphs or narrative essays.
- Keep table columns crisp: Parameter Name, Default, Tuned, Rationale. Move conceptual prose outside the table.

### Step 5: Dual-Perspective Pass
- **Newcomer Pass**: Can a user plug in the cable, verify with `lsusb -t` (5000M), install with one script, and launch in 1 command?
- **Maintainer Pass**: Is the complete project directory tree present? Are algorithm filter snippets and source paths documented?

---

## Standard Distribution README Structure (Human Style)

When drafting or refactoring a technical README or deployment guide, follow this clean, humanized chapter layout:

1. **标题与项目简介** (Title & Overview): 简述项目定位与主要功能。
2. **代码目录结构** (Project Directory Tree): ASCII 目录树展示核心文件夹与文件分工。
3. **系统架构与硬件连接** (Architecture & Hardware):
   - 简洁的系统框图 (`graph TD`)。
   - 物理接线要求（必须接 USB 3.0、9 针高速线）。
   - 快速检查命令与正常输出（`lsusb -t` 显示 `5000M`）。
4. **宿主机设置与 Docker 启动** (Host Setup & Docker):
   - Udev 权限设置（`sudo cp ... && sudo udevadm trigger`）。
   - Docker 启动与设备透传参数说明。
5. **安装依赖** (Dependencies):
   - 依赖清单表（区分系统自带与需额外添加）。
   - 一键安装脚本与手动分步说明。
6. **参数配置与说明** (Configuration & Settings):
   - 明确指出配置文件物理路径。
   - 核心代码片段展示。
   - 参数对比表（默认值 vs 修改值 vs 设置原因）。
7. **工作原理与算法实现** (How It Works & Pipeline):
   - 紧凑的数据流向图。
   - 核心算法/滤波代码段与注释。
8. **常用运行命令** (Usage & Quick Start):
   - 编译命令。
   - 常用场景启动命令（一键拉起、单独测相机、带参启动）。
   - 输出验证命令（查看话题、测 FPS、导出样张）。
9. **实测性能** (Performance & Benchmarks):
   - 简洁的实测数据表（指标、目标、实测值、判定）。
   - 实拍检测效果样张展示。
10. **常见问题** (Troubleshooting / FAQ, 可选):
    - 常见排错场景与解决办法。

---

## Self-Check Validation Checklist

Before presenting the README or guide, verify against this 6-point checklist:

- [ ] **No Bureaucratic Jargon**: Are words like "调优策略", "基准表", "矩阵", "因果链条", "决策树规范", "台账" completely absent?
- [ ] **File Grounding**: Does every mentioned modification name the exact file path and code snippet?
- [ ] **Dual Perspective**: Can a newcomer plug in hardware and run within 3 steps? Does a maintainer have the file tree?
- [ ] **Mermaid Syntax**: Are all edge labels quoted (`-->|"..."|`) with zero bare parentheses? Is the diagram visually clean?
- [ ] **Table Density**: Are all table cells concise without multi-sentence paragraphs?
- [ ] **Verifiable Commands**: Are all bash / launch commands complete, copy-pasteable, and tested?
- [ ] **No Process Residue**: Are there timelines, command transcripts, or "first I tried / then I found" narration left in the body? Remove them or compress to a conclusion.
