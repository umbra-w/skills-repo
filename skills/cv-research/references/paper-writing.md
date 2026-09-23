# CV and ML Paper Writing

## Contents

1. Argument architecture
2. Section contracts
3. Claim language
4. Tables and figures
5. Chinese-to-English drafting

## 1. Argument architecture

Write from the claim-evidence ledger. A strong paper has one coherent spine:

```text
important setting -> precise failure of prior approaches -> explanatory insight -> method derived from insight -> evidence that separates the insight from alternatives -> bounded implications
```

Do not construct the story backward by attaching an overly broad motivation to whichever metric improved.

## 2. Section contracts

### Title

Name the task and distinctive idea. Avoid unsupported superlatives and unexplained acronyms.

### Abstract

Use: context, specific limitation, insight/method, evidence with concrete scope, bounded conclusion. Include numbers only when verified and interpretable.

### Introduction

Establish importance, expose the precise gap, articulate the insight, preview the method, summarize evidence, and list contributions. Contributions should be claims, not a table of contents.

### Related Work

Organize by technical tension or assumptions, not a paper-by-paper chronology. State where the method differs without diminishing prior work or inventing distinctions.

### Method

Define problem and notation, overview the system, then explain each component as `motivation -> operation -> expected consequence`. State training objective, inference path, complexity, and implementation choices needed for reproducibility.

### Experiments

For each block, state the question, protocol, observation, and interpretation. Separate observation from explanation. Include datasets, splits, metrics, baselines, implementation, main results, ablations, robustness/generalization, efficiency, qualitative analysis, and failure modes as relevant.

### Limitations and conclusion

Describe observed or logically implied boundaries, affected users/settings, and unresolved risks. Conclude at the level established by evidence; do not reopen untested claims.

## 3. Claim language

Calibrate verbs:

- unsupported: “we hypothesize,” “we conjecture”;
- partial evidence: “suggests,” “is consistent with”;
- direct controlled evidence: “supports,” “demonstrates under [conditions]”;
- contradiction: “does not support,” “narrows the claim to.”

Avoid “proves” for ordinary empirical ML evidence. Define “efficient” by latency, throughput, memory, energy, parameters, or training cost under a stated protocol.

## 4. Tables and figures

- Give every table one question and every figure one message.
- Label best/second-best only when comparisons are genuinely comparable.
- Include direction arrows and metric units.
- Separate reported and reproduced values visually and in captions.
- Show uncertainty where it affects the conclusion.
- Use qualitative results to diagnose mechanisms and failure modes, not decorate the paper.
- Ensure captions are self-contained and do not claim more than the plotted evidence.

## 5. Chinese-to-English drafting

Translate the scientific function, not the Chinese word order. Preserve technical meaning and uncertainty. Prefer explicit subjects and concrete verbs. Avoid inflated phrases such as “greatly promotes,” “fully solves,” or “obviously superior” unless quantified evidence warrants them.

When mentoring, explain a recurring term briefly in Chinese at first use, then use the standard English term naturally throughout the draft.
