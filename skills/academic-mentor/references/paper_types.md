# Paper-type spines (五类论文 7 阶段对照表)

Each paper type has its own 7-stage spine — the stage names, inputs, deliverables, acceptance criteria, and audit fingerprints differ. Read this once the user tells you which type they're writing (at Stage 0), then instantiate the produce+audit loop against the correct spine.

The user's Desktop folder `论文阶段任务对照表_AI协作prompt版/` also contains one PDF per type — if they want the full source, direct them there.

**Cross-type rules (apply to all five):**
- Each stage runs the closed loop: 输入材料 → AI 协作 Prompt → 阶段产出物 → AI 验收 Prompt → 下一阶段输入.
- Every audit uses the universal 6-part template in `acceptance_templates.md`.
- Every stage ends with an explicit AI 能力边界 (what AI can and cannot do here).
- Never auto-advance. 部分通过 or 不通过 means the user reworks before moving on.

---

## 一、实证类 Empirical

**Main line (主线):** 选题要可验证，文献要能定位空白，理论要能推出假设，方法要能获得证据，分析要能回答问题，写作要能形成闭环。

| # | 阶段名 | 核心产出物 (deliverables) | 关键验收指标 |
|---|---|---|---|
| 1 | 科研选题与问题定义 | 候选选题清单; 核心研究问题表述; 研究对象与边界说明; 初步题目 3 个版本 | 问题可验证、边界清楚、可获得证据、有 MVP 可完成的版本 |
| 2 | 文献检索与综述构建 | 关键词与检索式; 核心文献清单; 文献分类矩阵; 研究空白初步陈述; 综述结构框架 | 站在真实文献基础上; 按问题组织而非堆砌; 空白与后续假设直接相关 |
| 3 | 理论框架与研究假设 | 理论框架 (图或文字); 变量关系说明; 研究假设列表; 核心概念定义; 变量-假设对应表 | 每个假设有理论依据; 变量可测量; 框架能指导设计; 假设回应文献空白 |
| 4 | 研究设计与方法路线 | 研究设计方案; 变量操作化表; 数据收集计划; 分析方法路线图; 伦理与质量控制说明 | 方法匹配问题; 数据来源清楚; 变量可测; 每个假设有对应分析; 识别偏差与伦理 |
| 5 | 数据收集、实验执行与数据分析 | 清洗后数据集/记录; 描述性统计; 主分析结果; 稳健性/敏感性分析; 图表初稿 | 数据可复现; 分析匹配假设; 结果对应问题; 异常/缺失有说明 |
| 6 | 结果呈现与论文写作 | 论文提纲; 引言/方法/结果/讨论初稿; 图表定稿; 贡献陈述 | 结果先呈现证据、讨论再解释意义; 结论克制; 不把相关写成因果 |
| 7 | 终稿打磨与投稿准备 | 终稿; 投稿检查清单; 投稿信/答辩说明; 数据代码可用性声明; 审稿回复计划 | 数据/代码/伦理声明齐全; 摘要与结论数值零误差对齐正文; 参考文献格式统一 |

**Stage-2 typical valid gap:** data gap, evaluation gap.
**Stage-3 focus:** identification strategy — RCT / DiD / IV / RDD / matching. Confounders and reverse causality dominate.
**Stage-4 hard indicators:** external validity across sites / cohorts; sample size and power calculation; pre-registration hygiene.
**Stage-5 audit:** effect size + CI, robustness across specifications, heterogeneous effects. Zero tolerance for correlation-as-causation.
**Fatal defect to hunt:** underpowered study dressed as null result; p-hacking across specifications.
**AI 能力边界:** AI 可以帮你梳理逻辑和检查形式，但不能替代真实抽样、真实数据核查、伦理审批和期刊规范核验。

---

## 二、方法/应用类 Methods-application

**Main line:** 问题要真实，方案要清楚，实施要可操作，效果要可验证，边界要说得明白。

| # | 阶段名 | 核心产出物 | 关键验收指标 |
|---|---|---|---|
| 1 | 应用问题与需求场景定义 | 问题定义; 需求场景说明; 现有痛点清单; 评价目标 | 问题真实具体; 应用场景清楚; 评价标准初步明确 |
| 2 | 现有方法与竞品方案分析 | 现有方法对比表; 不足分析; 改进方向; 相关文献清单 | 明确相对谁改进; 不足具体; 改进方向与后续方案一致 |
| 3 | 新方法、模型或方案设计 | 方法框架图文字版; 模块说明; 操作流程; 资源与条件清单 | 结构清楚; 每模块有明确功能; 具备实施条件 |
| 4 | 实施路径与原型构建 | 实施计划; 原型功能清单; 流程文档; 测试准备材料 | 步骤可执行; 资源明确; 原型能支撑验证; 风险有备选 |
| 5 | 效果验证与评估设计 | 验证方案; 评价指标表; 实验/案例结果; 对比分析表 | 验证方式与目标一致; 有清楚基线; 结果支撑核心主张; 局限被说明 |
| 6 | 论文写作与应用价值表达 | 论文提纲; 方法章节初稿; 验证结果说明; 应用价值段落 | 方法可复现; 结果对应核心问题; 贡献具体; 边界明确 |
| 7 | 终稿规范、成果转化与投稿准备 | 终稿; 投稿检查清单; 代码/数据/原型说明; 修改计划; 展示/传播材料 | 格式合规; 图表清晰; 补充材料齐; 边界与安全伦理说明完整 |

