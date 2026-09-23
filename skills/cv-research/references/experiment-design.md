# Computer Vision Experiment Design

## Contents

1. Evidence matrix
2. Fair baselines
3. Ablations and controls
4. Robustness and generalization
5. Statistics and reporting
6. Leakage and reproducibility

## 1. Evidence matrix

Map claims to experiments before training:

| Claim type | Minimum evidence | Stronger evidence |
|---|---|---|
| Accuracy | matched strong baselines on accepted metrics | multiple datasets, seeds, uncertainty |
| Mechanism | targeted intervention and discriminating control | subset analysis predicted by hypothesis |
| Generalization | explicit unseen domain/task/condition | multiple independent shifts |
| Robustness | named corruption, perturbation, or stress | severity curves and failure thresholds |
| Efficiency | matched hardware/software protocol | accuracy-latency-memory Pareto analysis |
| Calibration | reliability metric and diagram | shift-aware calibration and uncertainty |
| Data efficiency | controlled label/data fractions | learning curves and compute matching |

Each experiment must answer a question. Record the decision that each possible outcome would trigger.

## 2. Fair baselines

Choose baselines that are:

- standard for the task;
- closest in mechanism to test novelty;
- recent and competitive where feasible;
- reproduced under the same pipeline or clearly labeled as reported numbers;
- matched on input resolution, data, supervision, pretraining, augmentation, training budget, test-time augmentation, and post-processing when the claim requires fairness.

Separate `reported`, `reproduced`, and `reimplemented` results. Never silently mix them in one table.

## 3. Ablations and controls

An `ablation`（消融实验）tests whether a component matters. A controlled ablation should vary one explanatory factor while preserving capacity and optimization where possible.

Use:

- removal and replacement controls;
- parameter/FLOP-matched controls;
- random or shuffled-information controls;
- frozen-component controls;
- dose-response sweeps for continuous choices;
- interaction studies for components claimed to be complementary;
- negative controls where no effect is predicted;
- an oracle when privileged information can estimate headroom.

Do not rely only on an additive component ladder when interactions make attribution ambiguous.

## 4. Robustness and generalization

Name the shift before claiming either property:

- domain: camera, geography, institution, weather, synthetic-to-real;
- temporal: later collection period;
- class: unseen or long-tail categories;
- corruption: blur, noise, compression, occlusion;
- adversarial or worst-group condition;
- task or dataset transfer.

Report aggregate and subgroup behavior. Inspect failure cases systematically by predeclared categories rather than selecting visually persuasive examples.

## 5. Statistics and reporting

- Use multiple seeds when training stochasticity could change conclusions.
- Report per-seed values or mean with a suitable uncertainty summary.
- Use paired comparisons when methods are evaluated on the same examples.
- Report effect size, not only a p-value.
- Avoid claiming `statistical significance`（统计显著性）without a named test, assumptions, sample unit, and multiplicity treatment.
- For dataset-level metrics such as AP, use a justified bootstrap or accepted benchmark uncertainty procedure when feasible.
- Predefine a non-inferiority margin when claiming similar accuracy with lower cost.

## 6. Leakage and reproducibility

Audit:

- subject, video, scene, identity, geographic, and temporal split integrity;
- exact or near duplicate images;
- tuning on the test set or repeated hidden-test feedback;
- pretrained-data overlap and pseudo-label provenance;
- benchmark-specific prompt or threshold tuning;
- contamination through external foundation models.

Log commit, environment, seeds, data version, split, preprocessing, command, hardware, runtime, checkpoint selection, and evaluation script. Reproducibility is an evidence property, not merely a code-release promise.
