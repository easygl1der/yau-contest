---
title: "Qiuzhen AI QE — Spring 2025 — Problem 3 — Top-p Sampling"
exam: "2025-spring"
part: "D. Natural Language Processing"
problem: "Problem 3"
marks: "3"
study_status: "not started"
solution_status: "linked-existing-solution"
updated: 2026-08-09
---

# Problem 3 — Top-p Sampling

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-spring.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 3** in [the transcribed paper](../../../qzc-qe-ai-2025-spring.tex).
- Marks: **3**.
- Existing expanded treatment: [open the canonical TeX source](../../../qzc-qe-ai-2025-spring.tex) and locate **Problem 3**. Use this page as the study checklist; do not duplicate the worked solution here.

## What the examiner is asking

Compare nucleus sampling with greedy, beam, and fixed-top-k decoding.

## Zero-background prerequisite ladder

- autoregressive decoding
- diversity/quality trade-off
- probability mass truncation

## Core notation and concepts

- nucleus
- cumulative probability
- temperature
- beam search
- top-k

## Step-by-step learning route

Define the dynamic candidate set by cumulative mass; explain why it preserves plausible diversity and adapts to distribution sharpness.

## Exam-ready answer skeleton

Contrast at least two alternatives, including why fixed k is not adaptive.

## Self-check and common mistakes

- Self-check: Can you say when greedy decoding harms open-ended generation?
- Common mistake: Claiming top-p always improves factuality or confusing it with temperature scaling.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
