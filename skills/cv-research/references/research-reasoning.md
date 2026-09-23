# Research Reasoning

## Contents

1. Claim chain
2. Gap and novelty
3. Falsification and alternatives
4. Vocabulary protocol
5. Decision gates

## 1. Claim chain

Build the argument in this order:

1. Define the task and operating conditions.
2. Identify a consequential limitation in current knowledge or capability.
3. State a mechanism-level hypothesis explaining the limitation or a proposed remedy.
4. Define the intervention and what it changes while holding relevant factors fixed.
5. Predict observations that should occur if the hypothesis is right.
6. Predict observations that would weaken or refute it.
7. Specify evidence and uncertainty needed to support the bounded claim.

Reject circular hypotheses such as “the module improves performance because it is effective.” Prefer: “explicit temporal correspondence reduces identity switches under occlusion; therefore gains should concentrate in high-occlusion sequences and disappear when correspondence cues are shuffled.”

## 2. Gap and novelty

Distinguish four gaps:

- **Knowledge gap:** an unresolved scientific or empirical question.
- **Capability gap:** existing systems fail under a defined condition.
- **Evaluation gap:** common protocols do not measure an important behavior.
- **Efficiency gap:** a target capability requires impractical compute, memory, latency, annotation, or energy.

Distinguish novelty sources:

- new problem formulation or setting;
- new explanatory insight;
- new method derived from that insight;
- new evaluation protocol or resource;
- new empirical finding that changes accepted understanding.

Do not equate recombination with novelty. Ask: what could a knowledgeable reviewer learn here that was not already implied by prior work?

## 3. Falsification and alternatives

For every central claim, write:

```text
If the explanation is correct, we expect ...
If alternative A is correct, we instead expect ...
The controlled comparison that distinguishes them is ...
A result that would force us to weaken the claim is ...
```

Common alternative explanations in CV/ML:

- parameter count or architecture capacity;
- training compute, epochs, batch size, resolution, or augmentation;
- pretrained data, label supervision, or external models;
- hyperparameter-search budget and selective reporting;
- favorable dataset composition or metric choice;
- random-seed variance;
- data leakage or near duplicates;
- post-processing unavailable to baselines;
- annotation artifacts or shortcut learning;
- improved calibration rather than improved representation, or vice versa.

`causal attribution`（因果归因）requires isolating the intervention sufficiently to argue that it caused the effect. A single “with/without module” row rarely isolates mechanism because optimization and capacity may also change.

## 4. Vocabulary protocol

When first used in Chinese discussion, retain the English term and add a one-clause contextual explanation:

- `baseline`（基线）：the credible comparison the contribution must beat under matched conditions.
- `oracle`（理想信息上界）：a system using unavailable ground-truth information to estimate remaining headroom, not a deployable comparator.
- `upper bound`（上界）：a justified ceiling under stated assumptions; do not call any strong model an upper bound.
- `robustness`（鲁棒性）：stability under specified perturbations or shifts, not generic good performance.
- `generalization`（泛化）：performance outside the training distribution or sampled data, with the target shift explicitly named.
- `calibration`（校准）：agreement between predicted confidence and empirical correctness.
- `effect size`（效应量）：the magnitude of improvement, distinct from whether it is statistically detectable.
- `confidence interval`（置信区间）：an uncertainty interval produced by a stated procedure; avoid overclaiming its interpretation.
- `Pareto frontier`（帕累托前沿）：methods not dominated simultaneously on relevant objectives such as accuracy and latency.
- `non-inferiority`（非劣效）：evidence that a cheaper method is not worse than a reference by more than a predeclared margin.

Use the term in a paper-like sentence when useful: “Our hypothesis predicts gains specifically under severe occlusion, rather than uniform improvement across all subsets.”

## 5. Decision gates

Before advancing an idea, require:

- a concrete and important problem;
- a literature-aware gap rather than absence of a searched keyword;
- a falsifiable hypothesis or clearly bounded engineering objective;
- at least one discriminating experiment;
- feasible data, compute, and evaluation access;
- a contribution that remains meaningful if the headline metric gain is smaller than hoped.

If one gate fails, revise the idea before expanding the method.
