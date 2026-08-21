---
title: "Qiuzhen AI QE — Spring 2025 — Problem 1 — Variance of Empirical Loss"
exam: "2025-spring"
part: "A. Machine Learning Theory"
problem: "Problem 1"
marks: "7"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 1 — Variance of Empirical Loss

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **A. Machine Learning Theory, Problem 1** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **7**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 1**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Prove the exact variance of a fixed classifier's empirical zero-one loss.

## Zero-background prerequisite ladder

- zero-one loss
- Bernoulli variables
- variance of an independent sample mean

## Core notation and concepts

- fixed classifier
- target rule
- population risk
- empirical risk
- sample size

## Step-by-step learning route

Turn each loss into a Bernoulli variable; identify its parameter with population risk; average independent variances.

## Exam-ready answer skeleton

Define the indicators, state independence, compute one variance, and divide by the sample size.

## Self-check and common mistakes

- Self-check: Can you say which object is random and why covariance terms vanish?
- Common mistake: Letting the classifier vary with the sample, or confusing population risk with observed training loss.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [understanding-machine-learning](../../../../../../../ai-qe-review/books/understanding-machine-learning/README.md).
- Extension after this problem: Agnostic learning, Rademacher complexity, compression/PAC-Bayes bounds, kernel methods, and modern overparameterized-network theory.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
