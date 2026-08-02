# 2024 丘赛 总决赛面试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2024-final-interview-team-prob-stat-team.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2024-final-interview-team-prob-stat-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2024-final-interview-team-prob-stat-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Choose at least 2 of the following 3 problems.

## 题 1

^yau-2024-final-interview-team-prob-stat-team-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2024-final-interview-team-prob-stat-team-solutions.md#^yau-2024-final-interview-team-prob-stat-team-s1)。

Let $X_{n}, n = 1, 2, \cdots$ , be independent uniform $[0, 1]$ random variables and $X_{0} = x \in[0, 1]$ be a constant. Define

$$
N = \min \{n: X_{n} < X_{n - 1}\}.
$$

Find at least two diferent methods to evaluate $\mathbb{E}(N)$

## 题 2

^yau-2024-final-interview-team-prob-stat-team-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2024-final-interview-team-prob-stat-team-solutions.md#^yau-2024-final-interview-team-prob-stat-team-s2)。

Assume $Y_{1}, \dots, Y_{n}$ iid from a distribution with density function $f(y \mid$ $\alpha, \beta)$ . Without knowing $\alpha, \beta$ , we can obtain the MLE ${\hat{\alpha}},{\hat{\beta}}$ . If we know the true $\alpha = \alpha_{0}$ , then we can obtain the MLE ${\tilde{\beta}}.$

(1) Show that the asymptotic variance of $\hat{\beta}$ is larger than or equal to that of ${\tilde{\beta}}.$ .

(2) Find an example that the asymptotic variance of $\hat{\beta}$ is strictly larger than that of $\tilde{\beta}$ .

(3) Find an example that the asymptotic variance of $\hat{\beta}$ is equal to that of ${\tilde{\beta}}.$ .

## 题 3

^yau-2024-final-interview-team-prob-stat-team-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2024-final-interview-team-prob-stat-team-solutions.md#^yau-2024-final-interview-team-prob-stat-team-s3)。

Let $A =(a_{ij})_{m, n}$ be an $m{\mathrm{-}} \mathrm{by} - n$ matrix with iid $N(0, 1)$ entries. We assume that $m \leq n$ and denote the singular values of $A$ by $s_{1} \geq...\geq s_{m}$ (by definition $s_{i}^{2}{}^{,}$ s are eigenvalues of $AA^{\top})$ . We also have the variational characterizations

$$
s_{1} = \max_{u \in S^{m - 1}, v \in S^{n - 1}} u^{\top} Av, \qquad s_{m} = \min_{u \in S^{m - 1}} \max_{v \in S^{n - 1}} u^{\top} Av.
$$

Provide an upper bound of $\mathbb{E} s_{1}$ and a lower bound of $\mathbb{E} s_{m}$
