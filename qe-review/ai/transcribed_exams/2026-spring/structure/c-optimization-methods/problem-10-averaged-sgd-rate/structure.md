---
title: "Qiuzhen AI QE — Spring 2026 — Problem 10 — Averaged SGD Convergence"
exam: "2026-spring"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 10"
marks: "5"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 10 — Averaged SGD Convergence

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 10** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **5**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Derive a descent inequality and an averaged-iterate rate for decreasing steps.

## Zero-background prerequisite ladder

- smoothness descent; conditional expectation; telescoping; convexity; weighted averaging

## Core notation and concepts

- objective gap
- step size
- conditional expectation
- averaged iterate

## Step-by-step learning route

Apply smoothness to one update; condition and use unbiasedness; impose the step-size bound; sum/telescope with the decreasing schedule; apply convexity to the average.

## Exam-ready answer skeleton

Separate the one-step proof from the final summation argument.

## Self-check and common mistakes

- Self-check: Can you identify where the logarithm enters the final rate?
- Common mistake: Using Jensen in the wrong direction or averaging without accounting for weights.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
