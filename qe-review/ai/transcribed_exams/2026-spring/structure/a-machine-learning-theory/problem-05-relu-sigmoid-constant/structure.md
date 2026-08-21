---
title: "Qiuzhen AI QE — Spring 2026 — Problem 5 — ReLU and Sigmoid Equality"
exam: "2026-spring"
part: "A. Machine Learning Theory"
problem: "Problem 5"
marks: "5"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 5 — ReLU and Sigmoid Equality

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **A. Machine Learning Theory, Problem 5** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **5**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Show a function represented both by an all-ReLU and an all-sigmoid network on all of Euclidean space is constant.

## Zero-background prerequisite ladder

- ReLU piecewise linearity; sigmoid boundedness/analyticity; asymptotic behavior

## Core notation and concepts

- ReLU network
- sigmoid network
- piecewise affine
- boundedness

## Step-by-step learning route

Use the structural property of a ReLU network along rays and the bounded/asymptotic behavior imposed by a sigmoid network; rule out nonconstant affine pieces.

## Exam-ready answer skeleton

Make the global-domain assumption explicit.

## Self-check and common mistakes

- Self-check: Can you explain why equality only on a bounded domain would not give the same conclusion?
- Common mistake: Claiming a ReLU network is globally affine without accounting for regions.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [understanding-machine-learning](../../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- Extension after this problem: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
