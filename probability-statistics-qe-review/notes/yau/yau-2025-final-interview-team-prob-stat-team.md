# 2025 丘赛 总决赛面试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2025-final-interview-team-prob-stat-team.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2025-final-interview-team-prob-stat-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Group: Probability and statistics

## 题 1

^yau-2025-final-interview-team-prob-stat-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md#^yau-2025-final-interview-team-prob-stat-team-s1)。

Let $p \in(0, 1)$ . Suppose you have a coin with probability of “head” unknown. Can you design a game between two persons, which ends in a finite number of tosses of the coin with probability 1, such that one person’s winning probability is exactly $p.$

## 题 2

^yau-2025-final-interview-team-prob-stat-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md#^yau-2025-final-interview-team-prob-stat-team-s2)。

Let $(p_{1}, p_{2}, p_{3})$ be the probabilities of a discrete random variable, where $0 < p_{k} < 1$ and $p_{1} + p_{2} +$ $p_{3} = 1$ . Let $r_{1}, r_{2}, r_{3}$ be independent random variables, each following a Unif(0, 1) distribution. Define the random variable X as

$$
X = k, \quad \text{if} r_{k}^{1 / p_{k}} = \max \left\{r_{1}^{1 / p_{1}}, r_{2}^{1 / p_{2}}, r_{3}^{1 / p_{3}} \right\}.
$$

You may ignore the case where the maximum is not unique, as it occurs with probability zero. Determine the distribution of X.

## 题 3

^yau-2025-final-interview-team-prob-stat-team-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2025-final-interview-team-prob-stat-team-solutions.md#^yau-2025-final-interview-team-prob-stat-team-s3)。

Let $(X_{n})_{n \geq 0}$ be a discrete time simple symmetric random walk on $\mathbb{Z}^{d}.$ , whose increments $\left(X_{n + 1} - \right.$ $X_{n})_{n \geq 0}$ are independent and chosen uniformly from the 2d unit vectors $(\pm e_{i})_{1 \leq i \leq d}$ in $\mathbb{Z}^{d}$ with $\| e_{i} \| = 1$ . A function $f :{\mathbb{Z}^{d}} \to{\mathbb{R}}$ is called harmonic for the random walk if $\mathbb{E}[f(X_{1}) | X_{0} = x] = f(x)$ for all $x \in \mathbb{Z}^{d}$ . Show that every bounded harmonic function f is a constant.
