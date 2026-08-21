---
title: "Qiuzhen AI QE — Fall 2025 — Problem 2 — Scaling Laws and Architecture"
exam: "2025-fall"
part: "D. Natural Language Processing"
problem: "Problem 2"
marks: "5"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 2 — Scaling Laws and Architecture

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 2** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **5**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Compare LSTM and Transformer scaling curves under fixed data and fixed parameters.

## Zero-background prerequisite ladder

- power-law scaling; parameter/data regimes; architectural bias

## Core notation and concepts

- loss floor
- exponents
- coefficients
- throughput
- long-range dependency

## Step-by-step learning route

Substitute the fixed quantity into the scaling form; compare qualitative exponents/coefficient effects; justify with dependency length, parallelism, and bias.

## Exam-ready answer skeleton

Separate empirical curve comparison from mechanistic explanations.

## Self-check and common mistakes

- Self-check: Can you explain why a lower curve may arise from either an exponent or a prefactor?
- Common mistake: Claiming an ordering without stating the regime.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
