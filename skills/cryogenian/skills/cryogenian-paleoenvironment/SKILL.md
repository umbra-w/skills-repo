---
name: cryogenian-paleoenvironment
description: Use when legacy workflows or direct domain reconstruction concern Cryogenian or Neoproterozoic glaciation, Sturtian or Marinoan events, Cryogenian iron formations (CIF/BIF), open-water conditions, mercury isotopes, paleogeography, deglaciation, atmosphere-land-ocean cycling, or early habitability. This is the compatibility entry for the broader independent Cryogenian research suite.
---

# Cryogenian Paleoenvironment Compatibility Entry

Preserve bounded domain reconstruction from the original Skill while routing
specialized products to the independent suite. Nature Skills is not required.

## Scope First

Read `../cryogenian-shared/core/task-scope.md` and
`../cryogenian-shared/core/evidence-freshness.md`.

- `POINT`: answer the one term, claim, sentence, proxy question, calculation,
  source, or panel directly. Load core plus no more than one relevant legacy
  reference. Give the answer first, the decisive caveat, and the next check.
  Do not create a project workflow or handoff table.
- `COMPONENT`: use the owning suite Skill below.
- `SYSTEM`: use `$cryogenian-research-router`.

## Independent Suite

| Need | Skill |
|---|---|
| Current literature or source verification | `$cryogenian-evidence-scout` |
| Paper-level reading | `$cryogenian-paper-reader` |
| Creative hypothesis generation and validation | `$cryogenian-hypothesis-lab` |
| Sampling, analyses, and QA/QC | `$cryogenian-study-design` |
| Computation and multi-proxy integration | `$cryogenian-data-analysis` |
| Drafting | `$cryogenian-writing` |
| Language polishing or translation | `$cryogenian-polishing` |
| Figure creation and visual QA | `$cryogenian-figure` |
| Independent scientific review | `$cryogenian-reviewer` |

These are full workflows, not wrappers around Nature Skills. Invoke them
directly when their product is clear.

## Legacy Reconstruction

For a bounded paleoenvironment interpretation, read `manifest.yaml`, the three
`always_load` files, the matching workflow fragment, and only the relevant
on-demand reference. Establish chronology, setting, preservation, carrier,
proxy prerequisites, independence, and scale before reconstruction. Compare
alternatives and identify discriminating observations.

Treat all files under `references/` as `STATIC-HEURISTIC`: useful prompts and
validity checks, not current observations or consensus. Live-refresh current,
novelty, locality, chronology, numerical, causal, and publication-sensitive
claims. Mark missing information `UNK`; never invent data or citations.

Use `../cryogenian-shared/core/geochemistry-generalization.md` for work outside
the Cryogenian and do not transfer Nanhua/CIF assumptions by analogy alone.

