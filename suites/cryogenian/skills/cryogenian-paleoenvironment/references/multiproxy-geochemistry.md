# Multiproxy Geochemistry

Use this module to integrate redox, productivity, weathering, provenance, and
isotope records without treating proxy count as confidence.

## Contents

- [Proxy Contract](#proxy-contract)
- [Common Proxy Families](#common-proxy-families)
- [Detrital and Dilution Controls](#detrital-and-dilution-controls)
- [Redox Is Spatially Structured](#redox-is-spatially-structured)
- [Independence Matrix](#independence-matrix)
- [Covariance and Mechanism](#covariance-and-mechanism)
- [Multi-Proxy Verdict](#multi-proxy-verdict)
- [Common Failures](#common-failures)
- [Completion Check](#completion-check)

## Proxy Contract

For every proxy, report:

```text
Measurement and host phase:
Direct sensitivity:
Environmental prerequisites:
Preservation/analytical gates:
Major confounders:
Time-space scale:
Independent evidence needed:
Maximum defensible claim:
```

## Common Proxy Families

| Family | Direct target or sensitivity | Required cautions |
|---|---|---|
| Fe speciation | Operationally defined Fe pools and, under calibrated conditions, local depositional redox | Lithology, metamorphism, extraction selectivity, detrital Fe, carbonate/oxide/sulfide transformation |
| Redox-sensitive trace metals | Enrichment/removal under particular redox, sulfide, adsorption, and basin conditions | Detrital correction, hydrography, sedimentation rate, carrier phases, basin restriction |
| REE+Y patterns | Source mixing, water-rock interaction, hydrothermal/seawater influence | Detrital contamination, phosphates/oxides, normalization, diagenesis, analytical artifacts |
| Ce behavior | Ce redox cycling under suitable water-column and archive conditions | Detrital input, La interference, normalization, diagenesis, local versus global scope |
| Fe isotopes | Fe source and transformations involving redox, precipitation, transport | Multiple fractionating steps, incomplete reaction, mineral host, alteration |
| S isotopes/speciation | Sulfur sources and microbial/abiotic transformations | Reservoir size, openness, disproportionation, reoxidation, mineral-specific context |
| C isotopes and TOC | Carbon pools, burial, productivity/remineralization under a model | Diagenesis, methane cycling, carbonate mixing, facies, global-correlation circularity |
| N isotopes | Nitrogen-cycle transformations and source balance | Diagenesis, N concentration/host, assimilation, fixation, water-column structure |
| P abundance/speciation | Sedimentary P inventory and phases; potential nutrient retention/recycling | Detrital P, Fe-bound P, diagenetic redistribution, burial efficiency |
| Weathering proxies | Source lithology and weathering/erosion signals under proxy-specific assumptions | Provenance, grain size, recycling, hydrothermal input, diagenesis, seawater residence time |

Do not use this table as a substitute for proxy-specific primary methods.

## Detrital and Dilution Controls

Report raw concentration, justified normalization, denominator behavior, and
mass accumulation where possible. Al or Ti normalization can help but may fail
when source mineralogy changes. TOC normalization can fail in organic-poor rocks
or when preservation changes. Fe normalization can obscure the process in an
iron formation where Fe is the target flux.

Use mixing plots, mineralogy, grain size, provenance indicators, and enclosing
lithology controls. A normalized anomaly remains ambiguous if both numerator
and denominator changed independently.

## Redox Is Spatially Structured

Separate surface water, deeper water column, sediment-water interface, porewater,
and diagenetic zone. Ferruginous, euxinic, oxic, and intermittently oxygenated
conditions can coexist in different domains. A proxy may record local bottom
water or porewater rather than the global ocean.

Resolve apparently conflicting proxies by testing depth sensitivity, season,
facies, residence time, carrier, and time averaging before choosing one.

## Independence Matrix

Create a proxy-by-dependency table with columns for sample set, host phase,
normalizer, governing process, age model, and calibration. Two proxies with the
same dependencies provide replication, not independent convergence.

## Covariance and Mechanism

Covariance may arise from common forcing, common carrier, dilution, closure,
stratigraphic smoothing, or chance. Before inferring coupling:

1. align samples and uncertainties;
2. inspect raw and normalized variables;
3. test facies and carrier covariates;
4. check autocorrelation and uneven sampling;
5. specify the physical transfer process and expected lag;
6. retain alternatives.

Route formal modeling and statistical tests to `cryogenian-data-analysis`.

## Multi-Proxy Verdict

Use this structure:

| Claim | Direct evidence | Independent supporting evidence | Shared dependencies | Conflicts | Scale | Strength |
|---|---|---|---|---|---|---|

Conclude `convergent` only when at least two materially independent chains pass
their preservation and applicability gates at compatible scales.

## Common Failures

- Inferring oxygenation from one bulk ratio without local calibration.
- Treating a basin-restriction signal as global redox.
- Using chemostratigraphy both to align sections and prove global forcing.
- Ignoring mineral hosts and metamorphic redistribution.
- Counting multiple correlated measurements as separate confirmations.
- Inferring productivity directly from nutrient inventory or preservation-sensitive TOC.

## Completion Check

Every integrated conclusion must name the directly measured quantities, passed
gates, shared dependencies, conflicting observations, scale, and maximum claim.
