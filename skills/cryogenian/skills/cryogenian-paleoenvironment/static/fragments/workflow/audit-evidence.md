# Audit Evidence

## Inputs

Accept claims plus any data table, stratigraphic log, figure, analytical method,
paper excerpt, or user summary that supports them.

## Actions

1. Assign stable claim and evidence IDs and build the ledger defined in
   [evidence and provenance](../../../references/evidence-and-provenance.md).
2. Check the source pointer for every `OBS` and `CTX`; downgrade unverifiable
   material to `UNK` or `OBS-user-report`.
3. Audit age model and correlation before comparing horizons; use
   [chronology and correlation](../../../references/chronology-and-correlation.md).
4. Audit facies, depositional domain, preservation, carrier phase,
   normalization, analytical QA, and replication.
5. Assign evidence strength and a scale tuple. Test whether apparently
   independent proxies share samples, carriers, or assumptions.
6. Record supporting, ambiguous, and conflicting evidence, then state the
   narrowest verdict that survives all failed gates.

## Required Checks

- Every major claim has both a claim pointer and evidence pointer.
- A failed gate blocks the affected inference rather than disappearing into a
  general limitations paragraph.
- Negative evidence is distinguished from absence of data and non-detection.

## Output

Use the **Evidence Audit** contract with a claim-evidence matrix, gate results,
conflicts, blocking `UNK` items, bounded verdict, and repair actions.

## Stop Condition

Stop expanding the audit when each major claim is supported, bounded, or marked
unsupported and every blocking unknown has an owner and resolution method.
