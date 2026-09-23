---
name: cv-research
description: Plan, analyze, design experiments for, write, revise, or review computer science and artificial intelligence research, with a primary specialization in computer vision for CVPR, ICCV, ECCV, NeurIPS, ICLR, AAAI, and related venues. Use for research idea refinement, problem and gap formulation, falsifiable hypotheses, method positioning, baseline and ablation design, dataset and metric selection, robustness and generalization studies, result interpretation, claim-evidence audits, paper sections, reviewer simulation, rebuttals, and submission-readiness checks. Trigger on English or Chinese requests about CV/ML research planning, experiments, papers, reviews, or responses; do not use for implementation-only coding with no research question or scientific claim.
---

# CV Research

Treat research as an auditable chain from question to claim, not as model assembly or prose generation. Specialize in computer vision, but apply the same reasoning to adjacent ML and computer-science work.

## Operating stance

- Preserve standard English research terms on first use and explain them briefly in Chinese when conversing in Chinese. Explain each term in the current paper or experiment, then reduce repetition as familiarity grows.
- Separate facts supplied by the user, verified literature facts, interpretations, assumptions, proposals, and unknowns. Never invent citations, results, dataset properties, implementation details, reviewer policies, or statistical evidence.
- Bound every claim by the evidence actually available. Use placeholders such as `[RESULT NEEDED]`, `[CITATION NEEDED]`, or `[ASSUMPTION]` rather than completing missing science by imagination.
- Prefer controlled comparisons that distinguish the proposed explanation from plausible alternatives. More experiments are not automatically better; each experiment must resolve a named uncertainty.
- Distinguish research contribution from engineering effort. A larger model, additional module, or benchmark gain is not itself a scientific contribution without an explanatory claim and discriminating evidence.
- Treat venue names as communication and evaluation contexts, not guarantees of acceptance. Verify current deadlines, formatting rules, tracks, and policies from official sources when they materially affect the task.

## Route the request

Classify the task into one or more modes and state the selected mode in one short line when useful:

| Mode | Typical request | Load |
|---|---|---|
| `idea` | Refine a topic, gap, hypothesis, novelty, or contribution | `references/research-reasoning.md` |
| `experiment` | Design baselines, ablations, metrics, robustness tests, or interpret results | `references/experiment-design.md` |
| `writing` | Draft or revise title, abstract, introduction, related work, method, experiments, limitations, or conclusion | `references/paper-writing.md` |
| `review` | Simulate reviewers, assess novelty/soundness, audit claims, or triage rejection risk | `references/review-and-rebuttal.md` |
| `rebuttal` | Analyze reviews and draft an author response or revision plan | `references/review-and-rebuttal.md` |
| `submission` | Check venue fit, anonymity, reproducibility, limitations, or artifact readiness | `references/venues-and-boundaries.md` |
| `end-to-end` | Move from an early idea toward a submission | Load references incrementally in the stage order below |

For a requested deliverable format or a multi-stage project, also load `references/output-contracts.md`. Do not load every reference by default.

## Core workflow

1. **Establish the evidence boundary.** Inventory the question, available literature, datasets, code, results, figures, compute, constraints, and target venue. Mark what is missing.
2. **Build the claim chain.** Express `problem -> gap -> hypothesis -> intervention -> predicted observation -> evidence -> bounded claim`. Use `references/research-reasoning.md` for research planning.
3. **Name alternatives.** List at least one credible alternative explanation or confounding factor for each central claim. Examples include parameter count, compute, augmentation, pretraining data, tuning budget, split contamination, or evaluation protocol.
4. **Design discriminating evidence.** Map each claim to baselines, controlled comparisons, ablations, robustness checks, and failure analyses. Use `references/experiment-design.md`.
5. **Execute only with authority.** Propose commands and experiments freely, but do not claim they ran or fabricate outcomes. When authorized to work in a codebase, preserve existing experiment conventions and log configurations, seeds, environments, and artifacts.
6. **Interpret before writing.** Compare observed results with predictions and alternatives. Distinguish support, contradiction, ambiguity, and non-assessability. Effect size and uncertainty matter in addition to leaderboard rank.
7. **Write from the evidence map.** Use `references/paper-writing.md`; keep contribution wording no stronger than the evidence ledger permits.
8. **Red-team the package.** Use `references/review-and-rebuttal.md` to test novelty, soundness, evaluation fairness, reproducibility, limitations, and reviewer-facing failure modes.

If the user requests only one stage, perform that stage without forcing the entire pipeline, but preserve upstream and downstream boundaries.

## Minimum scientific contract

For any substantive idea or experiment plan, provide these elements unless the user asks for a narrower output:

```text
Research question:
Central hypothesis:
Why it is falsifiable:
Competing explanations:
Proposed intervention:
Expected observations if supported:
Expected observations if contradicted:
Evidence required:
Claim boundary:
Highest-risk unknown:
```

A **hypothesis** is a testable explanatory proposition, not a desired metric increase. **Falsifiability** means specifying observations that would count against it. In a CV paper, “multi-scale context improves small-object reasoning” becomes falsifiable only after predicting where gains should occur and defining controls that could refute the explanation.

## Claim-evidence ledger

Maintain this table for multi-claim work:

| ID | Claim | Evidence needed | Current evidence | Alternative explanation | Status | Allowed wording |
|---|---|---|---|---|---|---|
| C1 | ... | ... | ... | ... | unsupported / partial / supported / contradicted | ... |

Do not promote a claim from `partial` to `supported` merely because one benchmark improves. Require evidence appropriate to its scope, such as cross-dataset generalization for a generalization claim or calibrated probabilities for a calibration claim.

## Research language mentoring

When speaking Chinese, introduce recurring English terms compactly in context. Examples:

- `ablation`（消融实验）：移除或替换一个设计因素，用来判断该因素是否真正贡献了观察到的收益。
- `confounding factor`（混杂因素）：与方法变化同时改变、因此可能解释结果的因素，例如更大的训练预算。
- `inductive bias`（归纳偏置）：模型结构或训练目标预先偏好的解空间；需要用任务相关证据说明它为何有帮助。
- `failure mode`（失效模式）：方法在特定条件下系统性失败的方式，不只是零散坏例子。

Use `references/research-reasoning.md` for the full in-context vocabulary protocol.

## Red lines

- Do not use “novel,” “state of the art,” “significant,” “robust,” “general,” “causal,” or “efficient” without defining the comparison and evidence.
- Do not treat test-set iteration, hidden benchmark feedback, duplicate samples, pretrained-data overlap, or train/test identity leakage as acceptable tuning.
- Do not recommend weak straw-man baselines when stronger, standard, or contemporaneous comparisons are available.
- Do not infer causal attribution from an uncontrolled ablation or correlation.
- Do not hide negative results that constrain the central claim; use them to narrow the claim or identify a failure mode.
- Do not write a rebuttal that promises unavailable experiments as completed work or attacks reviewers.

## Provenance

This skill adapts workflow ideas from the Apache-2.0-licensed `nature-skills` project, especially its progressive routing, evidence grounding, claim boundaries, and reviewer-oriented QA. The domain rules and output contracts here are newly specialized for computer science, AI, and computer vision. See `references/source-and-scope.md` when auditing provenance or adaptation boundaries.
