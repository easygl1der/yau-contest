---
title: "Qiuzhen AI QE — Spring 2026 — Problem 2 — Supervised LDA"
exam: "2026-spring"
part: "D. Natural Language Processing"
problem: "Problem 2"
marks: "6"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 2 — Supervised LDA

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 2** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **6**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Explain how labels change topic learning and write the supervised generative model.

## Zero-background prerequisite ladder

- LDA; document topic proportions; logistic regression; factorized joints

## Core notation and concepts

- topic assignment
- topic mixture
- word distribution
- label model
- regression weights

## Step-by-step learning route

Contrast unsupervised and supervised objectives; define label conditional on topic summary; list the generative steps; multiply their factors.

## Exam-ready answer skeleton

Make the label depend on latent topic proportions/assignments rather than raw words only.

## Self-check and common mistakes

- Self-check: Can you identify the failure mode when unsupervised topics ignore prediction?
- Common mistake: Appending a classifier after LDA without integrating it into the probabilistic model.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
