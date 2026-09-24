---
name: cryogenian-evidence-scout
description: Use when a Cryogenian, Neoproterozoic glaciation, iron-formation, Hg-isotope, open-water, deglaciation, biogeochemical-cycle, or early-habitability claim needs literature discovery, current-state checking, source verification, citation metadata, or a dated evidence map. Also use for a single factual claim or source check.
---

# Cryogenian Evidence Scout

Find and verify evidence; do not substitute installed notes for literature.

## Start

Read `../cryogenian-shared/core/task-scope.md` and
`../cryogenian-shared/core/evidence-freshness.md`. Classify the request.

- `POINT`: answer the bounded claim or source question first. Search only as
  far as needed, cite exact locators, state confidence and one decisive caveat.
- `COMPONENT`: produce the evidence packet below.
- `SYSTEM`: define search strands, dependencies and stopping criteria; return
  evidence packets that the suite router can compose.

## Modes

Use `source-limited` when the user supplies a corpus. Do not imply coverage
beyond it. Use `live-refresh` for current, consensus, novelty, numerical,
chronological, locality, causal, or publication-sensitive claims. Search
multiple appropriate scholarly sources, prioritize primary evidence, and
record the search date and access limitations.

## Evidence Packet

Read `../cryogenian-shared/schemas/evidence-packet.md`. Return:

1. A bounded question and inclusion/exclusion logic.
2. Search sources, query concepts, date, and stopping rule.
3. A source table with identifiers, access, primary/secondary status, and
   relevance.
4. A claim-source matrix with page, figure, table, section, or data locators.
5. Supporting, opposing, and unresolved evidence; do not vote by paper count.
6. A synthesis bounded by age, locality, facies, proxy, and preservation.
7. Gaps, unavailable sources, and the next refresh trigger.

Use `LIVE-VERIFIED`, `USER-SUPPLIED`, `CONTESTED`, `STALE`, and
`SOURCE-NEEDED` explicitly where their distinction affects the conclusion.
Never invent citations or infer a paper's contents from title/abstract alone.

## Handoff

Provide machine-readable DOI/BibTeX/RIS lists when requested. For full-text
interpretation hand verified sources to `$cryogenian-paper-reader`; for
novelty testing hand the evidence packet to `$cryogenian-hypothesis-lab`.

