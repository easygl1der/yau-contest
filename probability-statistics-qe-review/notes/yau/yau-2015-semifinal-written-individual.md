# 2015 丘赛 半决赛笔试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2015-semifinal-written-individual.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2015-semifinal-written-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2015-semifinal-written-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

# Probability and Statistics Individual (5 problems)

Problem 1. $\mathrm{(a)}$ Let X and $Y$ be two random variables with zero means, variance 1, and correlation $\rho.$ . Prove that

$$
\mathbb{E}[\max \{X^{2}, Y^{2}\}] \leq 1 + \sqrt{1 - \rho^{2}}.
$$

(b) Let X and Y have a bivariate normal distribution with zero means, variances $\sigma^{2}$ and $\tau^{2}$ , respectively, and correlation $\rho.$ Find the conditional expectation $\mathbb{E}(X | Y)$

## 题 2

^yau-2015-semifinal-written-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2015-semifinal-written-individual-solutions.md#^yau-2015-semifinal-written-individual-s2)。

We flip a fair coin until heads turns out twice consecutively. What is the expected number of flips?

## 题 3

^yau-2015-semifinal-written-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2015-semifinal-written-individual-solutions.md#^yau-2015-semifinal-written-individual-s3)。

Let $(X_{n}, n \geq 1)$ be a sequence of independent Gaussian variables, with respective mean $\mu_{n},$ and variance $\sigma_{n}^{2}$

(a) Prove that if $\textstyle \sum_{n} X_{n}^{2}$ converges in $L^{1}$ , then $\textstyle \sum_{n} X_{n}^{2}$ converges in $L^{p}.$ , for every $p \in[1, \infty)$

(b) Assume that $\mu_{n} = 0$ , for every n. Prove that if $\textstyle \sum_{n} \sigma_{n}^{2} = \infty$ , then

$$
\mathbb{P}(\sum_{n} X_{n}^{2} = \infty) = 1.
$$

## 题 4

^yau-2015-semifinal-written-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2015-semifinal-written-individual-solutions.md#^yau-2015-semifinal-written-individual-s4)。

Let $X_{1}, \ldots, X_{n}$ be a random sample of size n from the exponential distribution with pdf $f(x; \theta) ~ = ~ \theta^{- 1} \exp(- x / \theta)$ for $x, \theta \ > \0$ , zero elsewhere. Let $Y_{1} = \operatorname{min} \{X_{1}, \ldots, X_{n}\}$ . Consider an estimator $nY_{1}$

(a) Show this estimate is unbiased.

(b) Prove or disprove: This estimate is a consistent estimator.

(c) Prove or disprove: This estimate is an eficient estimator.

## 题 5

^yau-2015-semifinal-written-individual-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2015-semifinal-written-individual-solutions.md#^yau-2015-semifinal-written-individual-s5)。

Let the independent normal random variables $Y_{1}, \dots, Y_{n}$ have, respectively, the probability density functions $N(\mu, \gamma^{2} x_{i}^{2}), ~ i ~ = ~ 1, \ldots, n$ , where the given $x_{1}, \ldots, x_{n}$ are not all equal and no one of which is zero.

(a) Construct a confidence interval for $\gamma$ with significance level $1 - \alpha$

(b) Discuss the test of the hypothesis $H_{0} : \gamma = 1, \mu$ unspecified, against all alternatives $H_{1} : \gamma \neq 1, \mu$ unspecified.
