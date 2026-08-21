---
title: "Qiuzhen AI QE — Fall 2025 — Problem 13 — Constructive Universal Approximation"
exam: "2025-fall"
part: "A. Machine Learning Theory"
problem: "Problem 13"
marks: "5"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 13 — Constructive Universal Approximation

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **A. Machine Learning Theory, Problem 13** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **5**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Construct a sigmoid network that uniformly approximates a Lipschitz function on a cube.

## Zero-background prerequisite ladder

- Lipschitz continuity; partitions; local approximation; sigmoid gates

## Core notation and concepts

- Lipschitz constant
- grid cells
- approximation error
- sigmoid

## Step-by-step learning route

Choose grid resolution from the target error; approximate the function by cellwise constants; implement soft cell indicators and aggregate them.

## Exam-ready answer skeleton

Explain both error sources: discretization and imperfect gates.

## Self-check and common mistakes

- Self-check: Can you make the construction's width/error dependence explicit at a high level?
- Common mistake: Quoting universal approximation without responding to the requested construction.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [understanding-machine-learning](../../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- Extension after this problem: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
