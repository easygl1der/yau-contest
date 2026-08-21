---
title: "Qiuzhen AI QE — Fall 2025 — Problem 4 — Topic–Ontology LDA"
exam: "2025-fall"
part: "D. Natural Language Processing"
problem: "Problem 4"
marks: "10"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 4 — Topic–Ontology LDA

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 4** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **10**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Design a structured topic model for fact triples and name its latent categories.

## Zero-background prerequisite ladder

- LDA; Dirichlet mixtures; latent variables; factorized joint models

## Core notation and concepts

- document mixture
- topic
- ontology category
- surface form
- fact triple

## Step-by-step learning route

Specify random variables and conditional dependencies; write the generative sampling order; factorize the joint; propose a naming procedure based on high-probability variables/examples.

## Exam-ready answer skeleton

Make every factor in the joint correspond to one sampling step.

## Self-check and common mistakes

- Self-check: Can you identify what is shared globally, per document, and per triple?
- Common mistake: Writing a joint distribution with variables that were never generated.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
