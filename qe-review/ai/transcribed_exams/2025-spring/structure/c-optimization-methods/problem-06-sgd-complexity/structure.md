---
title: "Qiuzhen AI QE — Spring 2025 — Problem 6 — Constant-Step SGD Complexity"
exam: "2025-spring"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 6"
marks: "5"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 6 — Constant-Step SGD Complexity

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 6** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **5**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 6**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Solve the recurrence to obtain a precision guarantee and noise floor.

## Zero-background prerequisite ladder

- geometric recurrence
- logarithmic iteration count
- bias/variance trade-off

## Core notation and concepts

- precision
- condition number
- iteration count
- noise floor
- step size

## Step-by-step learning route

Unroll the recurrence; bound the geometric term by the desired precision; solve for the iteration count; retain the residual noise term.

## Exam-ready answer skeleton

Separate transient accuracy from the irreducible constant-step residual.

## Self-check and common mistakes

- Self-check: Can you explain why reducing the step size also changes the required iteration count?
- Common mistake: Discarding the noise floor or using a step-size claim that contradicts stability requirements.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
