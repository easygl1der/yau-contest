# 2019 丘赛 半决赛笔试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2019-semifinal-written-team.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2019-semifinal-written-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2019-semifinal-written-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2019-semifinal-written-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2019-semifinal-written-team-solutions.md#^yau-2019-semifinal-written-team-s1)。

Suppose $(X_{n})_{n \geq 1}$ is a sequence of i.i.d. random variables and the common law is exponential with parameter one. Show that

$$
\mathbb{P} \left[\operatorname{limsup}_{n \to \infty} \frac{X_{n}}{\log n} = 1 \right] = 1.
$$

## 题 2

^yau-2019-semifinal-written-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2019-semifinal-written-team-solutions.md#^yau-2019-semifinal-written-team-s2)。

Let $(X_{n})_{n \geq 1}$ be i.i.d. real random variables and set $\textstyle S_{n} = \sum_{i = 1}^{n} X_{i}$ for $n \geq 1$ . Suppose that for some constant $c \in \mathbb{R}$ we have $S_{n} / n \to c{\mathrm{~ as ~}} n \to \infty$ almost surely. Show that $X_{1}$ has a finite first moment and $\mathbb{E}[X_{1}] = c$

## 题 3

^yau-2019-semifinal-written-team-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2019-semifinal-written-team-solutions.md#^yau-2019-semifinal-written-team-s3)。

Consider uniform permutation of $\{1, 2, \ldots, n\}$ and denote by $X_{n}$ the number of cycles in the permutation. Find a sequence of reals $(a_{n})_{n \geq 1}$ such that

$$
\lim_{n \to \infty} \frac{\mathbb{E}[X_{n}]}{a_{n}} = 1,
$$

and justify your answer.

## 题 4

^yau-2019-semifinal-written-team-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2019-semifinal-written-team-solutions.md#^yau-2019-semifinal-written-team-s4)。

The Erd¨os-R´enyi random graph $G(n, p)$ with parameters $n \geq 1$ and $p \in[0, 1]$ is the random graph whose vertex set is $V = \{1, 2, \dots, n\}$ and where for each pair $i \neq j \in V$ the edge $ij$ is present with probability p independently of all the other pairs.

(a) For $\begin{array}{r}{\epsilon > 0, \operatorname{if} p_{n} \ge(1 + \epsilon) \frac{\log n}{n}} \end{array}$ , then

$$
\mathbb{P}[G(n, p_{n}) \text{has an isolated vertex}] \to 0, \quad \text{as} n \to \infty.
$$

(b) For $\begin{array}{r}{\epsilon > 0, \operatorname{if} p_{n} \leq(1 - \epsilon) \frac{\log n}{n}} \end{array}$ , then

$$
\mathbb{P}[G(n, p_{n}) \text{has an isolated vertex}] \to 1, \quad \text{as} n \to \infty.
$$
