---
title: "Qiuzhen AI QE — Fall 2025 — Problem 12 — Projected SGD One-Step Bound"
exam: "2025-fall"
part: "A. Machine Learning Theory"
problem: "Problem 12"
marks: "7"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 12 — Projected SGD One-Step Bound

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **A. Machine Learning Theory, Problem 12** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **7**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Derive the expected squared-distance inequality for projected SGD.

## Zero-background prerequisite ladder

- projection nonexpansiveness; subgradients; unbiased estimators; norm expansion

## Core notation and concepts

- projection
- subgradient
- estimator
- step size
- comparator

## Step-by-step learning route

Apply projection nonexpansiveness to the update; expand the norm; take expectation; use unbiasedness and the second-moment bound.

## Exam-ready answer skeleton

Keep the inner product with the true subgradient and expectation explicit.

## Self-check and common mistakes

- Self-check: Can you say where convexity would be used in a later convergence step?
- Common mistake: Replacing the random estimator by the true gradient before taking expectation.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [understanding-machine-learning](../../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- Extension after this problem: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
