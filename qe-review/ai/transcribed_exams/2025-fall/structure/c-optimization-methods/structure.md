---
title: "Qiuzhen AI QE — Fall 2025 — C. Optimization Methods in Artificial Intelligence"
exam: "2025-fall"
part: "C. Optimization Methods in Artificial Intelligence"
kind: "part-study-map"
updated: 2026-08-09
---

# C. Optimization Methods in Artificial Intelligence — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2025-fall.tex)

## What this part assesses

convex-analysis tools and the full convergence-proof pipeline for deterministic or stochastic first-order algorithms.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 3 | [Smoothness and Strong Convexity](./problem-01-basic-definitions/structure.md) |
| Problem 2 | 2 | [Uniqueness of Minimizer](./problem-02-unique-minimizer/structure.md) |
| Problem 3 | 5 | [Unbiased Multisampling Gradient](./problem-03-unbiasedness/structure.md) |
| Problem 4 | 8 | [Expected Smoothness Bound](./problem-04-expected-smoothness/structure.md) |
| Problem 5 | 4 | [Extremes and Minibatch Interpolation](./problem-05-minibatch-interpolation/structure.md) |
| Problem 6 | 4 | [Optimal Importance Sampling](./problem-06-importance-sampling/structure.md) |
| Problem 7 | 3 | [Variance at the Optimum](./problem-07-variance-at-optimum/structure.md) |
| Problem 8 | 2 | [AC Inequality](./problem-08-ac-inequality/structure.md) |
| Problem 9 | 2 | [Stepsize and Convergence](./problem-09-stepsize-convergence/structure.md) |

## Recommended route and dependencies

- Problem 1 → Smoothness and Strong Convexity
- Problem 2 → Uniqueness of Minimizer
- Problem 3 → Unbiased Multisampling Gradient
- Problem 4 → Expected Smoothness Bound
- Problem 5 → Extremes and Minibatch Interpolation
- Problem 6 → Optimal Importance Sampling
- Problem 7 → Variance at the Optimum
- Problem 8 → AC Inequality
- Problem 9 → Stepsize and Convergence

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

Write the algorithmic update, compare it with the optimum or fixed point, expand the squared distance or objective gap, condition correctly on the past, and telescope or solve the resulting recurrence.

## Canonical reading and extensions

- Primary local reading: [first-order-methods-optimization](../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- This paper does not fully cover: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.
