---
title: "Qiuzhen AI QE — Fall 2025 — Problem 5 — Extremes and Minibatch Interpolation"
exam: "2025-fall"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 5"
marks: "4"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 5 — Extremes and Minibatch Interpolation

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 5** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **4**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Analyze the expected-smoothness constant at small/large minibatches and prove monotonicity.

## Zero-background prerequisite ladder

- closed-form constant; limits; monotonicity

## Core notation and concepts

- minibatch size
- SGD
- gradient descent
- expected smoothness

## Step-by-step learning route

Evaluate at one sample and at the infinite-batch limit; compare consecutive sizes or differentiate the continuous form.

## Exam-ready answer skeleton

Interpret the algebra as an SGD-to-GD trade-off.

## Self-check and common mistakes

- Self-check: Can you name the two limiting algorithms?
- Common mistake: Claiming variance vanishes at a finite minibatch without an interpolation condition.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
