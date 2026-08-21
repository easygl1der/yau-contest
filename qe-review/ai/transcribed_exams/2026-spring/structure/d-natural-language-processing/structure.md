---
title: "Qiuzhen AI QE — Spring 2026 — D. Natural Language Processing"
exam: "2026-spring"
part: "D. Natural Language Processing"
kind: "part-study-map"
updated: 2026-08-09
---

# D. Natural Language Processing — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2026-spring.tex)

## What this part assesses

language-model mechanisms, representation learning, probabilistic NLP, modern LLM alignment, and end-to-end NLP-system design.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 6 | [InfoNCE Gradient](./problem-01-infonce-gradient/structure.md) |
| Problem 2 | 6 | [Supervised LDA](./problem-02-supervised-lda/structure.md) |
| Problem 3 | 7 | [Efficient Long-Sequence Transformer](./problem-03-efficient-long-transformer/structure.md) |
| Problem 4 | 7 | [MLN Information Extraction](./problem-04-mln-information-extraction/structure.md) |
| Problem 5 | 7 | [RAG as External Memory](./problem-05-rag-external-memory/structure.md) |

## Recommended route and dependencies

- Problem 1 → InfoNCE Gradient
- Problem 2 → Supervised LDA
- Problem 3 → Efficient Long-Sequence Transformer
- Problem 4 → MLN Information Extraction
- Problem 5 → RAG as External Memory

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

For a concept prompt: definition, mechanism, trade-off, and failure mode. For a derivation: name the probabilistic objective and each approximation. For a design: data flow, components, evaluation, and failure handling.

## Canonical reading and extensions

- Primary local reading: [speech-language-processing](../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- This paper does not fully cover: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.
