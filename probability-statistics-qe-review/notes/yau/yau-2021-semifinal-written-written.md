# 2021 丘赛 半决赛笔试 written

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2021-semifinal-written-written.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2021-semifinal-written-written/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Probability and Statistics

Solve every problem.

## Part I: Probability

## 题 1

^yau-2021-semifinal-written-written-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s1)。

Suppose that a sequence $\{X_{n}\}$ of real-valued random variables converges to X in distribution and there are positive constants r and C such that $\mathbb{E} | X_{n} |^{r} \leq C$ for all n. Show that

$$
\lim_{n \to \infty} \mathbb{E} | X_{n} |^{s} = \mathbb{E} | X |^{s}
$$

for all $0 < s < r.$

## 题 2

^yau-2021-semifinal-written-written-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s2)。

Let $p(x, y)$ be the (one-step) transition function of a Markov chain on a discrete state space S and $p_{n}(x, y)$ be the n-step transition function. Show that for any positive integers L and N and any two states x and y we have

$$
\sum_{n = L}^{N + L} p_{n}(x, y) \leq \sum_{n = 0}^{N} p_{n}(y, y).
$$

## 题 3

^yau-2021-semifinal-written-written-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s3)。

Let $\{X_{n}\}$ be an independent, identically distributed sequence of random variables with the symmetric Bernoulli distribution

$$
\mathbb{P} \left\{X = 1 \right\} = \mathbb{P} \left\{X = - 1 \right\} = \frac{1}{2}.
$$

Let $S_{n} = \sum_{i = 1}^{N} X_{i}$ be the partial sum. Show that for all $\begin{array}{r}{\alpha > \frac{1}{2}.} \end{array}$

$$
\mathbb{P} \left\{\lim_{n \to \infty} \frac{S_{n}}{n^{\alpha}} = 0 \right\} = 1.
$$

## 题 4

^yau-2021-semifinal-written-written-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s4)。

Let $X^{n} = \left\{X_{ij} \right\}$ be an $n \times n$ random matrix whose entries are independent and identically distributed random variables with the symmetric Bernoulli distribution

$$
\mathbb{P} \left\{X = 0 \right\} = \mathbb{P} \left\{X = 1 \right\} = \frac{1}{2}.
$$

Let $p_{n} = \mathbb{P} \left\{\det X_{N} \right.$ is odd}. Show that $\operatorname{lim}_{n \to \infty} p_{n} > 0.$ .

## Part II: Statistics

## 题 5

^yau-2021-semifinal-written-written-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s5)。

You have been asked to help design a randomized trial of a new drug, call it drug A, to be used in place of the current drug, call it drug B, for a particular medical condition. The budget is fixed to have 1000 patients treated with A and 1000 treated with drug B. The issue is how to do the allocation of patients, because we have many pre-randomization measurements on each patient, roughly 200, such as blood pressure recordings, age, sex, and a large collection of genetics measurements. Obviously it is desirable to have the A group similar to the B group with respect to all pre-treatment covariates and non-linear functions of them that are expected to influence the efectiveness of the drugs with respect to the outcome variables.

Complete (or simple) randomization does this in expectation, but with many covariates, some covariates will not be balanced between the A and B groups in any one single randomized allocation. Standard blocking used in traditional experimental design can force balance on a few covariates, but the designer of drug A wants to have an experimental design that creates balance on many covariates, and feels that you, as a modern applied mathematician/statistician, should be able to do this.

Describe a class of methods that achieves this goal where each patient has a positive probability of receiving drug A and a positive probability of receiving drug B. Provide enough detail that you are describing an explicit algorithm.

## 题 6

^yau-2021-semifinal-written-written-q6

> 对应解答：[题 6 参考解](../../solutions/yau/yau-2021-semifinal-written-written-solutions.md#^yau-2021-semifinal-written-written-s6)。

You are given the results of a randomized experiment of two drugs, A and B. The experiment was not conducted in the usual way, however, but rather by allocating patients by a machine-learning algorithm under which each patient has a positive probability of receiving A and of receiving B; moreover the algorithm is completely specified and is built to create better than random balance on the covariates.

(a) Can unbiased estimates of the causal efect of drug A versus B be found, and if so, show why.

(b) Can exact small sample, non-parametric inferences for the causal efect in part (a) be derived, based solely on the randomization distribution of some statistic? For example, can we find exact significance levels under a sharp null hypothesis? If so, outline how to accomplish this goal.
