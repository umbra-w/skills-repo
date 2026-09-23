# Evidence and Provenance

Use this module when evidence origin, independence, confidence, or claim
traceability matters.

## Contents

- [Evidence Ledger](#evidence-ledger)
- [Claim Ledger](#claim-ledger)
- [Independence Test](#independence-test)
- [Evidence Strength Rules](#evidence-strength-rules)
- [Confidence Statement](#confidence-statement)
- [Negative Evidence](#negative-evidence)
- [Common Failures](#common-failures)
- [Completion Check](#completion-check)

## Evidence Ledger

Create one row per observation or contextual fact:

| Field | Content |
|---|---|
| Evidence ID | Stable ID such as `E-Sed-01`, `E-Hg-03`, or `E-Age-02` |
| Provenance | `OBS`, `CTX`, or `UNK`; add `user-report` when not directly inspected |
| Source pointer | Sample, bed, section, figure, table, page, dataset row, DOI, or exact quotation |
| Measurement | What was directly observed or measured, without interpretation |
| Method and uncertainty | Analytical/field method, precision, detection limit, or missing QA |
| Scale tuple | Time resolution, spatial extent, depositional domain, preservation state |
| Carrier/process | Mineral, organic phase, detrital component, water-mass process, or unknown |
| Claim role | Supports, contradicts, constrains, or does not test a claim |
| Gate status | Pass, fail, partial, or `UNK` |

Never assign a literature-derived statement to `OBS`. If only a user summary is
available, preserve it as `OBS-user-report` and request the underlying figure,
table, or methods before treating it as verified.

## Claim Ledger

| Field | Content |
|---|---|
| Claim ID | Stable ID such as `C-OW-01` or `C-Hg-02` |
| Exact claim | One proposition, not a paragraph |
| Claim type | Descriptive, correlation, environmental state, causal, scale transfer, or biological |
| Required evidence | Minimum direct observations and validation gates |
| Linked evidence | Evidence IDs, including conflicts |
| Strength | Direct, convergent, supporting, ambiguous, or conflicting |
| Scope | Smallest defensible time-space-depositional domain |
| Verdict | Supported, qualified, unresolved, or unsupported |

## Independence Test

Two proxies are not independent merely because they have different names.
Check whether they share:

- the same sample or stratigraphic interpolation;
- the same mineral, organic, or detrital carrier;
- the same redox, adsorption, productivity, or dilution process;
- the same calibration dataset or environmental model;
- the same age model or correlation assumption;
- the same preservation pathway.

Record shared dependencies. Count convergence only when evidence reaches the
claim through materially distinct observation and inference chains.

## Evidence Strength Rules

| Strength | Minimum condition |
|---|---|
| Direct | Validated observation is diagnostic for the bounded target and scale |
| Convergent | At least two independent, preserved, aligned chains support the same inference |
| Supporting | Evidence is expected under the inference but also under viable alternatives |
| Ambiguous | A prerequisite, source, carrier, timing, or alternative remains unresolved |
| Conflicting | Validated and aligned chains favor incompatible interpretations |

Use `conflicting`, not an average confidence score, when strong records disagree.
First test whether they record different depths, seasons, facies, or time windows.

## Confidence Statement

Write confidence as a reasoned sentence:

```text
Confidence is [level] for [bounded claim] because [independent evidence and
passed gates]; it is limited by [specific UNK/conflict] and does not extend to
[broader claim].
```

Do not derive confidence from proxy count or citation count alone.

## Negative Evidence

Classify an apparent absence before using it:

- `not measured`: no relevant observation exists;
- `below detection`: method-specific non-detection with a known limit;
- `not preserved`: the archive could have lost the signal;
- `not expected`: hypothesis predicts no signal in this setting;
- `true counter-observation`: preservation and sensitivity are adequate, but the
  predicted signal is absent.

Only the final category is a strong falsifier.

## Common Failures

- Citation present but no claim-level source pointer.
- A review article used as if it were the primary source for site data.
- Multiple ratios normalized to the same denominator counted as independent.
- A model output presented as an observation.
- Uncertainty listed at the end but not propagated into the verdict.
- “Consistent with” repeated until it reads as confirmation.

## Completion Check

Every major claim must be traceable to evidence, bounded in scale, assigned a
strength, checked against conflicting evidence, and linked to a resolution path
for each blocking `UNK`.
