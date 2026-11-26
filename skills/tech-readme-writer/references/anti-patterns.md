# Technical README Anti-Patterns

## Anti-Pattern 1: The "Ghost File" (Abstract Theorizing)
- **Problem**: The document discusses architecture, backend comparisons (e.g. `v4l2` vs `libuvc`), and performance trade-offs across 5 paragraphs, but never mentions which file was edited, where the parameter lives, or what the code looks like.
- **Consequence**: Readers finish reading with conceptual clarity but zero operational capability. They still do not know which file in the repository controls the behavior.
- **Fix**: Every conceptual decision must anchor to a concrete repository file path (e.g. `gemini/launch/gemini_camera.launch.py`) with an exact code snippet and parameter mapping table.

## Anti-Pattern 2: The Academic & Bureaucratic Jargon (AI Pseudo-Professional Tone)
- **Problem**: AI uses pseudo-academic, bureaucratic, or meta-skill jargon in document titles and text (e.g., "驱动调优策略", "核心性能基准表", "软硬件接口参数矩阵", "决策树规范", "验收台账", "因果链条解析").
- **Consequence**: The document reads like an internal government paper or an academic thesis rather than an open-source technical README. It feels artificial, unnatural, and exhausting to read.
- **Fix**: Use natural, pragmatic, concise phrasing typical of top human open-source maintainers:
  - ❌ "关键物理特性与驱动调优策略" $\rightarrow$ ✅ **"相机驱动与参数设置"**
  - ❌ "核心性能基准表 / 验收台账" $\rightarrow$ ✅ **"实测性能"** 或 **"测试结果"**
  - ❌ "软硬件接口参数矩阵" $\rightarrow$ ✅ **"设备与接口"**
  - ❌ "核心依赖组件版本对齐矩阵" $\rightarrow$ ✅ **"安装依赖"**
  - ❌ "标准操作命令集" $\rightarrow$ ✅ **"常用命令"** 或 **"快速开始"**
  - ❌ "故障诊断与排查决策树" $\rightarrow$ ✅ **"常见问题"** 或 **"排错"**

## Anti-Pattern 3: Syntax-Fragile & Unreadable Mermaid Diagrams
- **Problem A**: Putting unescaped parentheses inside edge labels: `A -->|label (1280x720)| B`. Mermaid treats `(` as node syntax, crashing markdown previewers with `Parse error: got 'PS'`.
- **Problem B**: Massive sequence diagrams with 10 lifelines and 30 messages, rendering into an unreadable tangle of micro-text.
- **Fix**:
  1. Always quote edge text: `A -->|"label [1280x720]"| B`.
  2. Use compact, modular, top-down flowcharts (`graph TD`) focused on stage-to-stage data flow and hardware acceleration.

## Anti-Pattern 4: The Paragraph-In-A-Table (Text Dumps)
- **Problem**: Cramming entire diagnostic paragraphs, historical background, or multi-step justifications into a single table cell.
- **Consequence**: Destroys table readability and layout on standard monitors.
- **Fix**: Tables are for structured data scanning (Name, Default, Tuned, Target, Actual, Status). Detailed prose belongs before or after the table, not inside its cells.

## Anti-Pattern 5: The "Expert-Only" Blindspot (Missing Newcomer Path)
- **Problem**: Document assumes the reader already knows the physical hardware quirks (e.g., that a blue USB port might drop to 2.0 with a bad cable) and only documents internal code.
- **Consequence**: Newcomers plug in the hardware, encounter runtime resets/crashes, and waste hours debugging software when the issue was physical.
- **Fix**: Always include a prominent "Hardware Prerequisites & Self-Check" section with explicit cable pin requirements and verification commands (`lsusb -t` $\rightarrow$ `5000M`).
