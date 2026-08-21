---
title: "Qiuzhen AI QE — Fall 2025 — Problem 2 — Likelihood, Flows, VAEs, and Diffusion"
exam: "2025-fall"
part: "B. Deep Learning and Reinforcement Learning"
problem: "Problem 2"
marks: "14"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 2 — Likelihood, Flows, VAEs, and Diffusion

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **B. Deep Learning and Reinforcement Learning, Problem 2** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **14**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Relate likelihood to KL divergence and state the training objectives for flows, VAEs, and diffusion.

## Zero-background prerequisite ladder

- density estimation
- change of variables
- latent variables
- ELBO
- diffusion chain

## Core notation and concepts

- data density
- model density
- KL
- Jacobian
- latent variable
- ELBO
- forward/reverse chain

## Step-by-step learning route

Derive the likelihood/KL identity; apply change of variables to flows; derive ELBO by inserting a variational posterior; decompose diffusion ELBO.

## Exam-ready answer skeleton

Organize by model family and identify the tractability obstacle each objective solves.

## Self-check and common mistakes

- Self-check: Can you distinguish exact likelihood in flows from lower-bound training in VAEs?
- Common mistake: Dropping the log-determinant in flows or treating ELBO as equal to likelihood.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [deep-learning-foundations-concepts](../../../../../../../ai-qe-review/books/deep-learning-foundations-concepts/README.md).
- Extension after this problem: generalization in deep networks, modern generative modeling, offline RL, alignment, and evaluation of learned systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
