# Review and Rebuttal

## Contents

1. Reviewer assessment
2. Concern ledger
3. Rebuttal workflow
4. Common rejection risks

## 1. Reviewer assessment

Assess only the supplied paper and verified context. Use these axes:

- problem importance and venue relevance;
- novelty relative to the closest prior work;
- technical soundness and assumption validity;
- empirical adequacy and baseline fairness;
- clarity and reproducibility;
- broader impacts, limitations, and ethical concerns where applicable.

Do not invent reviewer identities or pretend to know an acceptance decision. When simulating multiple reviewers, vary emphasis, not facts.

Default report:

```text
Scope and assessment boundary
Paper claim summary
Strengths
Major concerns with claim/evidence pointers
Minor concerns
Questions for the authors
Experiments or revisions that would resolve each concern
Confidence limits
Cross-review synthesis (only for multi-reviewer requests)
```

## 2. Concern ledger

For each concern record:

| ID | Severity | Claim pointer | Evidence pointer | Why it matters | Resolution test |
|---|---|---|---|---|---|

Use severity based on whether the concern threatens the central claim, not on rhetorical intensity. Mark a missing pointer rather than inventing a section or line number.

## 3. Rebuttal workflow

1. Parse every reviewer comment into atomic issues.
2. Classify each as misunderstanding, missing explanation, missing analysis, missing experiment, disagreement about scope, factual error, or action outside feasible scope.
3. Check whether reviewers share an underlying concern.
4. Prioritize issues threatening the central claim.
5. Map each issue to an action: clarify, cite verified evidence, add analysis, run feasible experiment, narrow claim, acknowledge limitation, or respectfully decline with reason.
6. Draft `acknowledge -> direct answer -> evidence/action -> manuscript change`.
7. Track promises and ensure the paper revision matches the response.

Never label a concern a misunderstanding until the manuscript is clear enough that a reasonable reader should not reach it. Do not promise results not yet obtained.

## 4. Common rejection risks

- novelty is architectural recombination without a new insight;
- closest methods or strong baselines are missing;
- improvements may come from compute, data, resolution, or tuning;
- ablations establish component utility but not claimed mechanism;
- single-dataset evidence supports an overly general claim;
- metric gains are tiny relative to variance or practical cost;
- efficiency claims omit matched hardware and end-to-end measurements;
- test data or hidden-server feedback influenced development;
- method details are insufficient to reproduce;
- limitations or societal risks are treated as boilerplate;
- prose claims causal attribution, robustness, or generalization beyond the experiments.
