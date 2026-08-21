---
title: "Qiuzhen AI QE — Spring 2025 — Problem 3 — VC Dimension of a Union"
exam: "2025-spring"
part: "A. Machine Learning Theory"
problem: "Problem 3"
marks: "9"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 3 — VC Dimension of a Union

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **A. Machine Learning Theory, Problem 3** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **9**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 3**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Prove the capacity upper bound for a union of two classes and apply it to rectangles and triangles.

## Zero-background prerequisite ladder

- shattering
- growth function
- Sauer's lemma
- upper versus lower bounds

## Core notation and concepts

- VC dimension
- restriction
- growth function
- shattered set
- hypothesis-class union

## Step-by-step learning route

Assume a too-large shattered set; count realized labelings through both growth functions; apply Sauer and derive a contradiction; then substitute known class dimensions.

## Exam-ready answer skeleton

Separate the theorem's upper bound from any claim of exact VC dimension.

## Self-check and common mistakes

- Self-check: Can you distinguish an upper bound from an exact VC-dimension determination?
- Common mistake: Treating the union of classes as though the two classes could jointly realize one labeling without the counting argument.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [understanding-machine-learning](../../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- Extension after this problem: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
