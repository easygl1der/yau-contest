---
title: "Qiuzhen AI QE — Spring 2026 — Problem 3 — Efficient Long-Sequence Transformer"
exam: "2026-spring"
part: "D. Natural Language Processing"
problem: "Problem 3"
marks: "7"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 3 — Efficient Long-Sequence Transformer

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 3** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **7**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Design an efficient attention mechanism and analyze complexity and long-range communication.

## Zero-background prerequisite ladder

- self-attention complexity; sparse attention graphs; global tokens/memory

## Core notation and concepts

- sequence length
- block sparsity
- window
- global token
- graph diameter

## Step-by-step learning route

Choose one mechanism; define its connectivity; calculate per-layer time/memory; reason about graph paths for long-distance interaction.

## Exam-ready answer skeleton

Make the architecture choice concrete rather than listing all options.

## Self-check and common mistakes

- Self-check: Can you compare its complexity with dense attention?
- Common mistake: Claiming local windows alone give constant-depth global communication.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
