# Acceptance templates (验收模板)

These are the exact output structures the audit track uses. Copy the skeleton, fill in specifics. Do not paraphrase away the 6-part structure — it is the promise the source materials make to the researcher.

---

## 通用阶段验收模板 (Universal 6-part acceptance template)

Use at the end of **every** stage's audit, regardless of paper type. Cut nothing.

```
【阶段验收 · Stage <N> · <阶段名>】

1) 总体结论：通过 / 部分通过 / 不通过

2) 逐条验收（对齐本阶段验收标准）：
   - 标准 1：满足 / 部分满足 / 不满足 —— 理由：<具体到哪一句、哪一个变量、哪一个证据>
   - 标准 2：满足 / 部分满足 / 不满足 —— 理由：...
   - 标准 3：...
   ...

3) 关键缺口（列出最影响下一阶段推进的 3 个问题，按严重程度排序）：
   - 缺口 A：<一句话陈述>
   - 缺口 B：...
   - 缺口 C：...

4) 修改任务（把每个缺口改写成可直接执行的补充任务）：
   - 任务 A（对应缺口 A）：<具体动作，例如"补充 <数据集名称> 的外部验证，报告 AUC 和 95% CI；见方法节 §4.3"，而不是"加强验证">
   - 任务 B（对应缺口 B）：...
   - 任务 C（对应缺口 C）：...

5) 风险提醒（材料/文献/数据/方法/伦理/结论过度推断中的潜在风险）：
   - <具体风险 + 具体位置>

6) 是否允许进入下一阶段：允许 / 暂不允许
   - 若"暂不允许"：说明必须先补齐哪些内容才能重新验收
```

**为什么必须严格输出这 6 项：**
- (1) 明确进/不进的判定 —— 逼迫定性判断，避免"看起来还行"式模糊反馈。
- (2) 逐条对齐验收标准 —— 避免遗漏任何一条硬指标。
- (3) 只列 3 个关键缺口 —— 强迫优先级排序，避免一次性抛 20 条让用户瘫痪。
- (4) 缺口 → 可执行任务 —— 每个问题都要能落地成动作，不是抽象抱怨。
- (5) 风险提醒 —— 用户可能没意识到的隐患（例如"这个 p 值没做多重比较校正"）。
- (6) 显式的门控信号 —— 让用户明确知道要不要重来。

---

## AI 能力边界模板 (AI capability boundary)

Append after every audit. Do not skip.

```
【AI 能力边界】
- AI 可以：<在本阶段 AI 真正能帮上忙的部分，例如"帮助拓展关键词组合、检查综述逻辑结构、生成消融实验的建议清单">
- AI 不能：<AI 无法替代的部分，例如"确认某篇文献是否真实存在、验证真实数据是否可获得、判断伦理审批是否通过、判断某选题是否真的具备学术原创性">
- 必须由研究者人工完成的事项：<具体清单>
```

**Why this matters:** the source materials treat this as a hard rule at every stage. Skipping it lets users over-trust AI on things it structurally cannot verify (literature accuracy, ethics review, real-world engineering constraints, journal fit, IRB, dataset access).

---

## 衔接下一阶段模板 (Bridge to next stage)

After a "通过" verdict, hand off explicitly:

```
【衔接下一阶段 · Stage <N> → Stage <N+1>】
将通过验收的以下产出物作为下一阶段"<下一阶段名>"的输入：
- <产出物 1>
- <产出物 2>
- <产出物 3>
- <产出物 4>
```

If "部分通过" or "不通过": no bridge — user must rework.

---

## 全稿终审模板 (Final holistic review, post-Stage 7)

Use only when all seven stages have passed and the user is preparing to submit.

```
【全稿终审 · Pre-submission Review】

审查对象：完整论文 + 图表 + 参考文献 + 附录 + 目标期刊要求 + 前七阶段产出物

1) 研究问题是否明确？
   <一段判断，指出研究问题在哪一句、是否可验证/可争论>

2) 材料/文献/数据是否支撑论证？
   <逐节判断，标出证据薄弱处>

3) 各阶段产出物是否相互衔接？
   - 引言的问题 ↔ 方法的对象：<一致 / 有 gap>
   - 方法的对象 ↔ 结果的证据：<一致 / 有 gap>
   - 结果的证据 ↔ 讨论的解释：<一致 / 过度推断>
   - 讨论的解释 ↔ 结论的回答：<一致 / 空泛升华>

4) 结论是否克制？
   <标出任何超出数据/材料能支撑的表述>

5) 图表、引用、附录、声明是否对应？
   - 图表编号连续、正文全部引用：<是 / 否，列出未引用编号>
   - 参考文献格式统一：<是 / 否>
   - 数据/代码可用性声明：<有 / 无>
   - 伦理声明 (IRB/隐私脱敏)：<有 / 无 / 不适用>
   - 摘要与结论中的数值与结果部分零误差：<核对 / 有出入，列出>

6) 格式、语言、逻辑、伦理风险：
   <逐项列出高风险、中风险、低风险条目>

【总体建议】：可以投稿 / 暂不建议投稿
【必须修改的问题】：
- ...
【建议优化的问题】：
- ...
【提交前必须由研究者人工确认的事项】：
- 参考文献真实性
- 目标期刊格式规范
- 作者署名与贡献声明
- IRB / 数据授权 / 版权
- 查重结果与降重后表达
- 补充材料与主文一致性
```

---

## Verdict thresholds (cheat sheet)

- **通过 (pass)** — all acceptance criteria fully met; deliverables are usable as next-stage input as-is. Green light.
- **部分通过 (conditional pass)** — most criteria met, 1–2 with fixable gaps; user must address flagged tasks but does not need to redo the whole stage.
- **不通过 (reject)** — a fatal defect (data leakage, non-testable hypothesis, cherry-picked evidence, no falsifier, no PRISMA transparency in a claimed systematic review, etc.); user must redo the stage's core work.

When in doubt between 通过 and 部分通过, choose 部分通过 — the source materials explicitly warn against premature green lights.
