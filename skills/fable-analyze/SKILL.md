---
name: fable-analyze
description: Windows 端编排的"贵模型只做分析"工作流。当用户要求深度分析、架构评审、多方案权衡、创新方向构思、论文定位决策且明确提到用 Fable/fable5/贵模型时使用。两种模式：裁决型（候选方案对比）与发散型（无锚点创新构思，内置五透镜 + 事后证据校验）。流程：便宜模型(triage+evidence)建 brief → 单次调用 WSL 里的 fable5 (claude-fable-5) 只读分析 → Windows 拿回建议校验并执行。不适用于日常编码和小问题。
---

# Fable-Analyze: 贵模型只出分析的工作流

## 核心原则（成本纪律）

Fable5 (claude-fable-5) 按贵 key 计费。本工作流的每一层设计都在压缩它的消耗：

1. **Fable 不碰文件系统**。它收到的输入是一个自包含的 evidence brief（由便宜模型预先整理好），不是一堆需要自己读的路径。
2. **Fable 只被调用一次**。单次调用、低 effort、限轮次、限预算。没有多轮对话、没有重试循环。
3. **杂活全部前置到便宜模型**。读文件、grep、统计、对比、汇总，全部由 Windows 端的 sub-agent（glm-5.3 槽位，走 internal-gw 便宜 key）完成。
4. **缺料的应对是"再来一轮便宜收集"，不是"让 Fable 自己去找"**。

## 核心原则（锚定纪律）

Brief 背着两个职责：信息压缩 + 问题框定。锚定风险来自后者。**信息分五层，各层准入规则按模式不同**：

| 层 | 例子 | 裁决型 | 发散型 |
|---|---|---|---|
| ① 原始数据/事实摘要 | 数字、路径、计数 | 进 | 进 |
| ② 硬约束 | deadline、撞车地盘、预算 | 进 | 进（收敛段才入场） |
| ③ 因果解读 | "X 是有效成分" | 进 | 标注"团队解读，可能错" |
| ④ 概念体系/内部词汇 | "边界"、"修复"、"escape route" | 进 | **全删**——内部词汇定义了能思考什么，是最深的锚 |
| ⑤ 倾向结论/候选方案 | "建议选 C′" | 进 | **全删** |

判定标准：问题是"在已知选项间选择"（裁决型）还是"选项本身未知"（发散型）。找创新方向、论文定位、范式重构一律发散型。

## 流程（四步）

### Step 1 — Triage（Windows 主对话判断，零额外成本）

先判断是否需要 Fable，再判断模式：

**需要 Fable**（满足任一）：
- 多个合理方案之间存在真正的架构权衡（不是有明显答案的技术选型）
- 便宜模型给出的答案可疑/互相矛盾，需要交叉裁决
- 用户明确点名要 Fable
- 需要超出团队当前概念框架的战略/创新构思（用户说"发散""创新""致命命中"时）

**模式判定**：
- 裁决型：问题空间已封闭（选 A 还是 B、这个方案有没有坑）
- 发散型：问题空间开放（怎么定位、还有什么方向、最有价值的claim是什么）

否则直接告诉用户"这个问题 X 模型能处理，不需要 Fable"，就地结束。

### Step 2 — Evidence Brief（便宜模型干活）

用 Agent tool 派 sub-agent（默认 `subagent_type=Explore`，重活可用 `general-purpose`，model 用 `sonnet` 或 `haiku` 槽位——它们都映射到 glm-5.3 便宜 key）收集材料。

**模式 A：裁决型 brief 模板**（问题空间封闭，候选方案是问题的一部分）：

```markdown
# Evidence Brief: <问题标题>
日期: <YYYY-MM-DD>  问题提出人: BlueRocket

## 决策问题（一句话）
<要 Fable 回答什么，必须是可回答的具体问题，不是开放话题>

## 背景约束
- <硬约束：deadline/依赖/预算/环境限制，逐条列>

## 证据 A: <来源名，如 src/xxx.py:120-180>
<关键代码摘录 / 配置 / 日志，只贴相关片段，注明路径和行号>

## 证据 B: ...
<同上，3-6 条为宜，超过 8 条说明 triage 没做减法>

## 已知事实（不需 Fable 重新推导）
- <便宜模型已确认的事实>

## 候选方案（如果已有倾向）
- 方案1: <描述> 优点: ... 代价: ...
- 方案2: ...
```

**模式 B：发散型 brief 模板**（无锚点，④⑤ 层信息全部清除）：

```markdown
# Evidence Brief: <问题标题> — 无锚点自由构思
日期: <YYYY-MM-DD>  提出人: BlueRocket

## 任务（开放，不给任何候选结构）
<一句话说明目标，如"为以下证据找到最有价值的论文定位/创新方向"。
 禁止出现团队内部建构的概念词汇——用事实描述，不用理论名词>

## 五透镜扫描要求（生成段，禁止提前自我审查）
L1 第一性原理：列出本领域 3-5 条公认的"常识"假设，逐条问——
   若该假设不成立或已过时，这个问题会变成什么问题？
L2 极端失效：主流范式在哪个 corner case 上彻底死掉？
   对它修补（渐进）vs 换范式（颠覆），分别长什么样？
L3 技术周期：底层技术的代际更迭改变了哪个历史前提？
   "资源无限"思想实验下解法会怎么变？
L4 五维渐进：对当前最好方案，逐维问 更高/更快/更强/更省/更广
L5 跨界移植：哪个成熟领域早就解决过同类问题、而本领域不知道？

## 背景约束（收敛段才入场，生成段不许看）
- <硬约束逐条列>

## 证据 <A/B/C/...>
<纯事实：数字、来源、已确认的测量结果。每条注明出处。
 团队自己的因果解读如必须包含，显式标注"团队解读，可能错">
```

