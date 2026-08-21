---
title: "Qiuzhen AI QE — Spring 2025 — C. Optimization Methods in Artificial Intelligence"
exam: "2025-spring"
part: "C. Optimization Methods in Artificial Intelligence"
kind: "part-study-map"
updated: 2026-08-19
---

# C. Optimization Methods in Artificial Intelligence — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2025-spring.tex)

## What this part assesses

convex-analysis tools and the full convergence-proof pipeline for deterministic or stochastic first-order algorithms.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 5 | [Smoothness and Strong Convexity](./problem-01-smoothness-strong-convexity/structure.md) |
| Problem 2 | 6 | [Combined Smoothness and Strong Convexity](./problem-02-combined-inequality/structure.md) |
| Problem 3 | 6 | [Proximal SGD Recurrence](./problem-03-proximal-recurrence/structure.md) |
| Problem 4 | 6 | [Conditional Variance Decomposition](./problem-04-conditional-variance/structure.md) |
| Problem 5 | 5 | [Linear Contraction and Noise Floor](./problem-05-linear-recurrence/structure.md) |
| Problem 6 | 5 | [Constant-Step SGD Complexity](./problem-06-sgd-complexity/structure.md) |
| Further learnings | Not graded in Spring 2025 | `opt-universal-review.tex` (after the section Scope): convex-set dictionary, subdifferential exam formulas, nonexpansiveness from monotonicity, finite-sum expected smoothness / importance sampling, iterate averaging, RCD pointer, momentum pointer into Part B |

## Recommended route and dependencies

- Problem 1 → Smoothness and Strong Convexity
- Problem 2 → Combined Smoothness and Strong Convexity
- Problem 3 → Proximal SGD Recurrence
- Problem 4 → Conditional Variance Decomposition
- Problem 5 → Linear Contraction and Noise Floor
- Problem 6 → Constant-Step SGD Complexity
- Further learnings → later-paper objects named in the section Scope list (do not rewrite Problems 1--6)

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

Write the algorithmic update, compare it with the optimum or fixed point, expand the squared distance or objective gap, condition correctly on the past, and telescope or solve the resulting recurrence.

## Canonical reading and extensions

- Primary local reading: [first-order-methods-optimization](../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- This paper does not fully cover: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives. The Scope list is collected in `opt-universal-review.tex` (finite-sum / averaging / RCD); Nesterov Lyapunov, SVRG/SAGA, and nonconvex saddles remain out of scope.
