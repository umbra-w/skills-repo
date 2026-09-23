# Task Scope

Classify every request before choosing workflow depth.

| Scope | Observable condition | Response contract |
|---|---|---|
| `POINT` | One term, claim, sentence, calculation, source, panel, or bounded method question | Answer first; use at most one task fragment; give only the decisive caveat and next check |
| `COMPONENT` | One paragraph, proxy family, dataset, figure, experiment, or section | Run one complete task Skill and return its product |
| `SYSTEM` | Paper, proposal, literature review, multi-proxy reconstruction, or research programme | Use the suite router and compose task Skills in dependency order |

Do not turn `POINT` work into a project. Do not require a full evidence matrix,
project scaffold, or suite handoff unless the point cannot be answered safely
without them. Escalate only the missing context that changes the answer.
