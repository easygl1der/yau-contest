---
title: "Qiuzhen AI QE — Fall 2025 — Problem 6 — Optimal Importance Sampling"
exam: "2025-fall"
part: "C. Optimization Methods in Artificial Intelligence"
problem: "Problem 6"
marks: "4"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 6 — Optimal Importance Sampling

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **C. Optimization Methods in Artificial Intelligence, Problem 6** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **4**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Choose the sampling distribution that minimizes the worst scaled smoothness constant.

## Zero-background prerequisite ladder

- simplex optimization; minimax equalization; component smoothness

## Core notation and concepts

- probability simplex
- importance sampling
- component smoothness

## Step-by-step learning route

Lower-bound the maximum by a weighted average; choose probabilities proportional to component smoothness to attain equality; compare with uniform sampling.

## Exam-ready answer skeleton

Give both optimizer and attained objective value.

## Self-check and common mistakes

- Self-check: Can you check that the proposed probabilities sum to one?
- Common mistake: Optimizing average rather than maximum scaled smoothness.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [first-order-methods-optimization](../../../../../../../ai-qe-review/books/first-order-methods-optimization/README.md).
- Extension after this problem: accelerated methods, variance reduction, nonconvex optimization, adaptive methods, and constrained/composite objectives.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
