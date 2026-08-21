---
title: "Qiuzhen AI QE — Spring 2025 — A. Machine Learning Theory"
exam: "2025-spring"
part: "A. Machine Learning Theory"
kind: "part-study-map"
updated: 2026-08-09
---

# A. Machine Learning Theory — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2025-spring.tex)

## What this part assesses

statistical learning guarantees, capacity, optimization foundations, and the assumptions that make generalization possible.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 7 | [Variance of Empirical Loss](./problem-01-empirical-loss-variance/structure.md) |
| Problem 2 | 7 | [Finite-Class PAC Bound with Non-Identical Samples](./problem-02-noniid-finite-pac/structure.md) |
| Problem 3 | 9 | [VC Dimension of a Union](./problem-03-vc-union/structure.md) |
| Problem 4 | 10 | [Stability and Regularized ERM](./problem-04-stability-regularized-erm/structure.md) |

## Recommended route and dependencies

- Problem 1 → Variance of Empirical Loss
- Problem 2 → Finite-Class PAC Bound with Non-Identical Samples
- Problem 3 → VC Dimension of a Union
- Problem 4 → Stability and Regularized ERM

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

For a proof, name the setting, define the random object or geometric witness, invoke the correct theorem, and close the requested inequality. For a multiple-choice item, identify the exact theorem and reject each tempting overstatement.

## Canonical reading and extensions

- Primary local reading: [understanding-machine-learning](../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- This paper does not fully cover: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.