**Stage-2 typical valid gap:** method gap in a target scenario; benchmark saturation.
**Stage-3 focus:** mechanism hypothesis for why the method should transfer to the new object / dataset / task.
**Stage-4 hard indicators:** ladder of baselines including current SOTA; ablation isolating the transferred module; fair-compute constraint; leakage-safe split (patient-level, temporal, cross-center as applicable).
**Stage-5 audit:** DeLong / bootstrap for metric comparisons, seed variance, external test set, calibration.
**Fatal defect to hunt:** "we applied X to Y and it worked" without a mechanism argument or a fair baseline. Data leakage from pretraining-corpus overlap.
**AI 能力边界:** AI 能协助设计框架和检查逻辑，但不能保证技术实现可行；工程细节需要真实开发、部署、测试和专家评审。

---

## 三、理论类 Theory

**Main line:** 问题要指向理论争议，概念要清楚，论点要可争辩，论证要严密，贡献要具体而克制。

| # | 阶段名 | 核心产出物 | 关键验收指标 |
|---|---|---|---|
| 1 | 理论问题与核心概念界定 | 理论问题表述; 核心概念清单; 初步论点版本; 研究边界说明 | 问题指向理论争议或概念困难; 概念有边界; 不是简单介绍 |
| 2 | 理论谱系与文献脉络梳理 | 理论谱系表; 核心文献分类表; 主要争议清单; 可进入的理论缺口 | 能说清问题从哪里来; 立场差异清楚; 综述服务于后续论证 |
| 3 | 理论缺口与本文立场形成 | 核心论点; 理论缺口陈述; 论证对象与反驳清单; 修正后的题目 | 立场明确可争论; 论点非常识判断; 后续章节可层层支撑 |
| 4 | 论证框架与章节结构设计 | 详细论文提纲; 章节论证任务表; 关键概念安排表; 可能反驳位置 | 每章有明确论证功能; 章节顺序推动主论点; 未把文献介绍误当论证 |
| 5 | 概念辨析与理论论证展开 | 核心章节初稿; 概念辨析段落; 理论比较表; 反驳与回应段落 | 每个判断有理论/文本依据; 推理链条清楚; 对被批判理论不过度简化 |
| 6 | 理论贡献、局限与结论提升 | 理论贡献表述; 局限性说明; 结论初稿; 未来研究方向 | 结论能回答引言问题; 贡献具体克制; 局限不削弱核心论点 |
| 7 | 终稿打磨与投稿准备 | 终稿; 格式检查清单; 投稿信/答辩说明; 修改计划 | 术语统一; 引用准确可查; 摘要清楚呈现问题、方法、贡献; 审稿回复逐条对应 |

**Stage-3 focus:** the causal / warrant chain **is** the paper. Assumptions, proofs, and boundary conditions must be explicit.
**Stage-4 hard indicators:** what counts as "empirical support" — simulation? toy example? real data? textual evidence? Adversarial examples that violate the assumptions.
**Stage-5 audit:** proofs airtight? Does the boundary condition analysis include failure regimes? Are counterarguments given fair strongest form?
**Fatal defect to hunt:** framework built on unstated assumptions; "theory" that is really just a diagram; no falsifier; strawmanning the opposing view.
**AI 能力边界:** AI 可能生成貌似严密但没有文本支撑的论证; 理论根据必须来自真实原典阅读，AI 不能替你完成经典文本精读。

---

## 四、综述类 Review / Survey

**Main line:** 范围要清楚，检索要透明，分类要有逻辑，评价要有依据，未来方向要具体。

| # | 阶段名 | 核心产出物 | 关键验收指标 |
|---|---|---|---|
| 1 | 综述主题与范围确定 | 综述主题; 范围说明; 综述类型判断 (叙述/系统/元分析); 核心综述问题 | 主题不大不空; 边界可检索、可执行; 问题能指导筛选 |
| 2 | 检索策略与文献筛选 | 检索式; 数据库清单; 纳入/排除标准; 筛选记录表 (PRISMA 流程) | 过程可复述; 标准前后一致; 文献来源真实可查 |
| 3 | 文献阅读、编码与资料矩阵 | 文献编码表; 核心文献摘要; 主题标签; 资料矩阵 | 每篇信息完整; 编码字段支持综述问题; 可横向比较 |
| 4 | 分类框架与研究脉络提炼 | 分类框架; 研究脉络图; 主题板块说明; 发展阶段总结 | 分类标准明确不重叠; 能解释领域发展逻辑; 非按年份罗列 |
| 5 | 比较评价与研究不足分析 | 研究评价表; 主要不足清单; 争议与矛盾总结; 研究空白陈述 | 评价有依据; 不足能导向未来研究; 无贬低或过度概括 |
| 6 | 综述正文写作与知识地图呈现 | 综述论文提纲; 正文初稿; 文献分类表; 研究脉络图/未来方向图 | 正文按问题组织; 图表帮助理解领域结构; 评价与未来方向对应 |
| 7 | 终稿规范、引用检查与投稿准备 | 终稿; 检索与筛选附录; 引用核查清单; 修改计划 | 检索透明; 核心文献无遗漏; 引用格式统一; 未来方向具体可研究 |

