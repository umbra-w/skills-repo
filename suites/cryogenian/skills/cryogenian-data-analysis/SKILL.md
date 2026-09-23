---
name: cryogenian-data-analysis
description: Use when cleaning, integrating, plotting, statistically analyzing, modeling, or auditing Cryogenian and Neoproterozoic sedimentological, stratigraphic, chronological, elemental, iron-speciation, rare-earth-element, mercury-isotope, or multi-proxy data. Also use for one calculation, model choice, uncertainty question, or diagnostic.
---

# Cryogenian Data Analysis

Make the analysis reproducible and keep inference within geological support.

## Scope

Read `../cryogenian-shared/core/task-scope.md` and
`../cryogenian-shared/core/provenance-and-scale.md`.

- `POINT`: compute or answer directly; show inputs, equation/model, units,
  assumptions, uncertainty, and the bounded interpretation.
- `COMPONENT`: analyze one dataset or proxy family end to end.
- `SYSTEM`: build a versioned multi-proxy integration workflow and sensitivity
  matrix.

## Workflow

Preserve raw data. Audit identifiers, units, detection limits, missingness,
duplicates, censoring, standards, blanks, drift, batch effects, stratigraphic
order, age-model provenance, and transformations. Write a data dictionary and
an explicit exclusion log.

Choose methods from the estimand and sampling design. Respect nested samples,
serial dependence, compositional constraints, multiple testing, analytical and
age uncertainty, and shared denominators. Treat values below detection limits
as censored rather than silently replacing them. Report effect sizes and
intervals, not only p-values.

For multi-proxy integration, distinguish independent evidence from proxies
sharing samples, carriers, normalizers, age models, or processes. Run raw and
normalized views, alternative age models, plausible diagenetic filters, and
leave-one-proxy/section-out sensitivity tests. Separate concentration from
flux and temporal association from causality.

## Product

Deliver reproducible code/notebook when files are supplied, derived tables and
figures, QA/QC report, model specification, diagnostics, uncertainty and
sensitivity results, machine-readable outputs, and a claim table stating what
is supported, unsupported, and unresolved. Never invent absent values.

