---
title: "Qiuzhen AI QE — Spring 2026 — Problem 2 — Flow Matching and Stochastic Interpolants"
exam: "2026-spring"
part: "B. Deep Learning and Reinforcement Learning"
problem: "Problem 2"
marks: "15"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 2 — Flow Matching and Stochastic Interpolants

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **B. Deep Learning and Reinforcement Learning, Problem 2** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **15**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Learn a velocity field transporting a base distribution to data and connect ODE/SDE marginals.

## Zero-background prerequisite ladder

- couplings; interpolation; conditional expectation; continuity equation; Fokker–Planck; score matching

## Core notation and concepts

- coupling
- velocity
- continuity equation
- marginal
- score
- diffusion coefficient

## Step-by-step learning route

Differentiate the interpolation; define the conditional-expectation velocity; derive the continuity equation weakly; use squared regression and conditional expectation; match Fokker–Planck to continuity with the score term.

## Exam-ready answer skeleton

Separate conditional path velocity from population velocity and ODE from SDE.

## Self-check and common mistakes

- Self-check: Can you verify cancellation of the diffusion term in the Fokker–Planck equation?
- Common mistake: Claiming each interpolation path is the learned ODE trajectory, or confusing the two velocity fields.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [deep-learning-foundations-concepts](../../../../../../../ai-qe-review/books/deep-learning-foundations-concepts/README.md).
- Extension after this problem: generalization in deep networks, modern generative modeling, offline RL, alignment, and evaluation of learned systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
