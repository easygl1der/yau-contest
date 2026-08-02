# 2025 Yau Mathematical Contest Final Interview overall

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/final-interview/yau-2025-final-interview-overall-acm-overall.pdf).
> - Source: [official archive download page](https://yau-contest.com/lists-jxxg.html).
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2025-final-interview-overall-acm-overall/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2025-final-interview-overall-acm-overall-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.


## Problem 1

^yau-2025-final-interview-overall-acm-overall-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2025-final-interview-overall-acm-overall-solutions.md#^yau-2025-final-interview-overall-acm-overall-s1).

Given a convex function $f : \mathbb{R}^{n} \cdot$ <sup>R</sup> and a scalar $\alpha > 0$ , the proximal operator $\mathbf{prox}_{\alpha, f}$ of $f$ is defined as the mapping from a point $x \in \mathbb{R}^{n}$ to the unique solution of the minimization problem:

$$
\min_{y \in \mathbb{R}^{n}} f(y) + \frac{1}{2 \alpha} \| y - x \|_{2}^{2}.
$$

(For the solution to always exist, we technically assume $f$ is closed and proper, but these conditions are not crucial for this problem.)

Many functions, such as $\lVert x \rVert_{1}$ and $\| x \|_{2}$ , have explicit forms for their proximal operators. For a fixed $\alpha > 0$ and $n \in \mathbb{N}$ , perform the following:

(a) Derive the explicit formula for $\mathbf{prox}_{\alpha, f}$ when $f(x) = \| x \|_{1}$

(b) Derive the explicit formula for $\mathbf{prox}_{\alpha, g}$ when $g(x) = \| x \|_{2}$

(c) Prove that prox $\mathbf{\Lambda}_{f + g} = \mathbf{prox}_{g} \circ \mathbf{prox}_{f}$ holds for $f(x) = \| x \|$ <sub>1</sub> and $g(x) = \| x \|_{2}$

## Problem 2

^yau-2025-final-interview-overall-acm-overall-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2025-final-interview-overall-acm-overall-solutions.md#^yau-2025-final-interview-overall-acm-overall-s2).

Consider the boundary value problem:

$$
\left\{\begin{array}{l} \varepsilon y^{\prime \prime} +(1 + \varepsilon) y^{\prime} + y = 0, x \in(0, 1), \varepsilon > 0 \\ y(0) = 0, y(1) = 1.\end{array} \right.
$$

Derive the leading-order uniform approximation of the solution as $\varepsilon \to 0$
