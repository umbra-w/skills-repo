# Sampling and Study Design

Use this module to turn hypotheses into field, sampling, analytical, and
integration plans.

## Contents

- [Start From the Decision](#start-from-the-decision)
- [Nested Sampling Hierarchy](#nested-sampling-hierarchy)
- [Replication Types](#replication-types)
- [Field and Sample Metadata](#field-and-sample-metadata)
- [Paired Context Analyses](#paired-context-analyses)
- [Analytical QA/QC](#analytical-qaqc)
- [Sampling Density](#sampling-density)
- [Expected-Outcome Decision Table](#expected-outcome-decision-table)
- [Integration and Statistics](#integration-and-statistics)
- [Stopping Rules](#stopping-rules)
- [Deliverables](#deliverables)

## Start From the Decision

For every proposed measurement, complete:

```text
Hypothesis edge tested:
Expected result under H1:
Expected result under H2:
Critical prerequisite:
Decision if positive:
Decision if negative:
Failure mode that makes the result non-diagnostic:
```

Remove analyses that do not change a stated decision.

## Nested Sampling Hierarchy

Design across the levels needed for the claim:

1. **Region/basin:** select contrasting paleogeographic positions and independent
   age control where regional conclusions are intended.
2. **Section/facies:** sample proximal-distal, shallow-deep, restricted-open, or
   ice-proximal/distal settings that distinguish spatial heterogeneity.
3. **Stratigraphic interval:** include pre-event background, transition, peak,
   recovery, and post-event baseline where preserved.
4. **Bed/sample:** document exact position, lithology, sedimentary structures,
   contacts, veins, weathering, and alteration.
5. **Aliquot/analysis:** randomize or block runs, include standards, blanks,
   duplicates, and reference materials.

Do not infer basin extent from one section or event duration from one anomalous bed.

## Replication Types

| Replication | Question answered |
|---|---|
| Field replicate | Is the pattern reproducible across sections or outcrops? |
| Facies replicate | Is the signal event-related rather than facies-controlled? |
| Stratigraphic replicate | Does the pattern recur or persist through time? |
| Biological/geological sample replicate | What is natural variability? |
| Preparation replicate | Is sample processing reproducible? |
| Analytical duplicate | Is instrument measurement repeatable? |
| Independent laboratory | Is a high-stakes result robust to laboratory-specific bias? |

Never substitute analytical duplicates for geological replication.

## Field and Sample Metadata

Require coordinates or locality ID, section datum, stratigraphic height,
lithology, facies, structure, orientation when relevant, weathering grade,
vein/fracture relationships, sample photograph, mass, split history, and chain
of custody. Preserve unprocessed archive material.

## Paired Context Analyses

Pair target proxies with the checks needed to interpret them:

- mineralogy and petrography for host phases and alteration;
- major elements and detrital indicators for dilution/mixing;
- TOC and sulfur phases for organic/sulfide carriers;
- Fe speciation or mineral-specific Fe data for iron/redox claims;
- grain size and facies for hydrodynamic sorting;
- geochronology or marker beds for event alignment;
- multiple Hg isotope values plus concentration and host-phase constraints for
  mercury interpretation.

Do not prescribe an analysis simply because it is conventional. Link it to a
gate or competing prediction.

## Analytical QA/QC

Record sample preparation, digestion/extraction, instrument, standardization,
certified reference materials, procedural blanks, detection/quantification
limits, recovery, drift, duplicate precision, interferences, data rejection
rules, and uncertainty propagation. Predefine how values below detection and
outliers will be treated.

## Sampling Density

Set spacing from expected bed thickness, process duration, sedimentation-rate
uncertainty, and the shortest feature the study must resolve. Use closer spacing
across boundaries and anomalies only if background intervals remain adequate.
Avoid comparing high-resolution target intervals with sparse controls.

## Expected-Outcome Decision Table

| Result pattern | Supports | Weakens | Still ambiguous because | Next decision |
|---|---|---|---|---|

Populate before data collection. Include null and contradictory outcomes so the
design can falsify the favored model.

## Integration and Statistics

Define the sampling unit, independent replicate, nested structure, covariates,
multiple-testing plan, missing-data treatment, and visualization before
analysis. Route formal statistical method selection and reporting to
`cryogenian-data-analysis`.

## Stopping Rules

Stop adding data types when:

- each critical mechanism edge has a diagnostic test;
- each proxy has preservation and carrier-phase checks;
- intended spatial and temporal claims have matching replication;
- further analyses would be redundant rather than independent;
- remaining uncertainty is explicitly outside feasible scope.

## Deliverables

Return a section/facies/sample matrix, analytical matrix, QA/QC plan,
expected-outcome table, integration plan, archive plan, and named specialist
handoffs.
