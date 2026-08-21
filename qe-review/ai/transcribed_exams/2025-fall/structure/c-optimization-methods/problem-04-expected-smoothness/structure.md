---
title: "Qiuzhen AI QE — Fall 2025 — Problem 4 — Expected Smoothness Bound"
exam: "2025-fall"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 4"
marks: "8"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 4 — Expected Smoothness Bound

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 4** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **8**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Derive the expected-smoothness constant for multisampling.

## Zero-background prerequisite ladder

- Bregman divergence; component smoothness; variance of averages; importance sampling

## Core notation and concepts

- Bregman divergence
- expected smoothness
- minibatch size
- component constants

## Step-by-step learning route

Decompose the second moment of a minibatch average into variance and mean terms; bound each component using smoothness/Bregman divergence; collect constants.

## Exam-ready answer skeleton

Track the two terms that interpolate between one sample and full gradient.

## Self-check and common mistakes

- Self-check: Can you explain the role of the Bregman divergence?
- Common mistake: Treating sampled gradients as independent of the shared evaluation point or losing the cross term.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
