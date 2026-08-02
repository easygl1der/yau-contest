# 2020 丘赛 半决赛笔试 written

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2020-semifinal-written-written.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2020-semifinal-written-written/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Solve every problem.

Part I: Probability

## 题 1

^yau-2020-semifinal-written-written-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s1)。

Let X be an essentially bounded random variable with mean zero. Show that

$$
\mathbb{E} e^{X} \leq \cosh \| X \|_{\infty},
$$

where cosh $\begin{array}{r}{x = \frac{e^{x} + e^{- x}}{2}} \end{array}$ is the hyperbolic cosine function.

## 题 2

^yau-2020-semifinal-written-written-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s2)。

Let  be a positive number. Suppose that X is a random variable with $\mathbb{E} | X | < \infty.$ Suppose that

$$
\lambda \mathbb{E} f(X + 1) = \mathbb{E} \{Xf(X)\}
$$

for all bounded smooth functions. Show that X has the Poisson distribution Poisson( ).

## 题 3

^yau-2020-semifinal-written-written-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s3)。

Consider the random walk

$$
S_{n} = a + X_{1} + X_{2} + \dots + X_{n},
$$

where a is a positive integer and $\{X_{i}\}$ are independent and identically distributed random variables with a common distribution

$$
\mathbb{P} \{X_{i} = 1\} = p, \quad \mathbb{P} \{X_{i} = - 1\} = 1 - p.
$$

Let $\tau_{0} = \operatorname{inf} \{n : S_{n} = 0\}$ be the first time the random walk reaches the state $x = 0.$ . For all $p \in[0, 1]$ <sup>τ</sup>find the probability $\mathbb{P}_{a} \{\tau_{0} < \infty\}$ that the random walk will eventually hit the state $x = 0.$

## 题 4

^yau-2020-semifinal-written-written-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s4)。

Let $Z =(X, Y)$ be an $\mathbb{R}^{2}.$ -valued random variable such that (1) X and Y are independent; <sup>,</sup>(2) both X and Y have mean zero and finite (nonvanishing) second moments; (3) the distribution of Z is invariant under the rotation counter-clockwise around the origin by an angle  not a multiple of 90 degrees. Show that X and Y must be normal random variables with the same variance.

## Part II: Statistics

The following collection of questions concerns the design of a randomized experiment where the N units to be randomized to drug A or drug B are people, for whom we have a large number of background covariates, collectively labelled X (e.g., age, sex, blood pressure, height, weight, occupational status, history of heart disease, family history of heart disease). The objective is to assign approximately half to drug A and half to drug B where the means of each of the X variables (and means of non-linear functions of them, such as squares or products) are close to equal in the two groups. Instead of using classical methods of design, such as blocking or stratification, the plan is to use modern computers to try many random allocations and discard those allocations that are considered unacceptable according to a pre-determined criterion for balanced X means, in particular an afinely invariant measure such as the Mahalanobis distance between the means of X in the two groups. After an acceptable allocation is found, outcome variables will be measured, and their means will be compared in group A and group B to estimate a treatment efect.

## 题 5

^yau-2020-semifinal-written-written-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s5)。

Prove that if the two groups are of the same size (i.e., N/2 for even N), this plan will result in unbiased estimates of the A versus B casual efect based on the sample means of Y in groups A and B, where Y is any linear function of X.

## 题 6

^yau-2020-semifinal-written-written-q6

> 对应解答：[题 6 参考解](../../solutions/yau/yau-2020-semifinal-written-written-solutions.md#^yau-2020-semifinal-written-written-s6)。

Provide a counter-example to the assertion that Problem 5 is true in small samples with odd N.
