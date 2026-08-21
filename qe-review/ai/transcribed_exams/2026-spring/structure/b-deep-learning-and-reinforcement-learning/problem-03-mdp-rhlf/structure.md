---
title: "Qiuzhen AI QE — Spring 2026 — Problem 3 — MDP, Actor–Critic, and RLHF"
exam: "2026-spring"
part: "B. Deep Learning and Reinforcement Learning"
problem: "Problem 3"
marks: "8"
study_status: "not started"
solution_status: "scaffold-only"
updated: 2026-08-09
---

# Problem 3 — MDP, Actor–Critic, and RLHF

[← Part map](../structure.md) · [Official source](../../../qzc-qe-ai-2026-spring.tex)

## Original question

- Source locator: **B. Deep Learning and Reinforcement Learning, Problem 3** in [the transcribed paper](../../../qzc-qe-ai-2026-spring.tex).
- Marks: **8**.
- Worked solution status: scaffold only. Attempt the source question first; add a full derivation later in a separate solution note rather than expanding this navigation page.

## What the examiner is asking

Derive value equations, outline policy iteration/actor–critic, and formulate preference alignment.

## Zero-background prerequisite ladder

- discounted MDP; Bellman equation; dynamic programming; policy gradient; preference data

## Core notation and concepts

- state
- action
- transition
- reward
- discount
- value
- actor
- critic
- preference pair

## Step-by-step learning route

Derive Bellman by conditioning on the first transition; state evaluation/improvement; replace unknown dynamics with learned critic/samples; give a reward-model or DPO preference objective.

## Exam-ready answer skeleton

Keep dynamic-programming and model-free roles distinct.

## Self-check and common mistakes

- Self-check: Can you describe what the critic estimates and how it helps the actor?
- Common mistake: Using policy iteration as though transition dynamics were known in actor–critic RL.

## Connections and next reading

- Use the Part dependency map to choose the prerequisite problem before attempting this one.
- Canonical local reading: [deep-learning-foundations-concepts](../../../../../../../ai-qe-review/books/deep-learning-foundations-concepts/README.md).
- Extension after this problem: generalization in deep networks, modern generative modeling, offline RL, alignment, and evaluation of learned systems.

## Progress

- [ ] `not started` — first closed-book attempt completed.
- [ ] `studying` — every prerequisite and self-check is secure.
- [ ] `exam-ready` — reproduce the skeleton within the marks-implied time budget.
