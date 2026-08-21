---
title: "Qiuzhen AI QE — Reinforcement Learning — Zero-Background Exam Preparation"
exam: "syllabus-and-cross-year"
part: "B. Deep Learning and Reinforcement Learning"
kind: "supplement-study-map"
study_status: "not started"
updated: 2026-08-13
---

# Reinforcement Learning — Zero-Background Exam Preparation

[← Spring 2025 Part map](../structure.md) · [Official syllabus](../../../../../syllabus/qzc-qe-ai-syllabus-2026-06.md) · [Spring 2026 MDP/RLHF source](../../../../2026-spring/qzc-qe-ai-2026-spring.tex)

## Why this supplement exists

The official syllabus names Bellman equations, Q-learning, and policy gradients. Spring 2025 Part II contains no direct RL problem, but Spring 2026 directly tests discounted MDPs, policy iteration, actor--critic under an unknown transition model, and RLHF/DPO.

## Dependency route

1. Probability, conditional expectation, and the Markov property
2. Discounted MDP, trajectories, return, value, and action value
3. Bellman expectation and optimality equations; policy evaluation and improvement
4. TD learning and Q-learning
5. REINFORCE, baseline identity, and actor--critic
6. Preference data, reward-model RLHF, KL regularization, and DPO

## Canonical source

The full English primer, derivations, drills, and answer skeleton are inserted after Part II of the Spring 2025 TeX source:

- [Reinforcement Learning: Zero-Background Exam Preparation Supplement](../../../qzc-qe-ai-2025-spring.tex)

## Exam-ready self-check

- Can you derive a Bellman equation by conditioning on the first transition?
- Can you distinguish planning with known $P$ from model-free Q-learning and actor--critic?
- Can you write the Q-learning TD target and identify its exploration requirement?
- Can you derive the score-function policy-gradient estimator and justify a state-only baseline?
- Can you state a KL-regularized RLHF objective or a DPO loss for $(x,y^+,y^-)$?

## Progress

- [ ] `not started` — read the prerequisite bridge and solve the two-state MDP.
- [ ] `studying` — reproduce all three syllabus-core derivations without notes.
- [ ] `exam-ready` — complete the closed-book drills and the Spring 2026 eight-point answer skeleton within the implied time budget.
