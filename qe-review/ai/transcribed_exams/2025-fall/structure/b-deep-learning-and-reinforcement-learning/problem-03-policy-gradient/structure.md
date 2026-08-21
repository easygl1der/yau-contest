---
title: "Qiuzhen AI QE — Fall 2025 — Problem 3 — Policy Gradient Methods"
exam: "2025-fall"
part: "B. Deep Learning and Reinforcement Learning"
problem: "Problem 3"
marks: "10"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 3 — Policy Gradient Methods

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **B. Deep Learning and Reinforcement Learning, Problem 3** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **10**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Prove the policy-gradient theorem and show the baseline leaves the gradient unchanged.

## Zero-background prerequisite ladder

- MDP trajectories
- log-derivative trick
- action value
- discounted occupancy
- variance reduction

## Core notation and concepts

- policy
- trajectory
- return
- action value
- state-visitation distribution
- baseline

## Step-by-step learning route

Differentiate trajectory likelihood; rearrange reward-to-go terms; express occupancy form; show baseline score expectation is zero; interpret advantage.

## Exam-ready answer skeleton

Keep the discount convention consistent across both equivalent forms.

## Self-check and common mistakes

- Self-check: Can you prove the baseline identity by summing policy probabilities?
- Common mistake: Using total return with an unjustified causal step or treating a baseline as changing the objective.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [deep-learning-foundations-concepts](../../../../../../../ai-qe-review/books/deep-learning-foundations-concepts/README.md).
- Extension after this problem: generalization in deep networks, modern generative modeling, offline RL, alignment, and evaluation of learned systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
