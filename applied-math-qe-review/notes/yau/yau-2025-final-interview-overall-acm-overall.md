# 2025 丘赛 总决赛面试 overall

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/final-interview/yau-2025-final-interview-overall-acm-overall.pdf)。
> - 来源：[官方题库下载页](https://yau-contest.com/lists-jxxg.html)。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2025-final-interview-overall-acm-overall/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2025-final-interview-overall-acm-overall-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2025-final-interview-overall-acm-overall-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2025-final-interview-overall-acm-overall-solutions.md#^yau-2025-final-interview-overall-acm-overall-s1)。

Given a convex function $f : \mathbb{R}^{n} \cdot$ <sup>R</sup> and a scalar $\alpha > 0$ , the proximal operator $\mathbf{prox}_{\alpha, f}$ of $f$ is defined as the mapping from a point $x \in \mathbb{R}^{n}$ to the unique solution of the minimization problem:

$$
\min_{y \in \mathbb{R}^{n}} f(y) + \frac{1}{2 \alpha} \| y - x \|_{2}^{2}.
$$

(For the solution to always exist, we technically assume $f$ is closed and proper, but these conditions are not crucial for this problem.)

Many functions, such as $\lVert x \rVert_{1}$ and $\| x \|_{2}$ , have explicit forms for their proximal operators. For a fixed $\alpha > 0$ and $n \in \mathbb{N}$ , perform the following:

(a) Derive the explicit formula for $\mathbf{prox}_{\alpha, f}$ when $f(x) = \| x \|_{1}$

(b) Derive the explicit formula for $\mathbf{prox}_{\alpha, g}$ when $g(x) = \| x \|_{2}$

(c) Prove that prox $\mathbf{\Lambda}_{f + g} = \mathbf{prox}_{g} \circ \mathbf{prox}_{f}$ holds for $f(x) = \| x \|$ <sub>1</sub> and $g(x) = \| x \|_{2}$

## 题 2

^yau-2025-final-interview-overall-acm-overall-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2025-final-interview-overall-acm-overall-solutions.md#^yau-2025-final-interview-overall-acm-overall-s2)。

Consider the boundary value problem:

$$
\left\{\begin{array}{l} \varepsilon y^{\prime \prime} +(1 + \varepsilon) y^{\prime} + y = 0, x \in(0, 1), \varepsilon > 0 \\ y(0) = 0, y(1) = 1.\end{array} \right.
$$

Derive the leading-order uniform approximation of the solution as $\varepsilon \to 0$
