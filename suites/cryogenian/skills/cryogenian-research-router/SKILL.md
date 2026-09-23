---
name: cryogenian-research-router
description: Use when a Cryogenian, Neoproterozoic, paleoenvironmental, sedimentary-geochemical, isotope-geochemical, or biogeochemical research request spans multiple tasks, is ambiguous about workflow, or asks for end-to-end research coordination. Also use as the suite entry point for complete papers, proposals, research programmes, and multi-proxy reconstructions; keep small bounded questions lightweight.
---

# Cryogenian Research Router

Coordinate an independent research suite modeled on Nature Skills' architecture:
specialized task Skills produce real artifacts, while a non-triggering shared
layer supplies common contracts. Nature Skills is not a runtime dependency.

## Scope First

Read `../cryogenian-shared/core/task-scope.md` and
`../cryogenian-shared/core/geochemistry-generalization.md`.

- `POINT`: answer directly with the relevant task Skill. Do not create an
  execution map, project scaffold, evidence matrix, or multi-Skill chain unless
  the bounded question genuinely requires it.
- `COMPONENT`: invoke exactly one owning task Skill unless a missing upstream
  artifact prevents a defensible product.
- `SYSTEM`: build an execution map, run Skills in dependency order, and
  integrate their artifacts rather than merely listing handoffs.

## Task Owners

| User need | Owning Skill | Product |
|---|---|---|
| Search, currency, citation verification | `$cryogenian-evidence-scout` | Dated evidence packet |
| Read a paper, figure, table, or supplement | `$cryogenian-paper-reader` | Located answer or dossier |
| Generate or test explanations | `$cryogenian-hypothesis-lab` | Discovery portfolio and validated shortlist |
| Sampling, analyses, QA/QC, feasibility | `$cryogenian-study-design` | Decision-led study plan |
| Calculation, statistics, integration | `$cryogenian-data-analysis` | Reproducible analysis package |
| Draft scientific content | `$cryogenian-writing` | Evidence-grounded prose and claim ledger |
| Improve or translate existing prose | `$cryogenian-polishing` | Meaning-preserving revision |
| Build or audit figures | `$cryogenian-figure` | Editable, visually verified figure |
| Independent critique | `$cryogenian-reviewer` | Prioritized review package |

Direct invocation of any owner is valid; the router is not a mandatory gateway.

## System Workflow

Define the decision and deliverables. Map dependencies and assign artifact
contracts. A typical order is evidence acquisition -> source reading ->
protected hypothesis discovery -> validation -> study design -> data analysis
-> writing -> figures -> independent review -> targeted revision. Omit stages
whose inputs and decisions are already settled.

At each boundary use `../cryogenian-shared/schemas/handoff.md`. Preserve source
states, claim limits, unresolved conflicts, transformations, and uncertainty.
If one Skill changes an upstream claim, invalidate affected downstream prose,
figures, and review findings and rerun only those parts.

## Integrated Product

For `SYSTEM`, return an execution map, artifacts produced, integrated claim
graph, conflicts between artifacts, unresolved decisions, and next action. Do
not hide disagreement by averaging conclusions. Current scientific answers
must come from live or user-supplied evidence, never static references alone.

