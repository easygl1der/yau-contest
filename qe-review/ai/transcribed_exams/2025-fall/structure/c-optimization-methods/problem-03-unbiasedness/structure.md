---
title: "Qiuzhen AI QE — Fall 2025 — Problem 3 — Unbiased Multisampling Gradient"
exam: "2025-fall"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 3"
marks: "5"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 3 — Unbiased Multisampling Gradient

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 3** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **5**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Prove the importance-weighted minibatch estimator is unbiased.

## Zero-background prerequisite ladder

- finite-sum gradient; sampling distribution; linearity of expectation

## Core notation and concepts

- sampling probability
- minibatch
- importance weight
- estimator

## Step-by-step learning route

Take expectation of one sampled term; cancel its sampling probability; average independent copies.

## Exam-ready answer skeleton

Show the calculation for one draw before extending to the minibatch.

## Self-check and common mistakes

- Self-check: Can you identify why all sampling probabilities must be positive?
- Common mistake: Forgetting the factor of the number of summands or of minibatch size.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
