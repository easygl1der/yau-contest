---
title: "Qiuzhen AI QE — Spring 2026 — A. Machine Learning Theory"
exam: "2026-spring"
part: "A. Machine Learning Theory"
kind: "part-study-map"
updated: 2026-08-09
---

# A. Machine Learning Theory — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2026-spring.tex)

## What this part assesses

statistical learning guarantees, capacity, optimization foundations, and the assumptions that make generalization possible.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| MQ1 | 0.5 | [Agnostic PAC Comparator](./problem-mq01-agnostic-pac/structure.md) |
| MQ2 | 0.5 | [VC Growth Function](./problem-mq02-growth-function/structure.md) |
| MQ3 | 0.5 | [ReLU Learning Theory](./problem-mq03-relu-theory/structure.md) |
| MQ4 | 0.5 | [ERM and PAC Learnability](./problem-mq04-erm-pac/structure.md) |
| MQ5 | 0.5 | [No Free Lunch Consequence](./problem-mq05-no-free-lunch/structure.md) |
| MQ6 | 0.5 | [Valid Kernels](./problem-mq06-kernel-feature-map/structure.md) |
| Problem 1 | 6 | [Mean-Squared Empirical-Loss Error](./problem-01-empirical-loss-mse/structure.md) |
| Problem 2 | 4 | [Unique Global Minimizer](./problem-02-strong-convex-minimizer/structure.md) |
| Problem 3 | 8 | [VC Dimension of an Interval–Ray Class](./problem-03-interval-ray-vc/structure.md) |
| Problem 4 | 7 | [Multivector Construction](./problem-04-multivector-separability/structure.md) |
| Problem 5 | 5 | [ReLU and Sigmoid Equality](./problem-05-relu-sigmoid-constant/structure.md) |

## Recommended route and dependencies

- MQ1 → Agnostic PAC Comparator
- MQ2 → VC Growth Function
- MQ3 → ReLU Learning Theory
- MQ4 → ERM and PAC Learnability
- MQ5 → No Free Lunch Consequence
- MQ6 → Valid Kernels
- Problem 1 → Mean-Squared Empirical-Loss Error
- Problem 2 → Unique Global Minimizer
- Problem 3 → VC Dimension of an Interval–Ray Class
- Problem 4 → Multivector Construction
- Problem 5 → ReLU and Sigmoid Equality

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

For a proof, name the setting, define the random object or geometric witness, invoke the correct theorem, and close the requested inequality. For a multiple-choice item, identify the exact theorem and reject each tempting overstatement.

## Canonical reading and extensions

- Primary local reading: [understanding-machine-learning](../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- This paper does not fully cover: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.
