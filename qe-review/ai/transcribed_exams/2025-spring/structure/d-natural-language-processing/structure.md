---
title: "Qiuzhen AI QE — Spring 2025 — D. Natural Language Processing"
exam: "2025-spring"
part: "D. Natural Language Processing"
kind: "part-study-map"
updated: 2026-08-19
---

# D. Natural Language Processing — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2025-spring.tex)

## What this part assesses

language-model mechanisms, representation learning, probabilistic NLP, modern LLM alignment, and end-to-end NLP-system design.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 3 | [Trigram Estimation and Smoothing](./problem-01-trigram-smoothing/structure.md) |
| Problem 2 | 3 | [Representation Learning](./problem-02-representation-learning/structure.md) |
| Problem 3 | 3 | [Top-p Sampling](./problem-03-top-p-sampling/structure.md) |
| Problem 4 | 3 | [Why Modern LLMs Work](./problem-04-llm-success-factors/structure.md) |
| Problem 5 | 3 | [Transformer Advantages](./problem-05-transformer-vs-rnn/structure.md) |
| Problem 6 | 5 | [Statistical Basis of Data Scaling Laws](./problem-06-data-scaling-laws/structure.md) |
| Problem 7 | 5 | [RLHF with a Reward Model](./problem-07-rlhf/structure.md) |
| Problem 8 | 8 | [Domain Question-Answering with RAG](./problem-08-domain-rag-system/structure.md) |
| Further learnings | Not graded in Spring 2025 | `nlp-universal-review.tex` (after Problem 8): InfoNCE gradient, four embeddings, long-context attention, alignment stages / DPO pointer, $L(P,T)$ scaling, RAG gain and MDP, LDA / supervised LDA, MLN MAP |

## Recommended route and dependencies

- Problem 1 → Trigram Estimation and Smoothing
- Problem 2 → Representation Learning
- Problem 3 → Top-p Sampling
- Problem 4 → Why Modern LLMs Work
- Problem 5 → Transformer Advantages
- Problem 6 → Statistical Basis of Data Scaling Laws
- Problem 7 → RLHF with a Reward Model
- Problem 8 → Domain Question-Answering with RAG
- Further learnings → later-paper objects named in the six-item syllabus map (do not rewrite Problems 1--8)

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

For a concept prompt: definition, mechanism, trade-off, and failure mode. For a derivation: name the probabilistic objective and each approximation. For a design: data flow, components, evaluation, and failure handling.

## Canonical reading and extensions

- Primary local reading: [speech-language-processing](../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- This paper does not fully cover: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.
