# Reconstruct Environment

## Inputs

Accept validated observations spanning one or more sections, facies, time
intervals, or proxy systems and a target environmental state.

## Actions

1. Partition the record into defensible time slices and depositional domains.
2. Build a paleogeographic/facies framework before placing geochemical results.
3. Load relevant modules for
   [open water](../../../references/glacial-sedimentology-and-open-water.md),
   [iron formations](../../../references/cryogenian-iron-formations.md), and
   [multiproxy geochemistry](../../../references/multiproxy-geochemistry.md).
4. Assign surface water, water column, bottom water, porewater, sediment source,
   and preservation observations to separate evidence columns.
5. Infer the smallest environmental state supported in each time-space cell.
6. Compare alternative reconstructions, then identify where the record is
   genuinely conflicting rather than merely recording vertical or lateral
   heterogeneity.

## Required Checks

- No surface-to-bottom, local-to-global, or younger-to-older transfer is silent.
- Time slices respect age uncertainty and hiatuses.
- Open water, oxygenation, productivity, and deglaciation are separate state
  variables unless evidence links them.

## Output

Use the **Reconstruction** contract: time-space table, evidence matrix,
environmental states, mechanism candidates, alternatives, confidence, and
uncertainty register.

## Stop Condition

Stop at the finest resolution supported by chronology and sampling. Do not fill
unobserved intervals or basin areas by narrative interpolation.
