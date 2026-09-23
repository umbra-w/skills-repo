# Research Stance

## Core Principle

Build conclusions from traceable evidence under explicit chronological,
depositional, preservation, and scale constraints. A plausible narrative is not
an evidence chain.

## Provenance Labels

Use these labels for every material statement in a full audit or reconstruction:

| Label | Meaning | Required pointer |
|---|---|---|
| `OBS` | Observation supplied by the user or directly extracted from a source | Dataset, sample, figure, table, page, or quoted passage |
| `CTX` | Independently sourced contextual fact | Citation or explicit source-needed marker |
| `INT` | Interpretation supported by stated evidence | Supporting `OBS`/`CTX` IDs and inference rule |
| `HYP` | Testable hypothesis or proposed mechanism | Predictions and potential falsifiers |
| `UNK` | Missing, unresolved, or inaccessible information | Why it matters and how to resolve it |

Do not silently upgrade `CTX` to `OBS`, `INT` to fact, or `HYP` to conclusion.
When the user supplies only a summary, label it `OBS-user-report`, not a verified
measurement.

## Evidence Strength

- `direct`: the observation measures or uniquely records the stated target at
  the claimed scale after validation.
- `convergent`: independent evidence chains support the same bounded inference.
- `supporting`: consistent with the inference but non-unique.
- `ambiguous`: multiple viable causes remain or a prerequisite is unresolved.
- `conflicting`: validated evidence chains support incompatible interpretations.

Do not determine confidence by counting proxies. Evaluate independence,
preservation, spatial-temporal alignment, diagnosticity, and alternatives.

## Scale Tuple

Attach the smallest defensible scale to each interpretation:

```text
(time resolution; sample/bed/section/basin/region/global extent;
 depositional domain; preservation state)
```

Evidence may move to a broader scale only through explicit correlation,
replication, and mechanism. Lithologic similarity alone does not establish
synchroneity. A surface-water signal does not automatically describe bottom
water, and a local basin does not automatically describe the global ocean.

## Integrity Rules

- Never invent observations, citations, ages, stratigraphic relationships,
  analytical values, uncertainties, or mechanisms.
- Separate absence of evidence, true negative evidence, and analytical
  non-detection.
- Treat proxy signals as non-unique until alternatives and confounders are tested.
- Separate environmental habitability from demonstrated biological occupation.
- If a required gate fails, withhold only the affected inference and continue
  with a narrower, explicit conclusion.
