# 2019 丘赛 半决赛笔试 team

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2019-semifinal-written-team.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2019-semifinal-written-team/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2019-semifinal-written-team-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。

## 1) (10 points)

Show that the quadrature formula $\int_{- 1}^{1}{\frac{f(x)}{\sqrt{1 - x^{2}}}} dx ={\frac{\pi}{n}} \sum_{k = 0}^{n - 1} f \left(\cos \pi{\frac{2k + 1}{2n}} \right)$ is exact for all polynomials of degree up to and including $2n - 1$

2) (15 pointes) Let $\boldsymbol{x} =(x_{0}, \ldots, x_{N - 1}) \in \mathbb{R}^{N}, \boldsymbol{x} \neq 0$ and ˆx be its discrete Fourier transform, i.e.

$$
\hat{x}_{w} = \frac{1}{\sqrt{N}} \sum_{t = 0}^{N - 1} x_{t} \exp(- 2 \pi iwt / N), w = 0, \ldots, N - 1.
$$

Prove that $\| x \|_{0} \| \hat{x} \|_{0} \geqslant N$ where $\| x \|_{0}$ denotes the number of nonzero entries in x. (Hint: show that ˆx can not have $\| x \|_{0}$ consecutive zeros.)

## 3) (20 pointes)

Let $m \leqslant n$ . Consider the $(n + m) \times(n + m)$ real matrix defined by

$$
A = \left[\begin{array}{cc} I & X \\ X^{\top} & O \end{array} \right],
$$

where I is the $n \times n$ identity matrix, X is a full-rank $n \times m$ matrix, O is the m × m zero matrix.

(i) Show that A is nonsingular.

(ii) Find the eigenvalues of A, some of which are in terms of the singular values of X.

(iii) Under what conditions on X would the iteration

$$
x_{n + 1} = x_{n} -(Ax_{n} - b)
$$

converge to the solution of $Ax = b$ for any $(n + m) \times(n + m)$ real vector b?

## 4) (25 pointes)

Let f be a continuously diferentiable convex function defined on $\mathbb{R}^{n}, \mathrm{i.e.,} f : \mathbb{R}^{n} \mathbb{R}$ is continuously diferentiable and for any $x, y \in \mathbb{R}^{n}$ and any $\alpha \in(0, 1), f(\alpha x +(1 - \alpha) y) \leq \alpha f(x) +(1 - \alpha) f(y)$ Suppose that the gradient of f is Lipschitz continuous, i.e., there exists a constant $L > 0$ such that

$$
\| \nabla f(x) - \nabla f(y) \|_{2} \leq L \| x - y \|_{2}.
$$

Prove the following inequalities:

(i). $\begin{array}{r}{f(\boldsymbol{y}) \le f(\boldsymbol{x}) +(\nabla f(\boldsymbol{x}))^{T}(\boldsymbol{y} - \boldsymbol{x}) + \frac{L}{2} \| \boldsymbol{y} - \boldsymbol{x} \|_{2}^{2}, \quad \forall \boldsymbol{x}, \boldsymbol{y} \in \mathbb{R}^{n};} \end{array}$

(ii). $\begin{array}{r}{f(\boldsymbol{y}) \geq f(\boldsymbol{x}) +(\nabla f(\boldsymbol{x}))^{T}(\boldsymbol{y} - \boldsymbol{x}) + \frac{\overline{{\boldsymbol{\cdot}}}}{2L} \| \nabla f(\boldsymbol{y}) - \nabla f(\boldsymbol{x}) \|_{2}^{2}, \quad \forall \boldsymbol{x}, \boldsymbol{y} \in \mathbb{R}^{n};} \end{array}$

(iii). $\begin{array}{r}{\frac{1}{L} \| \nabla f(y) - \nabla f(x) \|_{2}^{2} \leq(\nabla f(y) - \nabla f(x))^{T}(y - x), \quad \forall x, y \in \mathbb{R}^{n}.} \end{array}$

5) (30 pointes) Consider the following problems.

(i) Determine the order of St¨ormer’s method,

$$
y_{n + 2} - 2y_{n + 1} + y_{n} = h^{2} f(t_{n + 1}, y_{n + 1}), \quad n \geqslant 0,
$$

for solving the second order system of ODE’s

$$
y^{\prime \prime} = f(t, y), \quad t \geqslant 0,
$$

with the initial conditions $y(0) = y_{0}$ and $y^{\prime}(0) = y_{0}^{\prime}$

(ii) Using the second order central diferences in space and St¨ormer’s method in time, construct a scheme to solve the wave equation,

$$
u_{tt} = u_{xx}.
$$

(iii) Determine the condition for its stability.
