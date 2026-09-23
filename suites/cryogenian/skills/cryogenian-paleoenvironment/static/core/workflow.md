# Core Workflow

Run these steps in order. A selected workflow fragment may add checks but may not
skip an earlier dependency.

1. **Bound the question.** Record event, basin, stratigraphic interval, spatial
   domain, time resolution, target claim, and requested artifact. Mark absent
   fields `UNK`.
2. **Inventory observations.** Assign stable IDs and provenance labels. Keep
   measurements, field relations, literature context, interpretations, and
   hypotheses separate.
3. **Establish time and correlation.** Audit age type, uncertainty, dated
   material, stratigraphic position, hiatuses, correlation method, and possible
   diachroneity before aligning records.
4. **Establish depositional context.** Reconstruct facies associations,
   paleogeography, water depth, energy, sediment source, ice proximity, and
   evidence claimed for open water.
5. **Validate preservation and proxies.** Check alteration, metamorphism,
   weathering, detrital mixing, host phase, normalization, analytical quality,
   replication, and proxy applicability.
6. **Interpret individual proxies.** State what each measurement directly
   senses, its scale, viable causes, confounders, and maximum defensible claim.
7. **Integrate independent evidence.** Build a claim-evidence matrix. Do not
   double-count proxies sharing the same carrier, process, sample set, or model.
8. **Compare alternatives.** For environmental state or causality, retain at
   least two plausible explanations until a discriminating observation excludes
   one.
9. **Build the mechanism chain.** Link forcing, transfer, reservoir response,
   depositional recording, and preservation. Expose each assumption and attach
   a prediction or falsifier.
10. **Close with decisions.** State confidence, conflicts, blocking unknowns,
    the next highest-information work, and any specialist handoff.

## Stop and Continue Rules

| Condition | Stop | Continue |
|---|---|---|
| Age model absent or resolution too coarse | Synchronicity, rate, duration, and event-order claims | Facies-bounded or sample-level description |
| Preservation or host-phase gate fails | Primary proxy interpretation for the affected measurement | Alteration history and unaffected evidence chains |
| Records do not share time, facies, or scale | Direct covariance and causal coupling | Separate reconstructions with an explicit comparison gap |
| Only one non-unique proxy supports a state | High-confidence state assignment | Candidate interpretation and decisive-test design |
| Citation or source cannot be verified | Source-dependent contextual claim | User-supplied observations and clearly marked hypotheses |

Stopping is claim-specific, not task-wide. Never fill a blocked step with a
plausible value or narrative.
