---
title: "Qiuzhen AI QE — Spring 2025 — Problem 2 — Score-Based Diffusion with a VP SDE"
exam: "2025-spring"
part: "B. Deep Learning and Reinforcement Learning"
problem: "Problem 2"
marks: "15"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-19
---

# Problem 2 — Score-Based Diffusion with a VP SDE

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **B. Deep Learning and Reinforcement Learning, Problem 2** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **15**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 2**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Derive reverse-time dynamics, denoising-score-matching equivalence, and the VP training loss.

## Zero-background prerequisite ladder

- probability densities
- score function
- SDEs
- Gaussian transitions
- conditional expectation

## Core notation and concepts

- forward SDE
- reverse SDE
- score
- marginal density
- conditional density
- noise schedule

## Step-by-step learning route

Write the general reverse-time SDE; use conditional expectation to relate marginal and conditional scores; solve the linear VP transition; substitute its conditional score into the loss.

## Exam-ready answer skeleton

Keep the time convention explicit and finish with an implementable sample-time/noise/prediction loss.

## Self-check and common mistakes

- Self-check: Can you derive the conditional Gaussian mean and variance without confusing marginal and conditional scores?
- Common mistake: Wrong sign or time direction in the reverse SDE; treating the unknown marginal score as directly supervised.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [deep-learning-foundations-concepts](../../../../../../../ai-qe-review/books/deep-learning-foundations-concepts/README.md).
- Extension after this problem: the later-paper dictionary promised in the Scope list is now written in `dl-universal-review.tex` (MLE/KL, flows, VAE, DDPM ELBO, GAN, flow matching). RL remains the separate supplement, not a second treatise.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
