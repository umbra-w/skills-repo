# Test Mechanisms

## Inputs

Accept a causal claim or proposed chain linking climate, ice, weathering,
atmosphere, ocean circulation, redox, mineral deposition, nutrients, or biology.

## Actions

1. Express the preferred mechanism as nodes: forcing, transfer flux, reservoir
   response, depositional recording, and preservation.
2. Attach supporting evidence and assumptions to every edge.
3. Construct at least one viable alternative using
   [competing hypotheses](../../../references/competing-hypotheses.md).
4. Check mass balance and process direction with
   [atmosphere-land-ocean cycling](../../../references/atmosphere-land-ocean-cycling.md).
5. Check whether the proposed cause precedes the response within age-model
   uncertainty and whether their duration and spatial domains overlap.
6. Identify predictions unique enough to discriminate mechanisms and rank the
   next tests by information gain.

## Required Checks

- Covariance is not presented as causality.
- Every arrow names a transport or reaction process.
- Ad hoc rescue assumptions are visible and penalize confidence.

## Output

Return a mechanism graph or table, edge-level evidence, alternative models,
discriminating predictions, falsifiers, confidence, and next tests.

## Stop Condition

If two mechanisms make identical predictions with available observations,
report non-identifiability and redesign the test rather than selecting one.
