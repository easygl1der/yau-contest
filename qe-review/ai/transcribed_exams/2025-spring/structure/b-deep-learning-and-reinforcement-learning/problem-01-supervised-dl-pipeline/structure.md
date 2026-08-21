---
title: "Qiuzhen AI QE — Spring 2025 — Problem 1 — Supervised Deep-Learning Pipeline"
exam: "2025-spring"
part: "B. Deep Learning and Reinforcement Learning"
problem: "Problem 1"
marks: "18"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 1 — Supervised Deep-Learning Pipeline

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **B. Deep Learning and Reinforcement Learning, Problem 1** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **18**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 1**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Specify a classifier, train it, explain batch normalization, and diagnose underfitting versus overfitting.

## Zero-background prerequisite ladder

- vector spaces
- MLP composition
- softmax/cross-entropy
- SGD
- train/test distinction

## Core notation and concepts

- input
- feature extractor
- classifier
- logits
- probabilities
- minibatch statistics

## Step-by-step learning route

Define the hypothesis class and parameters; give loss and SGD update; contrast batch-normalization train/test behavior; map training/test error patterns to remedies.

## Exam-ready answer skeleton

Answer each subpart as model → objective → algorithm → diagnostic → intervention, with at least two remedies where requested.

## Self-check and common mistakes

- Self-check: Can you distinguish insufficient expressivity from poor generalization using the two error patterns?
- Common mistake: Calling logits probabilities, reusing minibatch statistics at test time, or proposing regularization to fix underfitting.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [deep-learning-foundations-concepts](../../../../../../../ai-qe-review/books/deep-learning-foundations-concepts/README.md).
- Extension after this problem: generalization in deep networks, modern generative modeling, offline RL, alignment, and evaluation of learned systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
