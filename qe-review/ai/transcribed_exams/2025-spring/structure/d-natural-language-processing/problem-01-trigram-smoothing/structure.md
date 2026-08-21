---
title: "Qiuzhen AI QE — Spring 2025 — Problem 1 — Trigram Estimation and Smoothing"
exam: "2025-spring"
part: "D. Natural Language Processing"
problem: "Problem 1"
marks: "3"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 1 — Trigram Estimation and Smoothing

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 1** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **3**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 1**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Explain count estimation and how to handle unseen contexts.

## Zero-background prerequisite ladder

- conditional probability
- n-gram counts
- sparsity
- smoothing/backoff

## Core notation and concepts

- trigram
- context count
- interpolation
- backoff
- unknown token

## Step-by-step learning route

Give the maximum-likelihood count ratio, identify the zero-count failure, then describe smoothing with backoff/interpolation.

## Exam-ready answer skeleton

Use one formula or verbal ratio plus a concrete unseen-context repair.

## Self-check and common mistakes

- Self-check: Can you distinguish an unseen continuation from an unseen context?
- Common mistake: Saying only 'use smoothing' without naming where probability mass comes from.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
