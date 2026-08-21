---
title: "Qiuzhen AI QE — Spring 2025 — Problem 7 — RLHF with a Reward Model"
exam: "2025-spring"
part: "D. Natural Language Processing"
problem: "Problem 7"
marks: "5"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 7 — RLHF with a Reward Model

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 7** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **5**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 7**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Explain policy optimization against learned human-preference rewards, including loss and gradient.

## Zero-background prerequisite ladder

- pretrained policy
- preference data
- reward model
- KL-regularized policy optimization
- policy gradient

## Core notation and concepts

- prompt
- response
- reward model
- reference policy
- KL penalty
- advantage

## Step-by-step learning route

Specify the data flow; write the reward/KL objective; use a score-function gradient or PPO-style surrogate; explain how the reference constrains drift.

## Exam-ready answer skeleton

Keep reward-model training distinct from policy optimization.

## Self-check and common mistakes

- Self-check: Can you state what the KL term protects against?
- Common mistake: Treating human labels as direct token-level rewards or omitting the reference-policy control.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
