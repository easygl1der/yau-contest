---
title: "Qiuzhen AI QE — Fall 2025 — A. Machine Learning Theory"
exam: "2025-fall"
part: "A. Machine Learning Theory"
kind: "part-study-map"
updated: 2026-08-09
---

# A. Machine Learning Theory — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2025-fall.tex)

## What this part assesses

statistical learning guarantees, capacity, optimization foundations, and the assumptions that make generalization possible.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 0.5 | [Bias-Variance Trade-off](./problem-01-bias-variance-tradeoff/structure.md) |
| Problem 2 | 0.5 | [No Free Lunch](./problem-02-no-free-lunch/structure.md) |
| Problem 3 | 0.5 | [Rademacher Complexity](./problem-03-rademacher-complexity/structure.md) |
| Problem 4 | 0.5 | [Empirical Risk Minimization](./problem-04-erm/structure.md) |
| Problem 5 | 1 | [VC Dimension](./problem-05-vc-dimension/structure.md) |
| Problem 6 | 1 | [Agnostic PAC Learning](./problem-06-agnostic-pac/structure.md) |
| Problem 7 | 1 | [Decreasing Learning Rate](./problem-07-decreasing-learning-rate/structure.md) |
| Problem 8 | optional bonus 1 | [Sauer's Lemma (Bonus)](./problem-08-sauer-lemma/structure.md) |
| Problem 9 | 5 | [VC Dimension of Signed Intervals](./problem-09-signed-intervals/structure.md) |
| Problem 10 | 6 | [Strong Convexity Properties](./problem-10-strong-convexity-properties/structure.md) |
| Problem 11 | 5 | [PAC Learning of Concentric Circles](./problem-11-concentric-circles-pac/structure.md) |
| Problem 12 | 7 | [Projected SGD One-Step Bound](./problem-12-projected-sgd/structure.md) |
| Problem 13 | 5 | [Constructive Universal Approximation](./problem-13-universal-approximation/structure.md) |

## Recommended route and dependencies

- Problem 1 → Bias-Variance Trade-off
- Problem 2 → No Free Lunch
- Problem 3 → Rademacher Complexity
- Problem 4 → Empirical Risk Minimization
- Problem 5 → VC Dimension
- Problem 6 → Agnostic PAC Learning
- Problem 7 → Decreasing Learning Rate
- Problem 8 → Sauer's Lemma (Bonus)
- Problem 9 → VC Dimension of Signed Intervals
- Problem 10 → Strong Convexity Properties
- Problem 11 → PAC Learning of Concentric Circles
- Problem 12 → Projected SGD One-Step Bound
- Problem 13 → Constructive Universal Approximation

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

For a proof, name the setting, define the random object or geometric witness, invoke the correct theorem, and close the requested inequality. For a multiple-choice item, identify the exact theorem and reject each tempting overstatement.

## Canonical reading and extensions

- Primary local reading: [understanding-machine-learning](../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- This paper does not fully cover: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.
