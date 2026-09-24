# Interpret Proxies

## Inputs

Accept raw or summarized sedimentological, mineralogical, elemental, or isotope
measurements with method, sample position, lithology, and analytical uncertainty
when available.

## Actions

1. Inventory each measurement as `OBS` and state what was physically or
   chemically measured.
2. Load the relevant proxy module: open-water sedimentology, iron formation,
   mercury isotopes, or multiproxy geochemistry.
3. For each proxy, report direct sensitivity, required preservation and
   analytical gates, viable causes, confounders, supported scale, and maximum
   defensible claim.
4. Check normalization, carrier phase, detrital mixing, alteration, detection
   limits, standards, blanks, and replication where applicable.
5. Compare with independent evidence; do not count two measurements of the same
   carrier or process as independent convergence.
6. Return a bounded `INT` or retain multiple `HYP` items with a discriminating
   test from [competing hypotheses](../../../references/competing-hypotheses.md).

## Required Checks

- Concentration is not treated as source identity.
- A proxy developed for one archive or setting is not transferred without an
  applicability argument.
- Sign, magnitude, and covariance are interpreted only after QA and context.

## Output

Use the **Proxy Interpretation** contract for each proxy, followed by an
integration table and explicit handoff.

## Stop Condition

If preservation, host phase, chronology, or context is unresolved, stop the
affected environmental inference and return the measurements as ambiguous.
