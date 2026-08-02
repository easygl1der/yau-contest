# 2025 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2025-final-interview-overall-prob-stat-overall.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2025-final-interview-overall-prob-stat-overall/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2025-final-interview-overall-prob-stat-overall-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## All-around: Probability and statistics

## 题 1

^yau-2025-final-interview-overall-prob-stat-overall-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2025-final-interview-overall-prob-stat-overall-solutions.md#^yau-2025-final-interview-overall-prob-stat-overall-s1)。

Suppose that a study has N subjects, divided into two groups. For subject $i(i = 1,..., N)$ , let $Z_{i}$ be the group assignment, with $Z_{i} = 1$ being the treatment group and $Z_{i} = 0$ being the control group, and $X_{i}$ be the covariates. The propensity score of subject i is the probability of that subject being in the treatment group: $e(X_{i}) = P(Z_{i} = 1 \mid X_{i})$ ). A metric for the similarity of the covariates distribution between the groups is the Bhattacharyya coefficient:

$$
\phi \equiv \int_{0}^{1} \sqrt{f_{1}(u) f_{0}(u)} d u,
$$

where $f_{z}(u)$ is the density of the propensity score in $\mathrm{group} z(\mathrm{for} z = 0, 1)$ . Assume $e(X) \sim{\mathsf{Beta}}(a, b)$ , derive the Bhattacharyya coefficient ϕ as a function of $(a, b)$ . (Note: The pdf of Beta distribution: $\frac{\Gamma(a + b)}{\Gamma(a) \Gamma(b)} \dot{x^{a - 1}(1 - x)^{b - 1}}$ where $\textstyle \Gamma(z) = \int_{0}^{\infty} t^{z - 1} e^{- t} dt$ is the Gamma function).

## 题 2

^yau-2025-final-interview-overall-prob-stat-overall-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2025-final-interview-overall-prob-stat-overall-solutions.md#^yau-2025-final-interview-overall-prob-stat-overall-s2)。

Let $X_{t} : = e^{B_{t} - \frac{t}{2}}$ , where $(B_{t})_{t \geq 0}$ is a standard Brownian motion with $B_{0} = 0$ . Find the distribution of $M : = \operatorname{sup}_{t \geq 0} X_{t}$
