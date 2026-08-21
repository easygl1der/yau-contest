---
title: "Qiuzhen AI QE — Spring 2026 — C. Optimization Methods in Artificial Intelligence"
exam: "2026-spring"
part: "C. Optimization Methods in Artificial Intelligence"
kind: "part-study-map"
updated: 2026-08-09
---

# C. Optimization Methods in Artificial Intelligence — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2026-spring.tex)

## What this part assesses

convex-analysis tools and the full convergence-proof pipeline for deterministic or stochastic first-order algorithms.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 2 | [Smoothness and Strong Convexity](./problem-01-basic-definitions/structure.md) |
| Problem 2 | 3 | [Proximal Optimality](./problem-02-prox-optimality/structure.md) |
| Problem 3 | 3 | [Unique Minimizer and Fixed Point](./problem-03-unique-fixed-point/structure.md) |
| Problem 4 | 2 | [Monotonicity of the Subdifferential](./problem-04-subdifferential-monotonicity/structure.md) |
| Problem 5 | 3 | [Nonexpansiveness of Prox](./problem-05-prox-nonexpansiveness/structure.md) |
| Problem 6 | 3 | [One-Step Proximal-SGD Inequality](./problem-06-one-step-inequality/structure.md) |
| Problem 7 | 5 | [Conditional Expectation and Variance](./problem-07-conditional-variance/structure.md) |
| Problem 8 | 4 | [Linear Contraction and Noise Floor](./problem-08-contraction-noise-floor/structure.md) |
| Problem 9 | 3 | [Averaging Reduces Variance](./problem-09-iterate-averaging/structure.md) |
| Problem 10 | 5 | [Averaged SGD Convergence](./problem-10-averaged-sgd-rate/structure.md) |

## Recommended route and dependencies

- Problem 1 → Smoothness and Strong Convexity
- Problem 2 → Proximal Optimality
- Problem 3 → Unique Minimizer and Fixed Point
- Problem 4 → Monotonicity of the Subdifferential
- Problem 5 → Nonexpansiveness of Prox
- Problem 6 → One-Step Proximal-SGD Inequality
- Problem 7 → Conditional Expectation and Variance
- Problem 8 → Linear Contraction and Noise Floor
- Problem 9 → Averaging Reduces Variance
- Problem 10 → Averaged SGD Convergence

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

Write the algorithmic update, compare it with the optimum or fixed point, expand the squared distance or objective gap, condition correctly on the past, and telescope or solve the resulting recurrence.

## Canonical reading and extensions

- Primary local reading: [first-order-methods-optimization](../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- This paper does not fully cover: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.
