---
title: "Qiuzhen AI QE — Spring 2026 — Problem 1 — InfoNCE Gradient"
exam: "2026-spring"
part: "D. Natural Language Processing"
problem: "Problem 1"
marks: "6"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 1 — InfoNCE Gradient

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **D. Natural Language Processing, Problem 1** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **6**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Differentiate contrastive loss and analyze high-dimensional negatives.

## Zero-background prerequisite ladder

- softmax cross-entropy; vector calculus; concentration intuition

## Core notation and concepts

- anchor
- positive
- negative
- temperature
- softmax weight
- false negative

## Step-by-step learning route

Rewrite loss as log-sum-exp minus positive score; differentiate; collect weighted positives/negatives; use high-dimensional inner-product scale and extreme-value intuition.

## Exam-ready answer skeleton

Give both algebraic gradient and geometric pull–push interpretation.

## Self-check and common mistakes

- Self-check: Can you explain the effect of lowering temperature?
- Common mistake: Treating all negatives equally after softmax weighting or ignoring false negatives.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [speech-language-processing](../../../../../../../ai-qe-review/books/speech-language-processing/README.md).
- Extension after this problem: retrieval quality, factuality and safety, long-context modeling, multilingual NLP, and rigorous evaluation of LLM systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
