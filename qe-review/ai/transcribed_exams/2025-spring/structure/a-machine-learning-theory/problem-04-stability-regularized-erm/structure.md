---
title: "Qiuzhen AI QE — Spring 2025 — Problem 4 — Stability and Regularized ERM"
exam: "2025-spring"
part: "A. Machine Learning Theory"
problem: "Problem 4"
marks: "10"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 4 — Stability and Regularized ERM

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **A. Machine Learning Theory, Problem 4** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **10**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 4**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Connect replace-one stability to expected generalization and derive the regularized-ERM risk bound.

## Zero-background prerequisite ladder

- empirical versus population risk
- replacement samples
- convexity/strong convexity
- Lipschitz stability

## Core notation and concepts

- replace-one sample
- algorithm stability
- regularization parameter
- Lipschitz constant
- comparator

## Step-by-step learning route

Use a ghost replacement to rewrite the generalization gap; invoke regularized-ERM stability; compare its objective to the population-risk minimizer.

## Exam-ready answer skeleton

Prove the expected gap first, then insert it into the regularized-ERM comparison.

## Self-check and common mistakes

- Self-check: Can you identify where each regularization and Lipschitz term enters the final bound?
- Common mistake: Using pointwise stability when only average stability is assumed, or omitting the comparator-objective inequality.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [understanding-machine-learning](../../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- Extension after this problem: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