**Stage 2 IS the paper.** PRISMA rigor is non-negotiable for systematic reviews: registered protocol, explicit inclusion / exclusion, PRISMA flow diagram, risk-of-bias assessment.
**Stage-3 focus:** the taxonomy or synthesis frame — is it MECE? Does it produce genuine insight or just re-shelve prior work?
**Stage-4 audit:** coding scheme, inter-rater reliability, search reproducibility.
**Stage-5 audit:** are meta-conclusions supported by the coded evidence, or hand-waved? Publication bias analysis?
**Fatal defect to hunt:** "narrative review disguised as systematic"; missing PRISMA elements; taxonomy that cannot classify a new paper unambiguously; "研究较少" pseudo-gap that never explains why.
**AI 能力边界:** AI 可能生成不存在的文献; 必须通过 CNKI / Web of Science / Scopus / PubMed 等真实数据库检索确认; AI 不能知道你是否遗漏最新文献。

---

## 五、阐释类 Interpretive / Qualitative

**Main line:** 对象要明确，问题要具体，材料要扎实，理论要服务文本，解释要有证据链。

| # | 阶段名 | 核心产出物 | 关键验收指标 |
|---|---|---|---|
| 1 | 阐释对象与研究问题确定 | 阐释对象说明; 核心研究问题; 材料范围; 题目版本 | 问题具体可回答; 对象边界清楚; 不是主题赏析 |
| 2 | 文本材料与背景资料收集 | 原始材料清单; 文本摘录表 (含页码/版本); 背景资料清单; 已有研究简表 | 材料直接支撑问题; 有出处; 背景不喧宾夺主 |
| 3 | 理论视角与阐释路径选择 | 理论视角选择说明; 核心理论概念; 阐释路径图; 理论与文本对应表 | 视角与问题匹配; 概念有定义; 能回到具体材料 |
| 4 | 细读、编码与材料分析 | 文本细读笔记; 材料分析表; 关键证据链; 初步阐释判断 | 每个解释有具体材料; 细读有分析推进; 呈现文本复杂性/矛盾 |
| 5 | 阐释论点与章节结构形成 | 中心论点; 详细提纲; 章节材料分配表; 题目修订版 | 中心论点可争论; 各章节服务主论点; 材料分配不重复 |
| 6 | 正文写作与阐释深化 | 正文初稿; 核心段落修改稿; 证据与论点对应表; 过渡句和章节结论 | 证据与解释紧密对应; 理论使用适度; 章节递进; 无把主观感受当结论 |
| 7 | 终稿打磨、格式规范与提交 | 终稿; 版本与引用检查清单; 摘要与关键词; 修改计划 | 版本引用清楚; 摘要说清对象、问题、方法、贡献; 无证据缺口 |

**Stage-2 typical valid gap:** theoretical-lens gap, phenomenon gap.
**Stage-3 focus:** the interpretive framework — what lens (grounded theory, case study, hermeneutics, discourse analysis) and why it fits. Reject mechanical theory application ("套理论").
**Stage-4 hard indicators:** sampling logic (theoretical saturation, not statistical representativeness); coding transparency; researcher reflexivity statement.
**Stage-5 audit:** are the interpretations traceable to the source material? Member checking? Triangulation across data sources? Any cherry-picked quotes?
**Fatal defect to hunt:** cherry-picked quotes; interpretations that outrun the evidence; no reflexivity on the researcher's position; theory pressed onto text without justification.
**AI 能力边界:** AI 可能误引或虚构文本内容; 所有细节必须以原文、档案或可靠版本为准; AI 不能替你完成对原始文本的细读。

---

## Cross-type reminders

- Whatever the type, the seven-stage closed loop still applies. Don't skip Stage 4 for review or theory papers — reinterpret it as "review classification design" or "argumentation structure design".
- The stage names above are the ones the user will recognize from the PDFs they have on their Desktop. Use these exact names in your responses.
- If the user cannot tell you their paper type, walk through the object and evidence with them — "what will convince a reviewer this is true?" — and infer the type from their answer. If unsure between two types (e.g. empirical vs methods-application), ask a targeted question about whether the primary contribution is a *finding* or a *method*.