两种 brief 写完都自查：**Fable 拿到这份材料后是否还需要读任何文件？** 如果是，补料再过一遍这步。

发散型额外自查：brief 里是否残留 ④⑤ 层内容（候选、倾向、内部理论词汇）？有则删除。

### Step 3 — 单次调用 WSL Fable（唯一花钱的一步）

把 brief 存成文件，通过 WSL 调用。**完整命令模板**（Windows 侧执行）：

```bash
# 1) brief 落盘（假设已在 C:\temp\fable\brief.md）
# 2) 调用（三重成本保险：effort low + max-turns 2 + max-budget 5 USD）
#    关键：必须先 cd ~ —— 若 cwd 是 /mnt/c/... ，claude 会读到 Windows 侧
#    .claude/settings.json（BASE_URL=127.0.0.1:15721，WSL 内不可达），导致 Connection refused
wsl.exe -d FedoraLinux-44 --exec bash -c '
cd /home/user && cat /mnt/c/temp/fable/brief.md | claude -p \
  --model claude-fable-5 \
  --effort low \
  --max-turns 2 \
  --max-budget-usd 5 \
  --output-format text \
  --append-system-prompt "You are in FABLE_ANALYSIS_MODE. The input is a pre-collected evidence brief. Trust it; do not read files, do not spawn agents unless one critical piece is missing (max 1 clarification, prefer answering with what you have). Do not propose running code or making changes. Output: Verdict (直接结论) / Reasoning (关键推理链, <=5 bullets) / Risks (最多3条) / Recommended next action (1条). Be concise."
'
```

**发散型 system prompt 变体**（替换 `--append-system-prompt` 的值）：

```
"You are in FABLE_ANALYSIS_MODE. The input is a pre-collected evidence brief. Trust it; do not read files, do not spawn agents unless one critical piece is missing. Do not propose running code or making changes. This is a STRATEGIC VISION request, not a menu selection: FIRST diverge through the requested lenses (each lens at least one candidate, no premature self-censorship, constraints are NOT visible during generation), THEN converge with constraints applied. Candidates must span at least two of: paradigm-level / cross-domain-level / incremental-level. Output: Assumptions (implicit assumptions you identified) / Candidates (>=4, each tagged with lens + level, 2-3 sentences) / Verdict (winner + why) / Moat (one-sentence thesis / why-unrejectable / why-now / why-this-team) / Risks (<=3). Be concise but bold."
```

要点：
- `--effort low` + `--max-turns 2` + `--max-budget-usd 5` 是三重保险，防止 fable 在 headless 模式里展开长 chain
- stdin 喂 brief 而不是把问题塞进 `-p` 参数，避免转义地狱
- 若输出末尾出现"缺关键材料"，回到 Step 2 补料（便宜），补完**一次性**重调，不进循环

### Step 4 — 回收、校验与执行（Windows 便宜模型/主对话）

拿到 Fable 的分析文本后，Windows 这边：
1. 原样呈现给用户（结论 + 推理 + 风险 + 下一步 / 发散型：候选 + 裁决 + moat + 风险）
2. **证据校验（发散型必做，裁决型抽查）**：便宜模型（主对话或 sub-agent）把 Fable 输出里引用的每个数字、事实性声明对着完整证据库逐条核查。重点查两类：a) Fable 引用的数字是否与源文件一致；b) Fable 声称的"证据支持"是否被完整证据（包括它没看到的部分）真正支持。校验结果标注在呈现文本之后，不修改 Fable 原文
3. 用户认可后，执行动作（改代码/写文档/跑实验）全部由 Windows 端普通模型 + 本地 skills 完成
4. **不复述、不总结、不"润色" Fable 的输出**——多一道转述就多一分失真，且没有额外价值

**发散与严谨的分界（论文场景）**：发散只允许发生在 positioning 层（主命题、贡献单位、框架）。claim 层（任何数字、gate 表述、因果句）纪律绝对：每个数字 trace 到冻结的 result.md，措辞红线 + 预注册 gate 不可被 Fable 输出松动。大胆额度全部花在命题上，一分钱不许花在数字上。

## 成本红线

- 每次 fable-analyze 全程只允许 **1 次 fable 调用**（至多 2 次，第 2 次必须是因为第 1 次缺料且已补料）
- Fable 输入（brief）控制在 **3000 字以内**；超了说明没做减法，回 Step 2 删
- 如果一个"分析"拆成了 5 个小问题，合并成 1 份 brief 一次问完，不要逐问调用
- relay 日志可事后核对：`Desktop/api-relay/logs/relay.log` 里 grep `claude-fable-5` 看实际 token 消耗（`in=/out=` 字段）

## 什么时候不用这个工作流

- 问题一句话能答 → 直接答
- 需要看代码改代码 → 普通开发流程（Opus/Sonnet 槽位足够）
- 连续多轮交互讨论 → 不适合 Fable（单次调用模式），改用普通模型对话
