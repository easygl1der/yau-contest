---
title: "Qiuzhen AI QE — Fall 2025 — Problem 7 — Variance at the Optimum"
exam: "2025-fall"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 7"
marks: "3"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 7 — Variance at the Optimum

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 7** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **3**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Express gradient-noise variance at the solution in terms of one importance-sampled draw.

## Zero-background prerequisite ladder

- unbiased minibatch average; variance scaling

## Core notation and concepts

- noise
- optimum
- variance
- minibatch size

## Step-by-step learning route

Use unbiasedness at the optimizer and independence of minibatch draws to obtain the inverse-minibatch factor.

## Exam-ready answer skeleton

Identify the random single-sample estimator explicitly.

## Self-check and common mistakes

- Self-check: Can you say when this variance becomes zero?
- Common mistake: Confusing the variance of an average with the variance of a sum.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
