# 2025 丘赛 半决赛笔试 written

> [!info] 来源与转录
> - 原始文件：[本地原件](../../sources/yau-contest/semifinal-written/yau-2025-semifinal-written-written.pdf)。
> - 来源：本地历史题库；上游发布页待补录。
> - MinerU 阅读稿：[完整转录](../../transcripts/mineru/yau-2025-semifinal-written-written/reading.md)；原始 Markdown、JSON 和图像资产位于 `parts/`。
> - 对应解答：[逐题参考解](../../solutions/yau/yau-2025-semifinal-written-written-solutions.md)。
> - 数学公式、图形、版式及任何 OCR 歧义均以原始文件为准。


## 题 1

^yau-2025-semifinal-written-written-q1

> 对应解答：[题 1 参考解](../../solutions/yau/yau-2025-semifinal-written-written-solutions.md#^yau-2025-semifinal-written-written-s1)。

We consider the multipoint iteration method

$$
x_{k + 1} = x_{k} - \alpha \frac{f(x_{k})}{f^{\prime} \left(x_{k} - \beta f(x_{k}) / f^{\prime}(x_{k})\right)},
$$

where α and $\beta$ are arbitrary parameters, for solving the equation $f(x) = 0$ . Determine the values $\alpha$ and $\beta$ such that the multipoint method achieves the highest possible order of convergence for finding ξ, a simple root of $f(x) = 0$

## 题 2

^yau-2025-semifinal-written-written-q2

> 对应解答：[题 2 参考解](../../solutions/yau/yau-2025-semifinal-written-written-solutions.md#^yau-2025-semifinal-written-written-s2)。

Compute the spectral radius of the matrix ${\bf A}^{- 1}$ , where

$$
\mathbf{A} = \left[\begin{array}{cccccccc} 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 \\ 1 & 0 & 1 & 0 & 0 & 0 & 0 & 0 \\ 0 & 1 & 0 & 1 & 0 & 0 & 0 & 0 \\ 0 & 0 & 1 & 0 & 1 & 0 & 0 & 0 \\ 0 & 0 & 0 & 1 & 0 & 1 & 0 & 0 \\ 0 & 0 & 0 & 0 & 1 & 0 & 1 & 0 \\ 0 & 0 & 0 & 0 & 0 & 1 & 0 & 1 \\ 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 \end{array} \right].
$$

## 题 3

^yau-2025-semifinal-written-written-q3

> 对应解答：[题 3 参考解](../../solutions/yau/yau-2025-semifinal-written-written-solutions.md#^yau-2025-semifinal-written-written-s3)。

Let the ordinary Legendre polynomial of degree k be denoted $P_{k}(x)$ for $k \geq 0$ . The associated Legendre functions are defined as

$$
P_{k}^{m} =(- 1)^{m}(1 - x^{2})^{m / 2} \frac{d^{m}}{dx^{m}} P_{k}(x), \quad m > 0, \quad k \geq m.
$$

(Note that despite the name, for odd m they are not actually polynomials.)

(a) Consider the interpolation problem of finding coeficients $a_{k}$ such that

$$
\sum_{k = 1}^{N} a_{k} P_{k}^{1}(x_{i}) = y_{i}, \quad i = 1, \dots, N.
$$

Prove that this linear system of equations for the unknown coeficients $a_{k}$ is nonsingular provided that the interpolation points $\{x_{i}\}$ exclude ±1 and are distinct.

(b) Consider the approximation problem of finding coeficients $a_{k}$ to minimize the squared approximation error

$$
\left| \left| f(x) - \sum_{k = 1}^{N} a_{k} P_{k}^{1}(x) \right| \right|_{2}^{2},
$$

where the $L^{2}$ norm is taken over $x \in[- 1, 1]$ . Derive the linear system for the coeficient $a_{k}$ and explain why it is nonsingular.

(c) Let M be the coeficient matrix from part (b). Prove that $\mathbf{M}_{k, j} = 0$ when $k + j$ is odd.

## 题 4

^yau-2025-semifinal-written-written-q4

> 对应解答：[题 4 参考解](../../solutions/yau/yau-2025-semifinal-written-written-solutions.md#^yau-2025-semifinal-written-written-s4)。

Given a set of column vectors $y_{1}, \ldots, y_{n} \in \mathbb{R}^{m}$ , let $\mathcal{V} = \operatorname{span} \{y_{1},..., y_{n}\} \subset \mathbb{R}^{m}$ . How can we find $\ell \leq$ dim V orthonormal vectors $\{\psi_{i}\}_{i = 1}^{\ell}$ in $\mathbb{R}^{m}$ that minimize

$$
J(\psi_{1}, \dots, \psi_{\ell}) = \sum_{j = 1}^{n} \left\| y_{j} - \sum_{i = 1}^{\ell}(y_{j}^{\top} \psi_{i}) \psi_{i} \right\|^{2},
$$

where $\| y \| = \sqrt{y^{\top} y}$ is the Euclidean norm?

## 题 5

^yau-2025-semifinal-written-written-q5

> 对应解答：[题 5 参考解](../../solutions/yau/yau-2025-semifinal-written-written-solutions.md#^yau-2025-semifinal-written-written-s5)。

Consider the initial-value problem

$$
\begin{array}{ll} \frac{\partial u}{\partial t} + u = \frac{\partial^{2} u}{\partial x^{2}}, & - \infty < x < \infty, \quad 0 < t \leq T, \\ u(x, 0) = u_{0}(x), & - \infty < x < \infty \end{array}
$$

where $T$ is a fixed positive real number, and $u_{0}$ is a real-valued continuous function on <sup>R</sup>. Consider the θ-scheme

$$
\begin{array}{l} \frac{U_{j}^{m + 1} - U_{j}^{m}}{\Delta t} +[\theta U_{j}^{m + 1} +(1 - \theta) U_{j}^{m}] \\ = \theta \frac{U_{j + 1}^{m + 1} - 2U_{j}^{m + 1} + U_{j - 1}^{m + 1}}{(\Delta x)^{2}} +(1 - \theta) \frac{U_{j + 1}^{m} - 2U_{j}^{m} + U_{j - 1}^{m}}{(\Delta x)^{2}} \end{array}
$$

for $j \in \mathbb{Z}, m = 0,..., M - 1$ , where $\Delta x > 0$ and $\Delta t = T / M, M \geq 1$ , and $U_{j}^{0} = u_{0}(j \Delta t), j \in \mathbb{Z}$

(a) Define the \`<sub>∞</sub>-norm as $\begin{array}{r}{\vert \vert U^{m} \vert \vert_{\ell_{\infty}} : = \operatorname{max}_{j \in \mathbb{Z}} \vert U_{j}^{m} \vert} \end{array}$ , and assume that $| | U^{0} | |_{\ell_{\infty}}$ is finite. Prove that for $\theta \in[0, 1]$ ，

$$
| | U^{m} | |_{\ell_{\infty}} \leq \left(\frac{1 -(1 - \theta) \Delta t}{1 + \theta \Delta t}\right)^{m} | | U^{0} | |_{\ell_{\infty}},
$$

holds for all $1 \leq m \leq M$ , provided that $\begin{array}{r}{A(\theta) \Delta t \leq \frac{(\Delta x)^{2}}{2 +(\Delta x)^{2}}} \end{array}$ , where $A(\theta)$ is a constant, depending on the choice of θ, which you should determine.

(b) Define the \` -norm as $\begin{array}{r}{\vert \vert U^{m} \vert \vert_{\ell_{2}} : = \left(\Delta x \sum_{j \in \mathbb{Z}} | U_{j}^{m} |^{2} \right)^{1 / 2}} \end{array}$ and suppose that $| | U^{m} | |_{\ell_{2}}$ is finite. • For $\theta \in[\textstyle{\frac{1}{2}}, 1]$ , show that $\| U^{m} \|_{\ell_{2}} \leq \| U^{0} \|_{\ell_{2}}$ holds for any $\Delta t, \Delta x > 0$ and all $1 \leq m \leq$ $M$

• For $\theta \in[0, \frac{1}{2})$ , prove that $\| U^{m} \|_{\ell_{2}} \leq \| U^{0} \|_{\ell_{2}}$ under the condition $\begin{array}{r}{B(\theta) \Delta t \leq \frac{2(\Delta x)^{2}}{4 +(\Delta x)^{2}}} \end{array}$ where $B(\theta)$ is a constant, depending on the choice of θ, which you should determine.

## 题 6

^yau-2025-semifinal-written-written-q6

> 对应解答：[题 6 参考解](../../solutions/yau/yau-2025-semifinal-written-written-solutions.md#^yau-2025-semifinal-written-written-s6)。

Consider the stif system of ordinary diferential equations:

$$
\frac{d \mathbf{y}}{dt} = \mathbf{f}(t, \mathbf{y}), \quad \mathbf{y}(0) = \mathbf{y}_{0}
$$

where $\mathbf{y} ={\binom{y_{1}}{y_{2}}}, \mathbf{y}_{0} ={\binom{2}{1}}$ , and

$$
\mathbf{f}(t, \mathbf{y}) = \binom{- 1000y_{1} + 999y_{2}}{- y_{2}}
$$

(a) Find the exact solution $\mathbf{y}(t) ={\binom{y_{1}(t)}{y_{2}(t)}}$

(b) For the explicit Euler method:

$$
\mathbf{y}_{n + 1} = \mathbf{y}_{n} + h \mathbf{f}(t_{n}, \mathbf{y}_{n})
$$

determine the absolute stability region and prove divergence when $h > 0.002$

(c) For the implicit Euler method:

$$
\mathbf{y}_{n + 1} = \mathbf{y}_{n} + h \mathbf{f}(t_{n + 1}, \mathbf{y}_{n + 1})
$$

prove unconditional stability for any $h > 0$

(d) For the trapezoidal rule:

$$
\mathbf{y}_{n + 1} = \mathbf{y}_{n} + \frac{h}{2}[\mathbf{f}(t_{n}, \mathbf{y}_{n}) + \mathbf{f}(t_{n + 1}, \mathbf{y}_{n + 1})]
$$

analyze its stability.
