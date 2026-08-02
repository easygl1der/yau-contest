# 2024 丘赛 总决赛面试 individual

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2024-final-interview-individual-prob-stat-individual.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2024-final-interview-individual-prob-stat-individual/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2024-final-interview-individual-prob-stat-individual-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Choose at least 3 from the following 4 problems.

## 题 1

^yau-2024-final-interview-individual-prob-stat-individual-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2024-final-interview-individual-prob-stat-individual-solutions.md#^yau-2024-final-interview-individual-prob-stat-individual-s1)。

Let $\{X_{i}\}_{i \ge 0}$ be iid with density function f and distribution function F . Define $N = \operatorname{min} \{n \geq 1 : X_{n} > X_{0}\}$

(1) Find the distribution function of $X_{N}$

(2) If $\mathbb{E} | X_{0} | < \infty$ , is it always true that $\mathbb{E} | X_{N} | < \infty ?$ If yes, prove it; if not, give a counterexample.

## 题 2

^yau-2024-final-interview-individual-prob-stat-individual-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2024-final-interview-individual-prob-stat-individual-solutions.md#^yau-2024-final-interview-individual-prob-stat-individual-s2)。

A fair coin is tossed repeatedly and independently, and the outcome is denoted as $X_{1} X_{2} \cdots$ with $X_{i} = H$ (head) or T (tail).

(1) Describe an idea about how to find the expected number of tosses required until a particular pattern of heads/tails appears.

(2) Evaluate the expected number of tosses to get the special pattern HT HH, i.e., evaluate <sup>E</sup>(N ), where $N = \operatorname{min} \{n \geq 4 : X_{n - 3} X_{n - 2} X_{n - 1} X_{n} = HTHH\}$

## 题 3

^yau-2024-final-interview-individual-prob-stat-individual-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2024-final-interview-individual-prob-stat-individual-solutions.md#^yau-2024-final-interview-individual-prob-stat-individual-s3)。

Given a filtration $\{{\mathcal F}_{n}\}$ , i.e., ${\mathcal{F}}_{1} \subseteq{\mathcal{F}}_{2} \subseteq \cdot \cdot \cdot \subseteq{\mathcal{F}}$ , we define ${\mathcal{F}}_{\infty} =$ $\sigma(\cup_{n = 1}^{\infty} \mathcal{F}_{n})$

(1) Is it correct that $\textstyle{\mathcal{F}}_{\infty} = \cup_{n = 1}^{\infty}{\mathcal{F}}_{n} ?$ If not, please give a counterexample.

(2) Let X be a random variable which is F-measurable and integrable. Prove $\{\mathbb{E}(X | \mathcal{F}_{n})\}_{n \geq 1}$ is uniformly integrable.

(3) Prove $\mathbb{E}(X |{\mathcal F}_{n}) \to \mathbb{E}(X |{\mathcal F}_{\infty})$ in $L^{1}$ , as n goes to infinity.

## 题 4

^yau-2024-final-interview-individual-prob-stat-individual-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2024-final-interview-individual-prob-stat-individual-solutions.md#^yau-2024-final-interview-individual-prob-stat-individual-s4)。

Consider the least squares problem. Assume Y is the n-dimensional outcome vector and X is the $n \times p$ covariate/design matrix. Assume X is full rank. We can run least squares of Y on X to obtain the usual estimator ${\hat{\boldsymbol{\beta}}}.$ the residual vector ˆε, and the hat matrix $H = X(X^{\mathrm{{T}}} X)^{- 1} X^{\mathrm{{T}}}$

Now we want to compute the least square coeficient $\hat{\beta}_{[i]}$ by dropping the ith observation, $i = 1, \ldots, n$ . Instead of running the least squares n times, can we obtain $\{\hat{\beta}_{[i]}, i = 1,..., n\}$ from $\hat{\beta}, \hat{\varepsilon},(X^{\mathrm{T}} X)^{- 1}$ , and H, so that we only need to run the least squares only once?
