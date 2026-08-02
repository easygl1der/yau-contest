# 2024 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2024-final-interview-overall-prob-stat-overall.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2024-final-interview-overall-prob-stat-overall/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2024-final-interview-overall-prob-stat-overall-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Choose at least 1 from the following 2 problems.

## Problem 1.

(1) Suppose there is a biased coin with a probability p of landing heads. How can we use this coin to generate a Bernoulli(0.5) random variable?

(2) How many tosses are required on average to generate one random digit using this method?

(3) How can you use this biased coin to generate a uniform distribution on {1, 2, 3} or, in general, a uniform distribution on $\{1, 2, \dots, n\} ?$

## 题 2

^yau-2024-final-interview-overall-prob-stat-overall-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2024-final-interview-overall-prob-stat-overall-solutions.md#^yau-2024-final-interview-overall-prob-stat-overall-s2)。

We have n observations $y_{i}, i = 1, \dotsc, n$ , satisfying the simple linear regression model:

$$
y_{i} = \alpha + \beta x_{i} + \epsilon_{i},
$$

where $\epsilon_{i}$ are iid random variables with mean 0 and variance $\sigma^{2}$ . Let $\hat{\beta}$ denote the least squares estimator of $\beta.$

(1) Suppose $x_{i} \ = \i$ . Is $\hat{\beta}$ consistent? Asymptotically normal? Explain your answer.

(2) Answer the same question for $x_{i} = e^{i}$
