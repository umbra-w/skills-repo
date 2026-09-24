# Competing Hypotheses

Use this module whenever the task assigns environmental state, source, process,
or causality.

## Contents

- [Model Set](#model-set)
- [Hypothesis Matrix](#hypothesis-matrix)
- [Causal Graph](#causal-graph)
- [Discriminating-Test Rules](#discriminating-test-rules)
- [Negative and Conflicting Results](#negative-and-conflicting-results)
- [Mechanism-Specific Examples](#mechanism-specific-examples)
- [Verdict Vocabulary](#verdict-vocabulary)
- [Completion Check](#completion-check)

## Model Set

Start with a model set broad enough to expose non-uniqueness but small enough to
test. Common classes include:

- target environmental or causal mechanism;
- local hydrographic/facies control;
- source mixing or changing sediment supply;
- carrier-phase or scavenging control;
- diagenetic, metamorphic, or weathering overprint;
- age/correlation mismatch;
- sampling or analytical artifact;
- null model with no required causal link.

Do not include a weak alternative merely to make the preferred model look good.

## Hypothesis Matrix

| Model ID | Mechanism | Necessary conditions | Unique prediction | Permissive prediction | Falsifier | Rescue assumptions |
|---|---|---|---|---|---|---|

A **unique prediction** differs among live models. A **permissive prediction** is
compatible with a model but does not distinguish it. Prioritize tests of unique
predictions.

## Causal Graph

Represent each mechanism as:

```text
forcing -> transfer/transport -> reservoir response -> depositional signal
        -> burial/preservation -> measured proxy
```

For every arrow, record process, direction, expected lag, spatial domain,
evidence, and assumption. If an arrow cannot be described physically or
chemically, it is narrative linkage rather than a mechanism.

## Discriminating-Test Rules

A strong test:

1. yields different expected outcomes under at least two live models;
2. samples the time and depositional domain where those outcomes differ;
3. includes preservation, carrier, and analytical controls;
4. has a result that could weaken the preferred model;
5. does not reuse the observation that generated the hypothesis as its only test.

Rank tests by expected information gain, feasibility, and dependence on other
unknowns. A cheap diagnostic control may be more valuable than an expensive new
proxy.

## Negative and Conflicting Results

- A missing predicted signal falsifies only if the archive would preserve it and
  the method could detect it.
- Conflicting proxies may record different depths, seasons, facies, carriers, or
  time windows; test alignment before discarding one.
- If a model needs a new untested assumption after each failed prediction,
  record the rescue cost and reduce confidence.
- If all models survive because every observation is permissive, report
  non-identifiability.

## Mechanism-Specific Examples

### Hg enrichment

Compare increased external Hg flux, organic/sulfide/Fe-oxide scavenging,
detrital input, reduced sedimentation/dilution, and redistribution during
diagenesis. Concentration alone is permissive for all five.

### Iron formation deposition

Compare hydrothermal or basinal Fe supply, glacial/continental delivery,
upwelling or overturn, and local remobilization; then separately compare
oxidation by molecular oxygen, biological photoferrotrophy, photochemical
processes, or other oxidants. Iron supply and oxidation mechanism are distinct
questions.

### Open water

Compare persistent basin-scale open water, seasonal polynya or leads, brief
ice-margin retreat, sub-ice-shelf currents, and redeposition. A traction
structure may constrain local hydrodynamics without selecting a climate state.

### Habitability

Compare true habitat improvement, spatial relocation of a habitable zone,
increased preservation, transported biosignatures, contamination, and no
biological response. Environmental improvement is not itself an occupation test.

## Verdict Vocabulary

- `favored`: uniquely predicted observations survive relevant gates and
  alternatives fail discriminating tests;
- `compatible`: observations fit but are non-unique;
- `unresolved`: decisive observations or prerequisites are missing;
- `disfavored`: a validated discriminating prediction fails;
- `not testable with current archive`: preservation, age, or sampling prevents
  adjudication.

Avoid “proven” for historical mechanisms. State the bounded model comparison and
remaining alternatives.

## Completion Check

Each favored mechanism must have at least one discriminating observation, an
explicit falsifier, a complete process chain, and no hidden scale or chronology
transfer. Otherwise retain multiple models.
