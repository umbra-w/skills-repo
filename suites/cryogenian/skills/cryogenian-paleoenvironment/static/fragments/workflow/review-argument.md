# Review Argument

## Inputs

Accept a proposal, manuscript passage, conceptual model, figure interpretation,
reviewer comment, or standalone claim with evidence pointers when available.

## Actions

1. Extract each major claim verbatim and assign a stable ID.
2. Classify it as descriptive, correlational, environmental-state, causal,
   regional/global, or biological/habitability.
3. Map cited or supplied evidence to the claim and run the relevant chronology,
   context, preservation, proxy, scale, and alternative gates.
4. Grade the claim as supported, supportable after qualification, unresolved,
   or unsupported.
5. Identify the exact overreach or missing test and provide the smallest repair.
6. When requested, supply revised wording that preserves the result while
   matching evidence strength.

## Required Checks

- Do not reward cautious tone when the evidence chain is still missing.
- Do not invent citations, reviewer requirements, sample values, or manuscript
  locations.
- Separate a weakly written claim from a scientifically unsupported claim.

## Output

Use the **Argument Review** contract with severity (`critical`, `major`,
`moderate`, `minor`), claim/evidence pointers, reason, repair, and decisive test.

## Stop Condition

Stop when every major claim has a verdict and actionable repair. Route final
prose polishing to `cryogenian-polishing` only after the scientific boundaries are fixed.
