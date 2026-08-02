# 2023 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2023-final-interview-overall-acm-overall.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2023-final-interview-overall-acm-overall/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

Consider the nonlinear Klein-Gordon equation

$$
\begin{array}{l} \varepsilon^{2} \partial_{tt} u(x, t) - \partial_{xx} u(x, t) + \frac{1}{\varepsilon^{2}} u(x, t) + f(u(x, t)) = 0, \quad 0 < x < 1, 0 < t < T, \\ u(x, 0) = g_{0}(x), \qquad \partial_{t} u(x, 0) = \frac{1}{\varepsilon^{2}} g_{1}(x), \qquad 0 \leq x \leq 1, \\ u(0, t) = u(1, t) = 0, \qquad 0 \leq t \leq T, \end{array}
$$

where $0 < \varepsilon \le 1$ is a given dimensionless constant, $f(u)$ is a function of u and $g_{0}(x)$ and $g_{1}(x)$ are given functions, which are all independent of ε.

## 题 1

^yau-2023-final-interview-overall-acm-overall-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md#^yau-2023-final-interview-overall-acm-overall-s1)。

Define the Hamiltonian (or energy) as

$$
E(t) := \int_{0}^{1} \left[\varepsilon^{2} | \partial_{t} u |^{2} + | \partial_{x} u |^{2} + \frac{1}{\varepsilon^{2}} u^{2} + F(u) \right] dx, \qquad t \geq 0,
$$

where

$$
F(u) = 2 \int_{0}^{u} f(s) ds.
$$

Show that the Hamiltonian is conserved, i.e.

$$
E(t) \equiv E(0), \qquad t \geq 0.
$$

## 题 2

^yau-2023-final-interview-overall-acm-overall-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md#^yau-2023-final-interview-overall-acm-overall-s2)。

Construct an explicit second-order (in space and time) finite diference (EXFD) method for the problem and find its linear stability.

## 题 3

^yau-2023-final-interview-overall-acm-overall-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2023-final-interview-overall-acm-overall-solutions.md#^yau-2023-final-interview-overall-acm-overall-s3)。

Construct a second-order (in space and time) finite diference method for the problem such that the the Hamiltonian (or energy) is conserved in the discretized level and prove it.
