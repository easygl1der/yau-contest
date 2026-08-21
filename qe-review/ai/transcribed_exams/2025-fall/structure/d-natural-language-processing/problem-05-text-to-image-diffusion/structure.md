---
title: "Qiuzhen AI QE — Fall 2025 — Problem 5 — Text-to-Image Diffusion"
exam: "2025-fall"
part: "D. Natural Language Processing"
problem: "Problem 5"
marks: "10"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 5 — Text-to-Image Diffusion

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2025-fall.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 5** in [the transcribed paper](../../../qzc-qe-ai-2025-fall.tex).
- Marks: **10**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Derive diffusion Gaussian identities and design a text-conditioned reverse model.

## Zero-background prerequisite ladder

- Gaussian chains; ELBO; posterior conditioning; noise prediction; text conditioning

## Core notation and concepts

- forward process
- cumulative alpha
- ELBO
- posterior
- noise predictor
- conditioning

## Step-by-step learning route

Derive the closed-form forward marginal by induction; decompose ELBO; use Gaussian conditioning for the posterior; substitute the noise parameterization; specify text encoding/cross-attention in the reverse network.

## Exam-ready answer skeleton

Keep each Gaussian's conditioning variables and variance distinct.

## Self-check and common mistakes

- Self-check: Can you derive the posterior by multiplying two Gaussian factors?
- Common mistake: Confusing the learned reverse transition with the known forward posterior.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
