---
title: "Qiuzhen AI QE — Spring 2026 — Problem 6 — One-Step Proximal-SGD Inequality"
exam: "2026-spring"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 6"
marks: "3"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 6 — One-Step Proximal-SGD Inequality

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 6** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **3**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Compare proximal SGD with the optimizer's fixed point.

## Zero-background prerequisite ladder

- fixed point; nonexpansiveness; stochastic gradient

## Core notation and concepts

- iterate
- optimizer
- stochastic gradient
- step size

## Step-by-step learning route

Apply Problem 5 to the update and fixed point, then substitute the gradient estimator and square.

## Exam-ready answer skeleton

Make the gradient at the optimum visible.

## Self-check and common mistakes

- Self-check: Can you reduce the statement to the deterministic case when noise vanishes?
- Common mistake: Comparing the iterate to a non-proximal expression for the optimizer.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
