# Atmosphere-Land-Ocean Cycling

Use this module to build causal and mass-balance models linking atmosphere,
continents/ice, surface water, deep water, sediment, and burial.

## Contents

- [Reservoir-Flux Ledger](#reservoir-flux-ledger)
- [Deglacial Forcing Candidates](#deglacial-forcing-candidates)
- [Mercury in the Cycle](#mercury-in-the-cycle)
- [Iron and Nutrient Coupling](#iron-and-nutrient-coupling)
- [Causal Timing Test](#causal-timing-test)
- [Mass-Balance Questions](#mass-balance-questions)
- [Spatial Architecture](#spatial-architecture)
- [Maximum Defensible Claims](#maximum-defensible-claims)
- [Common Failures](#common-failures)

## Reservoir-Flux Ledger

Define reservoirs before arrows:

| Reservoir | Candidate inventory/state | Relevant observations |
|---|---|---|
| Atmosphere | Gases, aerosols, Hg species, oxidants | Deposition-sensitive tracers, volcanic/ash evidence, model context |
| Ice/snow | Stored solutes, dust, gases, meltwater | Ice-proximal facies, meltwater indicators, modeled/modern analog limits |
| Land/regolith | Minerals, soils where applicable, weathering products | Provenance, weathering indices, detrital tracers |
| Surface water | Light, gas exchange, productivity, photochemistry | Sedimentology, photochemical tracers, surface-sensitive proxies |
| Deep/basinal water | Fe, S, nutrients, redox state | Fe/S/redox proxies, water-mass and basin geometry |
| Sediment/porewater | Adsorption, reduction/oxidation, recycling | Mineral hosts, diagenetic textures, sequential profiles |
| Burial/export | Organic matter, sulfide, oxides, detritus | Accumulation rates, carrier phases, mass balance |

For each flux, state direction, transported species, physical/chemical process,
expected sign, lag, spatial domain, and evidence.

## Deglacial Forcing Candidates

Consider ice-margin retreat, meltwater delivery, changing precipitation/runoff,
newly exposed substrate, erosion and weathering, sea-level change, circulation
and stratification shifts, gas exchange, biological production, and volcanic or
tectonic forcing. Do not assume they all increased monotonically or synchronously.

Pulse-like retreat, seasonal opening, basin restriction, and facies migration
can produce non-monotonic records in one section.

## Mercury in the Cycle

Keep source, processing, transfer, scavenging, and preservation separate:

```text
emission/recycling -> atmospheric transport and chemistry -> deposition
-> land/ice/surface-water storage -> runoff or exchange -> adsorption/reduction
-> particle export -> porewater redistribution -> preserved host phase
```

Hg isotopes may constrain parts of this chain, but inherited signals can survive
transport and mixing. A sedimentary Hg record is a mass balance among external
input, internal recycling, scavenging, dilution, sedimentation, and alteration.

## Iron and Nutrient Coupling

Fe oxides can scavenge Hg, phosphorus, and trace elements; reduction can release
some adsorbed species; sulfide formation can redirect metal hosts; organic
matter can both carry Hg and drive redox consumption. These couplings mean that
Hg, P, Fe, S, and TOC covariance may reflect a common carrier or redox shuttle
rather than simultaneous external flux increases.

## Causal Timing Test

For a proposed chain, fill:

| Edge | Cause interval | Expected lag | Response interval | Age overlap | Alternative common cause |
|---|---|---|---|---|---|

If chronology cannot resolve order, replace “caused” with “coincided with” or
“is compatible with,” then design a higher-resolution test.

## Mass-Balance Questions

1. Did concentration change because inventory/flux changed or because the
   sediment carrier/dilution changed?
2. Is accumulation rate available, or only concentration?
3. Are plausible sources and sinks enumerated?
4. Does the proposed source have enough magnitude under explicit assumptions?
5. Could internal recycling create the same pattern without new external input?
6. Are the proxy and mass-balance reservoirs at the same time-space scale?

Use quantitative mass balance only when endmembers, fluxes, and uncertainties
are adequately constrained. Otherwise expose the unknown terms symbolically.

## Spatial Architecture

Track landward-to-basin and surface-to-bottom gradients. A runoff signal should
have a plausible source-to-sink pathway. An overturn model should predict where
Fe, redox, and depositional changes occur. A local restricted basin can amplify
signals without a global reservoir change.

## Maximum Defensible Claims

- Covariance and compatible timing: coupled change is possible.
- Process-specific gradients plus mass balance: a transfer pathway is favored.
- Multiple dated basins and mechanistic consistency: a regional/global driver
  may be evaluated.
- A single concentration peak cannot establish external flux, global cycling,
  or causal direction.

## Common Failures

- Drawing arrows without transported species or process.
- Treating concentration as flux.
- Ignoring internal recycling and carrier-phase changes.
- Assuming deglaciation is one monotonic event.
- Inferring global cycles from one restricted basin.
- Using model plausibility as observational confirmation.
