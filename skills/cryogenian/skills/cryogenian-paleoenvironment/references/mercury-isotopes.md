# Mercury Isotopes

Use this module for Hg concentration, mercury enrichment, mass-dependent
fractionation (MDF), mass-independent fractionation (MIF), and sedimentary Hg
source/process interpretation.

## Contents

- [What Is Measured](#what-is-measured)
- [Concentration Gate](#concentration-gate)
- [Host-Phase Gate](#host-phase-gate)
- [Process Interpretation](#process-interpretation)
- [Source and Reservoir Models](#source-and-reservoir-models)
- [Preservation and Comparability](#preservation-and-comparability)
- [Integration With Open Water and Deglaciation](#integration-with-open-water-and-deglaciation)
- [Maximum Defensible Claim](#maximum-defensible-claim)
- [Common Failures](#common-failures)

## What Is Measured

Report the laboratory convention used by the source. Common notation is:

```text
delta202Hg = [(202Hg/198Hg)sample / (202Hg/198Hg)NIST-3133 - 1] * 1000
Delta199Hg = delta199Hg - beta199 * delta202Hg
Delta201Hg = delta201Hg - beta201 * delta202Hg
```

Values are normally in per mil. The exact beta factors and reporting details
must follow the cited method; do not recompute across datasets without checking
their convention, standards, corrections, and uncertainty.

- `delta202Hg` records MDF and may respond to source composition, adsorption,
  volatilization, redox reactions, biological processing, and phase transfer.
- `Delta199Hg` and `Delta201Hg` record odd-isotope MIF, often associated with
  photochemical reactions and subsequent transport or preservation.
- Even-isotope MIF, when reported, has different possible controls; do not infer
  it from odd-isotope behavior.

No single sign or magnitude is a universal source fingerprint.

## Concentration Gate

Before interpreting elevated Hg, evaluate:

1. units, digestion, recovery, blanks, detection limit, and reference materials;
2. TOC, total sulfur/sulfide, Fe/Mn oxides, clay/mineralogy, grain size, Al/Ti or
   another justified detrital indicator;
3. sedimentation rate, condensation, mass accumulation, and dilution;
4. weathering, veins, metamorphism, fluid flow, and diagenetic remobilization;
5. stratigraphic reproducibility and lateral/facies controls.

Ratios such as Hg/TOC, Hg/Al, or Hg/Fe are diagnostic only when the denominator
represents the relevant carrier or dilution process and is not near zero or
independently changing. Plot raw values and denominator behavior as well.

## Host-Phase Gate

Identify where Hg resides: organic matter, sulfides, Fe/Mn oxides, clay,
detrital minerals, elemental/nanoparticulate phases, secondary veins, or an
unresolved mixture. Use petrography, mineralogy, extraction, microanalysis, or
covariance as appropriate, while recognizing that operational extractions are
not unique mineral identifications.

If the host phase is unresolved or demonstrably secondary, withhold a primary
depositional-source interpretation.

## Process Interpretation

| Observation | Can support | Cannot establish alone |
|---|---|---|
| Hg concentration peak | Changed input, scavenging, preservation, or dilution | Volcanism or atmospheric flux |
| Shift in delta202Hg | Changed source/process/phase balance | A unique volcanic, terrestrial, or marine endmember |
| Reproducible non-zero Delta199Hg | Involvement of an MIF-bearing Hg pool and compatible photochemical history | Persistent open water, atmospheric oxygen level, or unique source |
| Coupled Delta199Hg-Delta201Hg behavior | Constraints on reaction/transport family under an explicit framework | A universal mechanism without modern/experimental comparison |
| Hg covariance with TOC, sulfide, or Fe | Carrier/scavenging relationship | External Hg flux unless mass balance separates carrier effects |

Photochemical interpretation requires attention to reaction pathway, Hg species,
light environment, dissolved organic matter, transport, and mixing. Sediments
can inherit an atmospheric/surface-water signature after substantial recycling.

## Source and Reservoir Models

Consider atmospheric deposition, volcanic/geologic emission, continental
weathering and runoff, biomass/soil recycling where applicable, seawater or
basinal recycling, hydrothermal input, detrital minerals, and diagenetic fluids.
Build an isotope and concentration mass balance when endmembers and fractions
are sufficiently constrained; otherwise retain qualitative mixtures.

For ancient low-organic or iron-rich sediments, test whether Fe oxides, sulfides,
or detrital phases dominate Hg removal before applying organic-rich shale
analogies.

## Preservation and Comparability

- Screen thermal maturity, metamorphic grade, fluid alteration, and weathering.
- Report total procedural uncertainty and long-term standard reproducibility.
- Check whether laboratories used compatible normalization and MIF definitions.
- Avoid over-interpreting values near analytical uncertainty.
- Replicate critical horizons and compare adjacent facies/background intervals.
- Align Hg data with measured stratigraphy rather than formation-level labels.

## Integration With Open Water and Deglaciation

A robust inference combines:

1. sedimentological evidence for the water/ice state;
2. Hg host-phase and preservation evidence;
3. concentration/mass accumulation and MDF/MIF behavior;
4. independent weathering, runoff, volcanism, redox, or productivity evidence;
5. chronology resolving the proposed event order.

Non-zero odd-MIF plus an open-water facies may strengthen a surface-exchange or
photochemical interpretation. It does not by itself specify duration, spatial
extent, atmospheric oxygen, or deglacial forcing.

## Maximum Defensible Claim

State the narrowest process common to all passed gates, for example:

```text
The preserved Hg pool is compatible with [source/process family] at [bounded
facies and interval], after accounting for [carrier/dilution controls]. It does
not uniquely establish [alternative source, global flux, or climate mechanism].
```

## Common Failures

- Calling every Hg spike a volcanic event.
- Assigning a delta202Hg sign to one source across all settings.
- Treating Delta199Hg as a direct open-water meter.
- Ignoring carrier phases in iron-rich or low-TOC sediment.
- Correlating Hg anomalies globally without independent age control.
- Mixing datasets with different standards or MIF equations without harmonization.
