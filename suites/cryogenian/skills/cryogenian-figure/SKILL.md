---
name: cryogenian-figure
description: Use when designing, creating, revising, auditing, or exporting scientific figures, stratigraphic columns, paleogeographic maps, proxy profiles, cross-plots, conceptual models, or multi-panel graphics for Cryogenian and Neoproterozoic research. Also use for one panel, axis, legend, color, caption, or visual diagnostic.
---

# Cryogenian Figure

Create publication-grade, data-faithful figures with editable source and visual
verification. This Skill is self-contained and does not require Nature Skills.

## Scope

Read `../cryogenian-shared/core/task-scope.md` and
`../cryogenian-shared/core/provenance-and-scale.md`.

- `POINT`: fix or advise on the requested panel/axis/legend directly; inspect
  the image or source when supplied.
- `COMPONENT`: create or revise one complete figure with source and exports.
- `SYSTEM`: define a manuscript figure system, then implement figures in
  narrative order with shared styles and scales.

## Design From The Claim

State the figure's question, audience, data type, comparison, uncertainty, and
claim ceiling. Choose form by task: stratigraphic profiles preserve depth/order;
maps show spatial uncertainty and reconstruction age; cross-plots expose raw
points and groups; conceptual models visibly distinguish observation from
hypothesis. Never encode an inferred boundary as a measured fact.

Use restrained, color-vision-safe colors plus redundant shape/line encodings.
Keep typography, line weights, panel labels, units, isotope notation, legends,
and stratigraphic direction consistent. Show analytical and age uncertainty
where relevant. Avoid decorative gradients and 3D effects.

## Build And Verify

Prefer reproducible Python/R code for data figures and editable vector output
for schematics. Keep data transformations explicit. Export at final journal
dimensions to PDF/SVG plus high-resolution PNG/TIFF as requested; embed fonts
where possible.

Render every deliverable and visually inspect it at final size. Check clipping,
overlap, legibility, panel order, color contrast, missing glyphs, blank panels,
axis direction, units, data/legend agreement, and caption consistency. Revise
until the rendered artifact passes. Do not claim verification without opening
the rendered output.

## Deliverables

Return editable source, final exports, caption, data/transformation note, and a
short visual-QA record. For a conceptual figure, include a legend distinguishing
`OBS`, `INT`, and `HYP` elements.

