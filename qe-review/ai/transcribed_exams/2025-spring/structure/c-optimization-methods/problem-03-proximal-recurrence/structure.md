---
title: "Qiuzhen AI QE — Spring 2025 — Problem 3 — Proximal SGD Recurrence"
exam: "2025-spring"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 3"
marks: "6"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 3 — Proximal SGD Recurrence

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 3** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **6**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 3**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Obtain a one-step squared-distance inequality using the proximal map.

## Zero-background prerequisite ladder

- proximal optimality
- fixed point at optimum
- nonexpansiveness
- norm expansion

## Core notation and concepts

- proximal operator
- optimizer
- stochastic noise
- step size
- fixed-point condition

## Step-by-step learning route

Represent both next iterate and optimum with proximal maps; apply nonexpansiveness; substitute the noisy gradient; square the difference.

## Exam-ready answer skeleton

Expose the deterministic gradient difference and stochastic noise as separate terms.

## Self-check and common mistakes

- Self-check: Can you write the fixed-point identity for the optimum?
- Common mistake: Using the prox optimality condition without first connecting it to the optimizer or losing the noise term.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
