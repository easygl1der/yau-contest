---
title: "Qiuzhen AI QE — Spring 2025 — Problem 2 — Finite-Class PAC Bound with Non-Identical Samples"
exam: "2025-spring"
part: "A. Machine Learning Theory"
problem: "Problem 2"
marks: "7"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 2 — Finite-Class PAC Bound with Non-Identical Samples

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **A. Machine Learning Theory, Problem 2** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **7**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 2**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Bound the probability that a zero-training-error classifier has high loss under the average sampling distribution.

## Zero-background prerequisite ladder

- realizable PAC setting
- independent non-identical draws
- product bound
- union bound

## Core notation and concepts

- per-example distribution
- average distribution
- realizability
- bad event
- finite class

## Step-by-step learning route

Fix one hypothesis; express zero empirical error as a product; bound it exponentially through average risk; then union-bound over hypotheses.

## Exam-ready answer skeleton

State the fixed-hypothesis event before the union bound and use the average-distribution identity explicitly.

## Self-check and common mistakes

- Self-check: Can you explain why the samples are independent but not identically distributed?
- Common mistake: Replacing the product by an i.i.d. expression or applying the union bound before conditioning on a fixed hypothesis.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [understanding-machine-learning](../../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- Extension after this problem: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
