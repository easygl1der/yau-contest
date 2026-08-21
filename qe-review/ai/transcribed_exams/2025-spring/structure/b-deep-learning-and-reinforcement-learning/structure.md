---
title: "Qiuzhen AI QE — Spring 2025 — B. Deep Learning and Reinforcement Learning"
exam: "2025-spring"
part: "B. Deep Learning and Reinforcement Learning"
kind: "part-study-map"
updated: 2026-08-19
---

# B. Deep Learning and Reinforcement Learning — Study Structure

[← Exam map](../structure.md) · [Official source](../../qzc-qe-ai-2025-spring.tex)

## What this part assesses

the mathematical objects behind neural networks, generative models, and sequential decision making, together with their training objectives.

## Problem map

| Problem | Marks | Learning entry |
| --- | ---: | --- |
| Problem 1 | 18 | [Supervised Deep-Learning Pipeline](./problem-01-supervised-dl-pipeline/structure.md) |
| Problem 2 | 15 | [Score-Based Diffusion with a VP SDE](./problem-02-score-based-diffusion/structure.md) |
| Further learnings | Not graded in Spring 2025 | `dl-universal-review.tex` (after Problem 2 Scope): backprop / CNN / attention / generative families, plus pointers into the RL supplement |
| Supplement | Not graded in Spring 2025 | [Reinforcement Learning: Zero-Background Exam Preparation](./reinforcement-learning-zero-basics/structure.md) |

## Recommended route and dependencies

- Problem 1 → Supervised Deep-Learning Pipeline
- Problem 2 → Score-Based Diffusion with a VP SDE
- Further learnings → later-paper DL objects named in Problem 2's scope list (do not rewrite Problems 1--2)
- Supplement → discounted MDP → Bellman equations → Q-learning and policy gradient → actor--critic and RLHF

Work from the first item down unless a problem's prerequisite ladder points back to an earlier concept. Multiple-choice questions are diagnostic checks: use them to expose missing definitions before attempting a proof.

## Reusable answer pattern

State the model and its input-output spaces first; then give the training objective or governing equation; finally connect the formal object to optimization, sampling, or a practical trade-off.

## Canonical reading and extensions

- Primary local reading: [deep-learning-foundations-concepts](../../../../../../ai-qe-review/books/deep-learning-foundations-concepts/README.md).
- The Spring 2025 paper does not assess RL directly, but the official syllabus requires Bellman equations, Q-learning, and policy gradients. Use the RL supplement after the two source problems; it is aligned to the MDP, actor--critic, and RLHF question that appears in Spring 2026.
