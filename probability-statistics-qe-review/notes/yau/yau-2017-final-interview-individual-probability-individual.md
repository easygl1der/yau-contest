# 2017 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2017-final-interview-individual-probability-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2017-final-interview-individual-probability-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2017-final-interview-individual-probability-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2017-final-interview-individual-probability-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2017-final-interview-individual-probability-individual-solutions.md#^yau-2017-final-interview-individual-probability-individual-s1)。

Let X be a random variable with finite variance. Denote by $m, \mu, \sigma$ the median, mean and standard deviation of X:

$$
m := \inf \{c: \mathbb{P}[X \leq c] \geq 1 / 2\}, \quad \mu = \mathbb{E}[X], \quad \sigma^{2} = \mathbb{E}[(X - \mu)^{2}].
$$

Show that $| m - \mu | \leq \sigma$

## 题 2

^yau-2017-final-interview-individual-probability-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2017-final-interview-individual-probability-individual-solutions.md#^yau-2017-final-interview-individual-probability-individual-s2)。

Let $(X_{n})_{n \geq 1}$ be a sequence of non-negative random variables. Let $(\mathcal{F}_{n})_{n \geq 1}$ be a filtration (i.e. a sequence of increasing σ-algebras). Assume that

$$
\mathbb{E}[X_{n} \mid \mathcal{F}_{n}] \to 0, \quad inprobability.
$$

Show that

X<sub>n</sub> → 0, in probability.

Is it true reversely? If yes, prove it; if not, give a counterexample.

## 题 3

^yau-2017-final-interview-individual-probability-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2017-final-interview-individual-probability-individual-solutions.md#^yau-2017-final-interview-individual-probability-individual-s3)。

Let $X_{1},..., X_{n}$ be independent random variables following common Poisson distribution with mean λ. Let $\eta = e^{- \lambda}$ . Does there exist a uniformly unbiased minimum variance estimator UMVUE of $\eta \overset{\mathcal{Q}}{\underset{\cdot}{\cdot}}$ (Recall that an estimator is UMVUE if it is unbaised estimator and has smallest variance among all unbiased estimators.) If yes, find it; if no, prove it.
