# 2012 丘赛 半决赛笔试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2012-semifinal-written-team.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2012-semifinal-written-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Probability and Statistics

Please solve 5 out of the following 6 problems.

## 题 1

^yau-2012-semifinal-written-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s1)。

Let $(X_{n})$ be a sequence of i.i.d. random variables.

## 题 1

^yau-2012-semifinal-written-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s1)。

Assume that each $X_{n}$ satisfies the exponential distribution with parameter 1 (i.e. $P(X_{n} \geq x) = e^{- x}, x \geq 0)$ . Prove that ${\mathrm{(a) ~}} P(X_{n} > \alpha$ log $n, i.o.) = 0$ , if $\alpha > 1;{\cal P}(X_{n} > \alpha \log n, i.o.) = 1$ , if $\alpha \leq 1$

Here $\mathrm{^{66} i.O^{7}}{}^{,}$ stands for “infinitely often”, and $A_{n}, i.o$ . stands lim $\operatorname{sup}_{n \to \infty} A_{n}$ (b) Let $L = \operatorname{lim} \operatorname{sup}_{n \to \infty}(X_{n} / \log n)$ , then $P(L = 1) = 1$

## 题 2

^yau-2012-semifinal-written-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s2)。

Assume that each $X_{n}$ satisfies the Poisson distribution with parameter λ (i.e. $\begin{array}{r}{P(X_{n} = k) = \frac{\lambda^{k}}{k !} e^{- \lambda}, k = 0, 1, 2, \cdot \cdot \cdot.)} \end{array}$ Put

$$
L = \operatorname{limsup}_{n \to \infty}(X_{n} \log \log n / \log n).
$$

Prove that $P(L = 1) = 1$

## 题 2

^yau-2012-semifinal-written-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s2)。

Let $X_{i}$ be i.i.d exponential r.v with rate one, $i \geq 1$ . Let N be a geometric random variable with success probability $p, \0 < p < 1$ , i.e. $P(N = k) =(1 - p)^{k - 1} p, k = 1, 2, \cdot \cdot \cdot$ , and independent of all $X_{i}, i \geq 1$ Find the distribution of $\textstyle \sum_{i = 1}^{N} X_{i}$

## 题 3

^yau-2012-semifinal-written-team-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s3)。

Let X and Y be i.i.d real valued r.v’s. Prove that $P(| X + Y | < 1) \leq$ $3P(| X - Y | < 1)$

## 题 4

^yau-2012-semifinal-written-team-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s4)。

Suppose $S = X_{1} + X_{2} + \cdot \cdot \cdot + X_{n}.$ a sum of independent random variables with $X_{i}$ distributed Binomial $(1, p_{i})$ . Show that $\mathbb{P}(S \even) =$ $1 / 2$ if and only if at least one $p_{i}$ equals $1 / 2$

## 题 5

^yau-2012-semifinal-written-team-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s5)。

Let $B_{\theta}$ denote the closed unit ball in $\mathbb{R}^{2}$ with center θ. Suppose $X_{1}, X_{2}, \cdots, X_{n}$ are independently and uniformly distributed on $B_{\theta}$ for an unknown θ in $\mathbb{R}^{2}$ . Denote that maximum likelihood estimator by <sup>ˆ</sup>θ. Show that $| \hat{\theta} - \theta | = O_{p}(1 / n)$

## 题 6

^yau-2012-semifinal-written-team-q6

> 对应解答：[题 6 参考解](../../solutions/yau/yau-2012-semifinal-written-team-solutions.md#^yau-2012-semifinal-written-team-s6)。

Suppose that $X_{1}, \cdots, X_{n}$ are a random sample from the Bernoulli distribution with probability of success $p_{1}$ and $Y_{1}, \cdots, Y_{n}$ be an independent random sample from the Bernoulli distribution with probability of success $p_{2}$

(a) Derive the maximum likelihood ratio test statistic for

$$
H_{0}: p_{1} = p_{2} \longleftrightarrow H_{1}: p_{1} \neq p_{2}.
$$

(Note: No simplification of the resulting test statistic is required. However, you need to give the asymptotic null.)

(b) Compute the asymptotic power of the test with critical region

$$
| \sqrt{n}(\hat{p}_{1} - \hat{p}_{2}) / \sqrt{2 \hat{p} \hat{q}} | \geqslant z_{1 - \alpha}
$$

when $p_{1} = p$ and $p_{2} = p + n^{- 1 / 2} \Delta$ , where $\hat{p} = 0.5.\hat{p}_{1} + 0.5 \hat{p}_{2}$
