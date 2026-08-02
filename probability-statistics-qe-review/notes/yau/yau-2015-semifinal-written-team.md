# 2015 丘赛 半决赛笔试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2015-semifinal-written-team.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2015-semifinal-written-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## Probability and Statistics Team (5 problems)

## 题 1

^yau-2015-semifinal-written-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s1)。

One hundred passengers board a plane with exactly 100 seats. The first passenger takes a seat at random. The second passenger takes his own seat if it is available, otherwise he takes at random a seat among the available ones. The third passenger takes his own seat if it is available, otherwise he takes at random a seat among the available ones. This process continues until all the 100 passengers have boarded the plane. What is the probability that the last passenger takes his own seat?

## 题 2

^yau-2015-semifinal-written-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s2)。

Assume a sequence of random variables $X_{n}$ converges in distribution to a random variable X. Let $\{N_{t}, t \geq 0\}$ be a set of positive integer-valued random variables, which is independent of $(X_{n})$ and converges in probability to ∞ as $t \to \infty$ . Prove that $X_{N_{t}}$ converges in distribution to $X$ as $t \to \infty$

## 题 3

^yau-2015-semifinal-written-team-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s3)。

Suppose $T_{1}, T_{2}, \dots, T_{n}$ is a sequence of independent, identically distributed random variables with the exponential distribution of the density function

$$
p(x) = \left\{\begin{array}{ll} e^{- x}, & \quad x \geq 0; \\ 0, & \quad x < 0.\end{array} \right.
$$

Let $S_{n} = T_{1} + T_{2} + \cdot \cdot \cdot + T_{n}$ . Find the distribution of the random vector

$$
V_{n} = \Bigl \{\frac{T_{1}}{S_{n}}, \frac{T_{2}}{S_{n}}, \dots, \frac{T_{n}}{S_{n}} \Bigr\}.
$$

## 题 4

^yau-2015-semifinal-written-team-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s4)。

Suppose that X and Z are jointly normal with mean zero and standard deviation 1. For a strictly monotonic function $f(\cdot)$ $\operatorname{cov}(X, Z) ~ = ~ 0$ if and only if cov $(X, f(Z)) = 0$ , provided the latter covariance exists. Hint: $Z$ can be expressed as $Z = \rho X + \varepsilon$ where X and ε are independent and $\varepsilon \sim N(0, \sqrt{1 - \rho^{2}})$

## 题 5

^yau-2015-semifinal-written-team-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2015-semifinal-written-team-solutions.md#^yau-2015-semifinal-written-team-s5)。

Consider the following penalized least-squares problem (Lasso):

$$
\frac{1}{2} \| \mathbf{Y} - \mathbf{X} \boldsymbol{\beta} \|^{2} + \lambda \| \boldsymbol{\beta} \|_{1}
$$

Let $\widehat{\beta}$ be a minimizer and $\Delta = \widehat{\beta} - \beta^{*}$ for any given $\beta^{*}$ . If $\lambda > 2 \| \mathbf{X}^{T}(\mathbf{Y} - \mathbf{X} \beta^{*}) \|_{\infty}$ show that

$$
1.\| \mathbf{Y} - \mathbf{X}^{T} \widehat{\boldsymbol{\beta}} \|^{2} - \| \mathbf{Y} - \mathbf{X}^{T} \boldsymbol{\beta}^{*} \|^{2} > - \lambda \| \boldsymbol{\Delta} \|_{1}.
$$

2. $\| \Delta_{S^{c}} \|_{1} \leq 3 \| \Delta_{S} \|_{1}$ , where $S = \{j : \beta_{i}^{*} \neq 0\}$ is the support of the vector $\beta^{*}, S^{c}$ is its complement set, $\Delta_{S}$ is the subvector of $\Delta$ restricted on the set $S_{i}$ , and $\| \Delta_{S} \|.$ 1 is its $L_{\mathrm{1}} \mathrm{- norm}$
