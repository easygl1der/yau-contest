---
title: "Qiuzhen AI QE — Spring 2025 — Problem 4 — Conditional Variance Decomposition"
exam: "2025-spring"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 4"
marks: "6"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 4 — Conditional Variance Decomposition

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 4** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **6**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 4**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Condition the recurrence on the pre-sampling history and bound the noise contribution.

## Zero-background prerequisite ladder

- filtration
- conditional expectation
- zero-mean cross term
- second-moment bound

## Core notation and concepts

- pre-sampling sigma-field
- conditional expectation
- noise variance
- deterministic direction

## Step-by-step learning route

Expand the square from Problem 3; condition on past iterates; cancel the cross term; apply the noise-moment bound.

## Exam-ready answer skeleton

State that conditioning is on information before the new noise sample.

## Self-check and common mistakes

- Self-check: Can you explain why conditioning on the sampled noise itself would be invalid?
- Common mistake: Using an incorrect conditioning convention or assuming the cross term is zero without conditional mean-zero noise.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
