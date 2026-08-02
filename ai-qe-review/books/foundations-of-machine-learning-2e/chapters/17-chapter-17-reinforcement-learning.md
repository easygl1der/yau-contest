---
title: "Chapter 17 \u2014 Reinforcement Learning"
book: "Foundations of Machine Learning"
book_slug: foundations-of-machine-learning-2e
course: machine-learning
chapter_number: 17
citekey: mohri2018foundations
official_syllabus: true
source_pdf: "sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf"
source_transcript: "transcripts/mineru/foundations-of-machine-learning-2e/reading.md"
source_line_start: 9397
source_line_end: 13080
source_pdf_page_range: null
review_status: needs-manual-review
image_count: 16
source_empty_image_alt: 16
non_semantic_image_alt: 15
caption_derived_image_alt: 1
formula_check:
  unbalanced_dollar_markers: false
  unbalanced_display_math: false
  render_risk: false
  source_control_characters: 35
  latex_environment_mismatches: 0
tags:
  - ai-qe
  - textbook
  - chapter
  - machine-learning
  - official-syllabus
---

# Chapter 17 — Reinforcement Learning

> [[../README|本书目录]] · [[16-chapter-16-learning-automata-and-languages|上一章]]

> [!cite] 来源与可追溯性
> - 书目：Foundations of Machine Learning（mohri2018foundations）
> - 权威原件：[source.pdf](../../../sources/textbooks/official/machine-learning/foundations-of-machine-learning-2e/source.pdf)
> - 原始阅读稿：[reading.md](../../../transcripts/mineru/foundations-of-machine-learning-2e/reading.md)，源行 9397–13080。
> - 本章保留 16 个提取图像；图片、公式或原文措辞有歧义时以 PDF 为准。

> [!abstract] 转录质量门
> 已完成结构、图片路径、数学定界符和高置信度 OCR 拼写检查。自动修复：PDF-confirmed book-specific control-codepoint pattern × 35；Affine × 7；different × 9；Differentiability × 1；efficient × 5；sufficient × 3。本章的异常状态以 frontmatter 的 `review_status` 与本书的 [[review-log]] 为准；没有 PDF 页码映射时不会伪造页码引用。

## 17.1 Learning scenario

The general scenario of reinforcement learning is illustrated by figure 17.1. Unlike the supervised learning scenario considered in previous chapters, here, the learner does not passively receive a labeled data set. Instead, it collects information through a course of actions by interacting with the environment. In response to an action, the learner or agent, receives two types of information: its current state in the environment, and a real-valued reward, which is specific to the task and its corresponding goal.

The objective of the agent is to maximize its reward and thus to determine the best course of actions, or policy, to achieve that objective. However, the information he receives from the environment is only the immediate reward related to the action just taken. No future or long-term reward feedback is provided by the environment. An important aspect of reinforcement learning is to consider delayed rewards or penalties. The agent is faced with the dilemma between exploring unknown states and actions to gain more information about the environment and the rewards, and exploiting the information already collected to optimize its reward. This is known as the exploration versus exploitation trade-of inherent to reinforcement learning.

![Figure 17.1](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/ef3860a3fcfcc6bdda4ac2a3a1dc47f5cef74940c86e9515d41793d6bdad2104.jpg)  
Figure 17.1  
Representation of the general scenario of reinforcement learning.

Note that there are several diferences between the learning scenario of reinforcement learning and that of supervised learning examined in most of the previous chapters. Unlike supervised learning, in reinforcement learning there is no fixed distribution according to which instances are drawn; it is the choice of a policy that defines the distribution over observations. In fact, slight changes to the policy may have dramatic efects on the rewards received. Furthermore, in general, the environment may not be fixed and could vary as a result of the actions selected by the agent. This may be a more realistic model for some learning problems than the standard supervised learning. Finally, note that, unlike supervised learning, in reinforcement learning, training and testing phases are intermixed.

Two main settings can be distinguished here: the one where the environment model is known to the agent, in which case its objective of maximizing the reward received is reduced to a planning problem; and the one where the environment model is unknown, in which case the agent faces a learning problem. In the latter setting, the agent must learn from the state and reward information gathered to both gain information about the environment and determine the best action policy. This chapter presents algorithmic solutions for both of these settings.

## 17.2 Markov decision process mode

We first introduce the model of Markov decision processes (MDPs), a model of the environment and interactions with the environment widely adopted in reinforcement learning. An MDP is a Markovian process defined as follows.

Definition 17.1 (MDPs) A Markov decision process (MDP) is defined by:

<sub>•</sub> a set of states S, possibly infinite.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/3ce07471b7ac4cb4e90e953dcf3d257fff998e812f36eafc57883bc5ac1a1254.jpg)  
Figure 17.2

Illustration of the states and transitions of an MDP at different times.

<sub>•</sub> a start state or initial state $s_{0} \in S$

<sub>•</sub> a set of actions A, possibly infinite.

<sub>•</sub> a transition probability $\mathbb{P}[s^{\prime} | s, a]$ : distribution over destination states $s^{\prime} = \delta(s, a)$

<sub>•</sub> a reward probability $\mathbb{P}[r^{\prime} | s, a]$ : distribution over rewards returned $r^{\prime} = r(s, a)$

The model is Markovian because the transition and reward probabilities depend only on the current state s and not the entire history of states and actions taken. This definition of MDP can be further generalized to the case of non-discrete state and action sets.

In a discrete-time model, actions are taken at a set of decision epochs $\{0, \ldots, T\}$ and this is the model we will adopt in what follows. This model can also be straightforwardly generalized to a continuous-time one where actions are taken at arbitrary points in time.

When T is finite, the MDP is said to have a finite horizon. Independently of the finiteness of the time horizon, an MDP is said to be finite when both S and A are finite sets. Here, we are considering the general case where the reward $r(s, a)$ at state s when taking action a is a random variable. However, in many cases, the reward is assumed to be a deterministic function the state and action pair $(s, a)$

Figure 17.2 illustrates the model corresponding to an MDP. At time $t \in \{0, \ldots, T\}$ the state observed by the agent is $s_{t}$ and it takes action $a_{t} \in A$ . The state reached is $s_{t + 1}$ (with probability $\mathbb{P}[s_{t + 1} | s_{t}, a_{t}])$ and the reward received $r_{t + 1} \in \mathbb{R}$ (with probability $\mathbb{P}[r_{t + 1} | s_{t}, a_{t}])$

Many real-world tasks can be represented by MDPs. Figure 17.3 gives the example of a simple MDP for a robot picking up balls on a tennis court.

## 17.3 Policy

The main problem for an agent in an MDP environment is to determine the action to take at each state, that is, an action policy.

## 17.3.1 Definition

Definition 17.2 (Policy) A policy is a mapping $\pi \colon S \to \Delta(A)$ , where $\Delta(A)$ is the set of probability distributions over A. A policy π is deterministic if for any s, there exists a unique $a \in A$ such that $\pi(s)(a) = 1$ . In that case, we can identify π with a mapping from S to A and use $\pi(s)$ to denote that action.

More precisely, this is the definition of a stationary policy since the choice of the distribution of actions does not depend on time. More generally, we could define a non-stationary policy as a sequence of mappings $\pi_{t} \colon S \to \Delta(A)$ indexed by t. In particular, in the finite horizon case, a non-stationary policy is typically necessary for optimizing rewards.

The agent’s objective is to find a policy that maximizes its expected (reward) return. The return it receives following a deterministic policy π along a specific sequence of states $s_{0}, \ldots, s_{T}$ is defined as follows:

for a finite horizon $\begin{array}{r}{(T < \infty) \colon \sum_{t = 0}^{T} r \bigl(s_{t}, \pi(s_{t}) \bigr)} \end{array}$

for an infinite horizon $\begin{array}{r}{(T = \infty) \colon \sum_{t = 0}^{+ \infty} \gamma^{t} r \bigl(s_{t}, \pi(s_{t}) \bigr)} \end{array}$ , where $\gamma \in[0, 1)$ is a constant factor less than one used to discount future rewards.

Note that the return is a single scalar summarizing a possibly infinite sequence of immediate rewards. In the discounted case, early rewards are viewed as more valuable than later ones.

## 17.3.2 Policy value

This leads to the following definition of the value of a policy at each state.

Definition 17.3 (Policy value) The value $V_{\pi}(s)$ of a policy π at state $s \in S$ is defined as the expected reward returned when starting at s and following policy π:

finite horizon: $\begin{array}{r}{V_{\pi}(s) = \mathbb{E}_{a_{t} \sim \pi(s_{t})} \left[\sum_{t = 0}^{T} r \big(s_{t}, a_{t} \big) \Big | s_{0} = s \right] \colon} \end{array}$

infinite discounted horizon: $\begin{array}{r}{V_{\pi}(s) = \mathbb{E}_{a_{t} \sim \pi(s_{t})} \left[\sum_{t = 0}^{+ \infty} \gamma^{t} r \bigl(s_{t}, a_{t} \bigr) \ \Big | \s_{0} = s \right].} \end{array}$

where the expectations are over the random selection of an action $a_{t}$ according to the distribution $\pi(s_{t})$ , which is explicitly indicated, and over the random states $s_{t}$ reached and the reward values $r \left(s_{t}, a_{t} \right).^{22}$ An infinite undiscounted horizon is also often considered based on the limit of the average reward, when it exists.

## 17.3.3 Optimal policies

Starting from a state $s \in S.$ to maximize its reward, an agent naturally seeks a policy $\pi$ with the largest value $V_{\pi}(s)$ . In this section, we will show that, remarkably, for any finite MDP in the infinite horizon setting, there exists a policy that is optimal for any start state, that is one with the following definition.

Definition 17.4 (Optimal policy) A policy $\pi^{*}$ is optimal if its value is maximal for every state $s \in S$ , that is, for any policy π and any state $s \in S, V_{\pi^{*}}(s) \geq V_{\pi}(s)$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p201-400/images/49796dd6fa8eeaab631094c8b8c2548923bf9d774f0eb5c275623f50850ee7b5.jpg)  
Figure 17.3

Example of a simple MDP for a robot picking up balls on a tennis court. The set of actions is $A = \{ s e a r c h . $ , carry, pickup} and the set of states reduced to $S = \{start, other\}$ . Each transition is labeled with the action followed by the probability of the transition probability and the reward received after taking that action. $R_{1}, R_{2}$ , and $R_{3}$ are real numbers indicating the reward associated to each transition (case of deterministic reward).

Moreover, we will show that for any MDP there exists a deterministic optimal policy. To do so, it is convenient to introduce the notion of state-action value function.

Definition 17.5 (State-action value function) The state-action value function $Q$ associated to a policy $\pi$ is defined for all $(s, a) \in S \times A$ as the expected return for taking action $a \in A$ at state $s \in S$ and then following policy π:

$$
\begin{array}{c} Q_{\pi}(s, a) = \mathbb{E}[r(s, a)] + \underset{a_{t} \sim \pi(s_{t})}{\mathbb{E}} \left[\sum_{t = 1}^{+ \infty} \gamma^{t} r \big(s_{t}, a_{t} \big) \Big | s_{0} = s, a_{0} = a \right] \\ = \mathbb{E} \left[r(s, a) + \gamma V_{\pi}(s_{1}) \Big | s_{0} = s, a_{0} = a \right].\end{array}\tag{17.1}
$$

Observe that $\mathbb{E}_{a \sim \pi(s)} \left[Q_{\pi}(s, a) \right] = V_{\pi}(s)$ (see also proposition 17.9)

Theorem 17.6 (Policy improvement theorem) For any two policies $\pi$ and $\pi^{\prime}$ the following holds:

$$
\Big(\forall s \in S, \underset{a \sim \pi^{\prime}(s)}{\mathbb{E}} \left[Q_{\pi}(s, a) \right] \geq \underset{a \sim \pi(s)}{\mathbb{E}} \left[Q_{\pi}(s, a) \right] \Big) \Rightarrow \Big(\forall s \in S, V_{\pi^{\prime}}(s) \geq V_{\pi}(s) \Big).
$$

Furthermore, a strict inequality for at least one state s in the left-hand side implies a strict inequality for at least one s in the right-hand side.

Proof: Assume that $\pi$ and $\pi^{\prime}$ verify the left-hand side. For any $s \in S$ , we have

$$
\begin{array}{l} V_{\pi}(s) = \underset{a \sim \pi(s)}{\mathbb{E}} \left[Q_{\pi}(s, a) \right] \\ \leq \underset{a \sim \pi^{\prime}(s)}{\mathbb{E}} \left[Q_{\pi}(s, a) \right] \\ = \underset{a \sim \pi^{\prime}(s)}{\mathbb{E}} \left[r(s, a) + \gamma V_{\pi}(s_{1}) \Big | s_{0} = s \right] \\ = \underset{a \sim \pi^{\prime}(s)}{\mathbb{E}} \left[r(s, a) + \gamma \underset{a_{1} \sim \pi(s_{1})}{\mathbb{E}} \left[Q_{\pi}(s_{1}, a_{1}) \right] \Big | s_{0} = s \right] \\ \leq \underset{a \sim \pi^{\prime}(s)}{\mathbb{E}} \left[r(s, a) + \gamma \underset{a_{1} \sim \pi^{\prime}(s_{1})}{\mathbb{E}} \left[Q_{\pi}(s_{1}, a_{1}) \right] \Big | s_{0} = s \right] \\ = \underset{a_{1} \sim \pi^{\prime}(s_{1})}{\mathbb{E}} \left[r(s, a) + \gamma r(s_{1}, a_{1}) + \gamma^{2} V_{\pi}(s_{2}) \Big | s_{0} = s \right].\end{array}
$$

Proceeding in this way shows that for any $T \geq 1$

$$
V_{\pi}(s) \leq \underset{a_{t} \sim \pi^{\prime}(s_{t})}{\mathbb{E}} \left[\sum_{t = 0}^{T} \gamma^{t} \mathbb{E}[r(s_{t}, a_{t})] + \gamma^{T + 1} V_{\pi}(s_{T + 1}) \Big | s_{0} = s \right].
$$

Since $V_{\pi}(s_{T + 1})$ is bounded, taking the limit $T \to + \infty$ gives

$$
V_{\pi}(s) \leq \underset{a_{t} \sim \pi^{\prime}(s_{t})}{\mathbb{E}} \left[\sum_{t = 0}^{+ \infty} \gamma^{t} \mathbb{E}[r(s_{t}, a_{t})] \Big | s_{0} = s \right] = V_{\pi^{\prime}}(s).
$$

Finally, any strict inequality in the left-hand side property results in a strict inequality in the chain of inequalities above. $\square$

Theorem 17.7 (Bellman’s optimality condition) A policy $\pi$ is optimal if for any pair $(s, a) \in S \times A$ with $\pi(s)(a) > 0$ the following holds:

$$
a \in \operatorname{argmax}_{a^{\prime} \in A} Q_{\pi}(s, a^{\prime}).\tag{17.2}
$$

Proof: By Theorem 17.6, if the condition (17.2) does not hold for some $(s, a)$ with $\pi(s)(a) > 0$ , then the policy $\pi$ is not optimal. This is because $\pi$ can then be improved by defining $\pi^{\prime}$ such that $\pi^{\prime}(s^{\prime}) = \pi(s)$ for $s^{\prime} \neq s$ and $\pi^{\prime}(s)$ concentrated on any element of argma $\mathfrak{c}_{a^{\prime} \in A} Q_{\pi}(s, a^{\prime})$ $\pi^{\prime}$ verifies $\mathbb{E}_{a \sim \pi^{\prime}(s)} \left[Q_{\pi}(s^{\prime}, a) \right] =$ $\mathbb{E}_{a \sim \pi(s)} \left[Q_{\pi}(s^{\prime}, a) \right]$ for $s^{\prime} \neq s$ and $\mathbb{E}_{a \sim \pi^{\prime}(s)} \left[Q_{\pi}(s, a) \right] > \mathbb{E}_{a \sim \pi(s)} \left[Q_{\pi}(s, a) \right]$ . Thus, by Theorem $17.6, V_{\pi^{\prime}}(s) > V_{\pi}(s)$ for at least one s and $\pi$ is not optimal.

Conversely, let $\pi^{\prime}$ be a non-optimal policy. Then there exists a policy $\pi$ and at least one state s for which $V_{\pi^{\prime}}(s) < V_{\pi}(s)$ . By Theorem 17.6, this implies that there exists some state $s \in S$ with $\mathbb{E}_{a \sim \pi^{\prime}(s)} \left[Q_{\pi}(s, a) \right] < \mathbb{E}_{a \sim \pi(s)} \left[Q_{\pi}(s, a) \right]$ . Thus, $\pi^{\prime}$ cannot satisfy the condition (17.2). $\square$

Theorem 17.8 (Existence of an optimal deterministic policy) Any finite MDP admits an optimal deterministic policy.

Proof: Let $\pi^{*}$ be a deterministic policy maximizing $\textstyle \sum_{s \in S} V_{\pi}(s)$ $\pi^{*}$ exists since there are only finitely many deterministic policies. If $\pi^{*}$ were not optimal, by Theorem 17.7, there would exist a state s with $\pi(s) \notin$ argma $\mathfrak{c}_{a^{\prime} \in A} Q_{\pi}(s, a^{\prime})$ . By theorem $17.6, \ \pi^{*}$ could then be improved by choosing a policy π with $\pi(s) \in$ $\operatorname{argmax}_{a^{\prime} \in A} Q_{\pi}(s, a^{\prime})$ and $\pi$ coinciding with $\pi^{*}$ for all other states. But then $\pi$ would verify $V_{\pi *}(s) \leq V_{\pi}(s)$ with a strict inequality at least for one state. This would contradict the fact that $\pi^{*}$ maximizes $\textstyle \sum_{s \in S} V_{\pi}(s)$ $\square$

In view of the existence of a deterministic optimal policy, in what follows, to simplify the discussion, we will consider only deterministic policies. Let $\pi^{*}$ denote a (deterministic) optimal policy, and let $Q^{*}$ and $V^{*}$ denote its corresponding stateaction value function and value function. By Theorem 17.7, we can write

$$
\forall s \in S, \pi^{*}(s) = \underset{a \in A}{\operatorname{argmax}} Q^{*}(s, a).\tag{17.3}
$$

Thus, the knowledge of the state-action value function $Q^{*}$ is sufficient for the agent to determine the optimal policy, without any direct knowledge of the reward or transition probabilities. Replacing $Q^{*}$ by its definition gives the following system of equations for the optimal policy values $V^{*}(s) = Q^{*}(s, \pi^{*}(s))$

$$
\forall s \in S, V^{*}(s) = \max_{a \in A} \Bigl \{\mathbb{E}[r(s, a)] + \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} | s, a] V^{*}(s^{\prime}) \Bigr\},\tag{17.4}
$$

also known as Bellman equations. Note that this system of equations is not linear due to the presence of the max operator.

## 17.3.4 Policy evaluation

The value of a policy at state s can be expressed in terms of its values at other states, forming a system of linear equations.

Proposition 17.9 (Bellman equations) The values $V_{\pi}(s)$ of policy π at states $s \in S$ for an infinite horizon MDP obey the following system of linear equations:

$$
\forall s \in S, V_{\pi}(s) = \underset{a_{1} \sim \pi(s)}{\mathbb{E}}[r(s, a_{1})] + \gamma \sum_{s^{\prime}} \mathbb{P}[s^{\prime} | s, \pi(s)] V_{\pi}(s^{\prime}).\tag{17.5}
$$

Proof: We can decompose the expression of the policy value as a sum of the first term and the rest of the terms, which admit γ as a multiplier:

$$
\begin{array}{rl} & V_{\pi}(s) = \mathbb{E} \left[\sum_{t = 0}^{+ \infty} \gamma^{t} r \big(s_{t}, \pi(s_{t}) \big) \Bigg | s_{0} = s \right].\\ & \qquad = \mathbb{E}[r(s, \pi(s))] + \gamma \mathbb{E} \left[\sum_{t = 0}^{+ \infty} \gamma^{t} r \big(s_{t + 1}, \pi(s_{t + 1}) \big) \Bigg | s_{0} = s \right] \\ & \qquad = \mathbb{E}[r(s, \pi(s))] + \gamma \mathbb{E} \left[\sum_{t = 0}^{+ \infty} \gamma^{t} r \big(s_{t + 1}, \pi(s_{t + 1}) \big) \Bigg | s_{1} = \delta(s, \pi(s)) \right] \\ & \qquad = \mathbb{E}[r(s, \pi(s)] + \gamma \mathbb{E}[V_{\pi}(\delta(s, \pi(s)))].\end{array}
$$

This completes the proof.

This a linear system of equations, also known as Bellman equations, that is distinct from the non-linear system (17.4). The system can be rewritten as

$$
\mathbf{V} = \mathbb{R} + \gamma \mathbf{PV},\tag{17.6}
$$

using the following notation: P denotes the transition probability matrix defined by $\mathbb{P}_{s, s^{\prime}} = \mathbb{P}[s^{\prime} | s, \pi(s)]$ for all $s, s^{\prime} \in S;$ ; V is the value column matrix whose sth component is $\mathbf{V}_{s} = V_{\pi}(s)$ ; and R the reward column matrix whose sth component is $\mathbb{R}_{s} = \mathbb{E}[r(s, \pi(s)]$ . V is typically the unknown variable in the Bellman equations and is determined by solving for it.

The following theorem shows that, for a finite MDP, this system of linear equations admits a unique solution.

Theorem 17.10 For a finite MDP, Bellman’s equations admit a unique solution given by

$$
\mathbf{V}_{0} =(\mathbf{I} - \gamma \mathbb{P})^{- 1} \mathbb{R}.\tag{17.7}
$$

Proof: The Bellman equations (17.6) can be equivalently written as

$$
(\mathbf{I} - \gamma \mathbb{P}) \mathbf{V} = \mathbb{R}.
$$

Thus, to prove the theorem it sufices to show that $\left(\mathbf{I} - \gamma \mathbb{P} \right)$ is invertible. To do so, note that the infinity of P can be computed using its stochasticity properties:

$$
\| \mathbb{P} \|_{\infty} = \max_{s} \sum_{s^{\prime}} | \mathbb{P}_{ss^{\prime}} | = \max_{s} \sum_{s^{\prime}} \mathbb{P}[s^{\prime} | s, \pi(s)] = 1.
$$

This implies that $\| \gamma \mathbb{P} \|_{\infty} = \gamma < 1$ . The eigenvalues of $\gamma{\bf P}$ are thus all less than one, and $\left(\mathbf{I} - \gamma \mathbb{P} \right)$ is invertible. $\square$

Thus, for a finite MDP, when the transition probability matrix P and the reward expectations R are known, the value of policy π at all states can be determined by inverting a matrix.

## 17.4 Planning algorithms

In this section, we assume that the environment model is known. That is, the transition probability $\mathbb{P}[s^{\prime} | s, a]$ and the expected reward $\mathbb{E}[r(s, a)]$ for all $s, s^{\prime} \in S$ and $a \in A$ are assumed to be given. The problem of finding the optimal policy then does not require learning the parameters of the environment model or estimating other quantities helpful in determining the best course of actions, it is purely a planning problem.

This section discusses three algorithms for this planning problem: the value iteration algorithm, the policy iteration algorithm, and a linear programming formulation of the problem.

## 17.4.1 Value iteration

The value iteration algorithm seeks to determine the optimal policy values $V^{\ast}(s)$ at each state $s \in S$ , and thereby the optimal policy. The algorithm is based on the Bellman equations (17.4). As already indicated, these equations do not form a system of linear equations and require a different technique to determine the solution. The main idea behind the design of the algorithm is to use an iterative method to solve them: the new values of $V(s)$ are determined using the Bellman equations and the current values. This process is repeated until a convergence condition is met.

For a vector V in $\mathbb{R}^{| S |}$ , we denote by $V(s)$ its sth coordinate, for any $s \in S$ . Let $\Phi \colon \mathbb{R}^{| S |} \mathbb{R}^{| S |}$ be the mapping defined based on Bellman’s equations (17.4):

$$
\forall s \in S,[\boldsymbol{\Phi}(\mathbf{V})](s) = \max_{a \in A} \Big \{\mathbb{E}[r(s, a)] + \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} | s, a] V(s^{\prime}) \Big\}.\tag{17.8}
$$

The maximizing actions $a \in A$ in these equations define an action to take at each state $s \in S$ , that is a policy π. We can thus rewrite these equations in matrix terms as follows:

$$
\boldsymbol{\Phi}(\mathbf{V}) = \max_{\boldsymbol{\pi}} \{\mathbb{R}_{\boldsymbol{\pi}} + \gamma \mathbb{P}_{\boldsymbol{\pi}} \mathbf{V}\},\tag{17.9}
$$

where $\mathbb{P}_{\pi}$ is the transition probability matrix defined by $(\mathbb{P}_{\pi})_{ss^{\prime}} = \mathbb{P}[s^{\prime} | s, \pi(s)]$ for all $s, s^{\prime} \in S$ , and $\mathbb{R}_{\pi}$ the reward vector defined by $({\bf R}_{\pi})_{s} = \mathbb{E}[r(s, \pi(s)]$ , for all $s \in S$

The algorithm is directly based on (17.9). The pseudocode is given above. Starting from an arbitrary policy value vector $\mathbf{V}_{0} \in \mathbb{R}^{| S |}$ , the algorithm iteratively applies

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
VALUEITERATION($\mathbf{V}_0$)
1 $\mathbf{V} \leftarrow \mathbf{V}_0 \quad \triangleright \mathbf{V}_0$ arbitrary value
2 while $\| \mathbf{V} - \boldsymbol{\Phi}(\mathbf{V}) \| \geq \frac{(1-\gamma)\epsilon}{\gamma}$ do
3 $\mathbf{V} \leftarrow \boldsymbol{\Phi}(\mathbf{V})$
4 return $\boldsymbol{\Phi}(\mathbf{V})$
</div>

## Figure 17.4

Value iteration algorithm.

Φ to the current V to obtain a new policy value vector until $\begin{array}{r}{\| \mathbf{V} - \Phi(\mathbf{V}) \| < \frac{(1 - \gamma) \epsilon}{\gamma}} \end{array}$ • where $\epsilon > 0$ is a desired approximation. The following theorem proves the convergence of the algorithm to the optimal policy values.

Theorem 17.11 For any initial value $\mathbf{V}_{0}$ , the sequence defined by $\mathbf{V}_{n + 1} = \Phi(\mathbf{V}_{n})$ converges to $\mathbf{V}^{*}$

Proof: We first show that Φ is γ-Lipschitz for the $\| \cdot \|_{\infty}.^{23}$ For any $s \in S$ and $\mathbf{V} \in \mathbb{R}^{| S |}$ , let $a^{*}(s)$ be the maximizing action defining $\Phi({\mathbf V})(s)$ in (17.8). Then, for any $s \in S$ and any $\mathbf{U} \in \mathbb{R}^{| S |}$ ，

$$
\begin{array}{l} \boldsymbol{\Phi}(\mathbf{V})(s) - \boldsymbol{\Phi}(\mathbf{U})(s) \leq \boldsymbol{\Phi}(\mathbf{V})(s) - \Big(\mathbb{E}[r(s, a^{*}(s))] + \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} \mid s, a^{*}(s)] \mathbf{U}(s^{\prime}) \Big) \\ \qquad = \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} | s, a^{*}(s)][\mathbf{V}(s^{\prime}) - \mathbf{U}(s^{\prime})] \\ \qquad \leq \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} | s, a^{*}(s)] \| \mathbf{V} - \mathbf{U} \|_{\infty} = \gamma \| \mathbf{V} - \mathbf{U} \|_{\infty}.\end{array}
$$

Proceeding similarly with $\Phi({\mathbf{U}})(s) - \Phi({\mathbf{V}})(s)$ , we obtain $\Phi(\mathbf{U})(s) - \Phi(\mathbf{V})(s) \leq$ $\gamma \| \mathbf{V} - \mathbf{U} \|_{\infty}$ . Thus, $| \Phi(\mathbf{V})(s) - \Phi(\mathbf{U})(s) | \leq \gamma \| \mathbf{V} - \mathbf{U} \|_{\infty}$ for all s, which implies

$$
\| \boldsymbol{\Phi}(\mathbf{V}) - \boldsymbol{\Phi}(\mathbf{U}) \|_{\infty} \leq \gamma \| \mathbf{V} - \mathbf{U} \|_{\infty},
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/2d41e8928ba566da73cd5ed615a802ce9ef859bc937b581c2b1d2cf04e11cf54.jpg)  
Figure 17.5

Example of MDP with two states. The state set is reduced to $S = \{1, 2\}$ and the action set to $A = \{a, b, c, d\}$ . Only transitions with non-zero probabilities are represented. Each transition is labeled with the action taken followed by a pair $[p, r]$ after a slash separator, where $p$ is the probability of the transition and r the expected reward for taking that transition.

that is the γ-Lipschitz property of Φ. Now, by Bellman equations (17.4), ${\bf V}^{*} =$ $\Phi(\mathbf{V}^{*})$ , thus for any $n \in \mathbb{N}$

$$
\| \mathbf{V}^{*} - \mathbf{V}_{n + 1} \|_{\infty} = \| \boldsymbol{\Phi}(\mathbf{V}^{*}) - \boldsymbol{\Phi}(\mathbf{V}_{n}) \|_{\infty} \leq \gamma \| \mathbf{V}^{*} - \mathbf{V}_{n} \|_{\infty} \leq \gamma^{n + 1} \| \mathbf{V}^{*} - \mathbf{V}_{0} \|_{\infty},
$$

which proves the convergence of the sequence to $\mathbf{V}^{*}$ since $\gamma \in(0, 1)$

The $\epsilon$-optimality of the value returned by the algorithm can be shown as follows. By the triangle inequality and the γ-Lipschitz property of $\Phi.$ , for any $n \in \mathbb{N}$ 2

$$
\begin{array}{rl} &{\| \mathbf{V}^{*} - \mathbf{V}_{n + 1} \|_{\infty} \leq \| \mathbf{V}^{*} - \boldsymbol{\Phi}(\mathbf{V}_{n + 1}) \|_{\infty} + \| \boldsymbol{\Phi}(\mathbf{V}_{n + 1}) - \mathbf{V}_{n + 1} \|_{\infty}} \\ &{\qquad = \| \boldsymbol{\Phi}(\mathbf{V}^{*}) - \boldsymbol{\Phi}(\mathbf{V}_{n + 1}) \|_{\infty} + \| \boldsymbol{\Phi}(\mathbf{V}_{n + 1}) - \boldsymbol{\Phi}(\mathbf{V}_{n}) \|_{\infty}} \\ &{\qquad \leq \gamma \| \mathbf{V}^{*} - \mathbf{V}_{n + 1} \|_{\infty} + \gamma \| \mathbf{V}_{n + 1} - \mathbf{V}_{n} \|_{\infty}.} \end{array}
$$

Thus, if $\mathbf{V}_{n + 1}$ is the policy value returned by the algorithm, we have

$$
\| \mathbf{V}^{*} - \mathbf{V}_{n + 1} \|_{\infty} \leq \frac{\gamma}{1 - \gamma} \| \mathbf{V}_{n + 1} - \mathbf{V}_{n} \|_{\infty} \leq \epsilon.
$$

The convergence of the algorithm is in $O(\log \frac{1}{\epsilon})$ number of iterations. Indeed, observe that

$$
\left\| \mathbf{V}_{n + 1} - \mathbf{V}_{n} \right\|_{\infty} = \left\| \boldsymbol{\Phi}(\mathbf{V}_{n}) - \boldsymbol{\Phi}(\mathbf{V}_{n - 1}) \right\|_{\infty} \leq \gamma \left\| \mathbf{V}_{n} - \mathbf{V}_{n - 1} \right\|_{\infty} \leq \gamma^{n} \left\| \boldsymbol{\Phi}(\mathbf{V}_{0}) - \mathbf{V}_{0} \right\|_{\infty}.
$$

Thus, if n is the largest integer such that $\begin{array}{r}{\frac{(1 - \gamma) \epsilon}{\gamma} \leq \| \mathbf{V}_{n + 1} - \mathbf{V}_{n} \|_{\infty}} \end{array}$ , it must verify $\begin{array}{r}{\frac{(1 - \gamma) \epsilon}{\gamma} \leq \gamma^{n} \| \Phi(\mathbf{V}_{0}) - \mathbf{V}_{0} \|_{\infty}} \end{array}$ and therefore $n \leq O \big(\log{\frac{1}{\epsilon}} \big)$ .<sup>24</sup>

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
POLICYITERATION( $\pi_{0}$ )

1  $\pi \leftarrow \pi_{0} \quad \triangleright \pi_{0}$  arbitrary policy
2  $\pi' \leftarrow NIL$ 
3 while ( $\pi \neq \pi'$ ) do
4  $V \leftarrow V_{\pi} \quad \triangleright$  policy evaluation: solve  $(\mathbf{I} - \gamma\mathbb{P}_{\pi})\mathbf{V} = \mathbb{R}_{\pi}$ .
5  $\pi' \leftarrow \pi$ 
6  $\pi \leftarrow \arg\max_{\pi}\{\mathbb{R}_{\pi} + \gamma\mathbb{P}_{\pi}\mathbf{V}\} \quad \triangleright$  greedy policy improvement.
7 return  $\pi$
</div>

## Figure 17.6

Policy iteration algorithm.

Figure 17.5 shows a simple example of MDP with two states. The iterated values of these states calculated by the algorithm for that MDP are given by

$$
\begin{array}{l} \mathbf{V}_{n + 1}(1) = \max \Big \{2 + \gamma \Big(\frac{3}{4} \mathbf{V}_{n}(1) + \frac{1}{4} \mathbf{V}_{n}(2) \Big), 2 + \gamma \mathbf{V}_{n}(2) \Big\} \\ \mathbf{V}_{n + 1}(2) = \max \Big \{3 + \gamma \mathbf{V}_{n}(1), 2 + \gamma \mathbf{V}_{n}(2) \Big\}.\end{array}
$$

For $\mathbf{V}_{0}(1) = - 1, \mathbf{V}_{0}(2) = 1$ , and $\gamma = 1 / 2$ , we obtain $\mathbf{V}_{1}(1) = \mathbf{V}_{1}(2) = 5 / 2$ . Thus, both states seem to have the same policy value initially. However, by the fifth iteration, $\mathbf{V}_{5}(1) = 4.53125, \mathbf{V}_{5}(2) = 5.15625$ and the algorithm quickly converges to the optimal values $\mathbf{V}^{*}(1) = 14 / 3$ and $\mathbf{V}^{*}(2) = 16 / 3$ showing that state 2 has a higher optimal value.

## 17.4.2 Policy iteration

An alternative algorithm for determining the best policy consists of using policy evaluations, which can be achieved via a matrix inversion, as shown by theorem 17.10. The pseudocode of the algorithm known as policy iteration algorithm is given in figure 17.6. Starting with an arbitrary action policy $\pi_{0}$ , the algorithm repeatedly computes the value of the current policy π via that matrix inversion and greedily selects the new policy as the one maximizing the right-hand side of the Bellman equations (17.9).

The following theorem proves the convergence of the policy iteration algorithm.

Theorem 17.12 Let $(\mathbf{V}_{n})_{n \in \mathbb{N}}$ be the sequence of policy values computed by the algorithm, then, for any $n \in \mathbb{N}$ , the following inequalities hold:

$$
\mathbf{V}_{n} \leq \mathbf{V}_{n + 1} \leq \mathbf{V}^{*}.\tag{17.10}
$$

Proof: Let $\pi_{n + 1}$ be the policy improvement at the nth iteration of the algorithm. We first show that $(\mathbf{I} - \gamma \mathbb{P}_{\pi_{n + 1}})^{- 1}$ preserves ordering, that is, for any column matrices X and Y in $\mathbb{R}^{| S |}$ , if $\left(\mathbf{Y} - \mathbf{X} \right) \geq \mathbf{0}$ , then $(\mathbf{I} - \gamma \mathbb{P}_{\pi_{n + 1}})^{- 1}(\mathbf{Y} - \mathbf{X}) \geq \mathbf{0}$ As shown in the proof of theorem 17.10, $\| \gamma \mathbb{P} \|_{\infty} = \gamma < 1$ . Since the radius of convergence of the power series $(1 - x)^{- 1}$ is one, we can use its expansion and write

$$
(\mathbf{I} - \gamma \mathbb{P}_{\pi_{n + 1}})^{- 1} = \sum_{k = 0}^{\infty}(\gamma \mathbb{P}_{\pi_{n + 1}})^{k}.
$$

Thus, if $\mathbf{Z} = \left(\mathbf{Y} - \mathbf{X} \right) \geq \mathbf{0}$ , then $\begin{array}{r}{(\mathbf{I} - \gamma \mathbb{P}_{\pi_{n + 1}})^{- 1} \mathbf{Z} = \sum_{k = 0}^{\infty}(\gamma \mathbb{P}_{\pi_{n + 1}})^{k} \mathbf{Z} \geq \mathbf{0}} \end{array}$ , since the entries of matrix $\mathbb{P}_{\pi_{n + 1}}$ and its powers are all non-negative as well as those of Z.

Now, by definition of $\pi_{n + 1}$ , we have

$$
\mathbb{R}_{\pi_{n + 1}} + \gamma \mathbb{P}_{\pi_{n + 1}} \mathbf{V}_{n} \geq \mathbb{R}_{\pi_{n}} + \gamma \mathbb{P}_{\pi_{n}} \mathbf{V}_{n} = \mathbf{V}_{n},
$$

which shows that $\mathbb{R}_{\pi_{n + 1}} \geq(\mathbf{I} - \gamma \mathbb{P}_{\pi_{n + 1}}) \mathbf{V}_{n}$ . Since $(\mathbf{I} - \gamma \mathbb{P}_{\pi_{n + 1}})^{- 1}$ preserves ordering, this implies that $\mathbf{V}_{n + 1} =(\mathbf{I} - \gamma \mathbb{P}_{\pi_{n + 1}})^{- 1} \mathbb{R}_{\pi_{n + 1}} \geq \mathbf{V}_{n}$ which concludes the proof of the theorem. $\square$

Note that two consecutive policy values can be equal only at the last iteration of the algorithm. The total number of possible policies is $| A |^{| S |}$ , thus this constitutes a straightforward upper bound on the maximal number of iterations. Better upper bounds of the form ${\overset{\cdot \cdot}{O}}{\big(}{\frac{| A |^{| S |}}{| S |}}{\big)}$ are known for this algorithm.

For the simple MDP shown by figure 17.5, let the initial policy $\pi_{0}$ be defined by $\pi_{0}(1) = b, \pi_{0}(2) = c$ . Then, the system of linear equations for evaluating this policy is

$$
\left\{\begin{array}{l} V_{\pi_{0}}(1) = 1 + \gamma V_{\pi_{0}}(2) \\ V_{\pi_{0}}(2) = 2 + \gamma V_{\pi_{0}}(2), \end{array} \right.
$$

which gives $\begin{array}{r}{V_{\pi_{0}}(1) = \frac{1 + \gamma}{1 - \gamma}} \end{array}$ and $\begin{array}{r}{V_{\pi_{0}}(2) = \frac{2}{1 - \gamma}} \end{array}$

Theorem 17.13 Let $(\mathbf{U}_{n})_{n \in \mathbb{N}}$ be the sequence of policy values generated by the value iteration algorithm, and $(\mathbf{V}_{n})_{n \in \mathbb{N}}$ the one generated by the policy iteration algorithm. If $\mathbf{U}_{0} = \mathbf{V}_{0}$ , then,

$$
\forall n \in \mathbb{N}, \mathbf{U}_{n} \leq \mathbf{V}_{n} \leq \mathbf{V}^{*}.\tag{17.11}
$$

Proof: We first show that the function Φ previously introduced is monotonic. Let U and V be such that $\mathbf{U} \leq \mathbf{V}$ and let $\pi$ be the policy such that $\pmb{\Phi}(\mathbf{U}) = \mathbb{R}_{\pi} + \gamma \mathbb{P}_{\pi} \mathbf{U}$

Then,

$$
\boldsymbol{\Phi}(\mathbf{U}) \leq \mathbb{R}_{\pi} + \gamma \mathbb{P}_{\pi} \mathbf{V} \leq \max_{\pi^{\prime}} \left\{\mathbb{R}_{\pi^{\prime}} + \gamma \mathbb{P}_{\pi^{\prime}} \mathbf{V} \right\} = \boldsymbol{\Phi}(\mathbf{V}).
$$

The proof is by induction on n. Assume that ${\mathbf U}_{n} \le{\mathbf V}_{n}$ , then by the monotonicity of Φ, we have

$$
\mathbf{U}_{n + 1} = \boldsymbol{\Phi}(\mathbf{U}_{n}) \leq \boldsymbol{\Phi}(\mathbf{V}_{n}) = \max_{\pi} \{\mathbb{R}_{\pi} + \gamma \mathbb{P}_{\pi} \mathbf{V}_{n}\}.
$$

Let $\pi_{n + 1}$ be the maximizing policy, that is, $\pi_{n + 1} = \operatorname{argmax}_{\boldsymbol \pi} \{\mathbb{R}_{\boldsymbol \pi} + \gamma \mathbb{P}_{\boldsymbol \pi} \mathbf{V}_{n}\}$ . Then,

$$
\boldsymbol{\Phi}(\mathbf{V}_{n}) = \mathbb{R}_{\pi_{n + 1}} + \gamma \mathbb{P}_{\pi_{n + 1}} \mathbf{V}_{n} \leq \mathbb{R}_{\pi_{n + 1}} + \gamma \mathbb{P}_{\pi_{n + 1}} \mathbf{V}_{n + 1} = \mathbf{V}_{n + 1},
$$

and thus ${\bf U}_{n + 1} \le{\bf V}_{n + 1}$

The theorem shows that the policy iteration algorithm converges in a smaller number of iterations than the value iteration algorithm due to the optimal policy. But, each iteration of the policy iteration algorithm requires computing a policy value, that is, solving a system of linear equations, which is more expensive to compute than an iteration of the value iteration algorithm.

## 17.4.3 Linear programming

An alternative formulation of the optimization problem defined by the Bellman equations (17.4) or the proof of Theorem 17.8 is via linear programming (LP), that is an optimization problem with a linear objective function and linear constraints. LPs admit (weakly) polynomial-time algorithmic solutions. There exist a variety of different methods for solving relatively large LPs in practice, using the simplex method, interior-point methods, or a variety of special-purpose solutions. All of these methods could be applied in this context.

By definition, the equations (17.4) are each based on a maximization. These maximizations are equivalent to seeking to minimize all elements of $\{V(s) \colon s \in S\}$ under the constraints $\begin{array}{r}{V(s) \ge \mathbb{E}[r(s, a)] + \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} | s, a] V(s^{\prime}),(s \in S)} \end{array}$ . Thus, this can be written as the following LP for any set of fixed positive weights $\alpha(s) > 0$ $(s \in S)$ :

$$
\begin{array}{rl} &{\underset{\mathbf{V}}{\min} \sum_{s \in S} \alpha(s) V(s)} \\{\mathrm{subjectto}} &{\forall s \in S, \forall a \in A, V(s) \geq \mathbb{E}[r(s, a)] + \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} | s, a] V(s^{\prime}),} \end{array}\tag{17.12}
$$

where $\mathbf{\nabla}_{\alpha > 0}$ is the vector with the sth component equal to $\alpha(s).^{25}$ To make each coeficient $\alpha(s)$ interpretable as a probability, we can further add the constraints that $\begin{array}{r}{\sum_{s \in S} \alpha(s) = 1} \end{array}$ . The number of rows of this LP is $| S | | A |$ and its number of columns S . The complexity of the solution techniques for LPs is typically more favorable in terms of the number of rows than the number of columns. This motivates a solution based on the equivalent dual formulation of this LP which can be written as

$$
\begin{array}{ll} \underset{\mathbf{x}}{\max} & \sum_{s \in S, a \in A} \mathbb{E}[r(s, a)] x(s, a) \\ \text{subject to} & \forall s \in S, \sum_{a \in A} x(s^{\prime}, a) = \alpha(s^{\prime}) + \gamma \sum_{s \in S, a \in A} \mathbb{P}[s^{\prime} | s, a] x(s^{\prime}, a) \\ & \forall s \in S, \forall a \in A, x(s, a) \geq 0, \end{array}\tag{17.13}
$$

and for which the number of rows is only S and the number of columns $| S | | A |$ Here $x(s, a)$ can be interpreted as the probability of being in state s and taking action a.

## 17.5 Learning algorithms

This section considers the more general scenario where the environment model of an MDP, that is the transition and reward probabilities, is unknown. This matches many realistic applications of reinforcement learning where, for example, a robot is placed in an environment that it needs to explore in order to reach a specific goal.

How can an agent determine the best policy in this context? Since the environment models are not known, it may seek to learn them by estimating transition or reward probabilities. To do so, as in the standard case of supervised learning, the agent needs some amount of training information. In the context of reinforcement learning with MDPs, the training information is the sequence of immediate rewards the agent receives based on the actions it has taken.

There are two main learning approaches that can be adopted. One known as the model-free approach consists of learning an action policy directly. Another one, a model-based approach, consists of first learning the environment model, and then of using that to learn a policy. The Q-learning algorithm we present for this problem is widely adopted in reinforcement learning and belongs to the family of model-free approaches.

The estimation and algorithmic methods adopted for learning in reinforcement learning are closely related to the concepts and techniques in stochastic approximation. Thus, we start by introducing several useful results of this field that will be needed for the proofs of convergence of the reinforcement learning algorithms presented.

## 17.5.1 Stochastic approximation

Stochastic approximation methods are iterative algorithms for solving optimization problems whose objective function is defined as the expectation of some random variable, or to find the fixed point of a function H that is accessible only through noisy observations. These are precisely the type of optimization problems found in reinforcement learning. For example, for the Q-learning algorithm we will describe, the optimal state-action value function $Q^{*}$ is the fixed point of some function H that is defined as an expectation and thus not directly accessible.

We start with a basic result whose proof and related algorithm show the flavor of more complex ones found in stochastic approximation. The theorem is a generalization of a result known as the strong law of large numbers. It shows that under some conditions on the coeficients, an iterative sequence of estimates $\mu_{m}$ converges almost surely (a.s.) to the mean of a bounded random variable.

Theorem 17.14 (Mean estimation) Let X be a random variable taking values in [0, 1] and let $x_{0}, \ldots, x_{m}$ be i.i.d. values of X. Define the sequence $(\mu_{m})_{m \in \mathbb{N}}$ by

$$
\mu_{m + 1} =(1 - \alpha_{m}) \mu_{m} + \alpha_{m} x_{m},\tag{17.14}
$$

with $\begin{array}{r}{\mu_{0} = x_{0}, \ \alpha_{m} \in[0, 1], \ \sum_{m \geq 0} \alpha_{m} = + \infty \and \sum_{m \geq 0} \alpha_{m}^{2} < + \infty} \end{array}$ . Then,

$$
\mu_{m} \xrightarrow{a.s.} \mathbb{E}[X].\tag{17.15}
$$

Proof: We give the proof of the $L_{2}$ convergence. The a.s. convergence is shown later for a more general theorem. By the independence assumption, for $m \geq 0$ ,

$$
\operatorname{Var}[\mu_{m + 1}] =(1 - \alpha_{m})^{2} \operatorname{Var}[\mu_{m}] + \alpha_{m}^{2} \operatorname{Var}[x_{m}] \leq(1 - \alpha_{m}) \operatorname{Var}[\mu_{m}] + \alpha_{m}^{2}.\tag{17.16}
$$

Let $\epsilon > 0$ and suppose that there exists $N \in \mathbb N$ such that for all $m \geq N$ , Va $\cdot[\mu_{m}] \geq \epsilon$ Then, for $m \geq N$ ,

$$
\operatorname{Var}[\mu_{m + 1}] \leq \operatorname{Var}[\mu_{m}] - \alpha_{m} \operatorname{Var}[\mu_{m}] + \alpha_{m}^{2} \leq \operatorname{Var}[\mu_{m}] - \alpha_{m} \epsilon + \alpha_{m}^{2},
$$

which implies, by reapplying this inequality, that

$$
\operatorname{Var}[\mu_{m + N}] \leq \underbrace{\operatorname{Var}[\mu_{N}] - \epsilon \sum_{n = N}^{m + N} \alpha_{n} + \sum_{n = N}^{m + N} \alpha_{n}^{2}}_{\rightarrow - \infty \text{when} m \rightarrow \infty},
$$

contradicting $\operatorname{Var}[\mu_{m + N}] ~ \geq ~ 0$ . Thus, this contradicts the existence of such an integer N. Therefore, for all $N \in \mathbb N$ , there exists $m_{0} \geq N$ such that $\operatorname{Var}[\mu_{m_{0}}] \leq \epsilon.$

Choose N large enough so that for all $m \geq N$ , the inequality $\alpha_{m} \leq \epsilon$ holds. This is possible since the sequence $(\alpha_{m}^{2})_{m \in \mathbb{N}}$ and thus $(\alpha_{m})_{m \in \mathbb{N}}$ converges to zero in view of $\textstyle \sum_{m \geq 0} \alpha_{m}^{2} < + \infty$ . We will show by induction that for any $m \geq m_{0}$ $\operatorname{Var}[\mu_{m}] \leq \epsilon.$ , which implies the statement of the theorem.

Assume that $\operatorname{Var}[\mu_{m}] ~ \leq ~ \epsilon$ for some m $\ge ~ m_{0}$ . Then, using this assumption, inequality 17.16, and the fact that $\alpha_{m} \leq \epsilon$ , the following inequality holds:

$$
\operatorname{Var}[\mu_{m + 1}] \leq(1 - \alpha_{m}) \epsilon + \epsilon \alpha_{m} = \epsilon.
$$

Thus, this proves that $\begin{array}{r}{\operatorname{lim}_{m + \infty} \operatorname{Var}[\mu_{m}] = 0} \end{array}$ , that is the $L_{2}$ convergence of $\mu_{m}$ to $\mathbb{E}[X]$ $\square$

Note that the hypotheses of the theorem related to the sequence $(\alpha_{m})_{m \in \mathbb{N}}$ hold in particular when $\begin{array}{r}{\alpha_{m} = \frac{1}{m}} \end{array}$ . The special case of the theorem with this choice of $\alpha_{m}$ coincides with the strong law of large numbers. This result has tight connections with the general problem of stochastic optimization.

Stochastic optimization is the general problem of finding the solution to the equation

$$
\mathbf{x} = H(\mathbf{x}),
$$

where $\mathbf{x} \in \mathbb{R}^{N}$ , when

$H(x)$ cannot be computed, for example, because H is not accessible or because the cost of its computation is prohibitive;

but an i.i.d. sample of m noisy observations $H(\mathbf{x}_{i}) + \mathbf{w}_{i}$ are available, $i \in[m]$ where the noise random variable w has expectation zero: $\mathbb{E}[\mathbf{w}] = \mathbf{0}$

This problem arises in a variety of different contexts and applications. As we shall see, it is directly related to the learning problem for MDPs.

One general idea for solving this problem is to use an iterative method and define a sequence $(\mathbf{x}_{t})_{t \in \mathbb{N}}$ in a way similar to what is suggested by theorem 17.14:

$$
\mathbf{x}_{t + 1} =(1 - \alpha_{t}) \mathbf{x}_{t} + \alpha_{t}[H(\mathbf{x}_{t}) + \mathbf{w}_{t}]\tag{17.17}
$$

$$
= \mathbf{x}_{t} + \alpha_{t}[H(\mathbf{x}_{t}) + \mathbf{w}_{t} - \mathbf{x}_{t}],\tag{17.18}
$$

where $(\alpha_{t})_{t \in \mathbb{N}}$ follow conditions similar to those assumed in theorem 17.14. More generally, we consider sequences defined via

$$
\mathbf{x}_{t + 1} = \mathbf{x}_{t} + \alpha_{t} D(\mathbf{x}_{t}, \mathbf{w}_{t}),\tag{17.19}
$$

where D is a function mapping $\mathbb{R}^{N} \times \mathbb{R}^{N}$ to $\mathbb{R}^{N}$ . There are many different theorems guaranteeing the convergence of this sequence under various assumptions. We will present one of the most general forms of such theorems, which relies on the following result.

Theorem 17.15 (Supermartingale convergence) Let $(X_{t})_{t \in \mathbb{N}}, \(Y_{t})_{t \in \mathbb{N}}.$ , and $(Z_{t})_{t \in \mathbb{N}}$ be sequences of non-negative random variables such that $\textstyle \sum_{t = 0}^{+ \infty} Y_{t} ~ < ~ + \infty$ . Let $\mathcal{F}_{t}$ denote all the information for $t^{\prime} \leq t \colon \mathcal{F}_{t} = \{(X_{t^{\prime}})_{t^{\prime} \leq t},(Y_{t^{\prime}})_{t^{\prime} \leq t},(Z_{t^{\prime}})_{t^{\prime} \leq t}\}$ . Then, if E $\left[{{X}_{t + 1}} \middle |{{\mathcal F}_{t}} \right] \leq{X}_{t} +{Y}_{t} -{Z}_{t}$ , the following holds:

$X_{t}$ converges to a limit (with probability one).

$\begin{array}{r}{\sum_{t = 0}^{+ \infty} Z_{t} < + \infty.} \end{array}$

The following is one of the most general forms of such theorems.

Theorem 17.16 Let D be a function mapping $\mathbb{R}^{N} \times \mathbb{R}^{N}$ to $\mathbb{R}^{N}, \mathbf{\Psi}(\mathbf{w}_{t})_{t \in \mathbb{N}}$ a sequence of random variables in $\mathbb{R}^{N}, \(\alpha_{t})_{t \in \mathbb{N}}$ a sequence of real numbers, and $\left(\mathbf{x}_{t} \right)_{t \in \mathbb{N}} \a$ sequence defined by $\mathbf{x}_{t + 1} = \mathbf{x}_{t} + \alpha_{t} D(\mathbf{x}_{t}, \mathbf{w}_{t})$ with $\mathbf{x}_{0} \in \mathbb{R}^{N}$ . Let $\mathcal{F}_{t}$ denote the entire history up to t, that is: $\mathcal{F}_{t} = \left\{(\mathbf{x}_{t^{\prime}})_{t^{\prime} \leq t},(\mathbf{w}_{t^{\prime}})_{t^{\prime} \leq t - 1},(\alpha_{t^{\prime}})_{t^{\prime} \leq t} \right\}$ , and let Ψ denote the function $\begin{array}{r}{\mathbf{x} \frac{1}{2} \Vert \mathbf{x} - \mathbf{x}^{*} \Vert_{2}^{2}} \end{array}$ for some $\mathbf{x}^{*} \in \mathbb{R}^{N}$ . Assume that D and $(\alpha)_{t \in \mathbb{N}}$ verify the following conditions:

$$
\bullet \exists K_{1}, K_{2} \in \mathbb{R}: \mathbb{E} \left[\| D(\mathbf{x}_{t}, \mathbf{w}_{t}) \|_{2}^{2} \mid \mathcal{F}_{t} \right] \leq K_{1} + K_{2} \Psi(\mathbf{x}_{t});
$$

$$
\bullet \exists c \geq 0 \colon \nabla \Psi(\mathbf{x}_{t})^{\top} \mathbb{E} \left[D(\mathbf{x}_{t}, \mathbf{w}_{t}) \mid \mathcal{F}_{t} \right] \leq - c \Psi(\mathbf{x}_{t});
$$

$$
\bullet \alpha_{t} > 0, \sum_{t = 0}^{+ \infty} \alpha_{t} = + \infty, \sum_{t = 0}^{+ \infty} \alpha_{t}^{2} < + \infty.
$$

Then, the sequence $\mathbf{x}_{t}$ converges almost surely to $\mathbf{x}^{*}$ :

$$
\mathbf{X}_{t} \xrightarrow{a.s.} \mathbf{X}^{*}.\tag{17.20}
$$

Proof: Since function Ψ is quadratic, a Taylor expansion gives

$$
\Psi(\mathbf{x}_{t + 1}) = \Psi(\mathbf{x}_{t}) + \nabla \Psi(\mathbf{x}_{t})^{\top}(\mathbf{x}_{t + 1} - \mathbf{x}_{t}) + \frac{1}{2}(\mathbf{x}_{t + 1} - \mathbf{x}_{t})^{\top} \nabla^{2} \Psi(\mathbf{x}_{t})(\mathbf{x}_{t + 1} - \mathbf{x}_{t}).
$$

Thus,

$$
\begin{array}{rl} &{\mathbb{E} \left[\Psi(\mathbf{x}_{t + 1}) | \mathcal{F}_{t} \right] = \Psi(\mathbf{x}_{t}) + \alpha_{t} \nabla \Psi(\mathbf{x}_{t})^{\top} \mathbb{E} \left[D(\mathbf{x}_{t}, \mathbf{w}_{t}) | \mathcal{F}_{t} \right] + \frac{\alpha_{t}^{2}}{2} \mathbb{E} \left[\| D(\mathbf{x}_{t}, \mathbf{w}_{t}) \|^{2} | \mathcal{F}_{t} \right]} \\ &{\qquad \leq \Psi(\mathbf{x}_{t}) - \alpha_{t} c \Psi(\mathbf{x}_{t}) + \frac{\alpha_{t}^{2}}{2}(K_{1} + K_{2} \Psi(\mathbf{x}_{t}))} \\ &{\qquad = \Psi(\mathbf{x}_{t}) + \frac{\alpha_{t}^{2} K_{1}}{2} - \left(\alpha_{t} c - \frac{\alpha_{t}^{2} K_{2}}{2}\right) \Psi(\mathbf{x}_{t}).} \end{array}
$$

Since by assumption the series $\textstyle \sum_{t = 0}^{+ \infty} \alpha_{t}^{2}$ is convergent, $\left(\alpha_{t}^{2} \right)$ and thus $(\alpha_{t})_{t}$ converges to zero. Therefore, for t suficiently large, the term $\begin{array}{r}{\left(\alpha_{t} c - \frac{\alpha_{t}^{2} K_{2}}{2} \right) \Psi \left(\mathbf{x}_{t} \right)} \end{array}$ has the sign of $\alpha_{t} c \Psi(\mathbf{x}_{t})$ and is non-negative, since $\alpha_{t} ~ > ~ 0, ~ \Psi({\bf x}_{t}) ~ \ge ~ 0$ , and $c > 0$ . Thus, by the supermartingale convergence theorem 17.15, $\Psi(\mathbf{x}_{t})$ converges and $\begin{array}{r}{\sum_{t = 0}^{+ \infty} \big(\alpha_{t} c - \frac{\alpha_{t}^{2} K_{2}}{2} \big) \Psi(\mathbf{x}_{t}) < + \infty} \end{array}$ . Since $\Psi(\mathbf{x}_{t})$ converges and $\textstyle \sum_{t = 0}^{+ \infty} \alpha_{t}^{2} <$ $+ \infty.$ , we have $\begin{array}{r}{\sum_{t = 0}^{+ \infty} \frac{\alpha_{t}^{2} K_{2}}{2} \Psi({\bf x}_{t}) < + \infty} \end{array}$ . But, since $\textstyle \sum_{t = 0}^{+ \infty} \alpha_{t} = + \infty$ , if the limit of $\Psi({\bf x}_{t})$ were non-zero, we would have $\begin{array}{r}{\sum_{t = 0}^{+ \infty} \alpha_{t} c \Psi(\mathbf{x}_{t}) = + \infty} \end{array}$ . This implies that the limit of $\Psi(\mathbf{x}_{t})$ is zero, that is $\begin{array}{r}{\operatorname{lim}_{t \to \infty} \| \mathbf{x}_{t} - \mathbf{x}^{*} \|_{2} \to 0} \end{array}$ , which implies $\mathbf{x}_{t} \xrightarrow{\mathrm{a.s.}} \mathbf{x}^{*}$ $\square$

The following is another related result for which we do not present the full proof.

Theorem 17.17 Let H be a function mapping $\mathbb{R}^{N}$ to $\mathbb{R}^{N},(\mathbf{w}_{t})_{t \in \mathbb{N}}$ a sequence of random variables in $\mathbb{R}^{N}, \(\alpha_{t})_{t \in \mathbb{N}}$ a sequence of real numbers, and $\left(\mathbf{x}_{t} \right)_{t \in \mathbb{N}}$ a sequence defined by

$$
\forall s \in[N], \quad \mathbf{x}_{t + 1}(s) = \mathbf{x}_{t}(s) + \alpha_{t}(s) \left[\mathbf{H}(\mathbf{x}_{t})(s) - \mathbf{x}_{t}(s) + \mathbf{w}_{t}(s) \right],
$$

for some $\mathbf{x}_{0} \in \mathbb{R}^{N}$ . Define $\mathcal{F}_{t}$ by $\mathcal{F}_{t} = \left\{(\mathbf{x}_{t^{\prime}})_{t^{\prime} \leq t},(\mathbf{w}_{t^{\prime}})_{t^{\prime} \leq t - 1}(\alpha_{t^{\prime}})_{t^{\prime} \leq t} \right\}$ , that is the entire history up to t, and assume that the following conditions are met:

$\mathbf{\nu}, \exists K_{1}, K_{2} \in \mathbb{R} \colon \mathbb{E} \left[\| \mathbf{w}_{t} \|^{2}(s) \bigm | \mathcal{F}_{t} \right] \leq K_{1} + K_{2} \| \mathbf{x}_{t} \|^{2}$ for some norm $\| \cdot \|,$

<sub>•</sub> E $\lceil \mathbf{w}_{t} \rceil \mathcal{F}_{t} \rceil = 0,$

$\begin{array}{r}{\forall s \in[N], \sum_{t = 0}^{+ \infty} \alpha_{t}(s) = + \infty, \sum_{t = 0}^{+ \infty} \alpha_{t}^{2}(s) < + \infty;} \end{array}$ and

<sub>•</sub> H is $a \parallel \cdot \parallel_{\infty}$ -contraction with fixed point $\mathbf{x}^{*}$ .

Then, the sequence $\mathbf{x}_{t}$ converges almost surely to $\mathbf{x}^{*}$ :

$$
\mathbf{X}_{t} \xrightarrow{a.s.} \mathbf{X}^{*}.\tag{17.21}
$$

The next sections present several learning algorithms for MDPs with an unknown model.

## 17.5.2 TD(0) algorithm

This section presents an algorithm, TD(0) algorithm, for evaluating a policy in the case where the environment model is unknown. The algorithm is based on Bellman’s linear equations giving the value of a policy $\pi$ (see proposition 17.9):

$$
\begin{array}{c} V_{\pi}(s) = \mathbb{E}[r(s, \pi(s)] + \gamma \sum_{s^{\prime}} \mathbb{P}[s^{\prime} | s, \pi(s)] V_{\pi}(s^{\prime}) \\ = \mathbb{E}_{s^{\prime}} \left[r(s, \pi(s)) + \gamma V_{\pi}(s^{\prime}) | s \right].\end{array}
$$

However, here the probability distribution according to which this last expectation is defined is not known. Instead, the TD(0) algorithm consists of

<sub>•</sub> sampling a new state $s^{\prime}{\mathrm{;}}$ and

<sub>•</sub> updating the policy values according to the following, which justifies the name of the algorithm:

$$
\begin{array}{c} V(s) \leftarrow(1 - \alpha) V(s) + \alpha[r(s, \pi(s)) + \gamma V(s^{\prime})] \\ = V(s) + \alpha[\underbrace{r(s, \pi(s)) + \gamma V(s^{\prime}) - V(s)}_{\text{temporal difference of V values}}].\end{array}\tag{17.22}
$$

Here, the parameter α is a function of the number of visits to the state s.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
TD(0)()
1  $V \leftarrow V_{0} \triangleright$  initialization.
2 for  $t \leftarrow 0$  to T do
3  $s \leftarrow SELECTSTATE()$ 
4 for each step of epoch t do
5  $r' \leftarrow REWARD(s, \pi(s))$ 
6  $s' \leftarrow NEXTSTATE(\pi, s)$ 
7  $V(s) \leftarrow(1 - \alpha)V(s) + \alpha[r' + \gamma V(s')]$ 
8  $s \leftarrow s'$ 
9 return V
</div>

The pseudocode of the algorithm is given above. The algorithm starts with an arbitrary policy value vector $\mathbf{V}_{0}$ . An initial state is returned by <sup>SelectState</sup> at the beginning of each epoch. Within each epoch, the iteration continues until a final state is found. Within each iteration, action $\pi(s)$ is taken from the current state s following policy π. The new state $s^{\prime}$ reached and the reward $r^{\prime}$ received are observed. The policy value of state s is then updated according to the rule (17.22) and current state set to be $s^{\prime}$

The convergence of the algorithm can be proven using theorem 17.17. We will give instead the full proof of the convergence of the Q-learning algorithm, for which that of TD(0) can be viewed as a special case.

## 17.5.3 Q-learning algorithm

This section presents an algorithm for estimating the optimal state-action value function $Q^{*}$ in the case of an unknown model. Note that the optimal policy or policy value can be straightforwardly derived from $Q^{*}$ via: $\pi^{*}(s) = \operatorname{argmax}_{a \in A} Q^{*}(s, a)$ and $V^{*}(s) = \operatorname{max}_{a \in A} Q^{*}(s, a)$ . To simplify the presentation, we will assume a deterministic reward function.

The Q-learning algorithm is based on the equations giving the optimal stateaction value function $Q^{*} ~(17.1)$ :

$$
\begin{array}{c} Q^{*}(s, a) = \mathbb{E}[r(s, a)] + \gamma \sum_{s^{\prime} \in S} \mathbb{P}[s^{\prime} \mid s, a] V^{*}(s^{\prime}) \\ = \mathbb{E}_{s^{\prime}}[r(s, a) + \gamma \max_{a \in A} Q^{*}(s^{\prime}, a)].\end{array}
$$

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
Q-LEARNING(π)

1  $Q \leftarrow Q_{0}$  ▷ initialization, e.g.,  $Q_{0} = 0$ .

2 for  $t \leftarrow 0$  to T do

3  $s \leftarrow SELECTSTATE()$ 

4 for each step of epoch t do

5  $a \leftarrow SELECTACTION(\pi, s)$  ▷ policy π derived from Q, e.g., ε-greedy.

6  $r' \leftarrow REWARD(s, a)$ 

7  $s' \leftarrow NEXTSTATE(s, a)$ 

8  $Q(s, a) \leftarrow Q(s, a) + \alpha[r' + \gamma \max_{a'} Q(s', a') - Q(s, a)]$ 

9  $s \leftarrow s'$ 

10 return Q
</div>

As for the policy values in the previous section, the distribution model is not known. Thus, the Q-learning algorithm consists of the following main steps:

<sub>•</sub> sampling a new state $s^{\prime}{\mathrm{;}}$ and

<sub>•</sub> updating the policy values according to the following:

$$
Q(s, a) \leftarrow(1 - \alpha) Q(s, a) + \alpha[r(s, a) + \gamma \max_{a^{\prime} \in A} Q(s^{\prime}, a^{\prime})].\tag{17.23}
$$

where the parameter α is a function of the number of visits to the state s.

The algorithm can be viewed as a stochastic formulation of the value iteration algorithm presented in the previous section. The pseudocode is given above. Within each epoch, an action is selected from the current state s using a policy π derived from Q. The choice of the policy $\pi$ is arbitrary so long as it guarantees that every pair $(s, a)$ is visited infinitely many times. The reward received and the state $s^{\prime}$ observed are then used to update Q following (17.23).

Theorem 17.18 Consider a finite MDP. Assume that for all $s \in \S$ and $a \ \in \A$ $\begin{array}{r}{\sum_{t = 0}^{+ \infty} \alpha_{t}(s, a) = + \infty} \end{array}$ , and $\textstyle \sum_{t = 0}^{+ \infty} \alpha_{t}^{2}(s, a) < + \infty$ with $\alpha_{t}(s, a) \in[0, 1]$ . Then, the Q-learning algorithm converges to the optimal value $Q^{*}$ (with probability one).

Note that the conditions on $\alpha_{t}(s, a)$ impose that each state-action pair is visited infinitely many times.

Proof: Let $(Q_{t}(s, a))_{t \geq 0}$ denote the sequence of state-action value functions at $(s, a) \in S \times A$ generated by the algorithm. By definition of the Q-learning updates,

$$
Q_{t + 1}(s_{t}, a_{t}) = Q_{t}(s_{t}, a_{t}) + \alpha \big[r(s_{t}, a_{t}) + \gamma \max_{a^{\prime}} Q_{t}(s_{t + 1}, a^{\prime}) - Q_{t}(s_{t}, a_{t}) \big].
$$

This can be rewritten as the following for all $s \in S$ and $a \in A$

$$
\begin{array}{l} Q_{t + 1}(s, a) = Q_{t}(s, a) + \alpha_{t}(s, a) \left[r(s, a) + \gamma \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \left[\max_{a^{\prime}} Q_{t}(u, a^{\prime}) \right] - Q_{t}(s, a) \right] \\ + \gamma \alpha_{t}(s, a) \left[\max_{a^{\prime}} Q_{t}(s^{\prime}, a^{\prime}) - \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \left[\max_{a^{\prime}} Q_{t}(u, a^{\prime}) \right] \right], \end{array} \tag{17.24}
$$

if we define $s^{\prime} = \mathrm{NEXTSTATE}(s, a)$ and $\alpha_{t}(s, a)$ as 0 if $(s, a) \neq(s_{t}, a_{t})$ and $\alpha_{t}(s_{t}, a_{t})$ otherwise. Now, let $\mathbf{Q}_{t}$ denote the vector with components $Q_{t}(s, a)$ , $\mathbf{w}_{t}$ the vector whose $s^{\prime} 1$ th entry is

$$
w_{t}(s) = \max_{a^{\prime}} Q_{t}(s^{\prime}, a^{\prime}) - \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \left[\max_{a^{\prime}} Q_{t}(u, a^{\prime}) \right],
$$

and $\mathbf{H}(\mathbf{Q}_{t})$ the vector with components $\mathbf{H}(\mathbf{Q}_{t})(s, a)$ defined by

$$
\mathbf{H}(\mathbf{Q}_{t})(s, a) = r(s, a) + \gamma \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \left[\max_{a^{\prime}} Q_{t}(u, a^{\prime}) \right].
$$

Then, in view of (17.24),

$$
\forall(s, a) \in S \times A, \quad \mathbf{Q}_{t + 1}(s, a) = \mathbf{Q}_{t}(s, a) + \alpha_{t}(s, a) \left[\mathbf{H}(\mathbf{Q}_{t})(s, a) - \mathbf{Q}_{t}(s, a) + \gamma \mathbf{w}_{t}(s) \right].
$$

We now show that the hypotheses of theorem 17.17 hold for $\mathbf{Q}_{t}$ and $\mathbf{w}_{t}$ , which will imply the convergence of $\mathbf{Q}_{t}$ to $\mathbf{Q}^{*}$ . The conditions on $\alpha_{t}$ hold by assumption. By definition of $\mathbf{w}_{t}, \mathbb{E}[\mathbf{w}_{t} | \mathcal{F}_{t}] = 0$ . Also, for any $s^{\prime} \in S$ ,

$$
\begin{array}{rl} &{| \mathbf{w}_{t}(s) | \leq \max_{a^{\prime}} | Q_{t}(s^{\prime}, a^{\prime}) | + \bigg | \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \Big[\max_{a^{\prime}} Q_{t}(u, a^{\prime}) \Big] \bigg |} \\ &{\quad \leq 2 \max_{s^{\prime}} | \max_{a^{\prime}} Q_{t}(s^{\prime}, a^{\prime}) | = 2 \| \mathbf{Q}_{t} \|_{\infty}.} \end{array}
$$

Thus, <sup>E</sup> $\lceil \mathbf{w}_{t}^{2}(s) \rceil \mathcal{F}_{t} \rceil \leq 4 \| \mathbf{Q}_{t} \|_{\infty}^{2}$ . Finally, H is a γ-contraction for $\| \cdot \|_{\infty}$ since for any $\mathbf{Q}_{1}, \bar{\mathbf{Q}}_{2} \in \mathbb{R}^{| S | \times} \bar{|} A |$ , and $(s, a) \in S \times A$ , we can write

$$
\begin{array}{l} | \mathbf{H}(\mathbf{Q}_{2})(x, a) - \mathbf{H}(\mathbf{Q}_{1})(x, a) | = \bigg | \gamma \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \left[\underset{a^{\prime}}{\max} Q_{2}(u, a^{\prime}) - \underset{a^{\prime}}{\max} Q_{1}(u, a^{\prime}) \right] \bigg | \\ \leq \gamma \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \left[\left| \underset{a^{\prime}}{\max} Q_{2}(u, a^{\prime}) - \underset{a^{\prime}}{\max} Q_{1}(u, a^{\prime}) \right| \right] \\ \leq \gamma \underset{u \sim \mathbb{P}[\cdot | s, a]}{\mathbb{E}} \underset{a^{\prime}}{\max}[| Q_{2}(u, a^{\prime}) - Q_{1}(u, a^{\prime}) |] \\ \leq \gamma \underset{u}{\max} \underset{a^{\prime}}{\max}[| Q_{2}(u, a^{\prime}) - Q_{1}(u, a^{\prime}) |] \\ = \gamma \| \mathbf{Q}_{2} - \mathbf{Q}_{1} \|_{\infty}.\end{array}
$$

Since H is a contraction, it admits a fixed point $\mathbf{Q}^{*} \colon \mathbf{H}(\mathbf{Q}^{*}) = \mathbf{Q}^{*}$

The choice of the policy π according to which an action a is selected (line 5) is not specified by the algorithm and, as already indicated, the theorem guarantees the convergence of the algorithm for an arbitrary policy so long as it ensures that every pair $(s, a)$ is visited infinitely many times. In practice, several natural choices are considered for $\pi.$ . One possible choice is the policy determined by the state-action value at time $t, Q_{t}$ . Thus, the action selected from state s is $\arg \operatorname{max}_{a \in A} Q_{t}(s, a)$ But this choice typically does not guarantee that all actions are taken or that all states are visited. Instead, a standard choice in reinforcement learning is the socalled $\epsilon$-greedy policy, which consists of selecting with probability $(1 - \epsilon)$ the greedy action from state $s,$ that is, a $\operatorname{rgmax}_{a \in A} Q_{t}(s, a)$ , and with probability $\epsilon \mathrm{~ a ~}$ random action from $s,$ for some $\epsilon \in(0, 1)$ . Another possible choice is the so-called Boltzmann exploration, which, given the current state-action value $Q{\mathrm{.}}$ , epoch $t \in \{0, \ldots, T\}$ ， and current state $s,$ consists of selecting action a with the following probability:

$$
p_{t}(a | s, Q) = \frac{e^{\frac{Q(s, a)}{\tau_{t}}}}{\sum_{a^{\prime} \in A} e^{\frac{Q(s, a^{\prime})}{\tau_{t}}}},
$$

where $\tau_{t}$ is the temperature. $\tau_{t}$ must be defined so that $\tau_{t} 0$ as $t \to + \infty$ , which ensures that for large values of $t,$ the greedy action based on $Q$ is selected. This is natural, since as t increases, we can expect $Q$ to be close to the optimal function. $\mathrm{On}$ the other hand, $\tau_{t}$ must be chosen so that it does not tend to 0 too fast to ensure that all actions are visited infinitely often. It can be chosen, for instance, as $1 / \log(n_{t}(s))$ , where $n_{t}(s)$ is the number of times s has been visited up to epoch t.

Reinforcement learning algorithms include two components: a learning policy, which determines the action to take, and an update rule, which defines the new estimate of the optimal value function. For an of-policy algorithm, the update rule does not necessarily depend on the learning policy. Q-learning is an of-policy algorithm since its update rule (line 8 of the pseudocode) is based on the max operator and the comparison of all possible actions $a^{\prime},$ that is the greedy action, which may not coincide with the action recommended by the current the policy π. More generally, an of-policy algorithm evaluates or improves one policy, while acting based on another policy.

In contrast, the algorithm presented in the next section, SARSA, is an on-policy algorithm. An on-policy algorithm evaluates and improves the current policy used for control. It evaluates the return based on the algorithm’s policy.

## 17.5.4 SARSA

SARSA is also an algorithm for estimating the optimal state-action value function in the case of an unknown model. The pseudocode is given in figure 17.7. The algorithm is in fact very similar to Q-learning, except that its update rule (line 9 of the pseudocode) is based on the action $a^{\prime}$ selected by the learning policy. Thus, SARSA is an on-policy algorithm, and its convergence therefore crucially depends on the learning policy. In particular, the convergence of the algorithm requires, in addition to all actions being selected infinitely often, that the learning policy becomes greedy in the limit. The proof of the convergence of the algorithm is nevertheless close to that of Q-learning.

The name of the algorithm derives from the sequence of instructions defining successively $s, \a, \r^{\prime}, \s^{\prime},$ , and $a^{\prime},$ and the fact that the update to the function $Q$ depends on the quintuple $(s, a, r^{\prime}, s^{\prime}, a)$

## 17.5.5 TD(λ) algorithm

Both TD(0) and Q-learning algorithms are only based on immediate rewards. The idea of TD(λ) consists instead of using multiple steps ahead. Thus, for $n > 1$ steps, we would have the update

$$
V(s) \leftarrow V(s) + \alpha \left(R_{t}^{n} - V(s)\right),
$$

where $R_{t}^{n}$ is defined by

$$
R_{t}^{n} = r_{t + 1} + \gamma r_{t + 2} + \ldots + \gamma^{n - 1} r_{t + n} + \gamma^{n} V(s_{t + n}).
$$

How should n be chosen? Instead of selecting a specific n, TD(λ) is based on a geometric distribution over all rewards $R_{t}^{n}$ , that is, it uses $\begin{array}{r}{R_{t}^{\lambda} =(1 - \lambda) \sum_{n = 0}^{+ \infty} \lambda^{n} R_{t}^{n}} \end{array}$ instead of $R_{t}^{n}$ where $\lambda \in[0, 1]$ . Thus, the main update becomes

$$
V(s) \leftarrow V(s) + \alpha \left(R_{t}^{\lambda} - V(s)\right).
$$

The pseudocode of the algorithm is given above. For $\lambda = 0$ , the algorithm coincides with TD(0). λ = 1 corresponds to the total future reward.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
SARSA(π)
1  $Q \leftarrow Q_{0}$  ▷ initialization, e.g.,  $Q_{0} = 0$ .
2 for  $t \leftarrow 0$  to T do
3  $s \leftarrow \text{SELECTSTATE()}$ 
4  $a \leftarrow \text{SELECTACTION}(\pi(Q), s) \triangleright$  policy π derived from Q, e.g., ε-greedy.
5 for each step of epoch t do
6  $r' \leftarrow \text{REWARD}(s, a)$ 
7  $s' \leftarrow \text{NEXTSTATE}(s, a)$ 
8  $a' \leftarrow \text{SELECTACTION}(\pi(Q), s') \triangleright$  policy π derived from Q, e.g., ε-greedy.
9  $Q(s, a) \leftarrow Q(s, a) + \alpha_{t}(s, a)[r' + \gamma Q(s', a') - Q(s, a)]$ 
10  $s \leftarrow s'$ 
11  $a \leftarrow a'$ 
12 return Q
</div>

## Figure 17.7

The SARSA algorithm.

In the previous sections, we presented learning algorithms for an agent navigating in an unknown environment. The scenario faced in many practical applications is more challenging; often, the information the agent receives about the environment is uncertain or unreliable. Such problems can be modeled as partially observable Markov decision processes (POMDPs). POMDPs are defined by augmenting the definition of MDPs with an observation probability distribution depending on the action taken, the state reached, and the observation. The presentation of their model and solution techniques are beyond the scope of this material.

## 17.5.6 Large state space

In some cases in practice, the number of states or actions to consider for the environment may be very large. For example, the number of states in the game of backgammon is estimated to be over $10^{20}$ . Thus, the algorithms presented in the previous section can become computationally impractical for such applications. More importantly, generalization becomes extremely dificult.

Suppose we wish to estimate the policy value $V_{\pi}(s)$ at each state s using experience obtained using policy π. To cope with the case of large state spaces, we can map each state of the environment to $\mathbb{R}^{N}$ via a mapping Φ: S <sup>RN</sup> , with N relatively small $(N \approx 200$ has been used for backgammon) and approximate $V_{\pi}(s)$ by a function $f_{\mathbf{w}}(s)$ parameterized by some vector w. For example, $f_{\mathbf{w}}$ could be a linear function defined by $f_{\mathbf{w}}(s) = \mathbf{w} \cdot \pmb{\Phi}(s)$ for all $s \in S$ , or some more complex non-linear function of w. The problem then consists of approximating $V_{\pi}$ with $f_{\mathbf{w}}$ and can be formulated as a regression problem. Note, however, that the empirical data available is not i.i.d.

<div class="mineru-algorithm" style="white-space: pre-wrap; font-family:monospace;">
TD(λ)()
1  $V \leftarrow V_{0} \triangleright$  initialization.
2  $e \leftarrow 0$ 
3 for  $t \leftarrow 0$  to T do
4  $s \leftarrow SELECTSTATE()$ 
5 for each step of epoch t do
6  $s' \leftarrow NEXTSTATE(\pi, s)$ 
7  $\delta \leftarrow r(s, \pi(s)) + \lambda V(s') - V(s)$ 
8  $e(s) \leftarrow \lambda e(s) + 1$ 
9 for  $u \in S$  do
10 if  $u \neq s$  then
11  $e(u) \leftarrow \gamma \lambda e(u)$ 
12  $V(u) \leftarrow V(u) + \alpha \delta e(u)$ 
13  $s \leftarrow s'$ 
14 return V
</div>

Suppose that at each time step t the agent receives the exact policy value $V_{\pi}(s_{t})$ Then, if the family of functions $f_{\mathbf{w}}$ is diferentiable, a gradient descent method applied to the empirical squared loss can be used to sequentially update the weight vector w via:

$$
\mathbf{w}_{t + 1} = \mathbf{w}_{t} - \alpha \nabla_{\mathbf{w}_{t}} \frac{1}{2}[V_{\pi}(s_{t}) - f_{\mathbf{w}_{t}}(s_{t})]^{2} = \mathbf{w}_{t} + \alpha[V_{\pi}(s_{t}) - f_{\mathbf{w}_{t}}(s_{t})] \nabla_{\mathbf{w}_{t}} f_{\mathbf{w}_{t}}(s_{t}).
$$

It is worth mentioning, however, that for large action spaces, there are simple cases where the methods used do not converge and instead cycle.

## 17.6 Chapter notes

Reinforcement learning is an important area of machine learning with a large body of literature. This chapter presents only a brief introduction to this area. For a more detailed study, the reader could consult the book of Sutton and Barto [1998], whose mathematical content is short, or those of Puterman [1994] and Bertsekas [1987], which discuss in more depth several aspects, as well as the more recent book of Szepesv´ari [2010]. The Ph.D. theses of Singh [1993] and Littman [1996] are also excellent sources.

Some foundational work on MDPs and the introduction of the temporal diference (TD) methods are due to Sutton [1984]. Q-learning was introduced and analyzed by Watkins [1989], though it can be viewed as a special instance of TD methods. The first proof of the convergence of Q-learning was given by Watkins and Dayan [1992].

Many of the techniques used in reinforcement learning are closely related to those of stochastic approximation which originated with the work of Robbins and Monro [1951], followed by a series of results including Dvoretzky [1956], Schmetterer [1960], Kiefer and Wolfowitz [1952], and Kushner and Clark [1978]. For a recent survey of stochastic approximation, including a discussion of powerful proof techniques based on ODE (ordinary diferential equations), see Kushner [2010] and the references therein. The connection with stochastic approximation was emphasized by Tsitsiklis [1994] and Jaakkola et al. [1994], who gave a related proof of the convergence of Q-learning. For the convergence rate of Q-learning, consult Even-Dar and Mansour [2003]. For recent results on the convergence of the policy iteration algorithm, see Ye [2011], which shows that the algorithm is strongly polynomial for a fixed discount factor.

Reinforcement learning has been successfully applied to a variety of problems including robot control, board games such as backgammon in which Tesauro’s TD-Gammon reached the level of a strong master [Tesauro, 1995] (see also chapter 11 of Sutton and Barto [1998]), chess, elevator scheduling problems [Crites and Barto, 1996], telecommunications, inventory management, dynamic radio channel assignment [Singh and Bertsekas, 1997], and a number of other problems (see chapter 1 of Puterman [1994]).

We described a large variety of machine learning algorithms and techniques and discussed their theoretical foundations as well as their use and applications. While this is not a fully comprehensive presentation, it should nevertheless ofer the reader some idea of the breadth of the field and its multiple connections with a variety of other domains, including statistics, information theory, optimization, game theory, and automata and formal language theory.

The fundamental concepts, algorithms, and proof techniques we presented should supply the reader with the necessary tools for analyzing other learning algorithms, including variants of the algorithms analyzed in this book. They are also likely to be helpful for devising new algorithms or for studying new learning schemes. We strongly encourage the reader to explore both and more generally to seek enhanced solutions for all theoretical, algorithmic, and applied learning problems.

The exercises included at the end of each chapter, as well as the full solutions we provide separately, should help the reader become more familiar with the techniques and concepts described. Some of them could also serve as a starting point for research work and the investigation of new questions.

Many of the algorithms we presented as well as their variants can be directly used in applications to derive efective solutions to real-world learning problems. Our detailed description of the algorithms and discussion should help with their implementation or their adaptation to other learning scenarios.

Machine learning is a relatively recent field and yet probably one of the most active ones in computer science. Given the wide accessibility of digitized data and its many applications, we can expect it to continue to grow at a very fast pace over the next few decades. Learning problems of different nature, some arising due to the substantial increase of the scale of the data, which already requires processing billions of records in some applications, others related to the introduction of completely new learning frameworks, are likely to pose new research challenges and require novel algorithmic solutions. In all cases, learning theory, algorithms, and applications form an exciting area of computer science and mathematics, which we hope this book could at least partly communicate.

In this appendix, we introduce some basic notions of linear algebra relevant to the material presented in this book. This appendix does not represent an exhaustive tutorial, and it is assumed that the reader has some prior knowledge of the subject.

## A.1 Vectors and norms

We will denote by <sup>H</sup> a vector space whose dimension may be infinite.

## A.1.1 Norms

Definition A.1 A mapping Φ: $\mathbb{H} \to \mathbb{R}_{+}$ is said to define a norm on <sup>H</sup> if it verifies the following axioms:

<sub>•</sub> definiteness: $\forall \mathbf{x} \in \mathbb{H}, \Phi(\mathbf{x}) = 0 \Leftrightarrow \mathbf{x} = \mathbf{0}$ ;

<sub>•</sub> homogeneity: $\forall \mathbf{x} \in \mathbb{H}, \forall \alpha \in \mathbb{R}, \Phi(\alpha \mathbf{x}) = | \alpha | \Phi(\mathbf{x}),$

<sub>•</sub> triangle inequality: $\forall \mathbf{x}, \mathbf{y} \in \mathbb{H}, \Phi(\mathbf{x} + \mathbf{y}) \leq \Phi(\mathbf{x}) + \Phi(\mathbf{y})$

A norm is typically denoted by $| | \cdot | |$ . Examples of vector norms are the absolute value on <sup>R</sup> and the Euclidean $\left(\mathrm{or} ~ L_{2} \right)$ norm on $\ddot{\mathbb R}^{N}$ . More generally, for any $p \geq 1$ the $L_{p}$ norm is defined on $\mathbb{R}^{N}$ as

$$
\forall \mathbf{x} \in \mathbb{R}^{N}, \| \mathbf{x} \|_{p} = \left(\sum_{j = 1}^{N} | x_{j} |^{p}\right)^{1 / p}.\tag{A.1}
$$

The $L_{1}, \L_{2},$ , and $L_{\infty}$ norms are some of the most commonly used norms, where $\| \mathbf{x} \|_{\infty} ~ =$ $\operatorname{max}_{j \in[N]} | x_{j} |$ . Two norms $\| \cdot \|$ and $\| \cdot \|^{\prime}$ are said to be equivalent if there exists $\alpha, \beta \ > \0$ such that for all $\mathbf{x} \in \mathbb{H}$

$$
\alpha \| \mathbf{x} \| \leq \| \mathbf{x} \|^{\prime} \leq \beta \| \mathbf{x} \|.\tag{A.2}
$$

The following general inequalities relating these norms can be proven straightforwardly:

$$
\| \mathbf{x} \|_{2} \leq \| \mathbf{x} \|_{1} \leq \sqrt{N} \| \mathbf{x} \|_{2}\tag{A.3}
$$

$$
\| \mathbf{x} \|_{\infty} \leq \| \mathbf{x} \|_{2} \leq \sqrt{N} \| \mathbf{x} \|_{\infty}\tag{A.4}
$$

$$
\| \mathbf{x} \|_{\infty} \leq \| \mathbf{x} \|_{1} \leq N \| \mathbf{x} \|_{\infty}.\tag{A.5}
$$

The second inequality of the first line can be shown using the Cauchy-Schwarz inequality presented later while the other inequalities are clear. These inequalities show the equivalence of these three norms. More generally, all norms on a finite-dimensional space are equivalent. The following additional properties hold for the $L_{\infty}$ norm: for all $\mathbf{x} \in \mathbb{H}$

$$
\forall p \geq 1, \| \mathbf{x} \|_{\infty} \leq \| \mathbf{x} \|_{p} \leq N^{1 / p} \| \mathbf{x} \|_{\infty}\tag{A.6}
$$

$$
\lim_{p \to + \infty} \| \mathbf{x} \|_{p} = \| \mathbf{x} \|_{\infty}.\tag{A.7}
$$

The inequalities of the first line are straightforward and imply the limit property of the second line.

Definition A.2 (Hilbert space) A Hilbert space is a vector space equipped with an inner product $\langle \cdot, \cdot \rangle$ and that is complete (all Cauchy sequences are convergent). The inner product induces a norm defined as follows:

$$
\forall \mathbf{x} \in \mathbb{H}, \| \mathbf{x} \|_{\mathbb{H}} = \sqrt{\langle \mathbf{x}, \mathbf{x} \rangle}.\tag{A.8}
$$

## A.1.2 Dual norms

Definition A.3 Let $\| \cdot \|$ be a norm on $\mathbb{R}^{N}$ . Then, the dual norm $\| \cdot \|_{*}$ associated to $\| \cdot \|$ is the norm defined $by$

$$
\forall \mathbf{y} \in \mathbb{R}^{N}, \quad \| \mathbf{y} \|_{*} = \sup_{\| \mathbf{x} \| = 1} | \langle \mathbf{y}, \mathbf{x} \rangle |.\tag{A.9}
$$

For any $p, q \geq 1$ that are conjugate that is such that $\textstyle{\frac{1}{p}} +{\frac{1}{q}} = 1$ , the $L_{p}$ and $L_{q}$ norms are dual norms of each other. In particular, the dual norm of $L_{2}^{\dot{}}$ is the $L_{2}$ norm, and the dual norm of the $L_{1}$ norm is the $L_{\infty}$ norm.

Proposition A.4 (Holder’s inequality)¨ Let $p, q \ge 1$ be conjugate: $\textstyle{\frac{1}{p}} +{\frac{1}{q}} \ = \1$ . Then, for all $x, y \in \mathbb{R}^{N}$

$$
| \left\langle \mathbf{x}, \mathbf{y} \right\rangle | \leq \| \mathbf{x} \|_{p} \| \mathbf{y} \|_{q},\tag{A.10}
$$

with equality when $| y_{i} | = | x_{i} |^{p - 1}$ for all $i \in[N]$

Proof: The statement holds trivially for $\mathbf{x} = \mathbf{0}$ or $\mathbf{y} = \mathbf{0}$ ; thus, we can assume $\mathbf{x} \neq \mathbf{0}$ and $\mathbf{y} \neq \mathbf{0}$ Let $a, b > 0$ . By the concavity of log (see definition B.7), we can write

$$
\log \left(\frac{1}{p} a^{p} + \frac{1}{q} b^{q}\right) \geq \frac{1}{p} \log(a^{p}) + \frac{1}{q} \log(b^{q}) = \log(a) + \log(b) = \log(ab).
$$

Taking the exponential of the left- and right-hand sides gives

$$
\frac{1}{p} a^{p} + \frac{1}{q} b^{q} \geq ab,
$$

which is known as Young’s inequality. Using this inequality with $a = | x_{j} | / \| \mathbf{x} \|_{p}$ and $b = | y_{j} | / \| \mathbf{y} \|_{q}$ for $j \in[N]$ and summing up gives

$$
\frac{\sum_{j = 1}^{N} | x_{j} y_{j} |}{\| \mathbf{x} \|_{p} \| \mathbf{y} \|_{q}} \leq \frac{1}{p} \frac{\| \mathbf{x} \|^{p}}{\| \mathbf{x} \|^{p}} + \frac{1}{q} \frac{\| \mathbf{y} \|^{q}}{\| \mathbf{y} \|^{q}} = \frac{1}{p} + \frac{1}{q} = 1.
$$

Since $\begin{array}{r}{| \left.\mathbf{x}, \mathbf{y} \right.| \leq \sum_{j = 1}^{N} | x_{j} y_{j} |} \end{array}$ , the inequality claim follows. The equality case can be verified straightforwardly. $\square$

Taking $p = q = 2$ immediately yields the following result known as the Cauchy-Schwarz inequality.

## Corollary A.5 (Cauchy-Schwarz inequality) For all $\mathbf{x}, \mathbf{y} \in \mathbb{R}^{N}$

$$
| \langle \mathbf{x}, \mathbf{y} \rangle | \leq \| \mathbf{x} \|_{2} \| \mathbf{y} \|_{2},\tag{A.11}
$$

with equality $if \mathbf{x}$ and y are collinear.

Let H be the hyperplane in $\mathbb{R}^{N}$ whose equation is given by

$$
\mathbf{w} \cdot \mathbf{x} + b = 0,
$$

for some normal vector $\mathbf{w} \in \mathbb{R}^{N}$ and ofset $b \in \mathbb{R}$ . Let $d_{p}(\mathbf{x}, \mathcal{H})$ denote the distance of x to the hyperplane H, that is,

$$
d_{p}(\mathbf{x}, \mathcal{H}) = \inf_{\mathbf{x}^{\prime} \in \mathcal{H}} \| \mathbf{x}^{\prime} - \mathbf{x} \|_{p}.\tag{A.12}
$$

Then, the following identity holds for all $p \geq 1{:}$

$$
d_{p}(\mathbf{x}, \mathcal{H}) = \frac{| \mathbf{w} \cdot \mathbf{x} + b |}{\| \mathbf{w} \|_{q}},\tag{A.13}
$$

where $q$ is the conjugate of p: $\textstyle{\frac{1}{p}} +{\frac{1}{q}} = 1$ . (A.13) can be shown by a straightforward application of the results of appendix B to the constrained optimization problem (A.12).

## A.1.3 Relationship between norms

A general form for the inequalities seen in equations $(\mathrm{A.3}),(\mathrm{A.4})$ and (A.5), which holds for al $L_{p}$ norms, is shown in the following proposition.

Proposition A.6 Let $1 \leq p \leq q$ . Then the following inequalities hold for all $\mathbf{x} \in \mathbb{R}^{N}$

$$
\| x \|_{q} \leq \| x \|_{p} \leq N^{\frac{1}{p} - \frac{1}{q}} \| x \|_{q}.\tag{A.14}
$$

Proof: First, assume $\mathbf{x} \neq \mathbf{0},$ , otherwise the inequalities hold trivially. Then the first inequality holds using $1 \leq p \leq q$ as follows:

$$
\left[\frac{\| \mathbf{x} \|_{p}}{\| \mathbf{x} \|_{q}} \right]^{p} = \sum_{i = 1}^{N} \left[\underbrace{\frac{x_{i}}{\| \mathbf{x} \|_{q}}}_{\leq 1} \right]^{p} \geq \sum_{i = 1}^{N} \left[\frac{x_{i}}{\| \mathbf{x} \|_{q}} \right]^{q} = 1.
$$

Finally, the second inequality follows by using H¨older’s inequality (proposition A.4)

$$
\| \mathbf{x} \|_{p} = \left[\sum_{i = 1}^{N} | x_{i} |^{p} \right]^{\frac{1}{p}} \leq \left[\left(\sum_{i = 1}^{N}(| x_{i} |^{p})^{\frac{q}{p}}\right)^{\frac{p}{q}} \left(\sum_{i = 1}^{N}(1)^{\frac{q}{q - p}}\right)^{1 - \frac{p}{q}} \right]^{\frac{1}{p}} = \| \mathbf{x} \|_{q} N^{\frac{1}{p} - \frac{1}{q}},
$$

which completes the proof.

## A.2 Matrices

For a matrix $\mathbf{M} \in \mathbb{R}^{m \times n}$ with m rows and n columns, we denote by $\mathbf{M}_{ij}$ its ijth entry, for all $i \in[m]$ and $j \in[n]$ . For any $m \geq 1$ , we denote by ${\mathbf I}_{m}$ the m-dimensional identity matrix, and refer to it as I when the dimension is clear from the context.

The transpose of M is denoted by $\mathbf{M}^{\top}$ and defined by $(\mathbf{M}^{\top})_{ij} = \mathbf{M}_{ji}$ for all $(i, j)$ . For any two matrices $\mathbf{M} \in \mathbb{R}^{m \times n}$ and $\mathbf{N} \in \mathbb{R}^{n \times p}$ $(\mathbf{M} \mathbf{N})^{\top} = \bar{\mathbf{N}}^{\top} \mathbf{M}^{\top}$ . M is said to be symmetric if $\mathbf{M}_{ij} = \mathbf{M}_{ji}$ for all $(i, j)$ , that is, if $\mathbf M = \mathbf M^{\top}$

The trace of a square matrix M is denoted by $\mathrm{Tr}[\mathbf{M}]$ and defined as $\begin{array}{r}{\mathrm{Tr}[\mathbf{M}] = \sum_{i = 1}^{N} \mathbf{M}_{ii}} \end{array}$ . For any two matrices $\mathbf{M} \in \mathbb{R}^{m \times n}$ and $\mathbf{N} \in \mathbb{R}^{n \times m}$ , the following identity holds: $\operatorname{Tr}[\mathbf{\bar{M} N}] = \operatorname{Tr}[\mathbf{NM}]$ . More generally, the following cyclic property holds with the appropriate dimensions for the matrices M, N, and P:

$$
\operatorname{Tr}[\mathbf{MNP}] = \operatorname{Tr}[\mathbf{PMN}] = \operatorname{Tr}[\mathbf{NPM}].\tag{A.15}
$$

The inverse of a square matrix M, which exists when M has full rank, is denoted by ${{\bf{M}}^{- 1}}$ and is the unique matrix satisfying $\mathbf{M} \mathbf{M}^{- 1} = \mathbf{M}^{- 1} \mathbf{M} = \mathbf{I}$

## A.2.1 Matrix norms

A matrix norm is a norm defined over $\mathbb{R}^{m \times n}$ where m and n are the dimensions of the matrices considered. Many matrix norms, including those discussed below, satisfy the following submultiplicative property:

$$
\| \mathbf{M} \mathbf{N} \| \leq \| \mathbf{M} \| \| \mathbf{N} \|.\tag{A.16}
$$

The matrix norm induced by the vector norm $\| \cdot \|_{p}$ or the operator norm induced by that norm is also denoted by $\| \cdot \|_{p}$ and defined by

$$
\| \mathbf{M} \|_{p} = \sup_{\| \mathbf{x} \|_{p} \leq 1} \| \mathbf{Mx} \|_{p}.\tag{A.17}
$$

The norm induced for $p = 2$ is known as the spectral norm, which equals the largest singular value of M (see section $\mathrm{A.2.2})$ , or the square-root of the largest eigenvalue of $\mathbf{M}^{\top} \mathbf{M}$

$$
\| \mathbf{M} \|_{2} = \sigma_{1}(\mathbf{M}) = \sqrt{\lambda_{\max}(\mathbf{M}^{\top} \mathbf{M})}.\tag{A.18}
$$

Not all matrix norms are induced by vector norms. The Frobenius norm denoted by $\| \cdot \|_{F}$ is the most notable of such norms and is defined by:

$$
\| \mathbf{M} \|_{F} = \left(\sum_{i = 1}^{m} \sum_{j = 1}^{n} \mathbf{M}_{ij}^{2}\right)^{1 / 2}.
$$

The Frobenius norm can be interpreted as the $L_{2}$ norm of a vector when treating M as a vector of size mn. It also coincides with the norm induced by the Frobenius product, which is the inner product defined for all M, $\mathbf{N} \in \mathbb{R}^{m \times n}$ by

$$
\langle \mathbf{M}, \mathbf{N} \rangle_{F} = \mathrm{Tr}[\mathbf{M}^{\top} \mathbf{N}].\tag{A.19}
$$

This relates the Frobenius norm to the singular values of M:

$$
\| \mathbf{M} \|_{F}^{2} = \mathrm{Tr}[\mathbf{M}^{\top} \mathbf{M}] = \sum_{i = 1}^{r} \sigma_{i}(\mathbf{M})^{2},
$$

where $r = \operatorname{rank}(\mathbf{M})$ . The second equality follows from properties of SPSD matrices (see section A.2.3).

For any $j \in[n]$ , let $\mathbf{M}_{j}$ denote the jth column of M, that is $\mathbf{M} =[\mathbf{M}_{1} \cdot \cdot \cdot \mathbf{M}_{n}]$ . Then, for any $p, r \geq 1$ , the $L_{p, r}$ group norm of M is defined by

$$
\| \mathbf{M} \|_{p, r} = \left(\sum_{j = 1}^{n} \| \mathbf{M}_{i} \|_{p}^{r}\right)^{1 / r}.
$$

One of the most commonly used group norms is the $L_{2, 1}$ norm defined by

$$
\| \mathbf{M} \|_{2, 1} = \sum_{i = 1}^{n} \| \mathbf{M}_{i} \|_{2}.
$$

## A.2.2 Singular value decomposition

The compact singular value decomposition (SVD) of M, with $r = \operatorname{rank}(\mathbf{M}) \leq \mathrm{min}(m, n)$ , can be written as follows:

$$
\mathbf{M} = \mathbf{U}_{M} \boldsymbol{\Sigma}_{M} \mathbf{V}_{M}^{\top}.
$$

The $r \times r$ matrix $\pmb{\Sigma}_{M} = \operatorname{diag}(\sigma_{1}, \dots, \sigma_{r})$ is diagonal and contains the non-zero singular values of M sorted in decreasing order, that is $\sigma_{1} \geq...\geq \sigma_{r} > 0$ The matrices $\mathbf{U}_{M} \in \mathbb{R}^{m \times r}$ and $\mathbf{V}_{M} \in \mathbb{R}^{n \times r}$ have orthonormal columns that contain the left and right singular vectors of M corresponding to the sorted singular values. We denote by $\mathbf{U}_{k} \in \mathbb{R}^{m \times k}$ the top $k \leq r$ left singular vectors of M.

The orthogonal projection onto the span of ${\bf U}_{k}$ can be written as $\mathbb{P}_{U_{k}} = \mathbf{U}_{k} \mathbf{U}_{k}^{\top}$ , where $\mathbb{P}_{U_{k}}$ is SPSD and idempotent, i.e., $\mathbb{P}_{U_{k}}^{2} = \mathbb{P}_{U_{k}}$ . Moreover, the orthogonal projection onto the subspace orthogonal to $\mathbf{U}_{k}$ is defined as $\bar{\mathbb{P}}_{U_{k}, \perp}$ . Similar definitions, i.e., $\mathbf{V}_{k}, \mathbb{P}_{V_{k}}, \mathbb{P}_{V_{k}, \perp}$ , hold for the right singular vectors.

The generalized inverse, or Moore-Penrose pseudo-inverse of a matrix M is denoted by M<sup>†</sup> and defined by

$$
\mathbf{M}^{\dagger} = \mathbf{U}_{M} \boldsymbol{\Sigma}_{M}^{\dagger} \mathbf{V}_{M}^{\top},\tag{A.20}
$$

where $\pmb{\Sigma}_{M}^{\dag} = \operatorname{diag}(\sigma_{1}^{- 1}, \dots, \sigma_{r}^{- 1})$ . For any square m × m matrix M with full rank, i.e., $r = m$ the pseudo-inverse coincides with the matrix inverse: $\mathbf{M}^{\dagger} = \mathbf{M}^{- 1}$

## A.2.3 Symmetric positive semidefinite (SPSD) matrices

Definition A.7 A symmetric matrix $\mathbf{M} \in \mathbb{R}^{m \times m}$ is said to be positive semidefinite if

$$
\mathbf{x}^{\top} \mathbf{Mx} \geq 0\tag{A.21}
$$

for all $\mathbf{x} \in \mathbb{R}^{m}$ . M is said to be positive definite if the inequality is strict.

Kernel matrices (see chapter 6) and orthogonal projection matrices are two examples of SPSD matrices. It is straightforward to show that a matrix M is SPSD if its eigenvalues are all nonnegative. Furthermore, the following properties hold for any SPSD matrix M:

## A.2 Matrices

M admits a decomposition $\mathbf{M} = \mathbf{X}^{\top} \mathbf{X}$ for some matrix X and the Cholesky decomposition provides one such decomposition in which X is an upper triangular matrix.

<sub>•</sub> The left and right singular vectors of M are the same and the SVD of M is also its eigenvalue decomposition.

<sub>•</sub> The SVD of an arbitrary matrix $\mathbf{X} = \mathbf{U}_{X} \pmb{\Sigma}_{X} \mathbf{V}_{X}^{\top}$ defines the SVD of two related SPSD matrices: the left singular vectors $(\mathbf{U}_{X})$ are the eigenvectors of $\mathbf{\mathbf{XX}^{\top}}$ , the right singular vectors $(\mathbf{V}_{X})$ are the eigenvectors of $\mathbf{X}^{\top} \mathbf{X}$ and the non-zero singular values of X are the square roots of the non-zero eigenvalues of $\mathbf{\mathbf{XX}^{\top}}$ and $\mathbf{X}^{\top} \mathbf{X}$

<sub>•</sub> The trace of M is the sum of its singular values, i.e., $\begin{array}{r}{\mathrm{Tr}[\mathbf{M}] = \sum_{i = 1}^{r} \sigma_{i}(\mathbf{M})} \end{array}$ , where rank $(\mathbf{M}) = r$

<sub>•</sub> The top singular vector of ${\bf M},{\bf u}_{1}$ , maximizes the Rayleigh quotient, which is defined as

$$
r(\mathbf{x}, \mathbf{M}) = \frac{\mathbf{x}^{\top} \mathbf{Mx}}{\mathbf{x}^{\top} \mathbf{x}}.
$$

In other words, $\mathbf{u}_{1} = \operatorname{argmax}_{\mathbf{x}} r(\mathbf{x}, \mathbf{M})$ and $r(\mathbf{u}, \mathbf{M}) = \sigma_{1}(\mathbf{M})$ . Similarly, if $\mathbf{M}^{\prime} = \mathbb{P}_{U_{i}, \perp} \mathbf{M}$ , that is, the projection of M onto the subspace orthogonal to $\mathbf{U}_{i}$ , then $\mathbf{u}_{i + 1} = \operatorname{argmax}_{\mathbf{x}} r(\mathbf{x}, \mathbf{M}^{\prime})$ where $\mathbf{u}_{i + 1}$ is the (i + 1)st singular vector of M.

In this appendix, we introduce the main definitions and results of convex optimization needed for the analysis of the learning algorithms presented in this book.

## B.1 Differentiation and unconstrained optimization

We start with some basic definitions for diferentiation needed to present Fermat’s theorem and to describe some properties of convex functions.

Definition B.1 (Gradient) Let $f \colon \mathcal{X} \subseteq \mathbb{R}^{N} \to$ <sup>R</sup> be a diferentiable function. Then, the gradient of f at $\mathbf{x} \in \mathcal{X}$ is the vector in $\mathbf{\mathbb{R}}^{N}$ denoted by $\nabla f(\mathbf{x})$ and defined by

$$
\nabla f(\mathbf{x}) = \left[\begin{array}{c} \frac{\partial f}{\partial \mathbf{x}_{1}}(\mathbf{x}) \\ \vdots \\ \frac{\partial f}{\partial \mathbf{x}_{N}}(\mathbf{x}) \end{array} \right].
$$

Definition B.2 (Hessian) Let $f \colon \mathcal{X} \subseteq \mathbb{R}^{N} \to \mathbb{R}$ be a twice diferentiable function. Then, the Hessian of f $at \mathbf{x} \in \mathcal{X}$ is the matrix in $\mathbb{R}^{N \times N}$ denoted by $\nabla^{2} f(\mathbf{\bar{x}})$ and defined by

$$
\nabla^{2} f(\mathbf{x}) = \left[\frac{\partial^{2} f}{\partial \mathbf{x}_{i}, \mathbf{x}_{j}}(\mathbf{x}) \right]_{1 \leq i, j \leq N}.
$$

Next, we present a classic result for unconstrained optimization.

Theorem B.3 (Fermat’s theorem) Let $f \colon \mathcal{X} \subseteq \mathbb{R}^{N} \to$ <sup>R</sup> be a diferentiable function. $Iff$ admits a local extremum at $\mathbf{x}^{\ast} \in \mathcal{X}$ , then $\nabla f(\mathbf{x}^{*}) = 0$ , that is, $\mathbf{x}^{*}$ is a stationary point.

## B.2 Convexity

This section introduces the notions of convex sets and convex functions. Convex functions play an important role in the design and analysis of learning algorithms, in part because a local minimum of a convex function is necessarily also a global minimum. Thus, the properties of a hypothesis that is learned by finding a local minimum of a convex optimization are often well understood, while for some non-convex optimization problems there may be a very large number of local minima for which no clear characterization of the learned hypothesis can be given.

Definition B.4 (Convex set) A set $\mathcal{X} \subseteq \mathbb{R}^{N}$ is said to be convex $iffor$ any two points $\mathbf{x}, \mathbf{y} \in{\mathcal{X}}$ the segment $\left[\mathbf{x}, \mathbf{y} \right]$ lies in $\mathcal{X}_{i}$ , that is

$$
\{\alpha \mathbf{x} +(1 - \alpha) \mathbf{y}: 0 \leq \alpha \leq 1\} \subseteq \mathcal{X}.
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/c2b8398c330e4167f030edd436c13b33e2330efb48c2c0fa4bc88d0595ee8652.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/f227829bd66f576e1f34aeb59e7c28ad8736a70e01403d5847dd75b96964c66c.jpg)  
Figure B.1

Examples of a convex (left) and a concave (right) functions. Note that any line segment drawn between two points on the convex function lies entirely above the graph of the function while any line segment drawn between two points on the concave function lies entirely below the graph of the function.

The following lemma illustrates several operations on convex sets that preserve convexity. These will be useful for proving several subsequent results of this section.

Lemma B.5 (Operations that preserve convexity of sets) The following operations on convex sets preserve convexity:

$Let \left\{{\mathcal{C}}_{i} \right\}_{i \in I}$ be any family of sets where for all $i \in I$ the set $\mathcal{C}_{i}$ is convex. Then the intersection of these sets $\cap_{i \in I} \mathcal{C}_{i}$ is also convex.

Let ${\mathcal{C}}_{1}$ and $\mathcal{C}_{2}$ be convex sets, then their sum ${\mathfrak{C}}_{1} +{\mathfrak{C}}_{2} = \{x_{1} + x_{2} : x_{1} \in{\mathfrak{C}}_{1}, x_{2} \in{\mathfrak{C}}_{2}\}$ , when defined, is convex.

Let $\mathcal{C}_{1}$ and $\mathcal{C}_{2}$ be convex sets, then their cross-product $\left(\mathcal{C}_{1} \times \mathcal{C}_{2} \right)$ is also convex.

<sub>•</sub> Any projection of a convex set C is also convex.

Proof: The first property holds since for any $x, y \in \textstyle \bigcap_{i \in I}{\mathcal{C}}_{i}$ and any $\alpha \in[0, 1]$ , we have αx + $(1 - \alpha) y \in \mathcal{C}_{i}$ for $\mathrm{any} \i \in I$ by the convexity of $\mathcal{C}_{i}$ The second property holds since for any $(x_{1} + x_{2}),(y_{1} + y_{2}) \in({\mathfrak{C}}_{1} +{\mathfrak{C}}_{2})$ we have $\alpha(x_{1} +$ $x_{2}) +(1 - \alpha)(y_{1} + y_{2}) =(\alpha x_{1} +(1 - \alpha) y_{1} + \alpha x_{2} +(1 - \alpha) y_{2}) \in({\mathcal C}_{1} +{\mathcal C}_{2})$ , which follows since $\alpha x_{1} +(1 - \alpha) y_{1} \in{\mathcal{C}}_{1}$ and $\alpha x_{2} +(1 - \alpha) y_{2} \in \mathcal{C}_{2},$ The third property holds since for $(x_{1}, x_{2}),(y_{1}, y_{2}) \ \in \({\mathfrak{C}}_{1} \times{\mathfrak{C}}_{2})$ we have $\alpha(x_{1}, x_{2}) +(1 -$ $\alpha)(y_{1}, y_{2}) =(\alpha x_{1} +(1 - \alpha) y_{1}, \alpha x_{2} +(1 - \alpha) y_{2}) \in({\mathcal{C}}_{1} \times{\mathcal{C}}_{2})$ , where the membership holds due to the assumption that $\mathcal{C}_{1}$ and $\mathcal{C}_{2}$ are convex.

Finally, the fourth property holds by noting that for any decomposition of the convex set $\mathcal{C}$ into projections $\mathcal{C}_{1}$ and $\mathcal{C}_{2}$ , such that ${\mathcal{C}} =({\mathcal{C}}_{1} \times{\mathcal{C}}_{2})$ , it must be the case that $\mathcal{C}_{1}$ is convex. If $\mathcal{C}_{2}$ is empty, then the result is trivially true. Otherwise, fix an element $x_{2} \in \mathcal{C}_{2}$ , then for any $x, y \in \mathcal{C}_{1}$ and any $\alpha \in[0, 1]$ we have $\alpha(x, x_{2}) +(1 - \alpha)(y, x_{2}) \in \mathcal{C}$ , which implies $\alpha x +(1 - \alpha) y \in{\mathcal{C}}_{1}$ . Since $\mathcal{C}_{1}$ was chosen arbitrarily, this fact holds for any projection of C. $\square$

Note that many set operations may not preserve convexity. Consider the union of disjoint intervals on $\mathbb{R} \colon[a, b] \cup[c, d]$ where $a < b < c < d.$ . Clearly [a, b] and [c, d] are convex, however we have $\textstyle{\frac{1}{2}} b +(\dot{1} -{\frac{1}{2}}) c \dot{\mathcal{U}} \left(\left[a, b \right] \cup \left[c, d \right] \right)$

Definition B.6 (Convex hull) The convex hull conv(X) of a set of points $\mathcal{X} \subseteq \mathbb{R}^{N}$ is the minimal convex set containing X and can be equivalently defined as follows:

$$
\operatorname{conv}(\mathcal{X}) = \Bigl \{\sum_{i = 1}^{m} \alpha_{i} \mathbf{x}_{i} \colon m \geq 1, \forall i \in[m], \mathbf{x}_{i} \in \mathcal{X}, \alpha_{i} \geq 0, \sum_{i = 1}^{m} \alpha_{i} = 1 \Bigr\}.\tag{B.1}
$$

Let Epi f denote the epigraph of function $f \colon{\mathcal{X}} \mathbb{R},$ , that is the set of points lying above its graph: $\{(x, y) \colon x \in \mathcal{X}, y \geq f(x)\}$ .

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/5d82daab5be6089e0e7b47c3dfa8a193474243f9fb944028bd191654b79207f6.jpg)  
Figure B.2  
Illustration of the first-order property satisfied by all convex functions.

Definition B.7 (Convex function) Let X be a convex set. A function $f \colon \mathcal{X} \mathbb{R}$ is said to be convex $if \operatorname{Epi} f$ is a convex set, or, equivalently, if for all $\mathbf{x}, \mathbf{y} \in{\mathcal{X}}$ and $\alpha \in[0, 1]$

$$
f(\alpha \mathbf{x} +(1 - \alpha) \mathbf{y}) \leq \alpha f(\mathbf{x}) +(1 - \alpha) f(\mathbf{y}).\tag{B.2}
$$

f is said to be strictly convex if inequality (B.2) is strict for all $\mathbf{x}, \mathbf{y} \in{\mathcal{X}}$ where $\textbf{x} \neq \textbf{y}$ and $\alpha \in(0, 1)$ . f is said to be (strictly) concave when −f is (strictly) convex. Figure B.1 shows simple examples of convex and concave functions. Convex functions can also be characterized in terms of their first- or second-order diferential.

Theorem B.8 Let f be a diferentiable function, then f is convex if and only if dom(f) is convex and the following inequalities hold:

$$
\forall \mathbf{x}, \mathbf{y} \in \operatorname{dom}(f), f(\mathbf{y}) - f(\mathbf{x}) \geq \nabla f(\mathbf{x}) \cdot(\mathbf{y} - \mathbf{x}).\tag{B.3}
$$

The property (B.3) is illustrated by figure B.2: for a convex function, the hyperplane tangent at x is always below the graph.

Theorem B.9 Let $f$ be a twice diferentiable function, then f is convex $iff$ dom(f) is convex and its Hessian is positive semidefinite:

$$
\forall \mathbf{x} \in \operatorname{dom}(f), \nabla^{2} f(\mathbf{x}) \succeq 0.
$$

Recall that a symmetric matrix is positive semidefinite if all of its eigenvalues are non-negative. Further, note that when $f$ is scalar, this theorem states that $f$ is convex if and only if its second derivative is always non-negative, that is, for all $x \in \operatorname{dom}(f), \quad \bar{f}^{\prime \prime}(x) \geq 0$

Example B.10 (Linear functions) Any linear function $f$ is both convex and concave, since equation (B.2) holds with equality for both f and −f by the definition of linearity.

Example B.11 (Quadratic function) The function $f \colon x \mapsto x^{2}$ defined over <sup>R</sup> is convex since it is twice diferentiable and for all $x \in \mathbb{R}, f^{\prime \prime}(x) = 2 > 0$

Example B.12 (Norms) Any norm $\| \cdot \|$ defined over a convex set X is convex since by the triangle inequality and the homogeneity property of the norm, for all $\alpha \in[0, 1], \mathbf{x}, \mathbf{y} \in \mathcal{X}$ , we can write

$$
\| \alpha \mathbf{x} +(1 - \alpha) \mathbf{y} \| \leq \| \alpha \mathbf{x} \| + \|(1 - \alpha) \mathbf{y} \| = \alpha \| \mathbf{x} \| +(1 - \alpha) \| \mathbf{y} \|.
$$

Example B.13 (Maximum function) The max function defined for all $\mathbf{x} \in \mathbb{R}^{N}$ , by $\mathbf{x} \mapsto \mathrm{max}_{j \in[N]} \mathbf{x}_{j}$ is convex. For all $\alpha \in[0, 1], \mathbf{x}, \mathbf{y} \in \mathbb{R}^{N}$ , by the sub-additivity of max, we can write

$$
\max_{j}(\alpha \mathbf{x}_{j} +(1 - \alpha) \mathbf{y}_{j}) \leq \max_{j}(\alpha \mathbf{x}_{j}) + \max_{j}((1 - \alpha) \mathbf{y}_{j}) = \alpha \max_{j}(\mathbf{x}_{j}) +(1 - \alpha) \max_{j}(\mathbf{y}_{j}).
$$

One useful approach for proving convexity or concavity of functions is to make use of composition rules. For simplicity of presentation, we will assume twice Differentiability, although the results can also be proven without this assumption.

Lemma B.14 (Composition of convex/concave functions) Assume $h : \mathbb{R} \mathbb{R}$ and $g : \mathbb { R } ^ { N } $ <sup>R</sup> are twice diferentiable functions and for all $\mathbf{x} \in \mathbb{R}^{N}$ , define $f(\mathbf{x}) = h(g(\mathbf{x}))$ . Then the following implications are valid:

<sub>•</sub> h is convex and non-decreasing, and g is convex =⇒ f is convex.

<sub>•</sub> h is convex and non-increasing, and g is concave =⇒ f is convex.

<sub>•</sub> h is concave and non-decreasing, and g is concave =⇒ f is concave.

<sub>•</sub> h is concave and non-increasing, and g is convex =⇒ f is concave.

Proof: We restrict ourselves to $N = 1$ , since it sufices to prove convexity (concavity) along all arbitrary lines that intersect the domain. Now, consider the second derivative of f:

$$
f^{\prime \prime}(x) = h^{\prime \prime}(g(x)) g^{\prime}(x)^{2} + h^{\prime}(g(x)) g^{\prime \prime}(x).\tag{B.4}
$$

Note that if h is convex and non-decreasing, we have $h^{\prime \prime} \geq 0$ and $h^{\prime} \geq 0$ . Furthermore, if g is convex we also have $g^{\prime \prime} \geq 0$ , and it follows that $f^{\prime \prime}(x) \geq 0,$ , which proves the first statement. The remainder of the statements are proven in a similar manner. $\square$

Example B.15 (Composition of functions) The previous lemma shows the convexity or concavity of the following composed functions:

<sub>•</sub> If $f : \mathbb{R}^{N} \to \mathbb{R}$ is convex, then exp(f) is convex.

<sub>•</sub> Any squared norm $\| \cdot \|^{2}$ is convex.

<sub>•</sub> For all $\mathbf{x} \in \mathbb{R}^{N}$ the function $\begin{array}{r}{\mathbf{x} \mapsto \log(\sum_{j = 1}^{N} x_{j})} \end{array}$ is concave.

The following two lemmas give examples of two other operations preserving convexity.

Lemma B.16 (Pointwise supremum or maximum of convex functions) Let $(f_{i})_{i \in \mathcal{I}}$ be a family of convex functions defined over a convex set C. Then, their pointwise supremum f defined for all $x \in \mathcal{C} \by \f(x) = \operatorname{sup}_{i \in \mathcal{I}} f_{i}(x)$ (resp. their pointwise maximum $if \left| \mathcal{I} \right| < + \infty)$ is a convex function.

Proof: Observe that Epi $f = \cap_{i \in \mathbb{2}} \operatorname{Epi} f_{i}$ and is therefore convex as an intersection of convex sets. $\square$

Example B.17 (Pointwise supremum of convex functions) The lemma shows in particular the convexity of the following functions:

A piecewise linear function f defined for all $\boldsymbol{x} \in \mathbb{R}^{N}$ by $f({\boldsymbol{x}}) = \mathrm{max}_{i \in[m]}{\bf w}_{i}^{\top}{\bf x} + b_{i}$ is convex as a pointwise maximum of Affine (and thus convex) functions.

The maximum eigenvalue $\lambda_{\operatorname{max}}(\mathbf{M})$ is a convex function over the set of symmetric matrices M since the set of symmetric matrices is convex and since $\lambda_{\operatorname{max}}(\mathbf{M}) = \operatorname{sup}_{\| \mathbf{x} \|_{2} \leq 1} \mathbf{x}^{\top} \mathbf{M} \mathbf{x}$ is defined as the supremum of the linear (and thus convex) functions M $\mapsto \mathbf{x}^{\top} \mathbf{M} \mathbf{\ddot{x}}$

<sub>•</sub> More generally, let $\lambda_{1}({\bf M}), \ldots, \lambda_{k}({\bf M})$ denote the top $k \leq n$ eigenvalues of a symmetric $n \times$ n matrix M. Then, by a similar argument, $\begin{array}{r}{\mathbf{M} \mapsto \sum_{i = 1}^{k} \lambda_{i}(\mathbf{M})} \end{array}$ is a convex function since $\begin{array}{r}{\sum_{i = 1}^{k} \lambda_{i}(\mathbf{M}) = \operatorname{sup}_{\mathrm{dim}(\mathbf{V}) = k} \sum_{i = 1}^{k} \mathbf{u}_{i}^{\top} \mathbf{\bar{M}} \mathbf{u}_{i}} \end{array}$ , where $\mathbf{u}_{1}, \ldots, \mathbf{u}_{k}$ is an orthonormal basis of V.

Using the previous property, along with the fact that $\mathrm{Tr}(\mathbf{M})$ is linear in M, also shows that M $\begin{array}{r}{\mathrm{I \mapsto} \sum_{i = k + 1}^{n} \lambda_{i}(\mathbf{M}) \overset{}{=} \mathrm{Tr}(\mathbf{M}) - \sum_{i = 1}^{k} \lambda_{i}(\mathbf{M}) \mathrm{~ or ~} \mathbf{M} \mapsto \sum_{i = n - k + 1}^{n} \lambda_{i}(\mathbf{M}) = - \sum_{i = 1}^{k} \lambda_{i}(- \mathbf{M})} \end{array}$ are concave functions.

Lemma B.18 (Partial infimum) Let f be a convex function defined over a convex set ${\mathcal{C}} \subseteq{\mathcal{X}} \times{\mathcal{Y}}$ and let $\mathcal{B} \subseteq \mathcal{Y}$ be a convex set such that ${\mathcal{A}} = \{x \in \mathfrak{X} \colon \exists y \in \mathfrak{B} \mid(x, y) \in \mathfrak{C}\}$ is non-empty. $Then, \mathcal{A}$ is a convex set and the function g defined for all $x \in{\mathcal{A}}$ by $\begin{array}{r}{g(x) = \operatorname{inf}_{y \in \mathcal{B}} f(x, y)} \end{array}$ is convex.

Proof: First note that the intersection of the convex sets C and $({\mathcal{X}} \times{\mathcal{B}})$ is convex. Thus, A is convex since it is the projection of the convex set $\mathcal{C} \cap(\mathcal{X} \times \mathcal{B})$ onto X.

Let $x_{1}$ and $x_{2}$ be in A. By definition of g, for any $\epsilon > 0 \quad$ , there exist $y_{1}, y_{2} \in \mathrm{~ \mathcal{B} ~}$ with $(x_{1}, y_{1}),(x_{2}, y_{2}) \ \in \{\mathfrak{C}}$ such that $f(x_{1}, y_{1}) ~ \le ~ g(x_{1}) + \epsilon$ and $f(x_{2}, y_{2}) ~ \le ~ g(x_{2}) + \epsilon$ . Then, for any $\alpha \in[0, 1]$ ，

$$
\begin{array}{l} g(\alpha x_{1} +(1 - \alpha) x_{2}) = \inf_{y \in \mathcal{B}} f(\alpha x_{1} +(1 - \alpha) x_{2}, y) \\ \qquad \leq f(\alpha x_{1} +(1 - \alpha) x_{2}, \alpha y_{1} +(1 - \alpha) y_{2}) \\ \qquad \leq \alpha f(x_{1}, y_{1}) +(1 - \alpha) f(x_{2}, y_{2}) \\ \qquad \leq \alpha g(x_{1}) +(1 - \alpha) g(x_{2}) + \epsilon.\end{array}
$$

Since the inequality holds for all $\epsilon > 0$ , it implies

$$
g(\alpha x_{1} +(1 - \alpha) x_{2}) \leq \alpha g(x_{1}) +(1 - \alpha) g(x_{2}),
$$

which completes the proof.

Example B.19 The lemma shows in particular that the distance to a convex set B, $d(x,{\mathcal{B}}) =$ ${\operatorname{inf}}_{y \in{\mathcal{B}}} \| x - y \|$ , is a convex function of x in any normed vector space, since $(x, y) \mapsto \| x - y \|$ is jointly convex in x and y for any norm $\| \cdot \|$

The following is a useful inequality applied in a variety of contexts. It is in fact a quasi-direct consequence of the definition of convexity.

Theorem B.20 (Jensen’s inequality) Let X be a random variable taking values in a non-empty convex set ${\mathcal{C}} \subseteq{\dot{\mathbb{R}}}^{N}$ with a finite expectation $\mathbb{E}[X]$ , and $f$ a measurable convex function defined over C. Then, $\mathbb{E}[X]$ is in ${\mathcal{C}}, \mathbb{E}[f(X)]$ is finite, and the following inequality holds:

$$
f(\mathbb{E}[X]) \leq \mathbb{E}[f(X)].
$$

Proof: We give a sketch of the proof, which essentially follows from the definition of convexity. Note that for any finite set of elements $x_{1}, \ldots, x_{n}$ in C and any positive reals $\alpha_{1}, \ldots, \alpha_{n}$ such that $\textstyle \sum_{i = 1}^{n} \alpha_{i} = 1$ , we have

$$
f \left(\sum_{i = 1}^{n} \alpha_{i} x_{i}\right) \leq \sum_{i = 1}^{n} \alpha_{i} f(x_{i}).
$$

This follows straightforwardly by induction from the definition of convexity. Since the $\alpha_{i} s$ can be interpreted as probabilities, this immediately proves the inequality for any distribution with a finite support defined by ${\pmb{\alpha}} =(\alpha_{1}, \ldots, \alpha_{n})$ .

$$
f(\underset{\boldsymbol{\alpha}}{\mathbb{E}}[X]) \leq \underset{\boldsymbol{\alpha}}{\mathbb{E}}[f(X)].
$$

Extending this to arbitrary distributions can be shown via the continuity of $f$ on any open set, which is guaranteed by the convexity of $f,$ and the weak density of distributions with finite support in the family of all probability measures. $\square$

## B.3 Constrained optimization

We now define a general constrained optimization problem and the specific properties associated to convex constrained optimization problems.

Definition B.21 (Constrained optimization problem) Let $\mathcal{X} \subseteq \mathbb{R}^{N}$ and $f, g_{i} \colon \mathcal{X} \mathbb{R}$ , for all $i \in[m]$ . Then, a constrained optimization problem has the form:

$$
\begin{array}{rl} \min_{\mathbf{x} \in \mathcal{X}} & f(\mathbf{x}) \\ subjectto: & g_{i}(\mathbf{x}) \leq 0, \forall i \in \{1, \ldots, m\}.\end{array}
$$

This general formulation does not make any convexity assumptions and can be augmented with equality constraints. It is referred to as the primal problem in contrast with a related problem introduced later. We will denote by $p^{*}$ the optimal value of the objective.

For any $\mathbf{x} \in \mathcal{X}$ , we will denote by $g(\mathbf{x})$ the vector $(g_{1}(\mathbf{x}), \ldots, g_{m}(\mathbf{x}))^{\top}$ . Thus, the constraints can be written as $g(\mathbf{x}) \leq \mathbf{0}$ . To any constrained optimization problem, we can associate a Lagrange function that plays an important role in the analysis of the problem and its relationship with another related optimization problem.

Definition B.22 (Lagrangian) The Lagrange function or the Lagrangian associated to the general constrained optimization problem defined in (B.21) is the function defined over $\mathcal{X} \times \mathbb{R}_{+}$ by:

$$
\forall \mathbf{x} \in \mathcal{X}, \forall \boldsymbol{\alpha} \geq 0, \quad \mathcal{L}(\mathbf{x}, \boldsymbol{\alpha}) = f(\mathbf{x}) + \sum_{i = 1}^{m} \alpha_{i} g_{i}(\mathbf{x}),
$$

where the variables $\alpha_{i}$ are known as the Lagrange or dual variables with $\pmb{\alpha} =(\alpha_{1}, \ldots, \alpha_{m})^{\top}$

Any equality constraint of the form $g(\mathbf{x}) = 0$ for a function g can be equivalently expressed by two inequalities: $- g(\mathbf{x}) \leq 0$ and $+ g(\mathbf{x}) \leq 0$ . Let $\alpha_{-} \geq 0$ be the Lagrange variable associated to the first constraint and $\alpha_{+} \geq 0$ the one associated to the second constraint. The sum of the terms corresponding to these constraints in the definition of the Lagrange function can therefore be written as $\alpha g(\mathbf{x})$ with $\alpha =(\alpha_{+} - \alpha_{-})$ . Thus, in general, for an equality constraint $g(\mathbf{x}) = 0$ the Lagrangian is augmented with a term $\alpha g(\mathbf{x})$ but with $\alpha \in \mathbb{R}$ not constrained to be non-negative. Note that in the case of a convex optimization problem, equality constraints $g(\mathbf{x})$ are required to be Affine since both $g(\mathbf{x})$ and $- g(\mathbf{x})$ are required to be convex.

Definition B.23 (Dual function) The (Lagrange) dual function associated to the constrained optimization problem is defined by

$$
\forall \boldsymbol{\alpha} \geq 0, F(\boldsymbol{\alpha}) = \inf_{\mathbf{x} \in \mathcal{X}} \mathcal{L}(\mathbf{x}, \boldsymbol{\alpha}) = \inf_{\mathbf{x} \in \mathcal{X}} \left(f(\mathbf{x}) + \sum_{i = 1}^{m} \alpha_{i} g_{i}(\mathbf{x})\right).\tag{B.5}
$$

Note that $F$ is always concave, since the Lagrangian is linear with respect to α and since the infimum preserves concavity. We further observe that

$$
\forall \boldsymbol{\alpha} \geq 0, \quad F(\boldsymbol{\alpha}) \leq p^{*},
$$

since for any feasible $\begin{array}{r}{\mathbf{x}, f(\mathbf{x}) + \sum_{i = 1}^{m} \alpha_{i} g_{i}(\mathbf{x}) \le f(\mathbf{x})} \end{array}$ . The dual function naturally leads to the following optimization problem.

(B.6)

Definition B.24 (Dual problem) The dual (optimization) problem associated to the constrained optimization problem is

$$
\max_{\boldsymbol{\alpha}} F(\boldsymbol{\alpha}) subjectto: \boldsymbol{\alpha} \geq 0.
$$

The dual problem is always a convex optimization problem (as a maximization of a concave problem). Let $d^{*}$ denote an optimal value. By (B.6), the following inequality always holds:

$$
d^{*} \leq p^{*} \quad(weakduality).
$$

The diference $(p^{*} - d^{*})$ is known as the duality gap. The equality case

$$
d^{*} = p^{*}
$$

$$
(strongduality)
$$

does not hold in general. However, strong duality does hold when convex problems satisfy a constraint qualification. We will denote by int(X) the interior of the set X.

Definition B.25 (Strong constraint qualification) Assume that in $({\mathcal{X}}) \neq \emptyset$ . Then, the strong constraint qualification or Slater’s condition is defined as

$$
\exists \overline{{\mathbf{x}}} \in \operatorname{int}(\mathcal{X}) \colon g(\overline{{\mathbf{x}}}) < 0.\tag{B.7}
$$

A function $h \colon \mathcal{X} \mathbb{R}$ is said to be $affine$ if it can be defined for all $\mathbf{x} \in \mathcal{X}$ by $h(\mathbf{x}) = \mathbf{w} \cdot \mathbf{x} + b,$ for some $\mathbf{w} \in \mathbb{R}^{N}$ and $b \in \mathbb{R}$

Definition B.26 (Weak constraint qualification) Assume that int $({\mathcal{X}}) \neq \emptyset$ . Then, the weak con straint qualification or weak Slater’s condition is defined as

$$
\exists \overline{{\mathbf{x}}} \in \operatorname{int}(\mathcal{X}) \colon \forall i \in[m],(g_{i}(\overline{{\mathbf{x}}}) < 0) \vee(g_{i}(\overline{{\mathbf{x}}}) = 0 \wedge g_{i} affine).\tag{B.8}
$$

We next present sufficient and necessary conditions for solutions to constrained optimization problems, based on the saddle point of the Lagrangian and Slater’s condition.

Theorem B.27 (Saddle point — sufficient condition) Let P be a constrained optimization problem over $\mathcal{X} = \mathbb{R}^{\bar{N}}.~ If \left(\mathbf{x}^{*}, \pmb{\alpha}^{*} \right)$ is a saddle point of the associated Lagrangian, that is,

$$
\forall \mathbf{x} \in \mathbb{R}^{N}, \forall \boldsymbol{\alpha} \geq 0, \quad \mathcal{L}(\mathbf{x}^{*}, \boldsymbol{\alpha}) \leq \mathcal{L}(\mathbf{x}^{*}, \boldsymbol{\alpha}^{*}) \leq \mathcal{L}(\mathbf{x}, \boldsymbol{\alpha}^{*}),\tag{B.9}
$$

then $\mathbf{x}^{*}$ is a solution of the problem P .

Proof: By the first inequality, the following holds:

$$
\begin{array}{c} \forall \boldsymbol{\alpha} \geq 0, \mathcal{L}(\mathbf{x}^{*}, \boldsymbol{\alpha}) \leq \mathcal{L}(\mathbf{x}^{*}, \boldsymbol{\alpha}^{*}) \Rightarrow \forall \boldsymbol{\alpha} \geq 0, \boldsymbol{\alpha} \cdot g(\mathbf{x}^{*}) \leq \boldsymbol{\alpha}^{*} \cdot g(\mathbf{x}^{*}) \\ \Rightarrow g(\mathbf{x}^{*}) \leq 0 \land \boldsymbol{\alpha}^{*} \cdot g(\mathbf{x}^{*}) = 0, \end{array}\tag{B.10}
$$

where $g(\mathbf{x}^{*}) \leq 0$ in (B.10) follows by letting $\alpha \to + \infty$ and $\alpha^{*} \cdot g(\mathbf{x}^{*}) = 0$ follows by letting $\alpha 0,$ In view of (B.10), the second inequality in (B.9) gives,

$$
\forall \mathbf{x}, \mathcal{L}(\mathbf{x}^{*}, \boldsymbol{\alpha}^{*}) \leq \mathcal{L}(\mathbf{x}, \boldsymbol{\alpha}^{*}) \Rightarrow \forall \mathbf{x}, f(\mathbf{x}^{*}) \leq f(\mathbf{x}) + \boldsymbol{\alpha}^{*} \cdot g(\mathbf{x}).
$$

Thus, for all x satisfying the constraints, that is $g(\mathbf{x}) \leq 0$ , we have

$$
f(\mathbf{x}^{*}) \leq f(\mathbf{x}),
$$

which completes the proof.

Theorem B.28 (Saddle point — necessary condition) Assume that f and $g_{i}, i \in[m]$ , are convex functions and that Slater’s condition holds. Then, $_{if \textbf{x}}$ is a solution of the constrained optimization problem, there exists $\alpha \geq 0$ such that $(\mathbf{x}, \pmb{\alpha})$ is a saddle point of the Lagrangian.

Theorem B.29 (Saddle point — necessary condition) Assume that f and $g_{i}, i \in[m]$ , are convex diferentiable functions and that the weak Slater’s condition holds. $If \textbf{x}$ is a solution of the constrained optimization problem, then there exists $\alpha \geq 0$ such that $(\mathbf{x}, \pmb{\alpha})$ is a saddle point of the Lagrangian.

We conclude with a theorem providing necessary and sufficient optimality conditions when the problem is convex, the objective function diferentiable, and the constraints qualified.

Theorem B.30 (Karush-Kuhn-Tucker’s theorem) Assume that $f, g_{i} : \mathcal{X} \mathbb{R}, \forall i \in[m]$ are convex and diferentiable and that the constraints are qualified. Then x is a solution of the constrained program if and if only there exists $\varpi \ge 0$ such that,

$$
\nabla_{\mathbf{x}} \mathcal{L}(\overline{{\mathbf{x}}}, \overline{{\boldsymbol{\alpha}}}) = \nabla_{\mathbf{x}} f(\overline{{\mathbf{x}}}) + \overline{{\boldsymbol{\alpha}}} \cdot \nabla_{\mathbf{x}} g(\overline{{\mathbf{x}}}) = 0\tag{B.11}
$$

$$
\nabla_{\alpha} \mathcal{L}(\overline{{\mathbf{x}}}, \overline{{\boldsymbol{\alpha}}}) = g(\overline{{\mathbf{x}}}) \leq 0\tag{B.12}
$$

$$
\overline{{{{\boldsymbol{\alpha}}}}} \cdot g(\overline{{{{\mathbf{x}}}}}) = \sum_{i = 1}^{m} \overline{{{{\boldsymbol{\alpha}}}}}_{i} g_{i}(\overline{{{{\mathbf{x}}}}}) = 0.\tag{B.13}
$$

The conditions B.11–B.13 are known as the KKT conditions. Note that the last two KKT conditions are equivalent to

$$
g(\overline{{{\mathbf{x}}}}) \leq 0 \wedge(\forall i \in \{1, \dots, m\}, \bar{\alpha}_{i} g_{i}(\overline{{{\mathbf{x}}}}) = 0).\tag{B.14}
$$

These equalities are known as complementarity conditions.

Proof: For the forward direction, since the constraints are qualified, if x is a solution, then there exists α such that the $(\overline{{\mathbf{x}}}, \overline{{\pmb{\alpha}}})$ is a saddle point of the Lagrangian and all three conditions are satisfied (the first condition follows by definition of a saddle point, and the second two conditions follow from (B.10)).

In the opposite direction, if the conditions are met, then for any x such that $g(\mathbf{x}) \leq 0$ , we can write

$$
\begin{array}{ll} f(\mathbf{x}) - f(\overline{{\mathbf{x}}}) \geq \nabla_{\mathbf{x}} f(\overline{{\mathbf{x}}}) \cdot(\mathbf{x} - \overline{{\mathbf{x}}}) & \text{(convexity of f)} \\ = - \sum_{i = 1}^{m} \overline{{\boldsymbol{\alpha}}}_{i} \nabla_{\mathbf{x}} g_{i}(\overline{{\mathbf{x}}}) \cdot(\mathbf{x} - \overline{{\mathbf{x}}}) & \text{(first condition)} \\ \geq - \sum_{i = 1}^{m} \overline{{\boldsymbol{\alpha}}}_{i}[g_{i}(\mathbf{x}) - g_{i}(\overline{{\mathbf{x}}})] & \text{(convexityofg_{i}s)} \\ = - \sum_{i = 1}^{m} \overline{{\boldsymbol{\alpha}}}_{i} g_{i}(\mathbf{x}) \geq 0, & \text{(third condition)} \end{array}
$$

which shows that $f({\overline{{\mathbf{x}}}})$ is the minimum of f over the set of points satisfying the constraints. $\square$

## B.4 Fenchel duality

In this section, we present an alternative theory of convex optimization or convex analysis where the functions $f$ considered may be non-diferentiable and take infinite values.

Throughout, this section, the set X denotes a Hilbert space with the inner product denoted by $\langle \cdot, \cdot \rangle$ . However, the results presented can be straightforwardly extended to the case of a Banach space. We consider functions taking values in $[- \infty, + \infty]$ . The domain of a function $f \colon { \mathcal { X } } $ $[- \infty, + \infty]$ is defined as the set

$$
\operatorname{dom}(f) = \{x \in \mathcal{X}: f(x) < + \infty\}.\tag{B.15}
$$

We extend the definition of convexity and say that $f \colon{\mathcal{X}}[- \infty, + \infty]$ is convex if it is convex over dom(f ), that is if for all $x, x^{\prime} \in$ dom(f) and all $t \in[0, 1]$

$$
f(tx +(1 - t) x^{\prime}) \leq tu +(1 - t) v,\tag{B.16}
$$

for all $(u, v) \in \mathbb{R}^{2}$ with $u \geq f(x)$ and $v \geq f(x^{\prime})$ . A convex function is said to be proper if it takes values in $(- \infty, + \infty]$ and if it is not uniformly equal to $+ \infty$ . It is said to be closed when its epigraph is closed.

## B.4.1 Subgradients

Definition B.31 Let $f \colon{\mathcal{X}}(- \infty, + \infty]$ be a convex function. Then, a vector $g \in \mathcal X$ is a subgradient of f at a point x ∈ dom(f) if the following inequality holds for all $z \in \mathcal X \colon$

$$
f(z) \geq f(x) + \langle z - x, g \rangle.\tag{B.17}
$$

The set of all subgradients at x is called the subdiferential of f at x and is denoted by $\partial f(x)$ with $\partial f(x) = \emptyset \for \x \not \in \mathrm{dom}(f)$

Thus, g is a subgradient at x if the hyperplane with normal vector g passing through the point $(x, f(x))$ is below the graph of $f,$ that is if it is supporting the graph of $f.$ Figure 14.1 illustrates these definitions.

The following lemma shows that if $f$ is diferentiable at $x \in \operatorname{dom}(f)$ , then its subdiferential is reduced to its gradient at x.

Lemma B.32 If f is diferentiable at $x \in \operatorname{dom}(f)$ , then $\partial f(x) = \{\nabla f(x)\}$

Proof: Clearly, the gradient $\nabla f(x)$ is always a subgradient at x. Now, let $g$ be in $\partial f(x)$ . Then, by definition of a subgradient, for any $\epsilon \in \mathbb{R}$ ,

$$
f(x + \epsilon(\nabla f(x) - g)) \geq f(x) + \epsilon \langle \nabla f(x) - g, g \rangle.
$$

A first-order Taylor series expansion gives

$$
f(x + \epsilon(\nabla f(x) - g)) - f(x) = \epsilon \langle \nabla f(x), \nabla f(x) - g \rangle + o(\epsilon \| \nabla f(x) - g \|).
$$

In view of that, the first inequality can be rewritten as

$$
\epsilon \| \nabla f(x) - g \|^{2} \leq o(\epsilon \| \nabla f(x) - g \|),
$$

which implies $\| \nabla f(x) - g \| = o(1)$ and $\nabla f(x) = g.$

Proposition B.33 Let $f \colon{\mathcal{X}}(- \infty, + \infty]$ be a proper function. Then, $x^{*}$ is a global minimizer of $f \iff \ \partial f(x^{*})$ contains 0.

Proof: Since f is proper, $\mathrm{if} \x^{\ast}$ is a minimizer, $f(x^{*})$ cannot be +∞. Thus $x^{*}$ must be in dom(f) (and thus $\partial f(x)$ is not defined to be empty). Now, $x^{*}$ is a global minimizer if for all $z \in{\mathcal{X}},$ $f(z) \geq f(x^{*})$ , that is if 0 is a subgradient of f at $x^{*}$ . $\square$

## B.4.2 Core

The core of a set ${\mathcal{C}} \subseteq{\mathcal{X}}$ is denoted by core(C) and defined as follows:

$$
\operatorname{core}(\mathcal{C}) = \{x \in \mathcal{C}: \forall u \in \mathcal{X}, \exists \epsilon > 0 \mid \forall t \in[0, \epsilon],(x + tu) \in \mathcal{C}\}.\tag{B.18}
$$

Thus, for $x \in \mathrm{core}(\mathcal{C})$ , for any direction $\boldsymbol{u}, \left(\boldsymbol{x} + t \boldsymbol{u} \right)$ is in C for t suficiently small. In view of this definition, core(C) clearly contains the interior of C, int(C).

Proposition B.34 Let $h \colon{\mathcal{X}}[- \infty, + \infty]$ be a convex function. If there exists $x_{0} \in \mathrm{core}(\mathrm{dom}(h))$ such that $h(x_{0}) > - \infty$ , then $h(x) > - \infty$ for all $x \in \mathcal X$

Proof: Let x be in X. Since $x_{0}$ is in $\mathrm{core}(\mathrm{dom}(h))$ , there exists $t > 0$ such that $x_{0}^{\prime} = x_{0} + t(x_{0} - x)$ is in dom(h), that is such that $h(x_{0}^{\prime}) < + \infty$ . Since $\begin{array}{r}{x_{0} = \frac{1}{1 + t} x_{0}^{\prime} + \frac{t}{1 + t} x} \end{array}$ , by convexity, the following holds:

$$
h(x_{0}) \leq \frac{1}{1 + t} h(x_{0}^{\prime}) + \frac{t}{1 + t} v \iff v \geq \frac{1 + t}{t} \Big[h(x_{0}) - \frac{1}{1 + t} h(x_{0}^{\prime}) \Big]\tag{B.19}
$$

for all $v \geq h(x)$ . This implies $\begin{array}{r}{h(x) \ge \frac{1 + t}{t}[h(x_{0}) - \frac{1}{1 + t} h(x_{0}^{\prime})] > - \infty} \end{array}$ , which concludes the proof. $\square$

The proof of the following result is left as an exercise (Exercise B.3).

Proposition B.35 Let $h \colon{\mathcal{X}}(- \infty, + \infty]$ be a convex function. Then, h admits a subdiferential at any $x \in \mathrm{core}(\mathrm{dom}(h))$ ).

## B.4.3 Conjugate functions

Definition B.36 (Conjugate functions) Let X be a Hilbert space. The conjugate function or Fenchel conjugate of a function $f \colon{\mathcal{X}} \mapsto[- \infty, + \infty]$ is the function $f^{*} \colon \mathcal{X} \mapsto[- \infty, + \infty]$ defined by

$$
f^{*}(u) = \sup_{x \in \mathcal{X}} \left\{\langle u, x \rangle - f(x) \right\}.\tag{B.20}
$$

Note that $f^{*}$ is convex as the pointwise supremum of the set of Affine and thus convex functions $u \mapsto \langle x, u \rangle - f(x)$ . Also, if there exists x such that $f(x) < + \infty$ , then $f > - \infty$ . Conjugation is order-reversing: for any f and g, if $f \leq g$ , then $g^{*} \leq f^{*}$ . Also, it is straightforward to see that if $f$ is closed proper convex, then $f^{* *} = f$

Figure B.3 illustrates the definition of conjugate functions. As shown by the figure, conjugate functions correspond to a dual description of the epigraph of a function in terms of supporting hyperplanes and their crossing points.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/263397efe853d33d6a6b03ddda451b680282df9033e2a51251d61c610c841972.jpg)  
Figure B.3

Illustration of the conjugate $f^{*}$ of a function f. Given $y, x^{*}$ is the point at which the distance between the hyperplane of equation $z = \langle x, y \rangle$ with normal y (slope y in dimension one) and the plot of $f(x)$ is the largest. This largest distance is equal to $f^{*}(y)$ . The parallel hyperplane $z = \langle x - x^{*}, y \rangle + f(x^{*})$ with normal y and passing through the point $(x^{*}, f(x^{*})$ is shown. This is a supporting hyperplane of the plot of $f(x)$ . The point at which it intercepts the y-axis (crossing point) has y-coordinate $- f^{\ast}(y)$

Lemma B.37 (Conjugate of extended relative entropy) Let $p_{0} ~ \in ~ \Delta$ be a distribution over X such that $p_{0}(x) > 0$ for all $x \in \mathcal{X}$ . Define $f \colon{\mathbb{R}^{x}} \to$ <sup>R</sup> by

$$
f(p) = \left\{\begin{array}{ll} D(p \| p_{0}) & \text{if} p \in \Delta \\ + \infty & \text{otherwise.} \end{array} \right.
$$

Then, the conjugate function $f^{*} \colon{\mathbb{R}}^{\mathcal{X}} \to{\mathbb{R}}$ of f is defined by

$$
\forall q \in \mathbb{R}^{\mathcal{X}}, f^{*}(q) = \log \bigg(\sum_{x \in \mathcal{X}} p_{0}(x) e^{q(x)} \bigg).
$$

Proof: By definition of $f,$ , for any $q \in \mathbb{R}^{\mathcal{X}}$ , we can write

$$
\sup_{p \in \mathbb{R}^{\mathcal{X}}} \big(\langle p, q \rangle - \mathrm{D}(p \| p_{0}) \big) = \sup_{p \in \Delta} \big(\langle p, q \rangle - \mathrm{D}(p \| p_{0}) \big).\tag{B.21}
$$

Fix $q \in \mathbb{R}^{\mathcal{X}}$ and let $\bar{q} \in \Delta$ be defined for al $x \in \mathcal X$ by

$$
\bar{q}(x) = \frac{p_{0}(x) e^{q(x)}}{\sum_{x \in \mathcal{X}} p_{0}(x) e^{q(x)}} = \frac{p_{0}(x) e^{q(x)}}{\mathbb{E}_{p_{0}}[e^{q}]}.\tag{B.22}
$$

Then, the following holds for all $p \in \Delta$

$$
\langle p, q \rangle - D(p \| p_{0}) = \underset{p}{\mathbb{E}}[\log(e^{q})] - \underset{p}{\mathbb{E}} \left[\log \frac{p}{p_{0}} \right] = \underset{p}{\mathbb{E}} \left[\log \frac{p_{0} e^{q}}{p} \right] = - D(p \| \bar{q}) + \log \underset{p_{0}}{\mathbb{E}}[e^{q}].
$$

Since $D(p \| \bar{q}) \geq 0$ and $D(p \| \bar{q}) = 0$ for $p = \bar{q}.$ , this shows that su $\begin{array}{r}{{\cdot} p_{p \in \Delta} \left(p{\cdot} q{-} D(p \| p_{0}) \right) = \log \left(\mathbb{E}_{p_{0}}[e^{q}] \right)} \end{array}$ and concludes the proof. $\square$

Table B.1 gives a series of other examples of functions and their conjugates. The following is an immediate consequence of the definition of the conjugate functions.

## Table B.1

Examples of functions g and their conjugates $g^{*}$

<table><tr><td>g(x)</td><td>dom(g)</td><td>g*(y)</td><td>dom(g*)</td></tr><tr><td>f(ax) (a≠0)</td><td>X</td><td>f*(y/a)</td><td>X*</td></tr><tr><td>f(x+b)</td><td>X</td><td>f*(y)-&lt;b,y&gt;</td><td>X*</td></tr><tr><td>af(x) (a&gt;0)</td><td>X</td><td>af*(y/a)</td><td>X*</td></tr><tr><td>αx+β</td><td>R</td><td>{-β if y=α+∞ otherwise</td><td>R</td></tr><tr><td> $\frac{|x|^p}{p}$  (p&gt;1)</td><td>R</td><td> $\frac{|y|^q}{q}$  ( $\frac{1}{p}+\frac{1}{q}=1$ )</td><td>R</td></tr><tr><td> $\frac{-x^p}{p}$  (0&lt;R+ $\frac{-(-y)^q}{q}$  ( $\frac{1}{p}+\frac{1}{q}=1$ )R_</td><td>R+</td><td> $\frac{-(-y)^q}{q}$  ( $\frac{1}{p}+\frac{1}{q}=1$ )</td><td>R-</td></tr><tr><td> $\sqrt{1+x^2}$ </td><td>R</td><td> $-\sqrt{1-(y)^2}$ </td><td>[-1,1]</td></tr><tr><td>-log(x)</td><td>R+  $\{0\}$ </td><td>-(1+log(-y))</td><td>R-  $\{0\}$ </td></tr><tr><td>ex</td><td>R</td><td>{y log(y)-y, if y&gt;00, if y=0</td><td>R+</td></tr><tr><td>log(1+ex)</td><td>R</td><td>{y log(y)+(1-y)log(1-y), if 0&lt; y&lt;10, if y=0,1</td><td>[0,1]</td></tr><tr><td>-log(1−ex)</td><td>R</td><td>{y log(y)-(1+y)log(1+y), if y&gt;00, if y=0</td><td>R+</td></tr></table>

Proposition B.38 (Fenchel’s inequality) Let X be a Hilbert space. For any function $f \colon \mathcal{X} \mapsto$ $[- \infty, + \infty]$ and any $x \in \operatorname{dom}(f)$ and $u \in \mathfrak{X}$ , the following inequality holds:

$$
f(x) + f^{*}(u) \geq \langle u, x \rangle.\tag{B.23}
$$

Equality holds if u is a subgradient of f at x.

We will denote by $A^{*}$ the adjoint operator of a bounded (or continuous) linear map $A \colon \mathcal{X} \mathcal{Y}.$ Also, we denote by $\operatorname{cont}(f)$ the set of points $x \in \mathcal X$ at which $f \colon{\mathcal{X}}[- \infty, + \infty]$ is finite and continuous.

Theorem B.39 (Fenchel duality theorem) Let X and Y be two Hilbert spaces, $f \colon{\mathcal{X}}(- \infty, + \infty]$ and $g \colon \mathcal{Y}(- \infty, + \infty]$ two convex functions and $A \colon \mathcal{X} \mathcal{Y}$ a bounded linear map. Then, the following two optimization problems ( Fenchel problems)

$$
\begin{array}{l} p^{*} = \inf_{x \in \mathcal{X}} \{f(x) + g(Ax)\} \\ d^{*} = \sup_{y \in \mathcal{Y}} \{- f^{*}(A^{*} y) - g^{*}(- y)\} \end{array}
$$

satisfy the weak duality $p^{*} \geq d^{*}$ . If further f and g satisfy the condition

$$
0 \in \operatorname{core} \big(\operatorname{dom}(g) - A(\operatorname{dom}(f)) \big),
$$

or the stronger condition

$$
A(\operatorname{dom}(f)) \cap \operatorname{cont}(g) \neq \emptyset,
$$

then strong duality holds, that is $p^{*} = d^{*}$ and the supremum in the dual problem is attained if $d^{\ast} \in \mathbb{R}$

Proof: By Fenchel’s inequality (proposition B.38) applied to both f and $^{g,}$ for any $x \in \mathcal{X}$ and $y \in \mathcal{Y}$ , the following inequalities hold:

$$
f(x) + f^{*} \left(A^{*} y\right) \geq \langle A^{*} y, x \rangle = \langle y, Ax \rangle = - \langle - y, Ax \rangle \geq - g(Ax) - g^{*}(- y).
$$

Comparing the leftmost and the rightmost terms gives

$$
f(x) + f^{*} \left(A^{*} y\right) \geq - g(Ax) - g^{*}(- y) \iff f(x) + g(Ax) \geq - f^{*} \left(A^{*} y\right) - g^{*}(- y).
$$

Taking the infimum over $x \in \mathcal{X}$ of the left-hand side and the supremum over $y \in \mathcal{Y}$ of the right-hand side of the last inequality yields $p^{*} \geq d^{*}$

Consider now the function $h \colon \mathcal{Y}[- \infty, + \infty]$ defined for all $u \in \mathbb{y}$ by

$$
h(u) = \inf_{x \in \mathcal{X}} \{f(x) + g(Ax + u)\}.\tag{B.24}
$$

Since $(x, u) \mapsto f(x) + g(Ax + u)$ is convex, h is convex as the infimum over one argument of that function. u is in dom(h) if there exists $x \in \mathscr{X}$ such that $f(x) + g(Ax + u) < + \infty$ , that is if there exists $x \in \mathcal X$ such that $f(x) < + \infty$ and $g(Ax + u) < + \infty$ , that is if there exists $x \in \operatorname{dom}(f)$ such that $(Ax + u) \in \mathrm{dom}(g)$ . Thus, we have dom $(h) = \mathrm{dom}(g) - A$ dom(f).

If $p^{*} = - \infty$ , then strong duality clearly holds. Otherwise, $p^{*} > - \infty$ . If $0 \in$ core $(\operatorname{dom}(g) -{}$ $A(\operatorname{dom}(f))) = \operatorname{core}(\operatorname{dom}(h))$ , then 0 is in dom(h) and $p^{*} < + \infty$ . Thus, $p^{*} = h(0)$ is in <sup>R</sup>. By proposition B.34, since $h(0) > - \infty$ and $0 \in \mathrm{core}(\mathrm{dom}(h))$ , h takes values in $(- \infty, + \infty]$ . Thus, by proposition B.35, h admits a subgradient −y at 0. By definition of $_{y,}$ for all $x \in \mathcal{X}$ and $u \in \mathbb{y}$ 2

$$
\begin{array}{l} h(0) \leq h(u) + \langle y, u \rangle \\ \quad \leq f(x) + g(Ax + u) + \langle y, u \rangle \\ \quad = \{f(x) - \langle A^{*} y, x \rangle\} + \{g(Ax + u) + \langle y, u \rangle + \langle A^{*} y, x \rangle\} \\ \quad = \{f(x) - \langle A^{*} y, x \rangle\} + \{g(Ax + u) + \langle y, Ax + u \rangle\}.\end{array}
$$

Taking the infimum over u and the supremum over x yields

$$
h(0) \leq - f^{*}(A^{*} y) - g^{*}(- y) \leq d^{*} \leq p^{*} = h(0),
$$

which proves $d^{*} = p^{*}$ and that the supremum defining $d^{*}$ is reached at y.

Finally, assume that $A(\operatorname{dom}(f)) \cap \operatorname{cont}(g) \neq \emptyset$ and let $u \in A(\mathrm{dom}(f)) \cap \mathrm{cont}(g)$ . Then, $u = Ax$ with $x \in \operatorname{dom}(f)$ and $u \in \mathrm{cont}(g) \subseteq \mathrm{dom}(g)$ . Thus, we have $0 = u - Ax \in \operatorname{dom}(g) - A \operatorname{dom}(f)$ Since $g$ is continuous at u and $g(u)$ is finite, for any $v \in \mathcal X$ , there exists $\epsilon > 0$ such that $g(u + tv)$ is finite for all $t \in[0, \epsilon]$ , thus $w_{t} =(u + tv) \in \mathrm{dom}(g)$ . Therefore, for any $t \in[0, \epsilon], tv = w_{t} - u =$ $w_{t} - Ax \in \operatorname{dom}(g) - A \operatorname{dom}(f)$ , which shows that $0 \in \operatorname{core} \big(\operatorname{dom}(g) - A(\operatorname{dom}(f)) \big)$ $\square$

To illustrate the theorem, consider the case where A is the identity operator. The primal optimization problem is then min<sub>x</sub> $\{f(x) + g(x)\}$ . Figure B.4 illustrates the Fenchel duality theorem in that case. The primal problem consists of finding the point $x^{*}$ at which the distance between the plots of $f(x)$ and $- g(x)$ is minimal since $f(x) \bar{+} g(x) = f(x) -(- g(x))$ . As shown by the figure, under the conditions of the theorem, this coincides with seeking $y^{*}$ at which the diference of the conjugate values of $f(x)$ and $- g(x)$ , that is the diference $- f^{*}(y) - g^{*}(- y)$ is maximal.

## B.5 Chapter notes

The results presented in this appendix are based on several key theorems: theorem B.3 due to Fermat (1629); theorem B.27 due to Lagrange (1797), theorem B.30 due to Karush [1939] and Kuhn and Tucker [1951], and theorem B.39 due to Werner Fenchel, based on the notion of conjugate functions or Legendre transformations. For a more extensive material on convex optimization, we strongly recommend the books of Boyd and Vandenberghe [2004], Bertsekas, Nedi´c, and Ozdaglar [2003], Rockafellar [1997], Borwein and Lewis [2000] and Borwein and Zhu [2005] which have formed the basis for part of the material presented in this appendix. In particular, our table of conjugate functions is extracted from [Borwein and Lewis, 2000].

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/60f40e9221e63d0f318d7a2fb495c73ea4edba84ca3738d063c1ddca6ce16864.jpg)  
Figure B.4

Illustration of Fenchel Duality; min ${\mathrm{\nabla}}_{x} \left\{f(x) + g(x) \right\} = \operatorname{max}_{y} \left\{{\mathrm{\nabla}} - f^{\ast}(y) - g^{\ast}(- y) \right\}$

## B.6 Exercises

B.1 Give the conjugate of the function f defined by $f(x) = \left| x \right|$ for all $x \in \mathbb{R}$

B.2 Prove the correctness of the conjugate function $g^{*}$ for each function g of Table B.1.

B.3 Give the proof of Proposition B.35.

# C <sub>Probability</sub> <sub>Review</sub>

In this appendix, we give a brief review of some basic notions of probability and will also define the notation that is used throughout the textbook.

## C.1 Probability

A probability space is a tuple consisting of three components: a sample space, an events set, and a probability distribution:

sample space Ω: Ω is the set of all elementary events or outcomes possible in a trial, for example, each of the six outcomes in $\{1, \ldots, 6\}$ when casting a die.

<sub>•</sub> events set $\mathcal{F} \colon \ \mathcal{F}$ is a σ-algebra, that is a set of subsets of Ω containing Ω that is closed under complementation and countable union (therefore also countable intersection). An example of an event may be “the die lands on an odd number”.

<sub>•</sub> probability distribution: <sup>P</sup> is a mapping from the set of all events $\mathcal{F}$ to [0, 1] such that $\mathbb{P}[\Omega] = 1$ , ${\bar{\mathbb{P}}}[\varnothing] = 1$ , and, for all mutually exclusive events $A_{1}, \ldots, A_{n}$ ，

$$
\mathbb{P} \left[A_{1} \cup \dots \cup A_{n} \right] = \sum_{i = 1}^{n} \mathbb{P} \left[A_{i} \right].
$$

The discrete probability distribution associated with a fair die can be defined by $\mathbb{P}[A_{i}] = 1 / 6$ for $i \in \{1 \ldots 6\}$ , where $A_{i}$ is the event that the die lands on value i.

## C.2 Random variables

Definition C.1 (Random variables) A random variable X is a function $X \colon \Omega \to$ <sup>R</sup> that is measurable, that is such that for any interval I, the subset of the sample space $\{\omega \in \Omega \colon X(\omega) \in I\}$ is an event.

The probability mass function of a discrete random variable X is defined as the function $x \mapsto$ $\mathbb{P}[X = x]$ . The joint probability mass function of discrete random variables X and Y is defined as the function $(x, y) \mapsto \mathbb{P}[X = x \wedge Y = y]$

A probability distribution is said to be absolutely continuous when it admits a probability density function, that is a function $f$ associated to a real-valued random variable X that satisfies for all $a, b \in \mathbb{R}$

$$
\mathbb{P}[a \leq X \leq b] = \int_{a}^{b} f(x) dx.\tag{C.1}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/f0a49b5a79f28b152508e2c54d574732454b04d9a5485828439b8ccd9c75245d.jpg)  
Figure C.1  
Approximation of the binomial distribution (in red) by a normal distribution (in blue).

Definition C.2 (Binomial distribution) A random variable X is said to follow a binomial distri bution $B(\boldsymbol n, \boldsymbol p)$ with $n \in \mathbb N$ and $p \in[0, 1]$ if for any $k \in \{0, 1, \ldots, n\}$ ，

$$
\mathbb{P}[X = k] = \binom{n}{k} p^{k}(1 - p)^{n - k}.
$$

Definition C.3 (Normal distribution) A random variable X is said to follow a normal (or Gaus sian) distribution $N(\mu, \sigma^{2})$ with $\mu \in \mathbb{R}$ and $\sigma > 0$ if its probability density function is given $by$

$$
f(x) = \frac{1}{\sqrt{2 \pi \sigma^{2}}} \exp \left(- \frac{(x - \mu)^{2}}{2 \sigma^{2}}\right).
$$

The standard normal distribution $N(0, 1)$ is the normal distribution with zero mean and unit variance.

The normal distribution is often used to approximate a binomial distribution. Figure C.1 illustrates that approximation.

Definition C.4 (Laplace distribution) A random variable X is said to follow a Laplace distribution with location parameter $\mu \in \mathbb{R}$ and scale parameter $b > 0 \if$ its probability density function is given $by,$

$$
f(x) = \frac{1}{2b} \exp \left(- \frac{| x - \mu |}{b}\right).
$$

Definition C.5 (Gibbs distributions) Given a set X and feature function Φ: $\mathcal{X} \to \mathbb{R}^{N}$ , a random variable X is said to follow a Gibbs distribution with parameter w ∈ <sup>RN</sup> if for any $x \in \mathcal X$ ,

$$
\mathbb{P}[X = x] = \frac{\exp(\mathbf{w} \cdot \Phi(x))}{\sum_{x \in \mathcal{X}} \exp(\mathbf{w} \cdot \Phi(x))}.
$$

The normalizing quantity in the denominator $\begin{array}{r}{Z = \sum_{x \in \mathcal{X}} \exp(\mathbf{w} \cdot \Phi(x))} \end{array}$ is also called the partition function.

Definition C.6 (Poisson distribution) A random variable X is said to follow a Poisson distri bution with $\lambda > 0$ if for any $k \in \mathbb{N}$

$$
\mathbb{P}[X = k] = \frac{\lambda^{k} e^{- \lambda}}{k !}.
$$

The definition of the following family of distributions uses the notion of independence of random variables defined in the next section.

Definition C.7 $(\chi^{2}$ distribution) The $\chi^{2}$ distribution (or chi-squared distribution) with k degrees of freedom is the distribution of the sum of the squares of k independent random variables, each following a standard normal distribution.

## C.3 Conditional probability and independence

Definition C.8 (Conditional probability) The conditional probability of event A given event B is defined by

$$
\mathbb{P}[A \mid B] = \frac{\mathbb{P}[A \cap B]}{\mathbb{P}[B]},\tag{C.2}
$$

when $\mathbb{P}[B] \neq 0$

Definition C.9 (Independence) Two events A and B are said to be independent if

$$
\mathbb{P}[A \cap B] = \mathbb{P}[A] \mathbb{P}[B].\tag{C.3}
$$

Equivalently, A and B are independent $iff \operatorname{\mathbb{P}}[A \mid B] = \operatorname{\mathbb{P}}[A]$ when $\mathbb{P}[B] \neq 0$

A sequence of random variables is said to be independent and identically distributed $(i.i.d.)$ when the random variables are mutually independent and follow the same distribution.

The following are basic probability formulae related to the notion of conditional probability. They hold for any events A, B, and $A_{1}, \ldots, A_{n}$ , with the additional constraint $\mathbb{P}[B] \neq 0$ needed for the Bayes formula to be well defined:

$$
\mathbb{P}[A \cup B] = \mathbb{P}[A] + \mathbb{P}[B] - \mathbb{P}[A \cap B]
$$

$$
(sumrule)\tag{C.4}
$$

$$
\mathbb{P}[\bigcup_{i = 1}^{n} A_{i}] \leq \sum_{i = 1}^{n} \mathbb{P}[A_{i}]\tag{unionbound}
$$

(C.5)

$$
\mathbb{P}[A \mid B] = \frac{\mathbb{P}[B \mid A] \mathbb{P}[A]}{\mathbb{P}[B]}\tag{Bayesformula}
$$

$$
\mathbb{P}[\bigcap_{i = 1}^{n} A_{i}] = \mathbb{P}[A_{1}] \mathbb{P}[A_{2} \mid A_{1}] \dots \mathbb{P}[A_{n} \mid \bigcap_{i = 1}^{n - 1} A_{i}]\tag{C.6}
$$

$$
(chainrule).\tag{C.7}
$$

The sum rule follows immediately from the decomposition of $A \cup B$ as the union of the disjoint sets A and $(B - A \cap B)$ . The union bound is a direct consequence of the sum rule. The Bayes formula follows immediately from the definition of conditional probability and the observation that: $\mathbb{P}[A | B] \mathbb{P}[B] = \mathbb{P}[B | A] \mathbb{P}[A] = \mathbb{P}[A \cap B]$ . Similarly, the chain rule follows the observation that ${\mathbb{P}}[A_{1}]{\mathbb{P}}[A_{2} | \dot{A}_{1}] \stackrel{-}{=}{\mathbb{P}}[A_{1} \cap A_{2}];$ using the same argument shows recursively that the product of the first k terms of the right-hand side equals $\mathbb{P}[\bigcap_{i = 1}^{k} A_{i}]$

Finally, assume that $\Omega = A_{1} \cup A_{2} \cup...\cup A_{n}$ with $A_{i} \cap A_{j} = \varnothing$ for $i \neq j,$ , i.e., the $A_{i} s$ are mutually disjoint. Then, the following formula is valid for any event B:

$$
\mathbb{P}[B] = \sum_{i = 1}^{n} \mathbb{P}[B \mid A_{i}] \mathbb{P}[A_{i}]
$$

$$
(theoremoftotalprobability).\tag{C.8}
$$

This follows the observation that $\mathbb{P}[B \mid A_{i}] \mathbb{P}[A_{i}] = \mathbb{P}[B \cap A_{i}]$ by definition of the conditiona probability and the fact that the events $B \cap A_{i}$ are mutually disjoint.

## C.4 Expectation and Markov’s inequality

Definition C.10 (Expectation) The expectation or mean of a random variable X is denoted by <sup>E</sup>[X] and defined by

$$
\mathbb{E}[X] = \sum_{x} x \mathbb{P}[X = x].\tag{C.9}
$$

When X follows a probability distribution D, we will also write $\mathbb{E}_{x \sim \mathcal{D}}[x]$ instead of $\mathbb{E}[X]$ to explicitly indicate the distribution. A fundamental property of expectation, which is straightforward to verify using its definition, is that it is linear, that is, for any two random variables X and $Y$ and any $a, b \in \mathbb{R}$ , the following holds:

$$
\mathbb{E}[aX + bY] = a \mathbb{E}[X] + b \mathbb{E}[Y].\tag{C.10}
$$

Furthermore, when X and Y are independent random variables, then the following identity holds:

$$
\mathbb{E}[XY] = \mathbb{E}[X] \mathbb{E}[Y].\tag{C.11}
$$

Indeed, by definition of expectation and of independence, we can write

$$
\begin{array}{c} \mathbb{E}[XY] = \sum_{x, y} xy \mathbb{P}[X = x \wedge Y = y] = \sum_{x, y} xy \mathbb{P}[X = x] \mathbb{P}[Y = y] \\ = \Big(\sum_{x} x \mathbb{P}[X = x] \Big) \Big(\sum_{y} y \mathbb{P}[Y = y] \Big), \end{array}
$$

where in the last step we used Fubini’s theorem . The following provides a simple bound for a non-negative random variable in terms of its expectation, known as Markov’s inequality.

Theorem C.11 (Markov’s inequality) Let X be a non-negative random variable with $\mathbb{E}[X] < \infty$ Then for all $t > 0$

$$
\mathbb{P} \left[X \geq t \mathbb{E}[X] \right] \leq \frac{1}{t}.\tag{C.12}
$$

Proof: The proof steps are as follows:

$$
\begin{array}{ll} \mathbb{P}[X \geq t \mathbb{E}[X]] = \sum_{x \geq t \mathbb{E}[X]} \mathbb{P}[X = x] & \text{(by definition)} \\ \leq \sum_{x \geq t \mathbb{E}[X]} \mathbb{P}[X = x] \frac{x}{t \mathbb{E}[X]} & \left(\text{using} \frac{x}{t \mathbb{E}[X]} \geq 1\right) \\ \leq \sum_{x} \mathbb{P}[X = x] \frac{x}{t \mathbb{E}[X]} & \text{(extending non - negative sum)} \\ = \mathbb{E} \left[\frac{X}{t \mathbb{E}[X]} \right] = \frac{1}{t} & \text{(linearity of expectation).} \end{array}
$$

This concludes the proof.

## C.5 Variance and Chebyshev’s inequality

Definition C.12 (Variance — Standard deviation) The variance of a random variable X is denoted by Var[X] and defined by

$$
\operatorname{Var}[X] = \mathbb{E}[(X - \mathbb{E}[X])^{2}].\tag{C.13}
$$

The standard deviation of a random variable X is denoted by $\sigma_{X}$ and defined by

$$
\sigma_{X} = \sqrt{\operatorname{Var}[X]}.\tag{C.14}
$$

For any random variable X and any $a \in \mathbb R$ , the following basic properties hold for the variance, which can be proven straightforwardly:

$$
\operatorname{Var}[X] = \mathbb{E}[X^{2}] - \mathbb{E}[X]^{2}\tag{C.15}
$$

$$
\operatorname{Var}[aX] = a^{2} \operatorname{Var}[X].\tag{C.16}
$$

Furthermore, when X and Y are independent, then

$$
\operatorname{Var}[X + Y] = \operatorname{Var}[X] + \operatorname{Var}[Y].\tag{C.17}
$$

Indeed, using the linearity of expectation and the identity $\mathbb{E}[X] \mathbb{E}[Y] - \mathbb{E}[XY] = 0$ which holds by the independence of X and $Y$ , we can write

$$
\begin{array}{rl} &{\operatorname{Var}[X + Y] = \mathbb{E}[(X + Y)^{2}] - \mathbb{E}[X + Y]^{2}} \\ &{\qquad = \mathbb{E}[X^{2} + Y^{2} + 2XY] -(\mathbb{E}[X]^{2} + \mathbb{E}[Y]^{2} + 2 \mathbb{E}[XY])} \\ &{\qquad =(\mathbb{E}[X^{2}] - \mathbb{E}[X]^{2}) +(\mathbb{E}[Y^{2}] - \mathbb{E}[Y]^{2}) + 2(\mathbb{E}[X] \mathbb{E}[Y] - \mathbb{E}[XY])} \\ &{\qquad = \operatorname{Var}[X] + \operatorname{Var}[Y].} \end{array}
$$

The following inequality known as Chebyshev’s inequality bounds the deviation of a random variable from its expectation in terms of its standard deviation.

Theorem C.13 (Chebyshev’s inequality) Let X be a random variable with $\operatorname{Var}[X] < + \infty$ . Then, for all $t > 0$ , the following inequality holds:

$$
\mathbb{P} \left[| X - \mathbb{E}[X] | \geq t \sigma_{X} \right] \leq \frac{1}{t^{2}}.\tag{C.18}
$$

Proof: Observe that:

$$
\mathbb{P} \left[| X - \mathbb{E}[X] | \geq t \sigma_{X} \right] = \mathbb{P}[(X - \mathbb{E}[X])^{2} \geq t^{2} \sigma_{X}^{2}].
$$

The result follows by application of Markov’s inequality to $(X - \mathbb{E}[X])^{2}$

We will use Chebyshev’s inequality to prove the following theorem.

Theorem C.14 (Weak law of large numbers) Let $(X_{n})_{n \in \mathbb{N}}$ be a sequence of independent random variables with the same mean $\mu$ and variance $\sigma^{2} < \infty$ . Let $\begin{array}{r}{\overline{{X}}_{n} \doteq \frac{1}{n} \sum_{i = 1}^{n} X_{i}.} \end{array}$ then, for any $\epsilon > 0$

$$
\lim_{n \to \infty} \mathbb{P}[| \overline{{X}}_{n} - \mu | \geq \epsilon] = 0.\tag{C.19}
$$

Proof: Since the variables are independent, we can write

$$
\operatorname{Var}[\overline{{X}}_{n}] = \sum_{i = 1}^{n} \operatorname{Var} \left[\frac{X_{i}}{n} \right] = \frac{n \sigma^{2}}{n^{2}} = \frac{\sigma^{2}}{n}.
$$

Thus, by Chebyshev’s inequality (with $t = \epsilon /(\operatorname{Var}[\overline{{X}}_{n}])^{1 / 2})$ , the following holds:

$$
\mathbb{P}[| \overline{{X}}_{n} - \mu | \geq \epsilon] \leq \frac{\sigma^{2}}{n \epsilon^{2}},
$$

which implies (C.19).

Example C.15 (Applying Chebyshev’s inequality) Suppose we roll a pair of fair dice n times. Can we give a good estimate of the total value of the n rolls? If we compute the mean and variance, we find $\mu = 7n$ and $\sigma^{2} = 35 / 6n$ (we leave it to the reader to verify these expressions). Thus, applying Chebyshev’s inequality, we see that the final sum will lie within $7n \pm 10 \sqrt{\frac{35}{6}} \i$ n in at least 99 percent of all experiments. Therefore, the odds are better than 99 to 1 that the sum will be between 6.975M and 7.025M after 1M rolls.

Definition C.16 (Covariance) The covariance of two random variables X and Y is denoted by Cov(X, Y ) and defined by

$$
\operatorname{Cov}(X, Y) = \mathbb{E} \left[(X - \mathbb{E}[X])(Y - \mathbb{E}[Y]) \right].\tag{C.20}
$$

Two random variables X and Y are said to be uncorrelated when $\operatorname{Cov}(X, Y) = 0$ . It is straightforward to see that if two random variables X and Y are independent then they are uncorrelated, but the converse does not hold in general. The covariance defines a positive semidefinite and symmetric bilinear form:

<sub>•</sub> symmetry: $\operatorname{Cov}(X, Y) = \operatorname{Cov}(Y, X)$ for any two random variables X and $Y;$

<sub>•</sub> bilinearity: $\operatorname{Cov}(X + X^{\prime}, Y) = \operatorname{Cov}(X, Y) + \operatorname{Cov}(X^{\prime}, Y)$ and $\operatorname{Cov}(aX, Y) = a \operatorname{Cov}(X, Y)$ for any random variables $X, X^{\prime}$ , and Y and $a \in \mathbb{R}$ ;

positive semidefiniteness: $\operatorname{Cov}(X, X) = \operatorname{Var}[X] \geq 0$ for any random variable X.

The following Cauchy-Schwarz inequality holds for random variables X and Y with $\operatorname{Var}[X] < + \infty$ and $\operatorname{Var}[Y] < + \infty{\mathrm{:}}$

$$
| \operatorname{Cov}(X, Y) | \leq \sqrt{\operatorname{Var}[X] \operatorname{Var}[Y]}.\tag{C.21}
$$

The following definition extends the notion of covariance to a vector of random variables.

Definition C.17 The covariance matrix $of$ a vector of random variables $\mathbf{X} =(X_{1}, \ldots, X_{N})$ is the matrix $ { i n } \mathbb { R } ^ { N \times N }$ denoted by C(X) and defined by

$$
\mathbf{C}(\mathbf{X}) = \mathbb{E} \left[(\mathbf{X} - \mathbb{E}[\mathbf{X}])(\mathbf{X} - \mathbb{E}[\mathbf{X}])^{\top} \right].\tag{C.22}
$$

Thus, $\mathbf{C}(\mathbf{X}) =(\operatorname{Cov}(X_{i}, X_{j}))_{ij}$ . It is straightforward to show that

$$
\mathbf{C}(\mathbf{X}) = \mathbb{E}[\mathbf{XX}^{\top}] - \mathbb{E}[\mathbf{X}] \mathbb{E}[\mathbf{X}]^{\top}.\tag{C.23}
$$

We close this appendix with the following well-known theorem of probability.

Theorem C.18 (Central limit theorem) Let $X_{1}, \ldots, X_{n}$ be a sequence of $i, i, d,$ random variables with mean $\mu$ and standard deviation σ. Let $\begin{array}{r}{\overline{{X}}_{n} = \frac{1}{n} \sum_{i = 1}^{n} X_{i}} \end{array}$ and $\overline{{\sigma}}_{n}^{2} = \sigma^{2} / n$ . Then, $(\overline{{X}}_{n} - \mu) / \overline{{\sigma}}_{n}$ converges to the $N(0, 1)$ in distribution, that is for any $t \in \mathbb{R}$

$$
\lim_{n \to \infty} \mathbb{P}[(\overline{{X}}_{n} - \mu) / \overline{{\sigma}}_{n} \leq t] = \int_{- \infty}^{t} \frac{1}{\sqrt{2 \pi}} e^{- \frac{x^{2}}{2}} dx.
$$

## C.6 Moment-generating functions

The expectation $\mathbb{E}[X^{p}]$ is called the pth-moment of the random variable X. The moment generating function of a random variable X is a key function from which its different moments can be straightforwardly computed via diferentiation at zero. It can therefore be crucial for specifying the distribution of X or analyzing its properties.

Definition C.19 (Moment-generating function) The moment-generating function of a random variable X is the function $\bar{M}_{X} \colon t \mapsto \bar{\mathbb{E}[e^{tX}]}$ defined over the set of $t \in \mathbb{R}$ for which the expectation is finite.

If $M_{X}$ is diferentiable at zero, then the pth-moment of X is given by $\mathbb{E}[X^{p}] = M_{X}^{(p)}(0)$ . We will present in the next chapter a general bound on the moment-generating function of a zero-mean bounded random variable (Lemma D.1). Here, we illustrate its computation in two special cases.

Example C.20 (Standard normal distribution) Let X be a random variable following a normal distribution with mean 0 and variance 1. Then, $M_{X}$ is defined for all $t \in \mathbb{R}$ by

$$
M_{X}(t) = \int_{- \infty}^{\infty} \frac{1}{\sqrt{2 \pi}} e^{- \frac{x^{2}}{2}} e^{tx} dx = e^{\frac{t^{2}}{2}} \int_{- \infty}^{\infty} \frac{1}{\sqrt{2 \pi}} e^{- \frac{1}{2}(x - t)^{2}} dx = e^{\frac{t^{2}}{2}},\tag{C.24}
$$

by recognizing that the last integrand is the probability density function of a normal distribution with mean t and variance 1

Example C.21 $(\chi^{2}$ distribution) Let X be a random variable following a $\cdot \chi^{2}$ distribution with k degrees of freedom. We can write $\textstyle X = \sum_{i = 1}^{k} X_{i}^{2}$ where the $X_{i} s$ are independent and follow a standard normal distribution.

Let $t < 1 / 2$ . By the i.i.d. assumption about the variables $X_{i}$ , we can write

$$
\mathbb{E}[e^{tX}] = \mathbb{E} \left[\prod_{i = 1}^{k} e^{tX_{i}^{2}} \right] = \prod_{i = 1}^{k} \mathbb{E} \left[e^{tX_{i}^{2}} \right] = \mathbb{E} \left[e^{tX_{1}^{2}} \right]^{k}.
$$

By definition of the standard normal distribution, we have

$$
\begin{array}{c} \mathbb{E}[e^{tX_{1}^{2}}] = \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{+ \infty} e^{tx^{2}} e^{\frac{- x^{2}}{2}} dx = \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{+ \infty} e^{(1 - 2t) \frac{- x^{2}}{2}} dx \\ = \frac{1}{\sqrt{2 \pi}} \int_{- \infty}^{+ \infty} \frac{e^{\frac{- u^{2}}{2}}}{\sqrt{1 - 2t}} du =(1 - 2t)^{- \frac{1}{2}}, \end{array}
$$

where we used the change of variable $u = \sqrt{1 - 2t} x$ . In view of that, the moment-generating function of the $\chi^{2}$ distribution is given by

$$
\forall t < 1 / 2, M_{X}(t) = \mathbb{E}[e^{tX}] =(1 - 2t)^{- \frac{k}{2}}.\tag{C.25}
$$

## C.7 Exercises

C.1 Let $f \colon(0, + \infty) \to \mathbb{R}_{+}$ be a function admitting an inverse $f^{- 1}$ and let X be a random variable. Show that if for any $t > 0, \mathbb{P}[X > t] \leq f(t)$ , then, for any $\delta > 0$ , with probability at least $1 - \delta, X \leq f^{- 1}(\delta)$

C.2 Let X be a discrete random variable taking non-negative integer values. Show that $\mathbb{E}[X] =$ $\textstyle \sum_{n \geq 1} \mathbb{P}[X \geq n]$ (Hint: rewrite $\mathbb{P}[X = n]$ as $\mathbb{P}[X \geq n] - \mathbb{P}[X \geq n + 1],$ ).

In this appendix, we present several concentration inequalities used in the proofs given in this book. Concentration inequalities give probability bounds for a random variable to be concentrated around its mean, or for it to deviate from its mean or some other value.

## D.1 Hoeffding’s inequality

We first present Hoefding’s inequality, whose proof makes use of the general Chernof bounding technique. Given a random variable X and $\epsilon > 0$ , this technique consists of proceeding as follows to bound $\mathbb{P}[X \geq \epsilon]$ . For any $t > 0$ , first Markov’s inequality is used to bound $\mathbb{P}[X \geq \epsilon]$ :

$$
\mathbb{P}[X \geq \epsilon] = \mathbb{P}[e^{tX} \geq e^{t \epsilon}] \leq e^{- t \epsilon} \mathbb{E}[e^{tX}].\tag{D.1}
$$

Then, an upper bound $g(t)$ is found for $\mathbb{E}[e^{tX}]$ and t is selected to minimize $e^{- t \epsilon} g(t)$ . For Hoefd ing’s inequality, the following lemma provides an upper bound on $\mathbb{E}[e^{tX}]$

Lemma D.1 (Hoeffding’s lemma) Let X be a random variable with $E[X] = 0$ and $a \leq X \leq b$ with $b > a$ . Then, for any $t > 0$ , the following inequality holds:

$$
\mathbb{E}[e^{tX}] \leq e^{\frac{t^{2}(b - a)^{2}}{8}}.\tag{D.2}
$$

Proof: By the convexity of $x \mapsto e^{x}$ , for all $x \in[a, b]$ , the following holds:

$$
e^{tx} \leq \frac{b - x}{b - a} e^{ta} + \frac{x - a}{b - a} e^{tb}.
$$

Thus, using $\mathbb{E}[X] = 0$

$$
\mathbb{E}[e^{tX}] \leq \mathbb{E} \left[\frac{b - X}{b - a} e^{ta} + \frac{X - a}{b - a} e^{tb} \right] = \frac{b}{b - a} e^{ta} + \frac{- a}{b - a} e^{tb} = e^{\phi(t)},
$$

where,

$$
\phi(t) = \log \left(\frac{b}{b - a} e^{ta} + \frac{- a}{b - a} e^{tb}\right) = ta + \log \left(\frac{b}{b - a} + \frac{- a}{b - a} e^{t(b - a)}\right).
$$

For any $t > 0$ , the first and second derivative of φ are given below:

$$
\begin{array}{l} \phi^{\prime}(t) = a - \frac{ae^{t(b - a)}}{\frac{b}{b - a} - \frac{a}{b - a} e^{t(b - a)}} = a - \frac{a}{\frac{b}{b - a} e^{- t(b - a)} - \frac{a}{b - a}}, \\ \phi^{\prime \prime}(t) = \frac{- abe^{- t(b - a)}}{[\frac{b}{b - a} e^{- t(b - a)} - \frac{a}{b - a}]^{2}} \\ \qquad = \frac{\alpha(1 - \alpha) e^{- t(b - a)}(b - a)^{2}}{[(1 - \alpha) e^{- t(b - a)} + \alpha]^{2}} \\ \qquad = \frac{\alpha}{[(1 - \alpha) e^{- t(b - a)} + \alpha]} \frac{(1 - \alpha) e^{- t(b - a)}}{[(1 - \alpha) e^{- t(b - a)} + \alpha]}(b - a)^{2}.\end{array}
$$

where α denotes $\frac{- a}{b - a}$ . Note that $\phi(0) = \phi^{\prime}(0) = 0$ and that $\phi^{\prime \prime}(t) = u(1 - u)(b - a)^{2}$ where $\begin{array}{r}{u = \frac{\alpha}{\left\lceil \left(1 - \alpha \right) e^{- t(b - a)} + \alpha \right\rceil}} \end{array}$ . Since u is in $[0, 1], u(1 - u)$ is upper bounded by $1 / 4$ and $\phi^{\prime \prime}(t) \leq \frac{(b - a)^{2}}{4}$ Thus, by the second order expansion of function φ, there exists $\theta \in[0, t]$ such that:

$$
\phi(t) = \phi(0) + t \phi^{\prime}(0) + \frac{t^{2}}{2} \phi^{\prime \prime}(\theta) \leq t^{2} \frac{(b - a)^{2}}{8},\tag{D.3}
$$

which completes the proof.

The lemma can be used to prove the following result known as Hoefding’s inequality.

Theorem D.2 (Hoeffding’s inequality) Let $X_{1}, \ldots, X_{m}$ be independent random variables with $X_{i}$ taking values in $[a_{i}, b_{i}]$ for all $i \in[m]$ ]. Then, for any $\epsilon > 0$ , the following inequalities hold for $\begin{array}{r}{S_{m} = \sum_{i = 1}^{m} X_{i}.} \end{array}$

$$
\mathbb{P}[S_{m} - \mathbb{E}[S_{m}] \geq \epsilon] \leq e^{- 2 \epsilon^{2} / \sum_{i = 1}^{m}(b_{i} - a_{i})^{2}}\tag{D.4}
$$

$$
\mathbb{P}[S_{m} - \mathbb{E}[S_{m}] \leq - \epsilon] \leq e^{- 2 \epsilon^{2} / \sum_{i = 1}^{m}(b_{i} - a_{i})^{2}}.\tag{D.5}
$$

Proof: Using the Chernof bounding technique and lemma D.1, we can write:

$$
\begin{array}{rlr} &{\mathbb{P}[S_{m} - \mathbb{E}[S_{m}] \geq \epsilon] \leq e^{- t \epsilon} \mathbb{E}[e^{t(S_{m} - \mathbb{E}[S_{m}])}]} \\ &{\quad = e^{- t \epsilon} \Pi_{i = 1}^{m} \mathbb{E}[e^{t(X_{i} - \mathbb{E}[X_{i}])}]} &{\qquad \mathrm{(independenceof} X_{i} s)} \\ &{\quad \leq e^{- t \epsilon} \Pi_{i = 1}^{m} e^{t^{2}(b_{i} - a_{i})^{2} / 8}} &{\qquad \mathrm{(lemmaD.1)}} \\ &{\quad = e^{- t \epsilon} e^{t^{2} \sum_{i = 1}^{m}(b_{i} - a_{i})^{2} / 8}} \\ &{\quad < e^{- 2 \epsilon^{2} / \sum_{i = 1}^{m}(b_{i} - a_{i})^{2}},} \end{array}
$$

where we chose $\begin{array}{r}{t = 4 \epsilon / \sum_{i = 1}^{m}(b_{i} - a_{i})^{2}} \end{array}$ to minimize the upper bound. This proves the first statement of the theorem, and the second statement is shown in a similar way. $\square$

When the variance $\sigma_{X_{i}}^{2}$ of each random variable $X_{i}$ is known and the $\sigma_{X_{i}}^{2}$ s are relatively small, better concentration bounds can be derived (see Bennett’s and Bernstein’s inequalities proven in exercise D.6).

## D.2 Sanov’s theorem

Here, we present a finer upper bound than Hoefding’s inequality expressed in terms of the binary relative entropy.

Theorem D.3 (Sanov’s theorem) Let $X_{1}, \ldots, X_{m}$ be independent random variables drawn according to some distribution D with mean p and support included in [0, 1]. Then, for any $q \in[0, 1]$ the following inequality holds for $\begin{array}{r}{\widehat{p} = \frac{1}{m} \sum_{i = 1}^{m} X_{i}.} \end{array}$

$$
\mathbb{P}[\widehat{p} \geq q] \leq e^{- m \mathrm{D}(q \| p)},
$$

where $\begin{array}{r}{D(q \| p) = q \log \frac{q}{p} +(1 - q) \log \frac{1 - q}{1 - p}} \end{array}$ is the binary relative entropy of p and $q.$

Proof: For any $t > 0$ , by convexity of the function $x \mapsto e^{tx}$ , the following inequality holds for al $x \in[0, 1] \colon e^{tx} = e^{t[(1 - x) \cdot 0 + x \cdot 1]} \leq 1 - x + e^{t} x$ . In view of that, for any $t > 0$ , we can write

$$
\begin{array}{ll} \mathbb{P}[\widehat{p} \geq q] = \mathbb{P}[e^{tm \widehat{p}} \geq e^{tmq}] \\ \quad = \mathbb{P}[e^{tm \widehat{p}} \geq e^{tmq}] \\ \quad \leq e^{- tmq} \mathbb{E}[e^{tm \widehat{p}}] & \text{(by Markov's inequality)} \\ = e^{- tmq} \mathbb{E}[e^{t \sum_{i = 1}^{m} X_{i}}] \\ = e^{- tmq} \prod_{i = 1}^{m} \mathbb{E}[e^{tX_{i}}] \\ \leq e^{- tmq} \prod_{i = 1}^{m} \mathbb{E}[1 - X_{i} + e^{t} X_{i}] &(\forall x \in[0, 1], e^{tx} \leq 1 - x + e^{t} x) \\ =[e^{- tq}(1 - p + e^{t} p)]^{m}.\end{array}
$$

Now, the function $f \colon t \mapsto e^{- tq}(1 - p + e^{t} p) =(1 - p) e^{- tq} + pe^{t(1 - q)}$ reaches its minimum at $\begin{array}{r}{t = \log{\frac{q(1 - p)}{p(1 - q)}}} \end{array}$ . Plugging in this value of t in the inequality above yields $\mathbb{P}[\widehat{p} \geq q] \leq e^{- m D(q | | p)}$ . $\square$ Note that for any $\epsilon > 0, \epsilon \leq 1 - p,$ with the choice $q = p + \epsilon $ , the theorem implies

$$
\mathbb{P}[\widehat{p} \geq p + \epsilon] \leq e^{- m \mathrm{D}(p + \epsilon \| p)}.\tag{D.6}
$$

This is a finer bound than Hoefding’s inequality (Theorem D.2) since, by Pinsker’s inequality (Proposition E.7), $D(p + \epsilon \| p) \geq \frac{1}{2}(\widetilde{2 \epsilon})^{2} = \hat{2} \epsilon^{2}$ . Similarly, we can derive a symmetric bound by applying the theorem to the random variables $Y_{i} = 1 - X_{i}$ . Then, for any $\epsilon > 0, \epsilon \leq p_{;}$ , with the choice $q = p - \epsilon,$ , the theorem implies

$$
\mathbb{P}[\widehat{p} \leq p - \epsilon] \leq e^{- m D(p - \epsilon \| p)}.\tag{D.7}
$$

## D.3 Multiplicative Chernoff bounds

Sanov’s theorem can be used to prove the following multiplicative Chernof bounds.

Theorem D.4 (Multiplicative Chernoff bounds) Let $X_{1}, \ldots, X_{m}$ be independent random variables drawn according to some distribution D with mean p and support included in [0, 1]. Then, for any $\begin{array}{r}{\gamma \in \left[0, \frac{1}{p} - 1 \right]} \end{array}$ , the following inequality holds for $\begin{array}{r}{\hat{\widehat{p}} = \frac{1}{m} \sum_{i = 1}^{\hat{m}} X_{i}} \end{array}$

$$
\begin{array}{l} \mathbb{P}[\widehat{p} \geq(1 + \gamma) p] \leq e^{- \frac{mp \gamma^{2}}{3}} \\ \mathbb{P}[\widehat{p} \leq(1 - \gamma) p] \leq e^{- \frac{mp \gamma^{2}}{2}}.\end{array}
$$

Proof: The proof consists of deriving in each case a finer lower bound for the binary relative entropy than Pinsker’s inequality. Using the inequalities $\log(1 + x) \geq{\frac{x}{1 +{\frac{x}{2}}}}$ and $\log(1 + x) < x.$ we can write

$$
\begin{array}{rl} &{- D((1 + \gamma) p \| p) =(1 + \gamma) p \log \frac{p}{(1 + \gamma) p} +(1 -(1 + \gamma) p) \log \left[\frac{1 - p}{1 -(1 + \gamma) p} \right]} \\ &{\qquad =(1 + \gamma) p \log \frac{1}{1 + \gamma} +(1 - p - \gamma p) \log \left[1 + \frac{\gamma p}{1 - p - \gamma p} \right]} \\ &{\qquad \leq(1 + \gamma) p \frac{- \gamma}{1 + \frac{\gamma}{2}} +(1 - p - \gamma p) \frac{\gamma p}{1 - p - \gamma p}} \\ &{\qquad = \gamma p \left[1 - \frac{1 + \gamma}{1 + \frac{\gamma}{2}} \right] = \frac{- \frac{\gamma^{2} p}{2}}{1 + \frac{\gamma}{2}} = \frac{- \gamma^{2} p}{2 + \gamma}} \\ &{\qquad \leq \frac{- \gamma^{2} p}{2 + 1} = \frac{- \gamma^{2} p}{3}.} \end{array}
$$

Similarly, using the inequalities $(1 - x) \log(1 - x) \geq - x +{\frac{x^{2}}{2}}$ valid for $x \in(0, 1)$ and $\log(1 - x) < - x$ we can write

$$
\begin{array}{rl} &{- D((1 - \gamma) p \| p) =(1 - \gamma) p \log \frac{p}{(1 - \gamma) p} +(1 -(1 - \gamma) p) \log \left[\frac{1 - p}{1 -(1 - \gamma) p} \right]} \\ &{\qquad =(1 - \gamma) p \log \frac{1}{1 - \gamma} +(1 - p + \gamma p) \log \left[1 - \frac{\gamma p}{1 - p + \gamma p} \right]} \\ &{\qquad \leq \Big(\gamma - \frac{\gamma^{2}}{2} \Big) p +(1 - p + \gamma p) \frac{- \gamma p}{1 - p + \gamma p} = \frac{- \gamma^{2} p}{2}.} \end{array}
$$

This completes the proof.

## D.4 Binomial distribution tails: Upper bounds

Let $X_{1}, \ldots, X_{m}$ be independent random variables taking values in $\{0, 1\}$ with $\mathbb{P}[X_{i} = 1] = p \in$ [0, 1] for $i = 1, \ldots, m$ . Then, $\scriptstyle \sum_{i = 1}^{m} X_{i}$ follows the binomial distribution $B(m, p)$ . We will denote by $\dot{\overline{{X}}}$ the average $\begin{array}{r}{\overline{{X}} = \frac{1}{m} \sum_{i = 1}^{m} \overline{{X_{i}}}} \end{array}$ . Then, the following equality and inequalities hold:

$$
\mathbb{P} \left[\overline{{X}} - p > \epsilon \right] = \sum_{k = \lceil(p + \epsilon) m \rceil}^{m}{\binom{m}{k}} p^{k}(1 - p)^{m - k}
$$

(Binomial formula)

$$
\mathbb{P} \left[\overline{{X}} - p > \epsilon \right] \leq e^{- 2m \epsilon^{2}}
$$

(Hoefding’s inequality)

$$
\mathbb{P} \left[\overline{{X}} - p > \epsilon \right] \leq e^{- \frac{m \epsilon^{2}}{2 \sigma^{2} + \frac{2 \epsilon}{3}}}
$$

(Bernstein’s inequality)

$$
\mathbb{P} \left[\overline{{X}} - p > \epsilon \right] \leq e^{- m \sigma^{2} \theta \left(\frac{\epsilon}{\sigma^{2}}\right)}
$$

(Bennett’s inequality)

$$
\mathbb{P} \left[\overline{{{X}}} - p > \epsilon \right] \leq e^{- mD(p + \epsilon \| p)}
$$

(Sanov’s inequality),

where $\sigma^{2} = p(1 - p) = \operatorname{Var}[X_{i}]$ and $\theta(x) =(1 + x) \log(1 + x) - x$ . The last three inequalities are shown in exercises D.6 and D.7. Using Bernstein’s inequality, for example, we can see that for $\epsilon$ relatively small, that is $\epsilon \ll 2 \sigma^{2}$ , the upper bound is approximately of the form $e^{- \frac{m \epsilon^{2}}{2 \sigma^{2}}}$ and thus admits a Gaussian behavior. For $\epsilon \gg \dot{2 \sigma^{2}}, e^{- \frac{3m \epsilon}{2}}$ , the upper bound admits a Poisson behavior.

Figure D.1 shows a comparison of these bounds for different values of the variance $\sigma^{2} = p(1 - p);$ small variance $\left(p =.05 \right)$ , large variance $\left(p =.5 \right)$

## D.5 Binomial distribution tails: Lower bound

Let X be a random variable following the binomial distribution $B(m, p)$ and let k be an integer such that $\begin{array}{r}{p \leq \frac{1}{4}} \end{array}$ and $k \geq mp$ or $p \leq \frac{1}{2}$ and $mp \leq k \leq m(1 - p)$ . Then, the following inequality known as $Slud^{\prime} s$ inequality holds:

$$
\mathbb{P}[X \geq k] \geq \mathbb{P} \left[N \geq \frac{k - mp}{\sqrt{mp(1 - p)}} \right],\tag{D.8}
$$

where N is in standard normal form.

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/dfd59b179148ac7133a070d16a2dab50c1c610e7ae5615cb4c0be5e22cc08e4a.jpg)

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/a0ea5c1c2035661149bfbf52445082c21dbd4024c44f5e88df166fd40aac247e.jpg)  
Figure D.1  
Comparison of tail bounds for a binomial random variable for $\epsilon =.3$ and $p =.05$ (small variance) or $p =.5$ (maximal variance) as a function of the sample size m.

## D.6 Azuma’s inequality

This section presents a concentration inequality that is more general than Hoefding’s inequality. Its proof makes use of a Hoefding’s inequality for martingale diferences.

Definition D.5 (Martingale difference) A sequence of random variables $V_{1}, V_{2}, \dots.$ . is a martingale diference sequence with respect to $X_{1}, X_{2}, \ldots \if$ for all $i > 0, V_{i}$ is a function of $X_{1}, \ldots, X_{i}$ and

$$
\mathbb{E}[V_{i + 1} | X_{1}, \dots, X_{i}] = 0.\tag{D.9}
$$

The following result is similar to Hoefding’s lemma.

Lemma D.6 Let V and Z be random variables satisfying $\mathbb{E}[V | Z] = 0$ and, for some function f and constant $c \geq 0$ , the inequalities:

$$
f(Z) \leq V \leq f(Z) + c.\tag{D.10}
$$

Then, for all $t > 0$ , the following upper bound holds:

$$
\mathbb{E}[e^{tV} | Z] \leq e^{t^{2} c^{2} / 8}.\tag{D.11}
$$

Proof: The proof follows using the same steps as in that of lemma D.1 with conditional expectations used instead of expectations: conditioned on Z, V takes values in $[a, b]$ with $a = f(Z)$ and $b = f(Z) + c$ and its expectation vanishes. $\square$

The lemma is used to prove the following theorem, which is one of the main results of this section.

Theorem D.7 (Azuma’s inequality) Let $V_{1}, V_{2},...$ . be a martingale diference sequence with respect to the random variables $X_{1}, X_{2},...,$ and assume that for all $i > 0$ there is a constant $c_{i} \geq 0$ and random variable $Z_{i}$ , which is a function of $X_{1}, \ldots, X_{i - 1}$ , that satisfy

$$
Z_{i} \leq V_{i} \leq Z_{i} + c_{i}.\tag{D.12}
$$

Then, for all $\epsilon > 0$ and m, the following inequalities hold:

$$
\mathbb{P} \left[\sum_{i = 1}^{m} V_{i} \geq \epsilon \right] \leq \exp \left(\frac{- 2 \epsilon^{2}}{\sum_{i = 1}^{m} c_{i}^{2}}\right)\tag{D.13}
$$

$$
\mathbb{P} \left[\sum_{i = 1}^{m} V_{i} \leq - \epsilon \right] \leq \exp \left(\frac{- 2 \epsilon^{2}}{\sum_{i = 1}^{m} c_{i}^{2}}\right).\tag{D.14}
$$

Proof: For any $k \in[m]$ , let $\begin{array}{r}{S_{k} = \sum_{i = 1}^{k} V_{i}} \end{array}$ . Then, using Chernof’s bounding technique, for any $t > 0$ , we can write

$$
\begin{array}{ll} \mathbb{P} \left[S_{m} \geq \epsilon \right] \leq e^{- t \epsilon} \mathbb{E}[e^{tS_{m}}] \\ = e^{- t \epsilon} \mathbb{E} \left[e^{tS_{m - 1}} \mathbb{E}[e^{tV_{m}} | X_{1}, \ldots, X_{m - 1}] \right] \\ \leq e^{- t \epsilon} \mathbb{E}[e^{tS_{m - 1}}] e^{t^{2} c_{m}^{2} / 8} &(\text{lemma D.6}) \\ \leq e^{- t \epsilon} e^{t^{2} \sum_{i = 1}^{m} c_{i}^{2} / 8} &(\text{iterating previous argument}) \\ = e^{- 2 \epsilon^{2} / \sum_{i = 1}^{m} c_{i}^{2}}, \end{array}
$$

where we chose $\begin{array}{r}{t = 4 \epsilon / \sum_{i = 1}^{m} c_{i}^{2}} \end{array}$ to minimize the upper bound. This proves the first statement of the theorem, and the second statement is shown in a similar way. $\square$

## D.7 McDiarmid’s inequality

The following is the main result of this section. Its proof makes use of Azuma’s inequality.

Theorem D.8 (McDiarmid’s inequality) Let $X_{1}, \ldots, X_{m} \in{\mathfrak{X}}^{m}$ be a set of m $\geq 1$ independent random variables and assume that there exist $c_{1}, \ldots, c_{m} > 0$ such that $f \colon \mathcal{X}^{m} \mathbb{R}$ satisfies the following conditions:

$$
\left| f \left(x_{1}, \dots, x_{i}, \dots, x_{m}\right) - f \left(x_{1}, \dots, x_{i}^{\prime}, \dots x_{m}\right) \right| \leq c_{i},\tag{D.15}
$$

for all $i \in[m]$ and any points $x_{1}, \ldots, x_{m}, x_{i}^{\prime} \in \mathcal{X}$ . Let f(S) denote $f(X_{1}, \ldots, X_{m})$ , then, for all $\epsilon > 0$ , the following inequalities hold:

$$
\mathbb{P}[f(S) - \mathbb{E}[f(S)] \geq \epsilon] \leq \exp \left(\frac{- 2 \epsilon^{2}}{\sum_{i = 1}^{m} c_{i}^{2}}\right)\tag{D.16}
$$

$$
\mathbb{P}[f(S) - \mathbb{E}[f(S)] \leq - \epsilon] \leq \exp \left(\frac{- 2 \epsilon^{2}}{\sum_{i = 1}^{m} c_{i}^{2}}\right).\tag{D.17}
$$

Proof: Define a sequence of random variables $V_{k}, ~ k ~ \in ~[m]$ , as follows: $V = f(S) - \mathbb{E}[f(S)]$ $V_{1} = \mathbb{E}[V | X_{1}] - \mathbb{E}[V]$ , and for $k > 1$

$$
V_{k} = \mathbb{E}[V | X_{1}, \dots, X_{k}] - \mathbb{E}[V | X_{1}, \dots, X_{k - 1}].
$$

Note that $\textstyle V = \sum_{k = 1}^{m} V_{k}$ . Furthermore, the random variable $\mathbb{E}[V | X_{1}, \ldots, X_{k}]$ is a function of $X_{1}, \ldots, X_{k}$ . Conditioning on $X_{1}, \ldots, X_{k - 1}$ and taking its expectation is therefore:

$$
\mathbb{E} \left[\mathbb{E}[V | X_{1}, \dots, X_{k}] | X_{1}, \dots, X_{k - 1} \right] = \mathbb{E}[V | X_{1}, \dots, X_{k - 1}],
$$

which implies $\mathbb{E}[V_{k} | X_{1},..., X_{k - 1}] = 0$ . Thus, the sequence $(V_{k})_{k \in[m]}$ is a martingale diference sequence. Next, observe that, since $\mathbb{E}[f(S)]$ is a scalar, $V_{k}$ can be expressed as follows:

$$
V_{k} = \mathbb{E}[f(S) | X_{1}, \dots, X_{k}] - \mathbb{E}[f(S) | X_{1}, \dots, X_{k - 1}].
$$

Thus, we can define an upper bound $W_{k}$ and lower bound U for V by:

$$
W_{k} = \sup_{x} \mathbb{E}[f(S) | X_{1}, \dots, X_{k - 1}, x] - \mathbb{E}[f(S) | X_{1}, \dots, X_{k - 1}]
$$

$$
U_{k} = \inf_{x} \mathbb{E}[f(S) | X_{1}, \dots, X_{k - 1}, x] - \mathbb{E}[f(S) | X_{1}, \dots, X_{k - 1}].
$$

Now, by (D.15), for any $k \in[m]$ , the following holds:

$$
W_{k} - U_{k} = \sup_{x, x^{\prime}} \mathbb{E}[f(S) | X_{1}, \ldots, X_{k - 1}, x] - \mathbb{E}[f(S) | X_{1}, \ldots, X_{k - 1}, x^{\prime}] \leq c_{k},\tag{D.18}
$$

thus, $U_{k} \ \le \V_{k} \ \le \U_{k} + c_{k}$ . In view of these inequalities, we can apply Azuma’s inequality to $\begin{array}{r}{V = \sum_{k = 1}^{m} V_{k}} \end{array}$ , which yields exactly (D.16) and (D.17). $\square$

McDiarmid’s inequality is used in several of the proofs in this book. It can be understood in terms of stability: if changing any of its argument afects f only in a limited way, then, its deviations from its mean can be exponentially bounded. Note also that Hoefding’s inequality (theorem D.2) is a special instance of McDiarmid’s inequality where f is defined by $\begin{array}{r}{f \colon(x_{1}, \ldots, x_{m}) \mapsto \frac{1}{m} \sum_{i = 1}^{m} x_{i}} \end{array}$

## D.8 Normal distribution tails: Lower bound

If N is a random variable following the standard normal distribution, then for $u > 0$ 2

$$
\mathbb{P}[N \geq u] \geq \frac{1}{2} \left(1 - \sqrt{1 - e^{- u^{2}}}\right).\tag{D.19}
$$

## D.9 Khintchine-Kahane inequality

The following inequality is useful in a variety of different contexts, including in the proof of a lower bound for the empirical Rademacher complexity of linear hypotheses (chapter 6).

Theorem D.9 (Khintchine-Kahane inequality) Let $(\mathbb{H}, \Vert \cdot \Vert)$ be a normed vector space and let $\mathbf{x}_{1}, \ldots, \mathbf{x}_{m}$ be $m \geq 1$ elements of <sup>H</sup>. Let $\pmb{\sigma} =(\sigma_{1}, \ldots, \sigma_{m})^{\top}$ with $\sigma_{i} \varepsilon$ independent uniform random variables taking values in $\{- 1, + 1\}$ (Rademacher variables). Then, the following inequalities hold:

$$
\frac{1}{2} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|^{2} \right] \leq \left(\underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\| \right]\right)^{2} \leq \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|^{2} \right].\tag{D.20}
$$

Proof: The second inequality is a direct consequence of the convexity of $x \mapsto x^{2}$ and Jensen’s inequality (theorem B.20).

To prove the left-hand side inequality, first note that for any $\beta_{1}, \ldots, \beta_{m} \in \mathbb{R}$ , expanding the product $\textstyle \prod_{i = 1}^{m}(1 + \beta_{i})$ leads exactly to the sum of all monomials $\beta_{1}^{\delta_{1}} \cdot \cdot \cdot \beta_{m}^{\delta_{m}}$ , with exponents $\delta_{1}, \ldots, \delta_{m}$ in $\{0, 1\}$ . We will use the notation $\beta_{1}^{\delta_{1}} \cdot \cdot \cdot \beta_{m}^{\delta_{m}} = \beta^{\delta}$ and $\begin{array}{r}{| \delta | = \sum_{i = 1}^{m} \delta_{m}} \end{array}$ for any $\pmb{\delta} =(\delta_{1}, \ldots, \delta_{m}) \in \{0, 1\}^{m}$ . In view of that, for any $(\alpha_{1}, \ldots, \alpha_{m}) \in \mathbb{R}^{m}$ and $t > 0$ , the following equality holds:

$$
t^{2} \prod_{i = 1}^{m}(1 + \alpha_{i} / t) = t^{2} \sum_{\boldsymbol{\delta} \in \{0, 1\}^{m}} \alpha^{\boldsymbol{\delta}} / t^{| \boldsymbol{\delta} |} = \sum_{\boldsymbol{\delta} \in \{0, 1\}^{m}} t^{2 - | \boldsymbol{\delta} |} \alpha^{\boldsymbol{\delta}}.
$$

Diferentiating both sides with respect to t and setting $t = 1$ yields

$$
2 \prod_{i = 1}^{m}(1 + \alpha_{i}) - \sum_{j = 1}^{m} \alpha_{j} \prod_{i \neq j}(1 + \alpha_{i}) = \sum_{\boldsymbol{\delta} \in \{0, 1\}^{m}}(2 - | \boldsymbol{\delta} |) \alpha^{\boldsymbol{\delta}}.\tag{D.21}
$$

For any $\pmb{\sigma} \in \{- 1, + 1\}^{m}$ , let $S_{\sigma}$ be defined by $S_{\sigma} = \| s_{\sigma} \|$ with $\begin{array}{r}{s_{\pmb{\sigma}} = \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i}} \end{array}$ . Then, setting $\alpha _ { i } = \sigma _ { i } \sigma _ { i } ^ { \prime } $ , multiplying both sides of (D.21) by $S_{\sigma} S_{\sigma^{\prime}}$ , and taking the sum over all $\pmb{\sigma}, \pmb{\sigma}^{\prime} \in$ $\{- 1, + 1\}^{m}$ yields

$$
\begin{array}{l} \sum_{\sigma, \sigma^{\prime} \in \{- 1, + 1\}^{m}} \bigg(2 \prod_{i = 1}^{m}(1 + \sigma_{i} \sigma_{i}^{\prime}) - \sum_{j = 1}^{m} \sigma_{j} \sigma_{j}^{\prime} \prod_{i \neq j}(1 + \sigma_{i} \sigma_{i}^{\prime}) \bigg) S_{\sigma} S_{\sigma^{\prime}} \\ \qquad = \sum_{\sigma, \sigma^{\prime} \in \{- 1, + 1\}^{m}} \sum_{\delta \in \{0, 1\}^{m}}(2 - | \delta |) \sigma^{\delta} \sigma^{\prime \delta} S_{\sigma} S_{\sigma^{\prime}} \\ \qquad = \sum_{\delta \in \{0, 1\}^{m}}(2 - | \delta |) \sum_{\sigma, \sigma^{\prime} \in \{- 1, + 1\}^{m}} \sigma^{\delta} \sigma^{\prime \delta} S_{\sigma} S_{\sigma^{\prime}} \\ \qquad = \sum_{\delta \in \{0, 1\}^{m}}(2 - | \delta |) \Big[\sum_{\sigma \in \{- 1, + 1\}^{m}} \sigma^{\delta} S_{\sigma} \Big]^{2}.\end{array}\tag{D.22}
$$

Note that the terms of the right-hand sum with $| \delta | \geq 2$ are non-positive. The terms with $| \delta | = 1$ are null: since $S_{\sigma} = S_{- \sigma}$ , we have $\begin{array}{r}{\sum_{\pmb{\sigma} \in \{- 1, + 1\}^{m}} \sigma^{\delta} S_{\pmb{\sigma}} = 0} \end{array}$ in that case. Thus, the right-hand side can be upper bounded by the term with $\delta = 0$ , that is, $\scriptstyle 2 \left(\sum_{\pmb{\sigma} \in \{- 1, + 1\}^{m}} S_{\pmb{\sigma}} \right)^{2}$ . The left-hand

side of (D.22) can be rewritten as follows:

$$
\begin{array}{l} \sum_{\boldsymbol{igma} \in \{- 1, + 1\}^{m}}(2^{m + 1} - m2^{m - 1}) S_{\boldsymbol{igma}}^{2} + 2^{m - 1} \sum_{\substack{\boldsymbol{igma} \in \{- 1, + 1\}^{m} \\ \boldsymbol{igma}^{\prime} \in B(\boldsymbol{igma}, 1)}} S_{\boldsymbol{igma}} S_{\boldsymbol{igma}^{\prime}} \\ = 2^{m} \sum_{\boldsymbol{igma} \in \{- 1, + 1\}^{m}} S_{\boldsymbol{igma}}^{2} + 2^{m - 1} \sum_{\boldsymbol{igma} \in \{- 1, + 1\}^{m}} S_{\boldsymbol{igma}} \bigg(\sum_{\boldsymbol{igma}^{\prime} \in B(\boldsymbol{igma}, 1)} S_{\boldsymbol{igma}^{\prime}} -(m - 2) S_{\boldsymbol{igma}} \bigg), \end{array}\tag{D.23}
$$

where $B(\pmb{\sigma}, 1)$ denotes the set of $\pmb{\sigma}^{\prime}$ that difer from $\sigma$ in exactly one coordinate $j \in[m]$ , that is the set of $\sigma^{\prime}$ with Hamming distance one from $\sigma$ Note that for any such $\pmb{\sigma}^{\prime}, s_{\pmb{\sigma}} - s_{\pmb{\sigma}^{\prime}} = 2 \sigma_{j} \mathbf{x}_{j}$ for one coordinate $j \in[m]$ , thus, $\begin{array}{r}{\sum_{\pmb{\sigma}^{\prime} \in B(\pmb{\sigma}, 1)} s_{\pmb{\sigma}} - s_{\pmb{\sigma}^{\prime}} = 2s_{\pmb{\sigma}}} \end{array}$ . In light of that and using the triangle inequality, we can write

$$
\begin{array}{c}(m - 2) S_{\boldsymbol{igma}} = \| ms_{\boldsymbol{igma}} \| - \| 2s_{\boldsymbol{igma}} \| = \left\| \sum_{\boldsymbol{igma}^{\prime} \in B(\boldsymbol{igma}, 1)} s_{\boldsymbol{igma}} \right\| - \left\| \sum_{\boldsymbol{igma}^{\prime} \in B(\boldsymbol{igma}, 1)} s_{\boldsymbol{igma}} - s_{\boldsymbol{igma}^{\prime}} \right\| \\ \leq \left\| \sum_{\boldsymbol{igma}^{\prime} \in B(\boldsymbol{igma}, 1)} s_{\boldsymbol{igma}^{\prime}} \right\| \leq \sum_{\boldsymbol{igma}^{\prime} \in B(\boldsymbol{igma}, 1)} S_{\boldsymbol{igma}^{\prime}}.\end{array}
$$

Thus, the second sum of (D.23) is non-negative and the left-hand side of (D.22) can be lower bounded by the first sum $\begin{array}{r}{2^{m} \sum_{\pmb{\sigma} \in \{- 1, + 1\}^{m}} S_{\pmb{\sigma}}^{2}} \end{array}$ . Combining this with the upper bound found for (D.22) gives

$$
2^{m} \sum_{\sigma \in \{- 1, + 1\}^{m}} S_{\sigma}^{2} \leq 2 \left[\sum_{\sigma \in \{- 1, + 1\}^{m}} S_{\sigma} \right]^{2}.
$$

Dividing both sides by $2^{2m}$ and using $\mathbb{P}[\pmb{\sigma}] = 1 / 2^{m}$ gives $\mathbb{E}_{\pmb{\sigma}}[\hat{S}_{\pmb{\sigma}}^{2}] \leq 2(\mathbb{E}_{\pmb{\sigma}}[S_{\pmb{\sigma}}])^{2}$ and completes the proof. $\square$

The constant $1 / 2$ appearing in the first inequality of (D.20) is optimal. To see this, consider the case where $m = 2$ and ${\bf x}_{1} ={\bf x}_{2} ={\bf x}$ for some non-zero vector $\mathbf{x} \in \mathbb{H}$ . Then, the left-hand side of the first inequality is $\begin{array}{r}{\frac{1}{2} \sum_{i = 1}^{m} \|{\bf x}_{i} \|^{2} = \|{\bf x} \|^{2}} \end{array}$ and the right-hand side $\big(\mathbb{E}_{\pmb{\sigma}} \big[\|(\sigma_{1} + \sigma_{2}) \mathbf{x} \| \big] \big)^{2} =$ $\| \mathbf{x} \|^{2}(\mathbb{E}_{\pmb{\sigma}}[| \sigma_{1} + \sigma_{2} |])^{2} = \| \mathbf{\dot{x}} \|^{2}$

Note that when the norm $\| \cdot \|$ corresponds to an inner product, as in the case of a Hilbert space <sup>H</sup>, we can write

$$
\underset{\boldsymbol{igma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\|^{2} \right] = \sum_{i, j = 1}^{m} \underset{\boldsymbol{igma}}{\mathbb{E}} \left[\sigma_{i} \sigma_{j}(\mathbf{x}_{i} \cdot \mathbf{x}_{j}) \right] = \sum_{i, j = 1}^{m} \underset{\boldsymbol{igma}}{\mathbb{E}}[\sigma_{i} \sigma_{j}](\mathbf{x}_{i} \cdot \mathbf{x}_{j}) = \sum_{i = 1}^{m} \| \mathbf{x}_{i} \|^{2},
$$

since by the independence of the random variables $\sigma_{i}.$ for $i \neq j, \mathbb{E}_{\pmb{\sigma}}[\sigma_{i} \sigma_{j}] = \mathbb{E}_{\pmb{\sigma}}[\sigma_{i}] \mathbb{E}_{\pmb{\sigma}}[\sigma_{j}] = 0$ Thus, (D.20) can then be rewritten as follows:

$$
\frac{1}{2} \sum_{i = 1}^{m} \| \mathbf{x}_{i} \|^{2} \leq \left(\underset{\pmb{\sigma}}{\mathbb{E}} \left[\left\| \sum_{i = 1}^{m} \sigma_{i} \mathbf{x}_{i} \right\| \right]\right)^{2} \leq \sum_{i = 1}^{m} \| \mathbf{x}_{i} \|^{2}.\tag{D.24}
$$

## D.10 Maximal inequality

The following gives an upper bound on the expectation of the maximum of a finite set of random variables that is useful in several contexts.

Theorem D.10 (Maximal inequality) Let $X_{\frac{1}{2}} \ldots X_{n}$ be $n \geq 1$ real-valued random variables such that for all $j \in[n]$ and $t > 0, \mathbb{E}[e^{tX_{j}}] \le e^{\frac{t^{\angle} r^{\angle}}{2}}$ for some $r > 0$ . Then, the following inequality holds:

$$
\mathbb{E} \left[\max_{j \in[n]} X_{j} \right] \leq r \sqrt{2 \log n}.
$$

$$
e^{t \mathbb{E}[\max_{j \in[n]} X_{j}]} \leq \mathbb{E}[e^{t \max_{j \in[n]} X_{j}}] = \mathbb{E} \left[\max_{j \in[n]} e^{tX_{j}} \right] \leq \mathbb{E} \left[\sum_{j \in[n]} e^{tX_{j}} \right] \leq ne^{\frac{t^{2} r^{2}}{2}}.
$$

Proof: For any t > 0 $t > 0,$ , by the convexity of exp and Jensen’s inequality, the following holds:

Taking the log of both sides yields

$$
\mathbb{E} \left[\max_{j \in[n]} X_{j} \right] \leq \frac{\log n}{t} + \frac{tr^{2}}{2}.\tag{D.25}
$$

Choosing $t ={\frac{{\sqrt{2 \log n}}}{r}}$ , which minimizes the right-hand side, gives the upper bound $r \sqrt{2}$ log n. $\square$ Note that, in view of the expression of their moment-generating function (equation (C.24)), for standard Gaussian random variables $X_{j}$ , the assumptions of the theorem hold as equalities: $\mathbb{E}[e^{tX_{j}}] = e^{\frac{t^{2}}{2}}$

Corollary D.11 (Maximal inequality) Let $X_{1} \ldots X_{n}$ be $n \geq 1$ real-valued random variables such that for all $\begin{array}{r}{j \in[n], X_{j} = \sum_{i = 1}^{m} Y_{ij}} \end{array}$ where, for each fixed $j \in[n]$ $Y_{ij}$ are independent zero mean random variables taking values in $[- r_{i}, + r_{i}]$ , for some $r_{i} ~ > ~ 0$ . Then, the following inequality holds:

$$
\mathbb{E} \left[\max_{j \in[n]} X_{j} \right] \leq r \sqrt{2 \log n},
$$

with $r = \sqrt{\textstyle \sum_{i = 1}^{m} r_{i}^{2}}$

Proof: By the independence of the $Y_{ij} s$ for fixed $j$ and Hoefding’s lemma (Lemma D.1), the following inequality holds for all $j \in[n]$

$$
\mathbb{E}[e^{tX_{j}}] = \mathbb{E} \left[\prod_{i = 1}^{m} e^{tY_{ij}} \right] = \prod_{i = 1}^{m} \mathbb{E}[e^{tY_{ij}}] \leq \prod_{i = 1}^{m} e^{\frac{t^{2} r_{j}^{2}}{2}} = e^{\frac{t^{2} r^{2}}{2}},\tag{D.26}
$$

with $\begin{array}{r}{r^{2} = \sum_{i = 1}^{m} r_{i}^{2}} \end{array}$ . The result then follows immediately by Theorem D.10.

## D.11 Chapter notes

Several of the concentration inequalities presented in this chapter are based on a bounding technique due to Chernof [1952]. Theorem D.3 is due to Sanov [1957]. For the exponential inequality of exercise D.7, which is an alternative form of Sanov’s inequality, see [Hagerup and R¨ub, 1990] and the references therein. The multiplicative Chernof bounds presented in this chapter (Theorem D.4) were given by Angluin and Valiant [1979]. Hoefding’s inequality and lemma (Lemma D.1 and Theorem D.2) are due to Hoefding [1963]. The improved version of Azuma’s inequality [Hoefding, 1963, Azuma, 1967] presented in this chapter is due to McDiarmid [1989]. The improvement is a reduction of the exponent by a factor of 4. This also appears in McDiarmid’s inequality, which is derived from the inequality for bounded martingale sequences. The inequalities presented in exercise D.6 are due to Bernstein [1927] and Bennett [1962]; the exercise is from Devroye and Lugosi [1995].

The binomial inequality of section D.5 is due to Slud [1977]. The tail bound of section D.8 is due to Tate [1953] (see also Anthony and Bartlett [1999]). The Khintchine-Kahane inequality was first studied in the case of real-valued variables x , . . . , x by Khintchine [1923], with better constants and simpler proofs later provided by Szarek [1976], Haagerup [1982], and Tomaszewski [1982]. The inequality was extended to normed vector spaces by Kahane [1964]. The proof presented here is due to Lata la and Oleszkiewicz [1994] and provides the best possible constants.

## D.12 Exercises

D.1 Twins paradox. Professor Mamoru teaches at a university whose computer science and math building has $F = 30$ floors.

(1) Assume that the floors are independent and that they have the same probability to be selected by someone taking the elevator. How many people should take the elevator in order to make it likely (probability more than half) that two of them go to the same floor?

(Hint: use the Taylor series expansion of $e^{- x} = 1 - x +..$ . and give an approximate general expression of the solution.)

(2) Professor Mamoru is popular, and his floor is in fact more likely to be selected than others. Assuming that all other floors are equiprobable, derive the general expression of the probability that two people $^{\mathrm{go}}$ to the same floor, using the same approximation as before. How many people should take the elevator in order to make it likely that two of them go to the same floor when the probability of Professor Mamoru’s floor is $.25,.35$ , or .5? When $q =.5$ , would the answer change if the number of floors were instead $F = 1, 000 ?$

(3) The probability models assumed in (1) and (2) are both naive. If you had access to the data collected by the elevator guard, how would you define a more faithful model?

D.2 Estimating label bias. Let D be a distribution over X and let $f \colon{\mathcal{X}} \times \{- 1, + 1\}$ be a labeling function. Suppose we wish to find a good approximation of the label bias of the distribution D, that is of $^{p_{+}}$ defined by:

$$
p_{+} = \underset{x \sim \mathcal{D}}{\mathbb{P}}[f(x) = + 1].\tag{D.27}
$$

Let S be a finite labeled sample of size m drawn i.i.d. according to D. Use S to derive an estimate ${\widehat{p}} +$ of $^{p_{+}}$ . Show that for any $\delta > 0$ , with probability at least $1 - \delta, | p_{+} - \widehat{p}_{+} | \leq$ $\sqrt{\frac{\log(2 / \delta)}{2m}}$

D.3 Biased coins. Professor Moent has two coins in his pocket, coin $x_{A}$ and coin $x_{B}$ . Both coins are slightly biased, i.e., $\mathbb{P}[x_{A} = 0] = 1 / 2 - \epsilon / 2$ and $\mathbb{P}[x_{B} = 0] = 1 / 2 + \epsilon / 2$ , where $0 < \epsilon < 1$ is a small positive number, 0 denotes heads and 1 denotes tails. He likes to play the following game with his students. He picks a coin $x \in \{x_{A}, x_{B}\}$ from his pocket uniformly at random, tosses it m times, reveals the sequence of 0s and 1s he obtained and asks which coin was tossed. Determine how large m needs to be for a student’s coin prediction error to be at most $\delta > 0$

(a) Let $S$ be a sample of size m. Professor Moent’s best student, Oskar, plays according to the decision rule $f_{o} \colon \{0, 1\}^{m} \to \{x_{A}, x_{B}\}$ defined by $f_{o}(S) = x_{A}$ if $N(S) < m / 2$ , where $N(S)$ is the number of $0^{\circ} s$ in sample S.

Suppose m is even, then show that

$$
error(f_{o}) \geq \frac{1}{2} \mathbb{P} \left[N(S) \geq \frac{m}{2} \Big | x = x_{A} \right].\tag{D.28}
$$

(b) Assuming m even, show that

$$
error(f_{o}) > \frac{1}{4} \left[1 - \left[1 - e^{- \frac{m \epsilon^{2}}{1 - \epsilon^{2}}} \right]^{\frac{1}{2}} \right].\tag{D.29}
$$

(c) Argue that if m is odd, the probability can be lower bounded by using $m + 1$ in the bound in (a) and conclude that for both odd and even $m.$

$$
error(f_{o}) > \frac{1}{4} \Big[1 - \Big[1 - e^{- \frac{2 \lceil m / 2 \rceil \epsilon^{2}}{1 - \epsilon^{2}}} \Big]^{\frac{1}{2}} \Big].\tag{D.30}
$$

(d) Using this bound, how large must m be if Oskar’s error is at most $\delta,$ where $0 < \delta < 1 / 4$ What is the asymptotic behavior of this lower bound as a function of $\epsilon ?$

(e) Show that no decision rule $f \colon \{0, 1\}^{m} \{x_{A}, x_{B}\}$ can do better than Oskar’s rule $f_{o},$ Conclude that the lower bound of the previous question applies to all rules.

D.4 Concentration bounds. Let X be a non-negative random variable satisfying $\mathbb{P}[X > t] \ \leq$ $ce^{- 2mt^{2}}$ for all $t > 0$ and some $c > 0$ . Show that $\begin{array}{r}{\mathbb{E}[X^{2}] \leq \frac{\log(ce)}{2m}} \end{array}$ (Hint: to do that, use the identity $\begin{array}{r}{\mathbb{E}[X^{2}] = \int_{0}^{+ \infty} \mathbb{P}[X^{2} > t] dt} \end{array}$ , write $\begin{array}{r}{\int_{0}^{+ \infty} = \int_{0}^{u} + \int_{u}^{+ \infty}} \end{array}$ , bound the first term by u and find the best u to minimize the upper bound).

D.5 Comparison of Hoefding’s and Chebyshev’s inequalities. Let $X_{1}, \ldots, X_{m}$ be a sequence of random variables taking values in $[0, 1]$ with the same mean $\mu$ and variance $\sigma^{2} < \infty$ and let $\begin{array}{r}{\overline{{X}} = \frac{1}{m} \sum_{i = 1}^{m} X_{i}} \end{array}$

(a) For any $\epsilon > 0$ , give a bound on $\mathbb{P}[| \overline{{X}} - \mu | > \epsilon]$ using Chebyshev’s inequality, then Hoefding’s inequality. For what values of σ is Chebyshev’s inequality tighter?

(b) Assume that the random variables $X_{i}$ take values in {0, 1}. Show that $\sigma^{2} \leq \frac{1}{4}$ . Use this to simplify Chebyshev’s inequality. Choose $\epsilon =.05$ and plot Chebyshev’s inequality thereby modified and Hoefding’s inequality as a function of m (you can use your preferred program for generating the plots).

D.6 Bennett’s and Bernstein’s inequalities. The objective of this problem is to prove these two inequalities.

(a) Show that for any $t > 0$ , and any random variable X with $\mathbb{E}[X] = 0, \mathbb{E}[X^{2}] = \sigma^{2}$ , and $X \leq c,$

$$
\mathbb{E}[e^{tX}] \leq e^{f(\sigma^{2} / c^{2})},\tag{D.31}
$$

where

$$
f(x) = \log \Big(\frac{1}{1 + x} e^{- ctx} + \frac{x}{1 + x} e^{ct} \Big).
$$

(b) Show that $f^{\prime \prime}(x) \leq 0$ for $x \geq 0$

(c) Using Chernof’s bounding technique, show that

$$
\mathbb{P} \left[\frac{1}{m} \sum_{i = 1}^{m} X_{i} \geq \epsilon \right] \leq e^{- tm \epsilon + \sum_{i = 1}^{m} f(\sigma_{X_{i}}^{2} / c^{2})},
$$

where $(\sigma_{X_{i}}^{2}$ is the variance of $X_{i}$

(d) Show that $f(x) \leq f(0) + xf^{\prime}(0) =(e^{ct} - 1 - ct) x.$

(e) Using the bound derived in (4), find the optimal value of t.

(f) Bennett’s inequality. Let $X_{1}, \ldots, X_{m}$ be independent real-valued random variables with zero mean such that for $i = 1, \ldots, m, X_{i} \leq c$ . Let $\begin{array}{r}{\sigma^{2} = \frac{1}{m} \sum_{i = 1}^{m} \sigma_{X_{i}}^{2}} \end{array}$ . Show that

$$
\mathbb{P} \left[\frac{1}{m} \sum_{i = 1}^{m} X_{i} > \epsilon \right] \leq \exp \left(- \frac{m \sigma^{2}}{c^{2}} \theta \left(\frac{\epsilon c}{\sigma^{2}}\right)\right),\tag{D.32}
$$

where $\theta(x) =(1 + x) \log(1 + x) - x.$

(g) Bernstein’s inequality. Show that under the same conditions as Bennett’s inequality

$$
\mathbb{P} \left[\frac{1}{m} \sum_{i = 1}^{m} X_{i} > \epsilon \right] \leq \exp \left(- \frac{m \epsilon^{2}}{2 \sigma^{2} + 2c \epsilon / 3}\right).\tag{D.33}
$$

(Hint: show that for all $\begin{array}{r}{x \ge 0, \theta(x) \ge h(x) = \frac{3}{2} \frac{x^{2}}{x + 3}.)} \end{array}$

(h) Write Hoefding’s inequality assuming the same conditions. For what values of $\sigma$ is Bernstein’s inequality better than Hoefding’s inequality?

D.7 Exponential inequality. Let X be a random variable following a binomial distribution $B(m, p)$

(a) Use Sanov’s inequality to show that the following exponential inequality holds for any $\epsilon > 0 :$

$$
\mathbb{P} \left[\frac{X}{m} - p > \epsilon \right] \leq \left[\left(\frac{p}{p + \epsilon}\right)^{p + \epsilon} \left(\frac{1 - p}{1 -(p + \epsilon)}\right)^{1 -(p + \epsilon)} \right]^{m}.\tag{D.34}
$$

(b) Use that to show that the following holds:

$$
\mathbb{P} \left[\frac{X}{m} - p > \epsilon \right] \leq \left(\frac{p}{p + \epsilon}\right)^{m(p + \epsilon)} e^{m \epsilon}.\tag{D.35}
$$

(c) Prove that

$$
\mathbb{P} \left[\frac{X}{m} - p > \epsilon \right] \leq e^{- mp \theta(\frac{\epsilon}{p})},\tag{D.36}
$$

where $\theta$ is defined as in exercise D.6.

# Notions of Information Theory

This chapter introduces some basic notions of information theory useful for the presentation of several learning algorithms and their properties. The definitions and theorems are given in the case of discrete random variables or distributions, but they can be straightforwardly extended to the continuous case.

We start with the notion of entropy, which can be viewed as a measure of the uncertainty of a random variable.

## E.1 Entropy

Definition E.1 (Entropy) The entropy of a discrete random variable X with probability mass function $p(x) = \mathbb{P}[X = x]$ is denoted by $H(X)$ and defined $by$

$$
H(X) = - \mathbb{E}[\log(p(X))] = - \sum_{x \in \mathcal{X}} p(x) \log(p(x)).\tag{E.1}
$$

We define by the same expression the entropy of a distribution p and abusively denote that by ${H}(p)$

The base of the logarithm is not critical in this definition since it only afects the value by a multiplicative constant. Thus, unless otherwise specified, we will consider the natural logarithm (base e). If we use base 2, then $- \log_{2}(p(x))$ ) is the number of bits needed to represent $p(x)$ Thus, by definition, the entropy of X can be viewed as the average number of bits (or amount of information) needed for the description of the random variable X. By the same property, the entropy is always non-negative:

$$
H(X) \geq 0.\tag{E.2}
$$

As an example, the entropy of a biased coin $X_{p}$ taking value 1 with probability $p$ and 0 with probability $1 - p$ is given by

$$
H(X_{p}) = - p \log p -(1 - p) \log(1 - p).\tag{E.3}
$$

The corresponding function of $p$ is often referred to as the binary entropy function. Figure E.1 shows a plot of that function when using base 2 for the logarithm. As can be seen from the figure, the entropy is a concave function.<sup>26</sup> It reaches its maximum at $\begin{array}{r}{p = \frac{1}{2}} \end{array}$ , which corresponds to the most uncertain case, and its minima at $p = 0$ or $p = 1$ which correspond to the fully certain cases. More generally, assume that the input space X has a finite cardinality $N \geq 1$ . Then, by Jensen’s

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/c7b0ce2fdd73b989234c6f744325cef063dbbd27961b929281f17113a252785c.jpg)  
Figure E.1

A plot of the binary entropy as a function of the bias $p.$

inequality, in view of the concavity of logarithm, the following inequality holds:

$$
H(X) = \mathbb{E} \left[\log \frac{1}{p(X)} \right] \leq \log \mathbb{E} \left[\frac{1}{p(X)} \right] = \log \left(\sum_{x \in \mathcal{X}} \frac{p(x)}{p(x)}\right) = \log N.\tag{E.4}
$$

Thus, more generally, the maximum value of the entropy is log $N$ , that is the entropy of the uniform distribution.

The entropy is a lower bound on lossless data compression and is therefore a critical quantity to consider in information theory. It is also closely related to the notions of entropy in thermodynamics and quantum physics.

## E.2 Relative entropy

Here, we introduce a measure of divergence between two distributions $p$ and $q,$ relative entropy, which is related to the notion of entropy. The following is its definition in the discrete case.

Definition E.2 (Relative entropy) The relative entropy (or Kullback-Leibler divergence) of two distributions $p$ and $q$ is denoted by $D(p \| q)$ and defined $by$

$$
\mathrm{D}(p \| q) = \underset{p}{\mathbb{E}} \left[\log \frac{p(X)}{q(X)} \right] = \sum_{x \in \mathcal{X}} p(x) \log \left[\frac{p(x)}{q(x)} \right],\tag{E.5}
$$

with the conventions 0 log $\begin{array}{r}{0 = 0, 0 \log \frac{0}{0} = 0} \end{array}$ , and a log $\begin{array}{r}{\frac{a}{0} = + \infty \for \a > 0} \end{array}$

Note that, in view of these conventions, whenever $q(x) = 0$ for some x in the support of $p$ $(p(x) > 0)$ , the relative entropy is infinite: $D(p \| q) = \infty$ . Thus, the relative entropy does not provide an informative measure of the divergence of $p$ and $q$ in such cases.

As for the entropy, the base of the logarithm is not critical in the definition of the relative entropy and we will consider the natural logarithm unless otherwise specified. If we use base $^{2,}$ the relative entropy can be interpreted in terms of coding length. Ideally, one could design for $p$ an optimal code with average length the entropy $H(p)$ . The relative entropy is the average number of additional bits needed to encode p when using an optimal code for q instead of one for p since it can be expressed as the diference $\begin{array}{r}{\dot{D}(p \| q) = \mathbb{E}_{p}[\log \frac{\hat{1}}{q(X)}] - H(p)} \end{array}$ , which, as shown by the following proposition, is always non-negative.

Proposition E.3 (Non-negativity of relative entropy) For any two distributions $p$ and $q,$ the following inequality holds:

$$
\mathrm{D}(p | | q) \geq 0.\tag{E.6}
$$

Furthermore, $D(p \| q) = 0 \iff \p = q.$

Proof: By the concavity of logarithm and Jensen’s inequality, the following holds:

$$
\begin{array}{c} - \mathrm{D}(p \| q) = \sum_{x: p(x) > 0} p(x) \log \left(\frac{q(x)}{p(x)}\right) \leq \log \bigg(\sum_{x: p(x) > 0} p(x) \frac{q(x)}{p(x)} \bigg) \\ = \log \bigg(\sum_{x: p(x) > 0} q(x) \bigg) \leq \log(1) = 0.\end{array}
$$

Thus, the relative entropy is always non-negative for all distributions $p$ and $q.$ The equality $D(p \| q) = 0$ can hold only if both of the inequalities above are equalities. The last one implies that $\textstyle \sum_{x \colon p(x) > 0} q(x) = 1$ . Since the log function is strictly concave, the first inequality can be an equality only if $\frac{q(x)}{p(x)}$ is some constant α over $\{x \colon p(x) > 0\}$ . Since $p(x)$ sums to one over that set, we must have $\textstyle \sum_{x \colon p(x) > 0} q(x) = \alpha$ . Thus, $\alpha = 1$ , which implies $q(x) = p(x)$ for all $x \in \{x : p(x) > 0\}$ and thus for all x. Finally, by definition, for any distribution $p, D(p \| p) = 0.$ , which completes the proof. $\square$

The relative entropy is not a distance. It is asymmetric: in general, $D(p \| q) \neq D(q \| p)$ for two distributions $p$ and $q.$ . Furthermore, in general, the relative entropy does not verify the triangle inequality.

Corollary E.4 (Log-sum inequality) For any set of non-negative real numbers $a_{1}, \ldots, a_{n}$ and $b_{1}, \ldots, b_{n}$ , the following inequality holds:

$$
\sum_{i = 1}^{n} a_{i} \log \left(\frac{a_{i}}{b_{i}}\right) \geq \left(\sum_{i = 1}^{n} a_{i}\right) \log \left(\frac{\sum_{i = 1}^{n} a_{i}}{\sum_{i = 1}^{n} b_{i}}\right),\tag{E.7}
$$

with the conventions 0 log 0 = 0, 0 log $\begin{array}{r}{\frac{0}{0} = 0} \end{array}$ , and a log $\begin{array}{r}{\frac{a}{0} = + \infty \for \a > 0} \end{array}$

Furthermore, equality holds in (E.7) if $\frac{a_{i}}{b_{i}}$ is a constant (does not depend on $i)$ .

Proof: With the conventions adopted, it is clear that the equality holds if $\textstyle \sum_{i = 1}^{n} a_{i} = 0$ , that is $a_{i} = 0$ for all $i \in \lceil n \rceil$ , or $\begin{array}{r}{\sum_{i = 1}^{n} b_{i} = 0} \end{array}$ , that is $b_{i} = 0$ for all $i \in[n]$ . Thus, we can assume that $\textstyle \sum_{i = 1}^{n} a_{i} \neq 0$ and $\textstyle \sum _ { i = 1 } ^ { n } b _ { i } \neq 0 $ . Since the inequality is invariant by scaling of the $a_{i} s$ or $b_{i} s$ , we can multiply them by positive constants such that $\textstyle \sum_{i = 1}^{n} a_{i} = \sum_{i = 1}^{n} b_{i} = 1$ . The inequality then coincides with the non-negativity of the relative entropy of the distributions thereby defined by $a_{i} s$ and $b_{i} s$ and the result holds by Proposition E.3. $\square$

Corollary E.5 (Joint convexity of relative entropy) The relative entropy function $(p, q) \mapsto D(p \| q)$ is convex.

Proof: For any $\alpha \in[0, 1]$ and any four probability distributions $p_{1}, p_{2}, q_{1}, q_{2}$ , by the Log-sum inequality (Corollary E.4), the following holds for any fixed x:

$$
\begin{array}{c}(\alpha p_{1}(x) +(1 - \alpha) p_{2}(x)) \log \left[\frac{\alpha p_{1}(x) +(1 - \alpha) p_{2}(x)}{\alpha q_{1}(x) +(1 - \alpha) q_{2}(x)} \right] \\ \leq \alpha p_{1}(x) \log \left[\frac{\alpha p_{1}(x)}{\alpha q_{1}(x)} \right] +(1 - \alpha) p_{2}(x) \log \left[\frac{(1 - \alpha) p_{1}(x)}{(1 - \alpha) q_{2}(x)} \right].\end{array}
$$

Summing up these inequalities over all x yields:

$$
\mathrm{D} \left(\alpha p_{1} +(1 - \alpha) p_{2} \| \alpha q_{1} +(1 - \alpha) q_{2}\right) \leq \alpha \mathrm{D} \left(p_{1} \| q_{1}\right) +(1 - \alpha) \mathrm{D} \left(p_{2} \| q_{2}\right),\tag{E.8}
$$

which concludes the proof.

(E.9)

## Corollary E.6 (Concavity of the entropy) The entropy function $p \mapsto H(p)$ is concave.

Proof: Observe that for any fixed distribution $p_{0}$ over ${\mathcal{X}},$ by definition of the relative entropy, we can write

$$
\mathrm{D}(p \| p_{0}) = \sum_{x \in \mathcal{X}} p(x) \log(p(x)) - \sum_{x \in \mathcal{X}} p(x) \log(p_{0}(x)).\tag{E.10}
$$

Thus, $\begin{array}{r}{H(p) = - D(p \| p_{0}) - \sum_{x \in \mathcal{X}} p(x) \log \bigl(p_{0}(x) \bigr)} \end{array}$ . By Corollary E.5, the first term is a concave function of p. The second term is linear in p and therefore is concave. Thus, H is concave as a sum of two concave functions. $\square$

Proposition E.7 (Pinsker’s inequality) For any two distributions p and $q,$ the following inequality holds:

$$
D(p \| q) \geq \frac{1}{2} \| p - q \|_{1}^{2}.\tag{E.11}
$$

Proof: We first show that the inequality holds for distributions over a set $\mathcal{A} \ = \ \{a_{0}, a_{1}\}$ of cardinality 2. Let $p_{0} = p(a_{0})$ and $q_{0} = q(a_{0})$ . Fix $p_{0} \in[0, 1]$ and consider the function $f \colon q_{0} \mapsto$ $f(q_{0})$ defined by

$$
f(q_{0}) = p_{0} \log \frac{p_{0}}{q_{0}} +(1 - p_{0}) \log \frac{1 - p_{0}}{1 - q_{0}} - 2(p_{0} - q_{0})^{2}.\tag{E.12}
$$

Observe that $f(p_{0}) = 0$ and that for ${\bf \bar{\boldsymbol{q}}}_{0} \in(0, 1)$ ),

$$
f^{\prime}(q_{0}) = - \frac{p_{0}}{q_{0}} + \frac{1 - p_{0}}{1 - q_{0}} + 4(p_{0} - q_{0}) =(q_{0} - p_{0}) \left[\frac{1}{(1 - q_{0}) q_{0}} - 4 \right].\tag{E.13}
$$

Since $\begin{array}{r}{(1 - q_{0}) q_{0} \le \frac{1}{4},[\frac{1}{(1 - q_{0}) q_{0}} - 4]} \end{array}$ is non-negative. Thus, $f^{\prime}(q_{0}) \leq 0$ for $q_{0} \leq p_{0}$ and $f^{\prime}(q_{0}) \geq 0$ for $q_{0} \geq p_{0}$ . Thus, $f$ reaches its minimum at $q_{0} = p_{0}$ , which implies $f(q_{0}) \geq f(p_{0}) = 0$ for all $q_{0}$ Since $f(q_{0})$ can be expressed as follows:

$$
f(q_{0}) = D(p \| q) - 2(p_{0} - q_{0})^{2}\tag{E.14}
$$

$$
= D(p | | q) - \frac{1}{2} \Big[| p_{0} - q_{0} | + |(1 - p_{0}) -(1 - q_{0}) | \Big]^{2}\tag{E.15}
$$

$$
= D(p \| q) - \frac{1}{2} \| p - q \|_{1}^{2} \geq 0,\tag{E.16}
$$

this proves the inequality for a set $\mathcal{A} = \overline{{\{}} a_{0}, a_{1}\}$ of cardinality 2.

Now, consider the distributions $p^{\prime}$ and $q^{\prime}$ defined over $\mathcal{A} = \{a_{0}, a_{1}\}$ with $\begin{array}{r}{p^{\prime}(a_{0}) = \sum_{x \in a_{0}} p(x)} \end{array}$ and $\begin{array}{r}{q^{\prime}(a_{0}) = \sum_{x \in a_{0}} q(x)} \end{array}$ where $a_{0} = \{x \in \mathfrak{X} \colon p(x) \geq q(x)\}$ and $a_{1} = \{x \in \mathfrak{X} \colon p(x) < q(x)\}$ }. By the Log-sum inequality (Corollary E.4),

$$
D(p \| q) = \sum_{x \in a_{0}} p(x) \log \left[\frac{p(x)}{q(x)} \right] + \sum_{x \in a_{1}} p(x) \log \left[\frac{p(x)}{q(x)} \right]\tag{E.17}
$$

$$
\geq p(a_{0}) \log \left[\frac{p(a_{0})}{q(a_{0})} \right] + p(a_{1}) \log \left[\frac{p(a_{1})}{q(a_{1})} \right]\tag{E.18}
$$

$$
= D(p^{\prime} \| q^{\prime}).\tag{E.19}
$$

Combining this inequality with the observation that

$$
\| p^{\prime} - q^{\prime} \|_{1} =(p(a_{0}) - q(a_{0})) -(p(a_{1}) - q(a_{1}))\tag{E.20}
$$

$$
= \sum_{x \in a_{0}}(p(x) - q(x)) - \sum_{x \in a_{1}}(p(x) - q(x))\tag{E.21}
$$

$$
= \sum_{x \in \mathcal{X}} | p(x) - q(x) |\tag{E.22}
$$

$$
= \| p - q \|_{1},\tag{E.23}
$$

shows that $\begin{array}{r}{D(p \| q) \ge D(p^{\prime} \| q^{\prime}) \ge \frac{1}{2} \| p - q \|_{1}^{2}} \end{array}$ and concludes the proof.

Definition E.8 (Conditional relative entropy) Let p and q be two probability distributions defined over $\mathcal{X} \times \mathcal{Y}$ and $_ra$ distribution over ${\mathcal{X}}.$ . Then, the conditional relative entropy of p and q with respect to the marginal r is defined as the expectation of the relative entropy of $p(\cdot | X)$ and $q(\cdot | X)$ with respect to $r :$

$$
\underset{X \sim r}{\mathbb{E}} \left[D \big(p(\cdot | X) \| q(\cdot | X) \big) \right] = \sum_{x \in \mathcal{X}} r(x) \sum_{y \in \mathcal{Y}} p(y | x) \log \frac{p(y | x)}{q(y | x)} = D(\widetilde{p} \| \widetilde{q}),\tag{E.24}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/b73d1a61459fade3707aa5da8a0adfc33dea907d1492702ba3ecb7a33e8112f4.jpg)  
Figure E.2

Illustration of the quantity measured by the Bregman divergence defined based on a convex and diferentiable function $F.$ . The divergence measures the distance between $F(x)$ and the hyperplane tangent to the curve at point $y.$

where $\widetilde{p}(x, y) = r(x) p(y | x)$ and $\widetilde{q}(x, y) = r(x) q(y | x)$ , with the conventions 0 log $\begin{array}{r}{0 = 0, 0 \log \frac{0}{0} = 0} \end{array}$ <sup>e</sup>and a log $\begin{array}{r}{\frac{a}{0} = + \infty \for \a > 0} \end{array}$

## E.3 Mutual information

Definition E.9 (Mutual information) Let X and Y be two random variables with joint probability distribution function $p(\cdot, \cdot)$ and marginal probability distribution functions $p(x)$ and $p(y)$ . Then, the mutual information $ofX$ and Y is denoted by $I(X, Y)$ and defined as follows:

(E.25)

$$
\begin{array}{l} I(X, Y) = D(p(x, y) \| p(x) p(y)) \\ \qquad = \underset{p(x, y)}{\mathbb{E}} \left[\log \frac{p(X, Y)}{p(X) p(Y)} \right] = \sum_{x \in \mathfrak{X}, y \in \mathcal{Y}} p(x, y) \log \left[\frac{p(x, y)}{p(x) p(y)} \right], \end{array}\tag{E.26}
$$

with the conventions 0 log $\begin{array}{r}{0 = 0, 0 \log \frac{0}{0} = 0} \end{array}$ , and a log $\begin{array}{r}{\frac{a}{0} = + \infty \for \a > 0} \end{array}$

When the random variables X and $Y$ are independent, their joint distributions is the product of the marginals $p(x)$ and $p(y)$ . Thus, the mutual information is a measure of the closeness of the joint distribution $p(x, y)$ to its value when X and Y are independent, where closeness is measured via the relative entropy divergence. As such, it can be viewed as a measure of the amount of information that each random variable can provide about the other. Note that by Proposition E.3, the equality $I(X, Y) = 0$ holds if $p(x, y) = p(x) p(y)$ for all $x, y,$ , that is if X and $Y$ are independent.

## E.4 Bregman divergences

Here we introduce the so-called unnormalized relative entropy $\widetildeD$ defined for all non-negative functions $p, q$ in $\mathbb{R}^{\mathcal{X}}$ by

$$
\widetilde{D}(p \| q) = \sum_{x \in \mathcal{X}} p(x) \log \left[\frac{p(x)}{q(x)} \right] + \bigl(q(x) - p(x) \bigr),\tag{E.27}
$$

Table E.1  
Examples of Bregman divergences and corresponding convex functions.

<table><tr><td></td><td> $B_{\boldsymbol{F}}(\boldsymbol{x} \parallel \boldsymbol{y})$ </td><td> $\boldsymbol{F}(\boldsymbol{x})$ </td></tr><tr><td>Squared  $L_2$ -distance</td><td> $\|x - y\|^2$ </td><td> $\|x\|^2$ </td></tr><tr><td>Mahalanobis distance</td><td> $(x - y)^\top Q(x - y)$ </td><td> $x^\top Qx$ </td></tr><tr><td>Unnormalized relative entropy</td><td> $\widetilde{D}(x \parallel y)$ </td><td> $\sum_{i \in I} x(i) \log(x(i)) - x(i)$ </td></tr></table>

with the conventions 0 log $\begin{array}{r}{0 = 0, 0 \log \frac{0}{0} = 0} \end{array}$ , and a log $\textstyle{\frac{a}{0}} = + \infty$ for $a > 0$ . The relative entropy coincides with the unnormalized relative entropy when restricted to $\Delta \times \Delta$ , where $\Delta$ is the family of distributions defined over X. The relative entropy inherits several properties of the unnormalized relative entropy, in particular, it can be shown that $\widetilde{D}(p \Vert q) \ge 0$ . Many of these properties are in fact shared by a broader family of divergences known as Bregman divergences.

Definition E.10 (Bregman divergences) Let F be a convex and diferentiable function defined over a convex (open) set C in a Hilbert space <sup>H</sup>. Then, the Bregman divergence $B_{F}$ associated to $F$ is defined for all $x, y \in \mathcal{C}$ by

$$
B_{F}(x \| y) = F(x) - F(y) - \langle \nabla F(y), x - y \rangle.\tag{E.28}
$$

Thus, $B_{F}(x \parallel y)$ measures the diference of $F(x)$ and its linear approximation. Figure E.2 illustrates this definition. Table E.1 provides several examples of Bregman divergences along with their corresponding convex functions $F(x)$ . Note that, although the unnormalized relative entropy is a Bregman divergence, the relative entropy is not a Bregman divergence since it is defined over the simplex which is not an open set and has an empty interior.

The following proposition presents several general properties of Bregman divergences.

Proposition E.11 Let F be a convex and diferentiable function defined over a convex set C in a Hilbert space <sup>H</sup>. Then, the following properties hold:

1. ∀x, $y \in{\mathcal{C}}, \ B_{F}(x \parallel y) \geq 0.$

$$
2.\forall x, y, z \in \mathcal{C}, \langle \nabla F(x) - \nabla F(y), x - z \rangle = \mathrm{B}_{F}(x \| y) + \mathrm{B}_{F}(z \| x) - \mathrm{B}_{F}(z \| y).
$$

3. $B_{F}$ is convex in its first argument. If additionally F is strictly convex, then $B_{F}$ is strictly convex in its first argument.

4. Linearity: let G be a convex and diferentiable function over C, then, for any $\alpha, \beta \in \mathbb{R}$ $B_{\alpha F + \beta G} = \alpha B_{F} + \beta B_{G}$

For the following properties, we will assume additionally that F is strictly convex.

5. Projection: for any $y \in \mathcal{C}$ and any closed convex set $\mathcal{K} \subseteq \mathcal{C}$ , the $B_{F} \mathrm{- projection}$ of y over $K_{i}$ $\begin{array}{r}{P_{\mathcal{K}}(y) = \operatorname{argmin}_{x \in \mathcal{K}} B_{F}(x \parallel y)} \end{array}$ , is unique.

6. Pythagorean theorem: for $y \in \mathcal{C}$ and any closed convex set $\mathcal{K} \subseteq \mathcal{C}$ , the following holds for all $x \in \mathcal K \colon$

$$
B_{F}(x \parallel y) \geq B_{F}(x \parallel P_{\mathcal{K}}(y)) + B_{F}(P_{\mathcal{K}}(y) \parallel y).\tag{E.29}
$$

7. Conjugate divergence: assume that F is closed proper strictly convex, and that the norm of its gradient tends to infinity near the boundary of C: li $1_{x \to \partial \mathcal{C}} \parallel \nabla F(x) \parallel = + \infty$ . The pair $(\mathcal{C}, F)$ is then said to be a convex function of Legendre type. Then, the conjugate of $F, F^{*}$ , is diferentiable and the following holds for all $x, y \in \mathcal{C}$

$$
B_{F}(x \parallel y) = B_{F^{*}}(\nabla F(y) \parallel \nabla F(x)).\tag{E.30}
$$

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/1c7222f8e8658f79504abee6b605ea76ae2c5e36bec69dd92104a3a651b9a522.jpg)  
Figure E.3

A depiction of the Pythagorean theorem stated in proposition E.11, where the squared length of each line illustrates the magnitude of the Bregman divergence between the points it connects.

Proof: Property (1) holds by convexity of the function F (the graph of F is above its tangent, see equation (B.3)).

Property (2) follows directly from the definition of the Bregman divergence:

$$
\begin{array}{rl} &{B_{F}(x \parallel y) + B_{F}(z \parallel x) - B_{F}(z \parallel y)} \\ &{\quad = - \left\langle \nabla F(y), x - y \right\rangle - \left\langle \nabla F(x), z - x \right\rangle + \left\langle \nabla F(y), z - y \right\rangle} \\ &{\quad = \left\langle \nabla F(x) - \nabla F(y), x - z \right\rangle.} \end{array}
$$

Property (3) holds since $x \mapsto F(x) - F(y) - \langle \nabla F(y), x - y \rangle$ is convex as a sum of the convex function $x \mapsto F(x)$ and the Affine and thus convex function $x \mapsto - F(y) - \langle \nabla F(y), x - y \rangle$ . Similarly, $B_{F}$ is strictly convex with respect to its first argument if F is strictly convex, as a sum of a strictly convex function and an Affine function.

Property (4) follows from a series of equalities:

$$
\begin{array}{rl} &{B_{\alpha F + \beta G} = \alpha F(x) + \beta G(x) - \alpha F(y) - \beta G(y) - \left\langle \nabla(\alpha F(y) + \beta G(y)), x - y \right\rangle} \\ &{\qquad = \alpha(F(x) - F(y) - \langle \nabla F(y), x - y \rangle) + \beta(G(x) - G(y) - \langle \nabla G(y), x - y \rangle)} \\ &{\qquad = \alpha B_{F} + \beta B_{G},} \end{array}
$$

where we have used the fact that both the gradient and inner-product are linear functions.

Property (5) holds since, by Property (3), mi ${\mathsf{1}}_{{\boldsymbol{x}} \in{\mathcal{X}}} B_{F}({\boldsymbol{x}} \parallel{\boldsymbol{y}})$ is a convex optimization problem with a strictly convex objective function.

For property (6), fix $y \in \mathcal{C}$ and let J be the function defined for all $\alpha \in[0, 1]$ by

$$
J(\alpha) = B_{F}(\alpha x +(1 - \alpha) P_{\mathcal{K}}(y) \| y).
$$

Since C is convex, for any $\alpha \in[0, 1], \alpha x +(1 - \alpha) P_{\mathcal{K}}(y)$ is in C. F is diferentiable over C therefore J is also diferentiable as a composition of F with $\alpha \mapsto \alpha x +(1 - \alpha) P_{\mathcal{K}}(y)$ . By definition of $P_{\mathcal{K}}(y)$ for any $\alpha \in(0, 1]$ ],

$$
\underline{{J(\alpha) - J(0)}} = \underline{{B_{F}(\alpha x +(1 - \alpha) P_{\mathcal{K}}(y) \| y) - B_{F}(P_{\mathcal{K}}(y) \| y)}} \geq 0.\tag{E.31}
$$

$J^{\prime}(0) \geq 0$ α This implies that . From the following expression of $J(\alpha)$

$$
J(\alpha) = F(\alpha x +(1 - \alpha) P_{\mathcal{K}}(y)) - F(y) - \langle \nabla F(y), \alpha x +(1 - \alpha) P_{\mathcal{K}}(y) - y \rangle,\tag{E.32}
$$

we can compute its derivative at 0:

$$
\begin{array}{rl} & J^{\prime}(0) = \langle x - P_{\mathcal{K}}(y), \nabla F(P_{\mathcal{K}}(y)) \rangle - \langle \nabla F(y), x - P_{\mathcal{K}}(y) \rangle \\ & \quad = - B_{F}(x \parallel P_{\mathcal{K}}(y)) + F(x) - F(P_{\mathcal{K}}(y)) - \langle \nabla F(y), x - P_{\mathcal{K}}(y) \rangle \\ & \quad = - B_{F}(x \parallel P_{\mathcal{K}}(y)) + F(x) - F(P_{\mathcal{K}}(y)) - \langle \nabla F(y), x - y \rangle - \langle \nabla F(y), y - P_{\mathcal{K}}(y) \rangle \\ & \quad = - B_{F}(x \parallel P_{\mathcal{K}}(y)) + B_{F}(x \parallel y) + F(y) - F(P_{\mathcal{K}}(y)) - \langle \nabla F(y), y - P_{\mathcal{K}}(y) \rangle \\ & \quad = - B_{F}(x \parallel P_{\mathcal{K}}(y)) + B_{F}(x \parallel y) - B_{F}(P_{\mathcal{K}}(y) \parallel y) \geq 0, \end{array}
$$

which concludes the proof of Property (6).

For property (7), note that, by definition, for any y, $F^{*}$ is defined by

$$
F^{*}(y) = \sup_{x \in \mathcal{C}} \bigl \{\langle x, y \rangle - F(x) \bigr\}.\tag{E.33}
$$

$F^{*}$ is convex and admits a sub-diferential at any y. By the strict convexity of $F,$ the function $x \mapsto \langle x, y \rangle - F(x)$ is strictly concave and diferentiable over C and the norm of its gradient, $y - \nabla F(x)$ , tends to infinity near the boundary of C (by the corresponding property assumed for $F)$ . Thus, its supremum is reached at a unique point $x_{y} \in \mathcal{C}$ where its gradient is zero, that is at $x_{y}$ with $\nabla F(x_{y}) = y.$ . This implies that for any $y, \partial F^{*}(y)$ , the subdiferential of $F^{*}$ , is reduced to a singleton. Thus, $F^{*}$ is diferentiable and its gradient at y is $\nabla F^{*}(y) = x_{y} = \nabla^{- 1} F(y)$ . Since $F^{*}$ is convex and diferentiable, its Bregman divergence is well defined. Furthermore, $F^{*}(y) =$ $\left.\nabla F^{- 1}(y), y \right.- F(\nabla F^{- 1}(y))$ since $x_{y} = \nabla^{- 1} F(y)$ . For any $x, y \in \mathcal{C}$ , using the definition of $B_{F}{:}$ and the expression of $\nabla F^{*}(y)$ and $F^{*}(y)$ we can write

$$
\begin{array}{l} B_{F^{*}}(\nabla F(y) \| \nabla F(x)) \\ = F^{*}(\nabla F(y)) - F^{*}(\nabla F(x)) - \big \langle \nabla^{- 1} F(\nabla F(x)), \nabla F(y) - \nabla F(x) \big \rangle \\ = F^{*}(\nabla F(y)) - F^{*}(\nabla F(x)) - \langle x, \nabla F(y) - \nabla F(x) \rangle \\ = \big \langle \nabla^{- 1} F(\nabla F(y)), \nabla F(y) \big \rangle - F(\nabla^{- 1} F(\nabla F(y))) \\ \qquad - \big \langle \nabla^{- 1} F(\nabla F(x)), \nabla F(x) \big \rangle + F(\nabla^{- 1} F(\nabla F(x))) - \langle x, \nabla F(y) - \nabla F(x) \rangle \\ = \langle y, \nabla F(y) \rangle - F(y) - \langle x, \nabla F(x) \rangle + F(x) - \langle x, \nabla F(y) - \nabla F(x) \rangle \\ = \langle y, \nabla F(y) \rangle - F(y) + F(x) - \langle x, \nabla F(y) \rangle \\ = F(x) - F(y) - \langle x - y, \nabla F(y) \rangle = B_{F}(x \| y), \end{array}
$$

which completes the proof.

Notice that while the unnormalized relative entropy (and thus the relative entropy) are convex functions of the pair of their arguments, this in general does not hold for all Bregman divergences, only convexity with respect to the first argument is guaranteed.

The notion of Bregman divergence can be extended to the case of non-diferentiable functions (see section 14.3).

## E.5 Chapter notes

The notion of entropy presented in this chapter is due to Shannon [1948] who, more generally, within the same article, set the foundation of information theory. More general definitions of entropy (R´enyi entropy) and relative entropy (R´enyi divergence) were later introduced by R´enyi [1961]. The Kullback-Leibler divergence was introduced in [Kullback and Leibler, 1951].

Pinsker’s inequality is due to Pinsker [1964]. Finer inequalities relating the relative entropy and the L -norm were later given by Csisz´ar [1967] and Kullback [1967]. See [Reid and Williamson, 2009] for a generalization of such inequalities to the case of f-divergences. The notion of Bregman divergence is due to Bregman [1967].

For a more extensive material on information theory, we strongly recommend the book of Cover and Thomas [2006].

![原书图像；请以 source.pdf 为准](../../../transcripts/mineru/foundations-of-machine-learning-2e/parts/p401-501/images/21b0bab65391517f33a280344ebeeb68f34e57de3b2e67cbc79e6c47cad25d5c.jpg)  
Figure E.4

An illustration of the parallelogram identity.

## E.6 Exercises

E.1 Parallelogram identity. Prove the following parallelogram identity for any three distributions p, q, and r on X:

$$
D(p \parallel r) + D(q \parallel r) = 2 D \left(\frac{p + q}{2} \parallel r\right) + D \left(p \parallel \frac{p + q}{2}\right) + D \left(q \parallel \frac{p + q}{2}\right).\tag{E.34}
$$

Does the equality hold if we replace the relative entropy $\mathrm{by}$ the norm-2 squared? Figure E.4 illustrates a particular example of this identity. Note, in the example we have

$$
\begin{array}{rl} &{\| p - r \|^{2} = \left\| \left(p - \frac{p + q}{2}\right) + \left(\frac{p + q}{2} - r\right) \right\|^{2}} \\ &{\qquad = \left\| p - \frac{p + q}{2} \right\|^{2} + \left\| \frac{p + q}{2} - r \right\|^{2} - 2 \cos(\pi - \theta) \left\| p - \frac{p + q}{2} \right\| \left\| \frac{p + q}{2} - r \right\|} \end{array}
$$

and

$$
\begin{array}{c} \| q - r \|^{2} = \left\| \left(q - \frac{p + q}{2}\right) + \left(\frac{p + q}{2} - r\right) \right\|^{2} \\ = \left\| q - \frac{p + q}{2} \right\|^{2} + \left\| \frac{p + q}{2} - r \right\|^{2} - 2 \cos(\theta) \left\| q - \frac{p + q}{2} \right\| \left\| \frac{p + q}{2} - r \right\|.\end{array}
$$

Summing these two quantities shows the identity holds for the example.

## F Notation

<table><tr><td>R</td><td>Set of real numbers</td></tr><tr><td> $\mathbb{R}_{+}$ </td><td>Set of non-negative real numbers</td></tr><tr><td> $\mathbb{R}^{n}$ </td><td>Set of n-dimensional real-valued vectors</td></tr><tr><td> $\mathbb{R}^{n\times m}$ </td><td>Set of  $n\times m$  real-valued matrices</td></tr><tr><td> $[a,b]$ </td><td>Closed interval between a and b</td></tr><tr><td> $(a,b)$ </td><td>Open interval between a and b</td></tr><tr><td> $\{a,b,c\}$ </td><td>Set containing elements a, b and c</td></tr><tr><td> $[n]$ </td><td>The set  $\{1,2,\ldots,n\}$ </td></tr><tr><td>N</td><td>Set of natural numbers, i.e.,  $\{0,1,\ldots\}$ </td></tr><tr><td>log</td><td>Logarithm with base e</td></tr><tr><td> $\log_{a}$ </td><td>Logarithm with base a</td></tr><tr><td>S</td><td>An arbitrary set</td></tr><tr><td> $|\mathcal{S}|$ </td><td>Number of elements in S</td></tr><tr><td> $s\in\mathcal{S}$ </td><td>An element in set S</td></tr><tr><td>X</td><td>Input space</td></tr><tr><td>Y</td><td>Target space</td></tr><tr><td>H</td><td>Feature space</td></tr><tr><td> $\langle\cdot,\cdot\rangle$ </td><td>Inner product in feature space</td></tr><tr><td>v</td><td>An arbitrary vector</td></tr><tr><td>1</td><td>Vector of all ones</td></tr><tr><td> $v_{i}$ </td><td>ith component of v</td></tr><tr><td> $\|v\|$ </td><td> $L_{2}$  norm of v</td></tr><tr><td> $\|v\|_{p}$ </td><td> $L_{p}$  norm of v</td></tr><tr><td>u o v</td><td>Hadamard or entry-wise product of vectors u and v</td></tr></table>

<table><tr><td> $f \circ g$ </td><td>Composition of functions  $f$  and  $g$ </td></tr><tr><td> $T_1 \circ T_2$ </td><td>Composition of weighted transducers  $T_1$  and  $T_2$ </td></tr><tr><td> $\mathbf{M}$ </td><td>An arbitrary matrix</td></tr><tr><td> $\| \mathbf{M} \|_2$ </td><td>Spectral norm of  $\mathbf{M}$ </td></tr><tr><td> $\| \mathbf{M} \|_F$ </td><td>Frobenius norm of  $\mathbf{M}$ </td></tr><tr><td> $\mathbf{M}^\top$ </td><td>Transpose of  $\mathbf{M}$ </td></tr><tr><td> $\mathbf{M}^\dagger$ </td><td>Pseudo-inverse of  $\mathbf{M}$ </td></tr><tr><td> $\text{Tr}[\mathbf{M}]$ </td><td>Trace of  $\mathbf{M}$ </td></tr><tr><td> $\mathbf{I}$ </td><td>Identity matrix</td></tr><tr><td> $K: \mathcal{X} \times \mathcal{X} \to \mathbb{R}$ </td><td>Kernel function over  $\mathcal{X}$ </td></tr><tr><td> $\mathbf{K}$ </td><td>Kernel matrix</td></tr><tr><td> $1_{\mathcal{A}}$ </td><td>Indicator function indicating membership in subset  $\mathcal{A}$ </td></tr><tr><td> $h_S$ </td><td>The hypothesis function returned when training with sample  $S$ </td></tr><tr><td> $R(\cdot)$ </td><td>Generalization error or risk</td></tr><tr><td> $\widehat{R}_S(\cdot)$ </td><td>Empirical error or risk with respect to sample  $S$ </td></tr><tr><td> $\widehat{R}_{S,\rho}(\cdot)$ </td><td>Empirical margin error with margin  $\rho$  and with respect to sample  $S$ </td></tr><tr><td> $\Re_m(\cdot)$ </td><td>Rademacher complexity over all samples of size  $m$ </td></tr><tr><td> $\widehat{\Re}_S(\cdot)$ </td><td>Empirical Rademacher complexity with respect to sample  $S$ </td></tr><tr><td> $N(0,1)$ </td><td>Standard normal distribution</td></tr><tr><td> $\mathbb{E}_{x \sim \mathcal{D}}[\cdot]$ </td><td>Expectation over  $x$  drawn from distribution  $\mathcal{D}$ </td></tr><tr><td> $\Sigma^*$ </td><td>Kleene closure over a set of characters  $\Sigma$ </td></tr></table>

Shivani Agarwal and Partha Niyogi. Stability and generalization of bipartite ranking algorithms. In Conference On Learning Theory, pages 32–47, 2005.

Shivani Agarwal, Thore Graepel, Ralf Herbrich, Sariel Har-Peled, and Dan Roth. Generalization bounds for the area under the ROC curve. Journal of Machine Learning Research, 6:393–425, 2005.

Nir Ailon and Mehryar Mohri. An efficient reduction of ranking to classification. In Conference On Learning Theory, pages 87–98, 2008.

Mark A. Aizerman, E. M. Braverman, and Lev I. Rozono\`er. Theoretical foundations of the potential function method in pattern recognition learning. Automation and Remote Control, 25: 821–837, 1964.

Cyril Allauzen and Mehryar Mohri. N-way composition of weighted finite-state transducers. International Journal of Foundations of Computer Science, 20(4):613–627, 2009.

Cyril Allauzen, Corinna Cortes, and Mehryar Mohri. Large-scale training of SVMs with automata kernels. In International Conference on Implementation and Application of Automata, pages 17– 27, 2010.

Erin L. Allwein, Robert E. Schapire, and Yoram Singer. Reducing multiclass to binary: A unifying approach for margin classifiers. Journal of Machine Learning Research, 1:113–141, 2000.

Noga Alon and Joel Spencer. The Probabilistic Method. John Wiley, 1992.

Noga Alon, Shai Ben-David, Nicol\`o Cesa-Bianchi, and David Haussler. Scale-sensitive dimensions, uniform convergence, and learnability. Journal of ACM, 44:615–631, July 1997.

Yasemin Altun and Alexander J. Smola. Unifying divergence minimization and statistical inference via convex duality. In Conference On Learning Theory, pages 139–153, 2006.

Galen Andrew and Jianfeng Gao. Scalable training of l -regularized log-linear models. In Proceedings of ICML, pages 33–40, 2007.

Dana Angluin. On the complexity of minimum inference of regular sets. Information and Control, 39(3):337–350, 1978.

Dana Angluin. Inference of reversible languages. Journal of the ACM, 29(3):741–765, 1982.

Dana Angluin and Leslie G. Valiant. Fast probabilistic algorithms for hamiltonian circuits and matchings. J. Comput. Syst. Sci., 18(2):155–193, 1979.

Martin Anthony and Peter L. Bartlett. Neural Network Learning: Theoretical Foundations. Cambridge University Press, 1999.

Nachman Aronszajn. Theory of reproducing kernels. Transactions of the American Mathematical Society, 68(3):337–404, 1950.

Patrick Assouad. Densit´e et dimension. Annales de l’institut Fourier, 33(3):233–282, 1983.

Kazuoki Azuma. Weighted sums of certain dependent random variables. Tohoku Mathematical Journal, 19(3):357–367, 1967.

Maria-Florina Balcan, Nikhil Bansal, Alina Beygelzimer, Don Coppersmith, John Langford, and Gregory B. Sorkin. Robust reductions from ranking to classification. Machine Learning, 72(1-2): 139–153, 2008.

Peter L. Bartlett and Shahar Mendelson. Rademacher and Gaussian complexities: Risk bounds and structural results. Journal of Machine Learning Research, 3, 2002.

Peter L. Bartlett, St´ephane Boucheron, and G´abor Lugosi. Model selection and error estimation. Machine Learning, 48:85–113, September 2002a.

Peter L. Bartlett, Olivier Bousquet, and Shahar Mendelson. Localized Rademacher complexities. In Conference on Computational Learning Theory, volume 2375, pages 79–97. Springer-Verlag, 2002b.

Amos Beimel, Francesco Bergadano, Nader H. Bshouty, Eyal Kushilevitz, and Stefano Varricchio. Learning functions represented as multiplicity automata. Journal of the ACM, 47:2000, 2000.

Mikhail Belkin and Partha Niyogi. Laplacian eigenmaps and spectral techniques for embedding and clustering. In Neural Information Processing Systems, 2001.

George Bennett. Probability inequalities for the sum of independent random variables. Journal of the American Statistical Association, 57:33–45, 1962.

Christian Berg, Jens P.R. Christensen, and Paul Ressel. Harmonic Analysis on Semigroups: Theory of Positive Definite and Related Functions, volume 100. Springer, 1984.

Francesco Bergadano and Stefano Varricchio. Learning behaviors of automata from shortest counterexamples. In European Conference on Computational Learning Theory, pages 380–391, 1995.

Adam L. Berger, Stephen Della Pietra, and Vincent J. Della Pietra. A maximum entropy approach to natural language processing. Comp. Linguistics, 22(1), 1996.

Joseph Berkson. Application of the logistic function to bio-assay. Journal of the American Statistical Association, 39:357—-365, 1944.

Sergei Natanovich Bernstein. Sur l’extension du th´eor\`eme limite du calcul des probabilit´es aux sommes de quantit´es d´ependantes. Mathematische Annalen, 97:1–59, 1927.

Dimitri P. Bertsekas. Dynamic Programming: Deterministic and Stochastic Models. Prentice Hall, 1987.

Dmitri P. Bertsekas, Angelica Nedi´c, and Asuman E. Ozdaglar. Convex Analysis and Optimization. Athena Scientific, 2003.

Laurence Bisht, Nader H. Bshouty, and Hanna Mazzawi. On optimal learning algorithms for multiplicity automata. In Conference On Learning Theory, pages 184–198, 2006.

Avrim Blum and Yishay Mansour. From external to internal regret. In Conference On Learning Theory, pages 621–636, 2005.

Avrim Blum and Yishay Mansour. Learning, regret minimization, and equilibria. In Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay Vazirani, editors,<sup>´</sup> Algorithmic Game Theory, chapter 4, pages 4–30. Cambridge University Press, 2007.

Anselm Blumer, Andrzej Ehrenfeucht, David Haussler, and Manfred K. Warmuth. Learnability and the Vapnik-Chervonenkis dimension. Journal of the ACM, 36(4):929–965, 1989.

Jonathan Borwein and Qiji Zhu. Techniques of Variational Analysis. Springer, New York, 2005.

Jonathan M. Borwein and Adrian S. Lewis. Convex Analysis and Nonlinear Optimization, Theory and Examples. Springer, 2000.

Bernhard E. Boser, Isabelle M. Guyon, and Vladimir N. Vapnik. A training algorithm for optima margin classifiers. In Conference On Learning Theory, pages 144–152, 1992.

Olivier Bousquet and Andr´e Elisseef. Stability and generalization. Journal of Machine Learning Research, 2:499–526, 2002.

Stephen P. Boyd and Lieven Vandenberghe. Convex Optimization. Cambridge University Press, 2004.

Lev M. Bregman. The relaxation method of finding the common point of convex sets and its application to the solution of problems in convex programming. USSR Computational Mathematics and Mathematical Physics, 7:200–217, 1967.

Leo Breiman. Prediction games and arcing algorithms. Neural Computation, 11:1493–1517, October 1999.

Leo Breiman, J. H. Friedman, R. A. Olshen, and C. J. Stone. Classification and Regression Trees. Wadsworth, 1984.

Nicol\`o Cesa-Bianchi. Analysis of two gradient-based algorithms for on-line regression. Journal of Computer System Sciences, 59(3):392–411, 1999.

Nicol\`o Cesa-Bianchi and G´abor Lugosi. Potential-based algorithms in online prediction and game theory. In Conference On Learning Theory, pages 48–64, 2001.

Nicol\`o Cesa-Bianchi and Gabor Lugosi. Prediction, Learning, and Games. Cambridge University Press, 2006.

Nicol\`o Cesa-Bianchi, Yoav Freund, David Haussler, David P. Helmbold, Robert E. Schapire, and Manfred K. Warmuth. How to use expert advice. Journal of the ACM, 44(3):427–485, 1997.

Nicol\`o Cesa-Bianchi, Alex Conconi, and Claudio Gentile. On the generalization ability of on-line learning algorithms. In Neural Information Processing Systems, pages 359–366, 2001.

Nicol\`o Cesa-Bianchi, Alex Conconi, and Claudio Gentile. On the generalization ability of on-line learning algorithms. IEEE Transactions on Information Theory, 50(9):2050–2057, 2004.

Nicol\`o Cesa-Bianchi, Yishay Mansour, and Gilles Stoltz. Improved second-order bounds for prediction with expert advice. In Conference On Learning Theory, pages 217–232, 2005.

Parinya Chalermsook, Bundit Laekhanukit, and Danupon Nanongkai. Pre-reduction graph products: Hardnesses of properly learning dfas and approximating edp on dags. In Symposium on Foundations of Computer Science, pages 444–453. IEEE, 2014.

Bernard Chazelle. The Discrepancy Method: Randomness and Complexity. Cambridge University Press, New York, NY, USA, 2000.

Stanley F. Chen and Ronald Rosenfeld. A survey of smoothing techniques for ME models. IEEE Transactions on Speech and Audio Processing, 8(1), 2000.

Herman Chernof. A measure of asymptotic eficiency for tests of a hypothesis based on the sum of observations. The Annals of Mathematical Statistics, 23(4):493–507, 12 1952.

Michael Collins, Robert E. Schapire, and Yoram Singer. Logistic regression, Adaboost and Bregman distances. Machine Learning, 48:253–285, September 2002.

Corinna Cortes and Mehryar Mohri. AUC optimization vs. error rate minimization. In Neural Information Processing Systems, 2003.

Corinna Cortes and Mehryar Mohri. Confidence intervals for the area under the ROC curve. In Neural Information Processing Systems, volume 17, Vancouver, Canada, 2005. MIT Press.

Corinna Cortes and Vladimir Vapnik. Support-vector networks. Machine Learning, 20(3):273–297, 1995.

Corinna Cortes, Patrick Hafner, and Mehryar Mohri. Rational kernels: Theory and algorithms. Journal of Machine Learning Research, 5:1035–1062, 2004.

Corinna Cortes, Leonid Kontorovich, and Mehryar Mohri. Learning languages with rational kernels. In Conference On Learning Theory, volume 4539 of Lecture Notes in Computer Science, pages 349–364. Springer, Heidelberg, Germany, June 2007a.

Corinna Cortes, Mehryar Mohri, and Ashish Rastogi. An alternative ranking problem for search engines. In Workshop on Experimental Algorithms, pages 1–22, 2007b.

Corinna Cortes, Mehryar Mohri, and Jason Weston. A general regression framework for learning string-to-string mappings. In Predicted Structured Data. MIT Press, 2007c.

Corinna Cortes, Mehryar Mohri, Dmitry Pechyony, and Ashish Rastogi. Stability of transductive regression algorithms. In International Conference on Machine Learning, Helsinki, Finland, July 2008a.

Corinna Cortes, Mehryar Mohri, and Afshin Rostamizadeh. Learning sequence kernels. In Proceedings of IEEE International Workshop on Machine Learning for Signal Processing, Canc´un, Mexico, October 2008b.

Corinna Cortes, Yishay Mansour, and Mehryar Mohri. Learning bounds for importance weighting. In Neural Information Processing Systems, Vancouver, Canada, 2010a. MIT Press.

Corinna Cortes, Mehryar Mohri, and Ameet Talwalkar. On the impact of kernel approximation on learning accuracy. In Conference on Artificial Intelligence and Statistics, 2010b.

Corinna Cortes, Spencer Greenberg, and Mehryar Mohri. Relative deviation learning bounds and generalization with unbounded loss functions. ArXiv 1310.5796, October 2013. URL http: //arxiv.org/pdf/1310.5796v4.pdf.

Corinna Cortes, Mehryar Mohri, and Umar Syed. Deep boosting. In International Conference on Machine Learning, pages 1179–1187, 2014.

Corinna Cortes, Vitaly Kuznetsov, Mehryar Mohri, and Umar Syed. Structural Maxent models. In International Conference on Machine Learning, pages 391–399, 2015.

David Cossock and Tong Zhang. Statistical analysis of Bayes optimal subset ranking. IEEE Transactions on Information Theory, 54(11):5140–5154, 2008.

Thomas M. Cover and Joy M. Thomas. Elements of Information Theory. Wiley-Interscience, 2006.

Trevor F. Cox and Michael A. A. Cox. Multidimensional Scaling. Chapman & Hall/CRC, 2nd edition, 2000.

Koby Crammer and Yoram Singer. Improved output coding for classification using continuous relaxation. In Neural Information Processing Systems, 2001.

Koby Crammer and Yoram Singer. On the algorithmic implementation of multiclass kernel-based vector machines. Journal of Machine Learning Research, 2, 2002.

Robert Crites and Andrew Barto. Improving elevator performance using reinforcement learning. In Neural Information Processing Systems, pages 1017–1023. MIT Press, 1996.

Imre Csisz´ar. Information-type measures of diference of probability distributions and indirect observations. Studia Scientiarum Mathematicarum Hungarica, 2:299–318, 1967.

Felipe Cucker and Steve Smale. On the mathematical foundations of learning. Bulletin of the American Mathematical Society, 39(1):1–49, 2001.

J. N. Darroch and D. Ratclif. Generalized iterative scaling for log-linear models. Annals of Mathematical Statistics, pages 1470–1480, 1972.

Sanjoy Dasgupta and Anupam Gupta. An elementary proof of a theorem of Johnson and Lindenstrauss. Random Structures and Algorithms, 22(1):60–65, 2003.

Colin De la Higuera. Grammatical inference: learning automata and grammars. Cambridge University Press, 2010.

Giulia DeSalvo, Mehryar Mohri, and Umar Syed. Learning with deep cascades. In Conference on Algorithmic Learning Theory, pages 254–269, 2015.

Luc Devroye and G´abor Lugosi. Lower bounds in pattern recognition and learning. Pattern Recognition, 28(7):1011–1018, 1995.

Luc Devroye and T. J. Wagner. Distribution-free inequalities for the deleted and holdout error estimates. IEEE Transactions on Information Theory, 25(2):202–207, 1979a.

Luc Devroye and T. J. Wagner. Distribution-free performance bounds for potential function rules. IEEE Transactions on Information Theory, 25(5):601–604, 1979b.

Thomas G. Dietterich. An experimental comparison of three methods for constructing ensembles of decision trees: Bagging, boosting, and randomization. Machine Learning, 40(2):139–157, 2000.

Thomas G. Dietterich and Ghulum Bakiri. Solving multiclass learning problems via errorcorrecting output codes. Journal of Artificial Intelligence Research, 2:263–286, 1995.

Harris Drucker and Corinna Cortes. Boosting decision trees. In Neural Information Processing Systems, pages 479–485, 1995.

Harris Drucker, Robert E. Schapire, and Patrice Simard. Boosting performance in neural networks. International Journal of Pattern Recognition and Artificial Intelligence, 7(4):705–719, 1993.

Miroslav Dud´ık, Steven J. Phillips, and Robert E. Schapire. Maximum entropy density estimation with generalized regularization and an application to species distribution modeling. Journal of Machine Learning Research, 8, 2007.

Richard M. Dudley. The sizes of compact subsets of Hilbert space and continuity of Gaussian processes. Journal of Functional Analysis, 1(3):290–330, 1967.

Richard M. Dudley. A course on empirical processes. Lecture Notes in Mathematics, 1097:2 – 142, 1984.

Richard M. Dudley. Universal Donsker classes and metric entropy. Annals of Probability, 14(4): 1306–1326, 1987.

Richard M. Dudley. Uniform Central Limit Theorems. Cambridge University Press, 1999.

Nigel Dufy and David P. Helmbold. Potential boosters? In Neural Information Processing Systems, pages 258–264, 1999.

Aryeh Dvoretzky. On stochastic approximation. In Proceedings of the Third Berkeley Symposium on Mathematical Statistics and Probability, pages 39–55, 1956.

Cynthia Dwork, Ravi Kumar, Moni Naor, and D. Sivakumar. Rank aggregation methods for the web. In International World Wide Web Conference, pages 613–622, 2001.

Bradley Efron, Trevor Hastie, Iain Johnstone, and Robert Tibshirani. Least angle regression. Annals of Statistics, 32(2):407–499, 2004.

James P. Egan. Signal Detection Theory and ROC Analysis. Academic Press, 1975.

Andrzej Ehrenfeucht, David Haussler, Michael J. Kearns, and Leslie G. Valiant. A general lower bound on the number of examples needed for learning. In Conference On Learning Theory, pages 139–154, 1988.

Jane Elith, Steven J. Phillips, Trevor Hastie, Miroslav Dud´ık, Yung En Chee, and Colin J. Yates. A statistical explanation of MaxEnt for ecologists. Diversity and Distributions, 1, 2011.

Eyal Even-Dar and Yishay Mansour. Learning rates for q-learning. Machine Learning, 5:1–25, 2003.

Dean P. Foster and Rakesh V. Vohra. Calibrated learning and correlated equilibrium. Games and Economic Behavior, 21:40–55, 1997.

Dean P. Foster and Rakesh V. Vohra. Asymptotic calibration. Biometrika, pages 379–390, 1998.

Dean P. Foster and Rakesh V. Vohra. Regret in the on-line decision problem. Games and Economic Behavior, 29(1-2):7–35, 1999.

Yoav Freund. Boosting a weak learning algorithm by majority. In Information and Computation, pages 202–216. Morgan Kaufmann Publishers Inc., 1990.

Yoav Freund. Boosting a weak learning algorithm by majority. Information and Computation, 121:256–285, September 1995.

Yoav Freund and Robert E. Schapire. Game theory, on-line prediction and boosting. In Conference On Learning Theory, pages 325–332, 1996.

Yoav Freund and Robert E. Schapire. A decision-theoretic generalization of on-line learning and an application to boosting. Journal of Computer System Sciences, 55(1):119–139, 1997.

Yoav Freund and Robert E. Schapire. Large margin classification using the perceptron algorithm. Machine Learning, 37:277–296, 1999a.

Yoav Freund and Robert E. Schapire. Adaptive game playing using multiplicative weights. Games and Economic Behavior, 29(1-2):79–103, October 1999b.

Yoav Freund, Michael J. Kearns, Dana Ron, Ronitt Rubinfeld, Robert E. Schapire, and Linda Sellie. efficient learning of typical finite automata from random walks. In Proceedings the ACM Symposium on Theory of Computing, pages 315–324, 1993.

Yoav Freund, Raj D. Iyer, Robert E. Schapire, and Yoram Singer. An efficient boosting algorithm for combining preferences. Journal of Machine Learning Research, 4, 2003.

Jerome H. Friedman. Greedy function approximation: A gradient boosting machine. Annals of Statistics, 29:1189–1232, 2000.

Jerome H. Friedman, Trevor Hastie, and Robert Tibshirani. Additive logistic regression: A statistical view of boosting. Annals of Statistics, 38(2), 2000.

E. Mark Gold. Language identification in the limit. Information and Control, 10(5):447–474, 1967.

E. Mark Gold. Complexity of automaton identification from given data. Information and Control, 37(3):302–320, 1978.

Joshua Goodman. Exponential priors for maximum entropy models. In Proceedings of HLT-NAACL, pages 305–312, 2004.

David M. Green and John A Swets. Signal Detection Theory and Psychophysics. Wiley, 1966.

Michelangelo Grigni, Vincent Mirelli, and Christos H Papadimitriou. On the dificulty of designing good classifiers. SIAM Journal on Computing, 30(1):318–323, 2000.

Adam J. Grove and Dale Schuurmans. Boosting in the limit: Maximizing the margin of learned ensembles. In Proceedings of the Fifteenth National Conference on Artificial Intelligence, pages 692–699, 1998.

Ufe Haagerup. The best constants in the Khintchine inequality. Studia Math, 70(3):231–283, 1982.

Torben Hagerup and Christine R¨ub. A guided tour of chernof bounds. Information Processing Letters, 33(6):305–308, 1990.

Jihun Ham, Daniel D. Lee, Sebastian Mika, and Bernhard Sch¨olkopf. A kernel view of the dimensionality reduction of manifolds. In International Conference on Machine Learning, 2004.

James A. Hanley and Barbara J. McNeil. The meaning and use of the area under a receiver operating characteristic (ROC) curve. Radiology, 143:29–36, 1982.

James Hannan. Approximation to Bayes risk in repeated plays. Contributions to the Theory of Games, 3:97–139, 1957.

Sergiu Hart and Andreu M. Mas-Colell. A simple adaptive procedure leading to correlated equilibrium. Econometrica, 68(5):1127–1150, 2000.

David Haussler. Decision theoretic generalizations of the PAC model for neural net and other learning applications. Information and Computation, 100(1):78–150, 1992.

David Haussler. Sphere packing numbers for subsets of the boolean n-cube with bounded Vapnik-Chervonenkis dimension. Journal of Combinatorial Theory, Series A, 69(2):217 – 232, 1995.

David Haussler. Convolution Kernels on Discrete Structures. Technical Report UCSC-CRL-99-10, University of California at Santa Cruz, 1999.

David Haussler, Nick Littlestone, and Manfred K. Warmuth. Predicting {0,1}-functions on randomly drawn points (extended abstract). In Symposium on Foundations of Computer Science, pages 100–109, 1988.

Ralf Herbrich, Thore Graepel, and Klaus Obermayer. Large margin rank boundaries for ordinal regression. In Advances in Large Margin Classifiers, pages 115–132. MIT Press, Cambridge, MA, 2000.

Wassily Hoefding. Probability inequalities for sums of bounded random variables. Journal of the American Statistical Association, 58(301):13–30, 1963.

Arthur E. Hoerl and Robert W. Kennard. Ridge regression: Biased estimation for nonorthogonal problems. Technometrics, 12(1):55–67, 1970.

Klaus-Uwe H¨ofgen, Hans-Ulrich Simon, and Kevin S. Van Horn. Robust trainability of single neurons. Journal of Computer and Systems Sciences, 50(1):114–125, 1995.

John E. Hopcroft and Jefrey D. Ullman. Introduction to Automata Theory, Languages and Computation. Addison-Wesley, 1979.

Cho-Jui Hsieh, Kai-Wei Chang, Chih-Jen Lin, S. Sathiya Keerthi, and S. Sundararajan. A dual coordinate descent method for large-scale linear SVM. In International Conference on Machine Learning, pages 408–415, 2008.

Tommi Jaakkola, Michael I. Jordan, and Satinder P. Singh. Convergence of stochastic iterative dynamic programming algorithms. Neural Computation, 6:1185–1201, 1994.

Kalervo J¨arvelin and Jaana Kek¨al¨ainen. IR evaluation methods for retrieving highly relevant documents. In ACM Special Interest Group on Information Retrieval, pages 41–48, 2000.

E. T. Jaynes. Information theory and statistical mechanics. Physical Review, 106(4):620–630, 1957.

E. T. Jaynes. Papers on probability, statistics, and statistical physics. Synthese library. D. Reidel Pub. Co., 1983.

Thorsten Joachims. Optimizing search engines using clickthrough data. In Knowledge and Discovery and Data Mining, pages 133–142, 2002.

William B. Johnson and Joram Lindenstrauss. Extensions of Lipschitz mappings into a Hilbert space. Contemporary Mathematics, 26:189––206, 1984.

Jean-Pierre Kahane. Sur les sommes vectorielles P ±u . Comptes Rendus Hebdomadaires des S’eances de l’Acad´emie des Sciences, Paris, 259:2577–2580, 1964.

Adam Kalai and Santosh Vempala. efficient algorithms for online decision problems. In Conference On Learning Theory, pages 26–40, 2003.

William Karush. Minima of Functions of Several Variables with Inequalities as Side Constraints. Master’s thesis, Department of Mathematics, University of Chicago, 1939.

Jun’ichi Kazama and Jun’ichi Tsujii. Evaluation and extension of maximum entropy models with inequality constraints. In Proceedings of EMNLP, pages 137–144, 2003.

Michael J. Kearns and Yishay Mansour. A fast, bottom-up decision tree pruning algorithm with near-optimal generalization. In International Conference on Machine Learning, pages 269–277, 1998.

Michael J. Kearns and Yishay Mansour. On the boosting ability of top-down decision tree learning algorithms. Journal of Computer and System Sciences, 58(1):109–128, 1999.

Michael J. Kearns and Dana Ron. Algorithmic stability and sanity-check bounds for leave-one-out cross-validation. Neural Computation, 11(6):1427–1453, 1999.

Michael J. Kearns and Robert E. Schapire. efficient distribution-free learning of probabilistic concepts (extended abstract). In Symposium on Foundations of Computer Science, pages 382– 391, 1990.

Michael J. Kearns and Leslie G. Valiant. Cryptographic limitations on learning boolean formulae and finite automata. Technical Report 14, Harvard University, 1988.

Michael J. Kearns and Leslie G. Valiant. Cryptographic limitations on learning boolean formulae and finite automata. Journal of ACM, 41(1):67–95, 1994.

Michael J. Kearns and Umesh V. Vazirani. An Introduction to Computational Learning Theory. MIT Press, 1994.

Aleksandr Khintchine. Uber dyadische br¨uche.<sup>¨</sup> Mathematische Zeitschrift, 18(1):109–116, 1923.

Jack Kiefer and Jacob Wolfowitz. Stochastic estimation of the maximum of a regression function. Annals of Mathematical Statistics, 23(1):462–466, 1952.

George Kimeldorf and Grace Wahba. Some results on tchebychefian spline functions. Journal of Mathematical Analysis and Applications, 33(1):82–95, 1971.

Jyrki Kivinen and Manfred K. Warmuth. Boosting as entropy projection. In Conference On Learning Theory, pages 134–144, 1999.

Vladimir Koltchinskii. Rademacher penalties and structural risk minimization. IEEE Transactions on Information Theory, 47(5):1902–1914, 2001.

Vladimir Koltchinskii and Dmitry Panchenko. Rademacher processes and bounding the risk of function learning. In High Dimensional Probability II, pages 443–459. Birkh¨auser, 2000.

Vladmir Koltchinskii and Dmitry Panchenko. Empirical margin distributions and bounding the generalization error of combined classifiers. Annals of Statistics, 30, 2002.

Leonid Kontorovich, Corinna Cortes, and Mehryar Mohri. Learning linearly separable languages. In Algorithmic Learning Theory, pages 288–303, 2006.

Leonid Kontorovich, Corinna Cortes, and Mehryar Mohri. Kernel methods for learning languages. Theoretical Computer Science, 405:223–236, 2008.

Harold W. Kuhn and Albert W. Tucker. Nonlinear programming. In 2nd Berkeley Symposium, pages 481–492, Berkeley, 1951. University of California Press.

Solomon Kullback. A lower bound for discrimination information in terms of variation. IEEE Transactions on Information Theory, 13(1):126–127, 1967.

Solomon Kullback and Richard A. Leibler. On information and suficiency. Ann. Math. Statist., 22(1):79–86, 1951.

Harold Kushner. Stochastic approximation: a survey. Wiley Interdisciplinary Reviews Computational Statistics, 2(1):87–96, 2010.

Harold J. Kushner and D. S. Clark. Stochastic Approximation Methods for Constrained and Unconstrained Systems, volume 26 of Applied Mathematical Sciences. Springer-Verlag, 1978.

Vitaly Kuznetsov, Mehryar Mohri, and Umar Syed. Multi-class deep boosting. In Neural Information Processing Systems, 2014.

John Laferty. Additive models, boosting, and inference for generalized divergences. In Conference On Learning Theory, pages 125–133, 1999.

John D. Laferty, Stephen Della Pietra, and Vincent J. Della Pietra. Statistical learning algorithms based on bregman distances. In Proceedings of the Canadian Workshop on Information Theory, 1997.

John D. Laferty, Andrew McCallum, and Fernando C. N. Pereira. Conditional random fields: Probabilistic models for segmenting and labeling sequence data. In International Conference on Machine Learning, pages 282–289, 2001.

Rafa l Lata la and Krzysztof Oleszkiewicz. On the best constant in the khintchine-kahane inequality. Studia Math, 109(1):101–104, 1994.

Guy Lebanon and John D. Laferty. Boosting and maximum likelihood for exponential models. In Neural Information Processing Systems, pages 447–454, 2001.

Michel Ledoux and Michel Talagrand. Probability in Banach Spaces: Isoperimetry and Processes. Springer, New York, 1991.

Ehud Lehrer. A wide range no-regret theorem. Games and Economic Behavior, 42(1):101–115, 2003.

Nick Littlestone. Learning quickly when irrelevant attributes abound: A new linear-threshold algorithm. Machine Learning, 2(4):285–318, 1987.

Nick Littlestone. From on-line to batch learning. In Conference On Learning Theory, pages 269–284, 1989.

Nick Littlestone and Manfred K. Warmuth. The weighted majority algorithm. In Symposium on Foundations of Computer Science, pages 256–261, 1989.

Nick Littlestone and Manfred K. Warmuth. The weighted majority algorithm. Information and Computation, 108(2):212–261, 1994.

Michael L. Littman. Algorithms for Sequential Decision Making. PhD thesis, Brown University, 1996.

Philip M. Long and Rocco A. Servedio. Random classification noise defeats all convex potential boosters. Machine Learning, 78:287–304, March 2010.

M. Lothaire. Combinatorics on Words. Cambridge University Press, 1982.

M. Lothaire. Mots. Herm\`es, 1990.

M. Lothaire. Applied Combinatorics on Words. Cambridge University Press, 2005.

Robert Malouf. A comparison of algorithms for maximum entropy parameter estimation. In Proceedings of CoNLL-2002, pages 49–55, 2002.

Christopher D. Manning and Dan Klein. Optimization, maxent models, and conditional estimation without magic. In Proceedings of HLT-NAACL, 2003.

Yishay Mansour and David A. McAllester. Boosting with multi-way branching in decision trees. In Neural Information Processing Systems, pages 300–306, 1999.

Yishay Mansour and David A. McAllester. Generalization bounds for decision trees. In Conference On Learning Theory, pages 69–74, 2000.

Llew Mason, Jonathan Baxter, Peter L. Bartlett, and Marcus R. Frean. Boosting algorithms as gradient descent. In Neural Information Processing Systems, pages 512–518, 1999.

Pascal Massart. Some applications of concentration inequalities to statistics. Annales de la Facult´e des Sciences de Toulouse, IX:245–303, 2000.

Peter McCullagh. Regression models for ordinal data. Journal of the Royal Statistical Society B, 42(2), 1980.

Peter McCullagh and John A. Nelder. Generalized Linear Models. Chapman & Hall, 1983.

Colin McDiarmid. On the method of bounded diferences. Surveys in Combinatorics, 141(1): 148–188, 1989.

Ron Meir and Gunnar R¨atsch. Advanced lectures on machine learning, machine learning summer school, canberra, australia. In Machine Learning Summer School, pages 118–183, 2002.

Ron Meir and Gunnar R¨atsch. An Introduction to Boosting and Leveraging, pages 118–183. Springer, 2003.

James Mercer. Functions of positive and negative type, and their connection with the theory of integral equations. Philosophical Transactions of the Royal Society of London. Series A, Containing Papers of a Mathematical or Physical Character, 209(441-458):415, 1909.

Sebastian Mika, Bernhard Scholkopf, Alex J. Smola, Klaus-Robert Muller, Matthias Scholz, and Gunnar Ratsch. Kernel PCA and de-noising in feature spaces. In Neural Information Processing Systems, pages 536–542, 1999.

Marvin Minsky and Seymour Papert. Perceptrons: An Introduction to Computational Geometry. MIT Press, 1969.

Mehryar Mohri. Semiring frameworks and algorithms for shortest-distance problems. Journal of Automata, Languages and Combinatorics, 7(3):321–350, 2002.

Mehryar Mohri. Weighted automata algorithms. In Manfred Droste, Werner Kuich, and Heiko Vogler, editors, Handbook of Weighted Automata, pages 213–254. Springer, 2009.

Mehryar Mohri and Afshin Rostamizadeh. Stability bounds for stationary ϕ-mixing and β-mixing processes. Journal of Machine Learning Research, 11:789–814, 2010.

Mehryar Mohri and Afshin Rostamizadeh. Perceptron mistake bounds. ArXiv 1305.0208, March 2013.

Mehryar Mohri, Fernando Pereira, and Michael D. Riley. Weighted automata in text and speech processing. European Conference on Artificial Intelligence, Workshop on Extended Finite State Models of Language, 2005.

Jorge Nocedal. Updating quasi-newton matrices with limited storage. Mathematics of Computation, 35(151):773–782, 1980.

Albert B.J. Novikof. On convergence proofs on perceptrons. In Proceedings of the Symposium on the Mathematical Theory of Automata, volume 12, pages 615–622, 1962.

Jos´e Oncina, Pedro Garc´ıa, and Enrique Vidal. Learning subsequential transducers for pattern recognition interpretation tasks. IEEE Transactions on Pattern Analysis and Machine Intelligence, 15(5):448–458, 1993.

Karl Pearson. On lines and planes of closest fit to systems of points in space. Philosophical Magazine, 2(6):559–572, 1901.

Fernando C. N. Pereira and Michael D. Riley. Speech recognition by composition of weighted finite automata. In Finite-State Language Processing, pages 431–453. MIT Press, 1997.

Dominique Perrin. Finite automata. In J. Van Leuwen, editor, Handbook of Theoretical Computer Science, Volume B: Formal Models and Semantics, pages 1–57. Elsevier, 1990.

Steven J. Phillips, Miroslav Dud´ık, and Robert E. Schapire. A maximum entropy approach to species distribution modeling. In Proceedings of ICML, 2004.

Steven J. Phillips, Robet P. Anderson, and Robert E. Schapire. Maximum entropy modeling of species geographic distributions. Ecological Modelling, 190:231–259, 2006.

Stephen Della Pietra, Vincent J. Della Pietra, and John D. Laferty. Inducing features of random fields. IEEE Trans. Pattern Anal. Mach. Intell., 19(4), 1997.

Mark Semenovich Pinsker. Information and Information Stability of Random Variables and Processes. Holden-Day, 1964.

Leonard Pitt and Manfred K. Warmuth. The minimum consistent DFA problem cannot be approximated within any polynomial. Journal of the ACM, 40(1):95–142, 1993.

John C. Platt. Fast training of support vector machines using sequential minimal optimization. In Advances in Kernel Methods, pages 185–208. MIT Press, 1999.

David Pollard. Convergence of Stochastic Processess. Springer, 1984.

David Pollard. Asymptotics via empirical processes. Statistical Science, 4(4):341 – 366, 1989.

Martin L. Puterman. Markov Decision Processes: Discrete Stochastic Dynamic Programming. John Wiley & Sons, Inc., 1994.

J. Ross Quinlan. Induction of decision trees. Machine Learning, 1(1):81–106, 1986.

J. Ross Quinlan. C4.5: Programs for Machine Learning. Morgan Kaufmann, 1993.

Ali Rahimi and Benjamin Recht. Random features for large-scale kernel machines. In Neural Information Processing Systems, pages 1177–1184, 2007.

Adwait Ratnaparkhi. Maximum entropy models for natural language processing. In Encyclopedia of Machine Learning, pages 647–651. Springer, 2010.

Gunnar R¨atsch and Manfred K. Warmuth. Maximizing the margin with boosting. In Conference On Learning Theory, pages 334–350, 2002.

Gunnar R¨atsch, Sebastian Mika, and Manfred K. Warmuth. On the convergence of leveraging. In NIPS, pages 487–494, 2001.

Gunnar R¨atsch, Takashi Onoda, and Klaus-Robert M¨uller. Soft margins for AdaBoost. Machine Learning, 42:287–320, March 2001.

Mark D. Reid and Robert C. Williamson. Generalised pinsker inequalities. In 22nd Conference on Learning Theory (COLT 2009), 2009.

Alfr´ed R´enyi. On measures of entropy and information. In Proceedings of the Fourth Berkeley Symposium on Mathematical Statistics and Probability, Volume 1: Contributions to the Theory of Statistics, pages 547–561. University of California Press, 1961.

Ryan Rifkin and Aldebaro Klautau. In defense of one-vs-all classification. Journal of Machine Learning Research, 5:101–141, 2004.

Ryan M. Rifkin. Everything Old Is New Again: A Fresh Look at Historical Approaches in Machine Learning. PhD thesis, Massachusetts Institute of Technology, 2002.

H. Robbins and S. Monro. A stochastic approximation method. Annals of Mathematical Statistics, 22(3):400–407, 1951.

R. Tyrrell Rockafellar. Convex analysis. Princeton University Press, 1997.

W.H. Rogers and T. J. Wagner. A finite sample distribution-free performance bound for local discrimination rules. Annals of Statistics, 6(3):506–514, 1978.

Dana Ron, Yoram Singer, and Naftali Tishby. On the learnability and usage of acyclic probabilistic finite automata. In Journal of Computer and System Sciences, pages 31–40, 1995.

Frank Rosenblatt. The perceptron: A probabilistic model for information storage and organization in the brain. Psychological Review, 65(6):386, 1958.

Ronald Rosenfeld. A maximum entropy approach to adaptive statistical language modelling. Computer Speech & Language, 10(3):187–228, 1996.

Sam T. Roweis and Lawrence K. Saul. Nonlinear dimensionality reduction by locally linear embedding. Science, 290(5500):2323, 2000.

Cynthia Rudin, Ingrid Daubechies, and Robert E. Schapire. The dynamics of AdaBoost: Cyclic behavior and convergence of margins. Journal of Machine Learning Research, 5:1557–1595, 2004.

Cynthia Rudin, Corinna Cortes, Mehryar Mohri, and Robert E. Schapire. Margin-based ranking meets boosting in the middle. In Conference On Learning Theory, 2005.

Walter Rudin. Fourier analysis on groups. Number 12 in Interscience tracts in pure and applied mathematics. John Wiley & Sons, 1990.

I. N. Sanov. On the probability of large deviations of random variables. Matematicheskii Sbornik, 42(84):11–44, 1957.

Norbert Sauer. On the density of families of sets. Journal of Combinatorial Theory, Series A, 13 (1):145–147, 1972.

Craig Saunders, Alexander Gammerman, and Volodya Vovk. Ridge regression learning algorithm in dual variables. In International Conference on Machine Learning, volume 521, 1998.

Robert E. Schapire. The strength of weak learnability. Machine Learning, 5:197–227, July 1990.

Robert E. Schapire. The boosting approach to machine learning: An overview. In Nonlinear Estimation and Classification, pages 149–172. Springer, 2003.

Robert E. Schapire and Yoav Freund. Boosting: Foundations and Algorithms. The MIT Press, 2012.

Robert E. Schapire and Yoram Singer. Improved boosting algorithms using confidence-rated predictions. Machine Learning, 37(3):297–336, 1999.

Robert E. Schapire and Yoram Singer. Boostexter: A boosting-based system for text categorization. Machine Learning, 39(2-3):135–168, 2000.

Robert E. Schapire, Yoav Freund, Peter Bartlett, and Wee Sun Lee. Boosting the margin: A new explanation for the efectiveness of voting methods. In International Conference on Machine Learning, pages 322–330, 1997.

Leopold Schmetterer. Stochastic approximation. In Proceedings of the Fourth Berkeley Symposium on Mathematical Statistics and Probability, pages 587–609, 1960.

Isaac J. Schoenberg. Metric spaces and positive definite functions. Transactions of the American Mathematical Society, 44(3):522–536, 1938.

Bernhard Sch¨olkopf and Alex Smola. Learning with Kernels. MIT Press, 2002.

Bernhard Sch¨olkopf, Ralf Herbrich, Alex J. Smola, and Robert Williamson. A generalized representer theorem. Technical Report 2000-81, Neuro-COLT, 2000.

Shai Shalev-Shwartz, Ohad Shamir, Nathan Srebro, and Karthik Sridharan. Learnability and stability in the general learning setting. In Conference On Learning Theory, 2009.

Claude E. Shannon. A mathematical theory of communication. Bell System Technical Journal, 27:379–423, 1948.

John Shawe-Taylor and Nello Cristianini. Kernel Methods for Pattern Analysis. Cambridge University Press, 2004.

John Shawe-Taylor, Peter L. Bartlett, Robert C. Williamson, and Martin Anthony. Structural risk minimization over data-dependent hierarchies. IEEE Transactions on Information Theory, 44(5):1926–1940, 1998.

Saharon Shelah. A combinatorial problem; stability and order for models and theories in infinitary languages. Pacific Journal of Mathematics, 41(1), 1972.

Satinder P. Singh. Learning to Solve Markovian Decision Processes. PhD thesis, University of Massachusetts, 1993.

Satinder P. Singh and Dimitri Bertsekas. Reinforcement learning for dynamic channel allocation in cellular telephone systems. In Neural Information Processing Systems, pages 974–980. MIT Press, 1997.

Maurice Sion. On general minimax theorems. Pacific Journal of Mathematics, 8(1):171–176, 1958.

Eric V. Slud. Distribution inequalities for the binomial law. Annals of Probability, 5(3):404–412, 1977.

Bharath Sriperumbudur and Zolt´an Szab´o. Optimal rates for random fourier features. In Neural Information Processing Systems, pages 1144–1152, 2015.

Gilles Stoltz and G´abor Lugosi. Internal regret in on-line portfolio selection. In Conference On Learning Theory, pages 403–417, 2003.

Rich Sutton. Temporal Credit Assignment in Reinforcement Learning. PhD thesis, University of Massachusetts, 1984.

Richard S. Sutton and Andrew G. Barto. Reinforcement Learning : An Introduction. MIT Press, 1998.

S.J. Szarek. On the best constants in the Khintchin inequality. Studia Math, 58(2):197–208, 1976.

Csaba Szepesv´ari. Algorithms for Reinforcement Learning. Synthesis Lectures on Artificial Intelligence and Machine Learning. Morgan & Claypool, 2010.

Eiji Takimoto and Manfred K. Warmuth. Path kernels and multiplicative updates. In Conference On Learning Theory, pages 74–89, 2002.

Benjamin Taskar, Carlos Guestrin, and Daphne Koller. Max-margin Markov networks. In Neural Information Processing Systems, 2003.

Robert F. Tate. On a double inequality of the normal distribution. The Annals of Mathematical Statistics, 1:132–134, 1953.

Joshua Tenenbaum, Vin de Silva, and John C. Langford. A global geometric framework for nonlinear dimensionality reduction. Science, 290(5500):2319–2323, 2000.

Gerald Tesauro. Temporal diference learning and TD-gammon. Communications of the ACM, 38:58–68, March 1995.

Robert Tibshirani. Regression shrinkage and selection via the lasso. Journal of the Royal Statistical Society. Series B, 58(1):267–288, 1996.

B. Tomaszewski. Two remarks on the Khintchine-Kahane inequality. In Colloquium Mathematicum, volume 46, 1982.

Boris Trakhtenbrot and Janis M. Barzdin. Finite Automata: Behavior and Synthesis. North Holland, 1973.

John N. Tsitsiklis. Asynchronous stochastic approximation and q-learning. In Machine Learning, volume 16, pages 185–202, 1994.

Ioannis Tsochantaridis, Thorsten Joachims, Thomas Hofmann, and Yasemin Altun. Large margin methods for structured and interdependent output variables. Journal of Machine Learning Research, 6:1453–1484, 2005.

Leslie G. Valiant. A theory of the learnable. Communications of the ACM, 27(11):1134–1142, 1984.

Vladimir N. Vapnik. Statistical Learning Theory. Wiley-Interscience, 1998.

Vladimir N. Vapnik. The Nature of Statistical Learning Theory. Springer-Verlag, 2000.

Vladimir N. Vapnik. Estimation of Dependences Based on Empirical Data. Springer-Verlag, 2006.

Vladimir N. Vapnik and Alexey Chervonenkis. A note on one class of perceptrons. Automation and Remote Control, 25, 1964.

Vladimir N. Vapnik and Alexey Chervonenkis. On the uniform convergence of relative frequencies of events to their probabilities. Theory of Probability and Its Applications, 16:264, 1971.

Vladimir N. Vapnik and Alexey Chervonenkis. Theory of Pattern Recognition. Nauka, 1974.

Santosh S. Vempala. The random projection method. In DIMACS Series in Discrete Mathematics and Theoretical Computer Science, volume 65. American Mathematical Society, 2004.

Pierre Fran¸cois Verhulst. Notice sur la loi que la population suit dans son accroissement. Correspondance math´ematique et physique, 10:113—-121, 1838.

Pierre Fran¸cois Verhulst. Recherches math´ematiques sur la loi d’accroissement de la population. Nouveaux M´emoires de l’Acad´emie Royale des Sciences et Belles-Lettres de Bruxelles, 18:1—-42, 1845.

Mathukumalli Vidyasagar. A Theory of Learning and Generalization: With Applications to Neural Networks and Control Systems. Springer-Verlag, 1997.

Sethu Vijayakumar and Si Wu. Sequential support vector classifiers and regression. International Conference on Soft Computing, 1999.

John von Neumann. Zur Theorie der Gesellschaftsspiele. Mathematische Annalen, 100(1):295–320, 1928.

Vladimir G. Vovk. Aggregating strategies. In Conference On Learning Theory, pages 371–386, 1990.

Grace Wahba. Spline Models for Observational Data, volume 59 of CBMS-NSF Regional Conference Series in Applied Mathematics. Society for Industrial and Applied Mathematics, 1990.

Christopher J. C. H. Watkins. Learning from Delayed Rewards. PhD thesis, Cambridge University, 1989.

Christopher J. C. H. Watkins. Dynamic alignment kernels. Technical Report CSD-TR-98-11, Royal Holloway, University of London, 1999.

Christopher J. C. H. Watkins and Peter Dayan. Q-learning. Machine Learning, 8(3-4):279–292, 1992.

Andr´e Weil. L’int´egration dans les groupes topologiques et ses applications, volume 1145. Hermann Paris, 1965.

Kilian Q. Weinberger and Lawrence K. Saul. An introduction to nonlinear dimensionality reduction by maximum variance unfolding. In Conference on Artificial Intelligence, 2006.

Jason Weston and Chris Watkins. Support vector machines for multi-class pattern recognition. European Symposium on Artificial Neural Networks, 4(6), 1999.

Bernard Widrow and Marcian E. Hof. Adaptive switching circuits. Neurocomputing: Foundations of Research, 1988.

Peter M. Williams. Bayesian regularisation and pruning using a Laplace prior. Neural Computation, 7:117–143, 1994.

Huan Xu, Shie Mannor, and Constantine Caramanis. Sparse algorithms are not stable: A no-freelunch theorem. In Conference on Communication, Control, and Computing, pages 1299–1303, 2008.

Yinyu Ye. The simplex and policy-iteration methods are strongly polynomial for the markov decision problem with a fixed discount rate. Mathematics of Operations Research, 36(4):593–603, 2011.

Tong Zhang. Statistical behavior and consistency of classification methods based on convex risk minimization. Annals of Statistics, 32:56–134, 2003a.

Tong Zhang. Sequential greedy approximation for certain convex optimization problems. IEEE Trans. Inf. Theor., 49(3):682–691, 2003b.

Martin Zinkevich. Online convex programming and generalized infinitesimal gradient ascent. In International Conference on Machine Learning, pages 928–936, 2003.

## Index

L<sub>1</sub>-geometric margin, see margin L<sub>1</sub>-margin, see margin L -regularized AdaBoost, 165 logistic regression, 325 β-contracting, 388 β-stable, 334, 338, 340–342 uniformly, 334 $\epsilon$-greedy policy, 401 $\epsilon$-insensitive loss, 282 $\epsilon$-transition, 361 γ-fat-dimension, 274, see fat-shattering dimension γ-shattered, 274, see fat-shattered log-linear model, 321, 326 ρ-margin loss function, see margin σ-admissible, 337, 338, 340–342 σ-algebra, 429 k-CNF formula, 18, 19 k-deterministic, 377 k-reversible, 377 k-term DNF formula, 18 n-fold cross-validation, 71 n-way composition, 128, 136 pth-moment, 434

absolutely continuous, 429 accepted, 28, 361 accepting path, 123, 361 access string, 364–368 accuracy, 8, 11, 17, 23, 46, 148–150, 154, 167, 169, 172, 244, 283 pairwise ranking, 245, 255, 256

action, 7, 163, 164, 183, 205, 240, 379–383, 387–390, 393, 398, 399, 401–404 greedy, 401, 402 policy, see policy random, 401 active learning, 7, 362 acyclic, 361 AdaBoost, 145 L -regularized, 165 AdaBoost’s weak learning condition, 162 AdaBoost.MH, 222, 223, 236, 237 AdaBoost.MR, 222, 236, 238 adaptive boosting, 150 adversarial, 177, 178, 180, 204, 260 argument, 180 assumption, 178 choice, 260 scenario, 177 advice, 178 Affine, 421 agent, 379 aggregated algorithms, 213, 221 algebraic transductions, 127 algorithm dependent, 333 deterministic, 183, 258–260, 264 learning, 1, 4–6, 9, 19, 20, 23, 24, 27, 43, 46, 47, 55, 57, 71, 80, 85, 98, 146, 148, 150, 168, 173, 179, 186, 202, 252, 257, 333, 334, 343, 362 of-policy, 401, 402 on-policy, 402 randomized, 186, 209, 239, 259, 260, 264 algorithmic stability, see stability

approximately correct, 11 approximation error, 61–64 area under the curve, see AUC AUC, 239, 255, 256, 264, 265 automaton k-reversible, 377 deterministic, 360, see also DFA, 361, 362 finite, 125, 129, 130, 360, 361, 370, 375, 377 learning, 359 prefix-tree, 370, 371, 373 reverse deterministic, 374 reversible, 370, 371, 373, 374 average noise, 23 precision, 263 regret, 186 Azuma’s inequality, 202, 442, 445

base classifier set, 146 classifiers, 146 rankers, 244 Bayes classifier, 22, 47, 61, 74, 75, 78, 140 error, 22, 23, 28, 61, 67, 259 formula, 431 hypothesis, 22 scoring function, 74 Bellman equations, 385–387, 389, 390, 392 Bennett’s inequality, 447 Bernstein’s inequality, 438, 440, 447 bias, 46, 71, 296, 446, 450 bigram, 128, 129 gappy, 128, 129 kernel, 128, 129 binary classification, 9 classifier, 79 decision tree, 224 entropy, 450 entropy function, 449 space partition (BSP) trees, 225 binomial distribution, 430, 440, 448

bipartite ranking, 251 Boltzmann exploration, 401 boosted, 168 boosting, 145–149, 152, 154, 155, 159, 160, 163, 165, 167–172, 174, 175, 221–224, 236, 237, 239, 244–246, 251, 291, 298, 320, 330 by filtering, 168 by majority, 168 multi-class, 213, see also AdaBoost.MH, see also AdaBoost.MR, 237 round, 147, 148, 171 trees, 291 Bregman divergence, 169, 295, 307, 313, 331, 337, 453–456 generalized, 337, 338 calibration problem, 229, 230 categorical question, 224 Cauchy-Schwarz inequality, 53, 97, 98, 112, 118, 197, 309, 310, 339, 341, 409, 410, 433 chain rule, 431 Chebyshev’s inequality, 433, 447 Chernof bound, 28, 45 bounding technique, 437, 438 multiplicative bounds, 439, 445 chi-squared distribution, 430 Cholesky decomposition, 115, 413 partial, 280, 285 classification, 3, 259 binary, 4, 33, 34, 61, 74, 79, 102, 159, 173, 213, 228–231, 239, 244, 252, 257, 264, 271, 281, 325, 330, 331 document, 2, 3, 106, 215 image, 3, 140 linear, 79, 105, 177, 190, 198 multi-class, xiii, 168, 213–215, 217, 219–222, 224, 225, 228, 229, 232, 233, 235–237, 264, 315, 321, 331 text, 3 classifier, 38, 67, 146–149, 153, 159, 164, 169, 172, 173, 214, 223, 230–232, 239, 255, 273 base, 146–148, 151, 160, 162, 163, 167, 169, 170, 175, 224

binary, 74, 229–232, 259, 265 linear, 80

clique, 234

closed, 422

clustering, 3, 117, 224

co-accessible, 125 code binary, 232 word, 231, 232

complementarity conditions, 83, 90, 282, 421

complete metric space, 388

composition, 123 constraint equality, 102, 420 qualification, 420 qualification strong, 421 qualification weak, 421

concave, 84, 91, 118, 226, 278, 304, 416–418, 420, 449, 451, 452, 456 function, 84, 118, 416, 449, 452 problem, 420

context-free grammars, 363

concentration inequality, xiv, 437, 445

function of Legendre type, 454

concept, 1, 3, 9–19, 24–27, 29, 36, 41, 54–57, 145, 179, 180, 347, 348, 361–364, 369, 377 class, 10–12, 14, 16–19, 24–27, 29, 54, 55, 57, 145, 179, 362, 363, 377 class universal, 17

conditional maximum entropy models, 315 probability, 431 relative entropy, 316, 319, 331, 452

Conditional Random Fields, see CRFs

confidence, 17, 27, 28, 57, 92, 93, 95, 97, 148, 155, 157, 159, 215, 229, 231, 232, 241, 264, 315

conjugate, 157, 201, 300, 304, 307, 308, 313, 328, 329, 410, 423, 424, 426, 427, 454 function, 300, 304, 307, 308, 328, 329, 423, 424, 427

consistent, 7–9, 15–17, 19–21, 24, 27, 55, 57, 163, 172, 179, 362–364, 375 algorithm, 16, 17 case, 20, 21 DFA, 362, 363, 375 hypothesis, 15–17, 172 pairwise, 257 constrained optimization problem, 420

hull, 37, 38, 157, 191, 250, 416 convex, 415, 417 combination, 157–159, 222 diferentiable functions, 421 function, 73, 151, 152, 165, 235, 237, 255, 275, 307, 337, 415–419, 422, 423, 455

margin, 92, see margin, 95, 97, 155, 157, 159

set, 299, 300, 317, 318, 416–419, 454sets, 415

strictly, 82, 299, 307, 317, 417, 454, 455

convexity, 47, 75, 77, 88, 107, 188, 191, 203, 210, 211, 237, 277, 310, 416, 418–420, 422, 423, 437, 439, 443, 444, 451, 455, 456

core, 423

covariance, 348, 349, 353, 356, 433 matrix, 348, 349, 353, 356, 434

covering, 49, 58, 59, 133, 134, 263 number, 49, 58, 134, 263

CRFs, 235, 237

cross-validation, 68–73, 99, 102, 103, 166, 167, 285, 323, 324 n-fold, 70–73, 88, 228 error, 71, 102

data set, 102, 109, 139, 161, 255, 347, 348, 357, 379 test, 5, 6 training, 5, 6, 21, 24, 25, 71, 72, 87, 88, 93, 101, 102, 170, 176, 228, 229 unseen, 8

validation, 4 DCG, 263, 264 normalized, 263 decision epochs, 381 stump, 154 tree, 154, 155, 168, 169, 213, 221, 224, 225, 227, 228, 236, 291, 298, 365, 366, 368, 376 tree binary, 238, 365 DeepBoost, 169 degrees of freedom, 430 deterministic, 22, 361, 381 determinization, 361 DFA, 361, 362, 364–366, 368–370, 375–377 consistent, 362, 363, 375 equivalent, 361 minimal, 361, 362, 364, 376 dichotomy, 34, 36, 37, 50 diferentiable function, 170, 337, 415, 417, 453, 454 dimensionality reduction, 3, 6, 117, 347, 348, 351, 354, 356 discounted cumulative gain, see DCG distinguishing strings, 364 distribution, 430 -free model, 11 binomial, 430, 440, 448 chi-squared, 430 Gaussian, 303 Gibbs, 295, 299, 300, 306, 312, 317, 430 Laplace, 430 normal, 330, 355, 358, 430, 434, 443, 46 Poisson, 430 probability, 22, 131, 140, 397, 403, 429, 431, 453 divergence Bregman, 169, 295, 307, 313, 331, 337, 453–456 Bregman generalized, 337, 338 Kullback-Leibler, 344, 450, 456 R´enyi, 456 DNF formula, 17 doubling trick, 185, 189, 204, 205 dual, 420 Langrange function, 420

norm, 158, 287, 301, 308, 324, 327, 410 optimization, 83–85, 89–91, 99, 103, 116, 142, 194, 222, 237, 278, 279, 284, 292, 295, 302, 315, 318, 319 optimization problem, 420 problem, 84, 91, 278, 279, 282, 284, 299, 300, 302, 307, 313, 317, 318, 320, 331, 420, 425 variables, 83, 86, 90, 292, 293 duality Fenchel, 300, 307, 328, 426 gap, 420 strong, 84, 420, 425, 426 weak, 425

early stopping, 165, 167, 170 edge, 149, 246 eigenvalue, 411, 413, 418 emphasis function, 262 empirical error, 10 kernel map, 113, 114 kernel maps, 112 Rademacher complexity, 30 risk, 10 risk minimization, see risk minimization empty string, 122, 360 ensemble algorithms, 145 hypotheses, 155 methods, 145, 155, 165, 250, 251 entropy, 168, 169, 199, 201, 226, 227, 295, 296, 298, 299, 302, 306–308, 312, 317, 330, 331, 344, 345, 438, 439, 449–454, 456, 457, 477, 482 binary, 450 binary function, 449 conditional relative, 319, 331 maximum, 295 maximum conditional, 315 R´enyi, 456 regularized, 344 relative, 450 relative conditional, 316, 452 unnormalized relative, 453 envelope, 290

environment, 1, 7, 379–381, 387, 393, 397, 403, 404 model, 379, 380, 387, 393, 397 unknown, 403 epigraph, 416 equivalence queries, 363 equivalent, 409 Erd¨os, 43 ERM, see risk minimization error, 10 empirical, 10, 19–21, 57, 59, 65, 67, 88, 145, 148–151, 154, 168, 171, 172, 175, 211, 214, 227, 236, 241, 246–248, 252, 269, 270, 273, 275, 276, 286, 294, 334, 336 estimation, 61–64, 67, 73 excess, 64, 65, 67, 74, 76–78 generalization, 10, 11, 16, 19–22, 24, 26, 43, 59, 65, 66, 69, 70, 79, 86, 87, 95, 97–99, 140, 155, 161, 166, 172, 178, 201, 202, 204, 212, 214, 217, 230, 238, 241–243, 252, 268, 276, 323, 334, 336, 342 leave-one-out, 72, 85, 86, 193, 194, 293, 294, 342 mean squared, 228, 275, 277, 289 reconstruction, 353 test, 6, 155 training, 65, 155, 174 true, 20 error-correcting output codes (ECOC), 231 estimation error, 61 events, 140 set, 429 examples, 4 labeled, 5–7, 59, 71, 170, 223, 364 misclassified, 171 negative, 23 positive, 16, 17, 227, 369, 376 excess error, 61 expectation, 431 linearity, 86, 133, 336, 432 expected loss, 163 experience, 1 expert advice, 27, 177–179

algorithm, 205 best, 7, 178, 181–183, 205 exploration versus exploitation, 7 exponential inequality, 448

false negative, 12 positive, 12, 103, 143, 256 positive rate, 256 fat-shattered, 274 fat-shattering, 290 dimension, 274 feature, 4 extraction, 347 function, 430 mapping, 112–114, 117–119, 137, 139, 219, 220, 243, 244, 275, 276, 281, 283, 284, 297, 315, 347, 350 missing, 228 space, 92, 97–99, 104, 106, 107, 112, 130, 131, 139, 140, 167, 224, 243, 276, 280, 289, 376, 459 vector, 156, 225, 234, 279, 280, 300, 320, 321, 327, 350 Fenchel conjugate, 423 duality theorem, 300, 307, 328, 426 problems, 425 Fermat’s theorem, 415 final state, 123, 125, 360, 361, 364, 366, 370–372, 374, 398 weight, 122–124 finite, 381 horizon, 381 query subset, 257 fixed point, 230, 388, 394, 397, 401 Frobenius norm, 412 product, 412 Fubini’s theorem, 44, 432 function Affine, 151, 275, 455 measurable, 22, 28, 273 symmetric, 107, 262

game zero-sum, 163, 164, 204 gap penalty, 128 Gaussian, 430 distribution, 303 kernel, 110 generalization bound, 14, 15, 21, 35, 43, 58, 59, 93, 94, 97, 159, 217, 220, 235, 236, 243, 268, 272, 273, 280, 283, 284, 287, 288, 293, 331, 333, 341, 343 error, 10 geometric margin L -, 157, 161 Gibbs distribution, 295, 299, 300, 306, 312, 317, 430 gradient, 415 descent, 191, 192, 207, 289, 291, 294, 304, 313, 320, 327, 404 Gram matrix, 84, 108, 139 graph acyclic, 55 Laplacian, 352, 357 neighborhood, 352, 353 structure, 235 graphical model, 234 group Lasso, see Lasso norm, 412 growth function, 29, 34–36, 40–42, 50, 56, 63, 333 H¨older’s inequality, 166, 210, 301, 303, 322, 329, 411 Halving algorithm, 179, 181, 183 Hamming distance, 214, 231, 232, 234, 444 Hessian 82 84 210. 313 415 417 Hilbert space, 73, 105, 107, 108, 110, 112, 113, 121, 138, 139, 141, 142, 410, 422, 423, 425, 444, 454 pre-, 112 reproducing kernel, 110–112, 117, 336, 350 hinge loss, 88, 89, 99, 174, 207, 341–343 quadratic, 89, 343

Hoefding’s inequality, 19, 27, 59, 69, 134, 203, 268, 269, 437–439, 441, 443, 445, 447 lemma, 188, 201, 306, 441, 445 horizon finite, 382 infinite, 382, 385 Huber loss, 284 hyperparameters, 4, 5 hyperplane marginal, 81, 83, 87, 90, 91 maximum-margin, 80, 81, 83, 197 optimal, 100 hypothesis base, 151, 152, 155–157, 173, 174, 211, 255 linear, 64, 97, 98, 155, 265, 277 set, 5, 7, 10 set finite, 15, 20, 21, 25, 27, 53, 180, 268 single, 19

i.i.d., 10, 11, 15, 20, 32, 193, 194, 252, 296, 334–336, 404, 431, 480 impurity Gini index, 226 misclassification, 226 inconsistent, 9 case, 19, 27, 269 independent and identically distributed (i.i.d.), 431 inequality Azuma’s, 202, 442, 445 Bennett’s, 447 Bernstein’s, 438, 440, 447 Cauchy-Schwarz, 53, 97, 98, 112, 118, 197, 309, 310, 339, 341, 409, 410, 433 Chebyshev’s, 433, 447 concentration, xiv, 437, 445 exponential, 448 H¨older’s, 166, 210, 301, 303, 322, 329, 411 Hoefding’s, 19, 27, 59, 69, 134, 203, 268, 269, 437–439, 441, 443, 445, 447 Jensen’s, 51–53, 77, 97, 104, 118, 133, 134, 188, 311, 318, 327, 443, 444, 450, 451

Khintchine-Kahane, 118, 186, 445 Log-sum, 451, 452 Markov’s, 134, 354, 432, 433, 437 maximal, 324 McDiarmid’s, 29, 31, 32, 139, 310, 335, 442, 443, 445 Pinsker’s, 302, 318, 344, 439, 456 Slud’s, 440 Young’s, 410 information theory, xiv, 23, 407, 449, 450, 456 initial state, 381 input space, 9, 22, 30, 33, 52, 56, 79, 105–109, 112, 121, 130, 139, 173, 197, 213, 240, 267, 275, 285, 351, 449 instances, 9 inverse generalized, 412 Isomap, 351, 352, 356 iterative scaling generalized, 313

Jensen’s inequality, 51–53, 77, 97, 104, 118, 133, 134, 188, 311, 318, 327, 443, 444, 450, 451 Johnson-Lindenstrauss lemma, 348, 354, 356 joint probability mass function, 429

kernel, 105, 106 approximate feature maps, 131 bigram, 128, 129 bigram sequence, 129 continuous, 131, 142 convolution, 136 diference, 138 empirical map, 112, 113 functions, 107, 130–132, 135, 137, 138, 222, 343, 350 gappy bigram, 129 Gaussian, 110, 113, 116 map empirical, 114 matrix, 108, 113–116, 118, 128, 143, 244, 270, 278, 280, 282, 284, 285, 293, 343, 344, 350, 352–354, 357 methods, xiv, 85, 105, 106, 130, 136, 351

negative definite symmetric, 105, 119, 121, 141 normalized, 112, 113, 116, 137, 285 PCA, 347, 349–354, 356, 357 polynomial, 108, 109, 131, 139 positive definite, 108 positive definite symmetric, 110–119, 121, 137–140, 197, 199, 219, 220, 233, 243, 276, 281–284, 289, 293, 336, 338, 350 positive semidefinite, 108 rational, 105, 122, 127, 142 ridge regression, 267, 275–277, 292, 294, 333, 343 sequence, 121, 129 shift-invariant, 131 sigmoid, 110 Khintchine-Kahane inequality, 118, 186, 445 KKT conditions, 83, 89, 221, 278, 282, 284, 421 KPCA, 347, 349–354, 356, 357 Kullback-Leibler divergence, 344, 450, 456

labels, 4, 9

Lagrange, 83, 89, 90, 99, 101, 102, 166, 304, 313, 324, 420 dual function, see dual function, 420 multipliers, 101, 102 variables, 83, 89, 90 Lagrangian, 83, 89, 90, 221, 278, 282, 284, 420–422 Laplace distribution, 430 Laplacian eigenmaps, 351, 352, 357 Lasso, 267, 275, 285–288, 290, 291, 293, 294, 343 group, 289 on-line, 294 law of large numbers, 394 learner strong, 146 weak, 145, 146 learning active, 7, 362 algorithm, 1, 4–6, 9, 19, 20, 23, 24, 27, 43, 46, 47, 55, 57, 71, 80, 85, 98, 146,

148, 150, 168, 173, 179, 186, 202, 252, 257, 333, 334, 343, 362 algorithm PAC, 12, 16, 26–28, 146 algorithm weak, 146, 244 on-line, 7, 177 passive, 7 policy, 401 problem, 380 reinforcement, 7, 379 with queries, 363 leave-one-out cross-validation, 71 error, 85 lemma Hoefding’s, 188, 201, 306, 441, 445 Johnson-Lindenstrauss, 348, 354, 356 Massart’s, 35, 51, 287 Sauer’s, 40–43, 49, 50, 55 Talagrand’s, 52, 216, 217, 242 linear -ly separable labeling, 50 algebra, 409 classification problem, 79 classifiers, 79 Lipschitz function, 52, 93 LLE, 353, 354, 356, 357 locally linear embedding, see LLE Log-sum inequality, 451, 452 logistic, 330 form, 326 loss, 153 multinomial regression, 315 regression, 153, 315, 325 logistic regression L -regularized, 325 loss €-insensitive. 282 convex, 77, 153, 250, 284 function, 268 hinge, 88, 89, 99, 174, 207, 341–343 Huber, 284 logistic, 153 margin, 92 matrix, 163 quadratic $\epsilon$-insensitive, 283 quadratic hinge, 88, 89, 343

squared, 268 loss function, 4 manifold learning, 3 margin $L_{1^{-}}, 156$ L -geometric, 156 confidence, 92 geometric, 80 hard, 88 loss function, 92 soft, 88 Markov decision process, see MDP Markov’s inequality, 134, 354, 432, 433, 437 martingale diferences, 441 Massart’s lemma, 35, 51, 287 Maxent conditional, 316 conditional models, 315 conditional principle, 316 conditional structural models, 330 models, 295, 298, 299, 306, 307, 312, 315–317, 319–321, 325–327, 330–332 principle, 298, 299, 302, 306, 312, 315, 316, 319, 330 structural models, 312 unregularized, 298 unregularized conditional, 316 maximal inequality, 324 maximum a posteriori, 297 maximum entropy models, 295 maximum likelihood principle, 296 McDiarmid’s inequality, 29, 31, 32, 139, 310, 335, 442, 443, 445 MDP, 380, 381, 383, 385, 389–391, 393 finite, 382, 385–387, 399 partially observable, 403 mean squared error, 268 measurable, 429 membership queries, 363 Mercer’s condition, 107, 142 minimization, 361 mistake bound, 179

bound model, 179 model, 178 mixed strategy, 163 model -based, 393 -free approach, 393 selection, 61, 71 model selection, 61 moment-generating function, 354, 434, 445 mono-label case, 213 Moore-Penrose pseudo-inverse, 412 multi-class classification, xiii, 168, 213–215, 217, 219–222, 224, 225, 228, 229, 232, 233, 235–237, 264, 315, 321, 331 multi-label case, 213 mutual information, 453

NFA, 361 node impurity, 226 noise, 23 non-realizable, 29 non-stationary policy, 382 norm, 409 dual, 158, 287, 301, 308, 324, 327, 410 Frobenius, 412 matrix, 411 operator induced, 411 spectral, 411 normal, 430 distribution, 330, 355, 358, 430, 434, 443, 460 normalization, 110 normalized discounted cumulative gain, see DCG normalized Occam’s razor principle, 23, 43, 79, 269, 362 of-policy algorithm, 401 on-line learning, 7, 177 on-policy algorithm, 402 one-versus-all, 229–232, 236 one-versus-one, 229–232, 238 orthogonal projection, 412 outlier, 87, 168

OVA, see one-versus-all OVO, see one-versus-one

PAC, 11 agnostic learning, 22, 48, 61 learnable, 11 learnable with membership queries, 363 learning, 12, 14, 16–19, 22, 23, 26–28, 45, 57, 145, 146, 343, 361, 363, 364, 376 learning algorithm, 11, 12, 16, 26–28, 146 learning framework, 9 weakly learnable, 145 packing numbers, 49 pairwise consistent, 257 independence, 258 parallelogram identity, 457 part-of-speech tagging, 233 partition function, 300, 430 passive, 362 learning, 7 PCA, 347–351, 356–358 penalized risk estimate, 211 Perceptron algorithm, 100, 190–193, 196–199, 201, 206–208, 265 dual, 197 kernel, 197, 206, 212 update, 207 voted, 193, 197 Pinsker’s inequality, 302, 318, 344, 439, 456 pivot, 261 planning, 379, 387 pointwise maximum, 418 supremum, 418 Poisson distribution, 430 policy, 379–381, 390, 393 iteration algorithm, 390 value, 379 POMDP, see MDP partially observable positive, 12 definite, 105, 108, 412 definite symmetric, 107, 108 semidefinite, 108, 412

precision, 263 preference -based setting, 240, 257 function, 240, 257 prefix-tree automaton, 370 primal problem, 420 principal component analysis, see PCA prior knowledge, 5 probability, 27 probabilistic method, 43 probability, 11 density function, 429 distribution, 429 mass function, 429 space, 429 probably approximately correct, see PAC probit model, 330 proper, 422 pseudo-dimension, 267, 272 pure strategies, 163

Q-learning algorithm, 393, 394, 398, 399 QP, 82, 84, 100, 101, 230, 235, 282, 288 convex, 82, 91, 282–284 quadratic $\epsilon$-insensitive loss, 283 hinge loss, 88 programming, 82 SVR, 283 QuickSort algorithm, 261 randomized, 260

R´enyi divergence, 456 entropy, 456 Rademacher complexity, 29–36, 43, 48, 50–53, 63, 68, 79, 97, 100, 118, 157–159, 169, 213, 219, 220, 236, 239, 241, 243, 251, 263, 267, 269, 270, 274, 275, 287, 298, 316, 333, 460 bound, 43, 287, 298, 316 empirical, 29–31, 33, 34, 49, 51–53, 93, 97, 117, 118, 143, 157, 216, 250, 271, 277, 283, 287, 323, 324, 327, 443

generalization bound, 158 local, 48 Rademacher variables, 30, 32, 51, 118, 186, 219, 443 radial basis function, 110 Radon’s theorem, 38 random variable, 429 Randomized-Weighted-Majority algorithm, 184, 186, 209 RankBoost, 236–239, 244–255, 264, 265 ranking, 3, 239, 259 RankPerceptron, 265 rational, 126 Rayleigh quotient, 349, 413 RBF, see radial basis function realizable, 29 recall, 263 reconstruction error, 348 regression, 3, 228, 267 kernel, 267, 275, 276 linear, 267, 275 ordinal, 264 support vector, 267, 275, 281 regret, 7, 178, 258 external, 178, 205 internal, 205 swap, 205 regular expressions, 361 languages, 361 regularization -based algorithm, 72 parameter, 73 path, 288 term, 73 reinforcement learning, 7, 379 relative entropy, 450 representer theorem, 117 reproducing property, 111 reversible, 370 languages, 370 reward, 379 probability, 381 risk, 10 risk minimization empirical, 34, 62–65, 67, 68, 70, 73, 236

structural, 64 voted, 78 RKHS, see Hilbert space ROC curve, 239, see also AUC, 255, 256, 264 RWM algorithm, see Randomized-Weighted-Majority algorithm

approximation, 394 assumption, 361, 362 scenario, 21 subgradient descent, 191 structural risk minimization, see risk minimization structured output, 233 stumps, 154 subdiferential, 337, 422 subgradient, 337, 422 submultiplicative property, 411 supervised learning, 6 support vector, 83, 90, 193 support vector machines, see SVM support vector networks, see SVM SVD, see singular value decomposition SVM, 79–84, 86, 90, 91, 100, 101, 103, 105, 116, 130, 143, 156, 162, 170, 194, 196, 207, 222, 243, 281 multi-class, 221, 236 SVMStruct, 235 SVR, 275, 281–285, 289, 291–293, 333, 337, 339–341 dual, 291 on-line, 291 quadratic, 284, 294 symmetric, 411 positive semidefinite, 108, 110, 114, 115, 128, 279, 357, 412, 413 Talagrand’s lemma, 52, 216, 217, 242 tensor product, 114 test sample, 4 theorem Fenchel duality, 300, 307, 328, 426 Fermat’s, 415 Fubini’s, 44, 432 Radon’s, 38 representer, 117 Sanov’s, 439 trace, 411 training sample, 4 transducer weighted, 122 transductive inference, 6

transition, 360 probability, 381 transpose, 411 trigrams, 106 true positive rate, 256 uncentered, 356 uncombined algorithms, 213, 221 uncorrelated, 433 uniform convergence bound, 15 unnormalized relative entropy, 453 unstable, 228 unsupervised learning, 6 update rule, 401 validation sample, 4 validation set, 68 value, 382 iteration algorithm, 387 variance, 432 VC-dimension, 29, 36–40, 42, 43, 45, 46, 48–51, 53–57, 63, 68, 77, 79, 91, 98, 100, 103, 104, 145, 154, 155, 158, 167, 168, 170, 172, 179, 238, 243, 263, 267, 271–273, 290, 333, 376, 377 generalization bound, 57 visualization, 347 voted risk minimization, see risk minimization weight, 181 function, 262 Weighted-Majority algorithm, 181, 183, 184, 186, 198, 205 Widrow-Hof algorithm, 289, 290 on-line, 291 Winnow algorithm, 198, 199, 206 update, 198 witness, 271 WM algorithm, see Weighted-Majority algorithm Young’s inequality, 410 zero-sum game, 163

Adaptive Computation and Machine Learning

Francis Bach, Editor

Bioinformatics: The Machine Learning Approach, Pierre Baldi and Søren Brunak

Reinforcement Learning: An Introduction, Richard S. Sutton and Andrew G. Barto

Graphical Models for Machine Learning and Digital Communication, Brendan J. Frey

Learning in Graphical Models, Michael I. Jordan

Causation, Prediction, and Search, second edition, Peter Spirtes, Clark Glymour, and Richard

Principles of Data Mining, David Hand, Heikki Mannila, and Padhraic Smyth

Bioinformatics: The Machine Learning Approach, second edition, Pierre Baldi and Soren Brunak

Learning Kernel Classifiers: Theory and Algorithms, Ralf Herbrich

Learning with Kernels: Support Vector Machines, Regularization, Optimization, and Beyond, Bernhard Sch¨olkopf and Alexander J. Smola

Introduction to Machine Learning, Ethem Alpaydin

Gaussian Processes for Machine Learning, Carl Edward Rasmussen and Christopher K.I. Williams

Semi-Supervised Learning, Olivier Chapelle, Bernhard Sch¨olkopf, and Alexander Zien, Eds.

The Minimum Description Length Principle, Peter D. Gr¨unwald

Introduction to Statistical Relational Learning, Lise Getoor and Ben Taskar, Eds.

Probabilistic Graphical Models: Principles and Techniques, Daphne Koller and Nir Friedman

Introduction to Machine Learning, second edition, Ethem Alpaydin

Machine Learning in Non-Stationary Environments: Introduction to Covariate Shift Adaptation, Masashi Sugiyama and Motoaki Kawanabe

Boosting: Foundations and Algorithms, Robert E. Schapire and Yoav Freund

Machine Learning: A Probabilistic Perspective, Kevin P. Murphy

Foundations of Machine Learning, Mehryar Mohri, Afshin Rostamizadeh, and Ameet Talwalkar

Introduction to Machine Learning, third edition, Ethem Alpaydin

Deep Learning, Ian Goodfellow, Yoshua Bengio, and Aaron Courville

Elements of Causal Inference, Jonas Peters, Dominik Janzing, and Bernhard Sch¨olkopf

Machine Learning for Data Streams, with Practical Examples in MOA, Albert Bifet, Ricard Gavald\`a, Geofrey Holmes, Bernhard Pfahringer

Foundations of Machine Learning, second edition, Mehryar Mohri, Afshin Rostamizadeh, and Ameet Talwalkar

