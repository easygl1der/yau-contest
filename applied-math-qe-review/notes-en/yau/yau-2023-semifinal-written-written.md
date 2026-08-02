# 2023 Yau Mathematical Contest Semifinal Written Examination written

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2023-semifinal-written-written.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2023-semifinal-written-written/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

Solve every problem.

## Problem 1

^yau-2023-semifinal-written-written-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s1).

Consider the forward and the centered finite diference formulas

$$
D_{h}^{+} f(x_{0}) = \frac{f(x_{0} + h) - f(x_{0})}{h},\tag{1}
$$

$$
D_{h}^{0} f(x_{0}) = \frac{f(x_{0} + h) - f(x_{0} - h)}{2h},\tag{2}
$$

to approximate the derivative of $f$ at a point $x_{0}$ . Assume $f$ is a smooth function in a neighborhood of $x_{0}$ containing the points $x_{0} + h$ and $x_{0} - h$

(a) Prove that $D_{h}^{+} f(x_{0})$ and $D_{h}^{0} f(x_{0})$ approximate $f^{\prime}(x_{0})$ to $O(h)$ and $O(h^{2})$ , respectively.

(b) Derive an $O(h^{2})$ approximation to $f^{\prime}(x_{0})$ from $D_{h}^{+} f(x_{0})$ by doing Richardson extrapolation.

(c) Take $f(x) = \sin x$ and $x_{0} = 0$ . Prove that both $D_{h}^{+} f(x_{0})$ and $D_{h}^{0} f(x_{0})$ converge quadratically to $f^{\prime}(x_{0})$ as $h0$ and that in fact they produce the same approximation to $f^{\prime}(x_{0})$ in this particular case.

## Problem 2

^yau-2023-semifinal-written-written-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s2).

For functions defined on a closed interval [0, 1], we want to compute the following definite integral,

$$
I[f] = \int_{0}^{1} f(x) \log(1 / x) dx.
$$

Here we consider the weight function log $\left.1 / x \right.$ , and denote $P_{n}(x)$ as the monic orthogonal polynomials for the corresponding weighted inner product.

(a) Let $P_{0} = 1$ . Find $P_{1}(x)$ , and the corresponding node $x_{1}^{1}$ and weight $\omega_{1}^{1}$ for the 1-point Gaussian quadrature rule.

(b) Derive a recursive formula for $P_{n + 1}(x)$ using $P_{n}(x)$ and $P_{n - 1}(x)$

(c) Consider the normalized orthogonal polynomials $Q_{n}(x) = P_{n}(x) / \vert \vert P_{n} \vert \vert$ , where

$$
| | P_{n} | | = \sqrt{P_{n}(x)^{2} \log(1 / x) dx}.
$$

Derive a recursive formula for $Q_{n + 1}(x)$ using $Q_{n}(x)$ and $Q_{n - 1}(x)$

(d) Use the above recursive formula to show that $x = \lambda$ is a node of the 4-point Gaussian quadrature if and only if it is an eigenvalue of a symmetric, tridiagonal matrix. Write out the form of the symmetric and tridiagonal matrix explicitly.

## Problem 3

^yau-2023-semifinal-written-written-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s3).

Let A be a real $n \times n$ matrix with distinct eigenvalues such that

$$
| \lambda_{1} | > | \lambda_{2} | \geq | \lambda_{3} | \geq \dots \geq | \lambda_{n} | \geq 0,
$$

with corresponding eigenvectors $\{v_{j}\}_{j = 1}^{n}$

(a) Show that the power iteration

$$
z_{m} = \frac{A^{m} z_{0}}{| | A^{m} z_{0} | |_{\infty}} \longrightarrow \pm \frac{v_{1}}{| | v_{1} | |_{\infty}}, \quad \forall z_{0} \in \mathbb{R}^{n}.
$$

(b) Consider the following iteration with initial guess $x_{0} = y_{0} = 1$

$$
x_{n + 1} = x_{n} + y_{n}, \quad y_{n + 1} = x_{n + 1} + x_{n}.
$$

Show that $y_{n} / x_{n} \to{\sqrt{2}}$ as $n \to \infty$

## 4. Consider the initial value problem

$$
y^{\prime} = f(t, y), \quad 0 < t \leq T.\tag{3}
$$

$$
y(0) = y_{0}.\tag{4}
$$

Assume $f$ is continuous and Lipschitz in $y$ in $[0, T] \times(- \infty, \infty)$ . Denote $y_{n} \approx y(t_{n})$ $t_{n} = nh$ , and $h = T / N$ , with N a positive integer, and consider the one-step method

$$
y_{n + 1} = y_{n} + \alpha hf(t_{n}, y_{n}) + \beta hf(t_{n} + \gamma h, y_{n} + \gamma hf(t_{n}, y_{n})),
$$

where $\alpha, \beta$ and $\gamma$ are real parameters.

(a) Prove that the method is consistent if and only if $\alpha + \beta = 1$ , and the order of the method can not exceed 2.

(b) Suppose that a second-order method of the above form is applied to $f(t, y) = - \lambda y$ with $\lambda > 0$ , and the initial condition $y_{0} = 1$ . Show that the sequence $(y_{n})_{n \geq 0}$ is bounded if and only if $\begin{array}{r}{h \leq \frac{2}{\lambda}} \end{array}$ . Show further that for such $h.$ ,

$$
| y(t_{n}) - y_{n} | \leq \frac{1}{6} \lambda^{3} h^{2} t_{n}, \quad n \geq 0.
$$

## Problem 5

^yau-2023-semifinal-written-written-q5

> Corresponding solutions: [Problem 5 Reference Solution](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s5).

Let $u(t, x)$ be the solution of the initial-boundary value problem

$$
u_{t} = Du_{xx}, \quad 0 < x < L, \quad 0 < t \leq T,\tag{5}
$$

$$
u(0, x) = f(x)\tag{6}
$$

$$
u(t, 0) = u(t, L) = 0,\tag{7}
$$

where $L > 0$ and $D > 0$ . Consider the finite diference scheme

$$
\frac{u_{j}^{n + 1} - u_{j}^{n}}{\Delta t} = D \frac{u_{j + 1}^{n} - 2u_{j}^{n} + u_{j - 1}^{n}}{(\Delta x)^{2}}, \quad j = 1, \ldots, M - 1, \quad n = 0, 1, \ldots, N - 1\tag{8}
$$

with $u_{0}^{n} = u_{M}^{n} = 0$ for all n and $u_{j}^{0} = f(j \Delta x), j = 0,..., M$ . Here $\Delta t = T / N$ and $\Delta x = L / M$ and $u_{j}^{n} \approx u(n \Delta t, j \Delta x)$

(a) Prove that (8) is consistent with (5).

(b) Prove that if $\begin{array}{r}{\Delta t{} \leq \frac{1}{2D}(\Delta x)^{2}} \end{array}$ the finite diference scheme (8) is stable under the $l^{\infty}$ norm.

(c) Prove that if $\begin{array}{r}{\Delta t{} \leq \frac{1}{2D}(\Delta x)^{2}} \end{array}$ the finite diference scheme (8) converges in the $l^{\infty}$ norm to the exact solution of (5)-(7).

## Problem 6

^yau-2023-semifinal-written-written-q6

> Corresponding solutions: [Problem 6 Reference Solution](../../solutions/yau/yau-2023-semifinal-written-written-solutions.md#^yau-2023-semifinal-written-written-s6).

Let $\psi^{\varepsilon}(t, x)$ be the solution to the following Schr¨odinger equation:

$$
i \varepsilon \frac{\partial \psi^{\varepsilon}}{\partial t} = - \frac{\varepsilon^{2}}{2} \nabla_{x}^{2} \psi^{\varepsilon} + V(x) \psi^{\varepsilon}, x =(x_{1}, \dots, x_{n})^{\mathrm{T}} \in \mathbb{R}^{n},
$$

where $i = \sqrt{- 1}, \varepsilon \ll 1$ is a small positive real number (rescaled Planck constant), $\nabla_{x}^{2} = \sum_{j = 1}^{n} \partial_{x_{j}}^{2}$ , and $V(x) \in C^{\infty}(\mathbb{R}^{n})$ is the potential function.

Consider the WKB expansion

$$
\psi^{\varepsilon}(t, x) = A(t, x) e^{i \frac{S(t, x)}{\varepsilon}},
$$

(a) Derive equations for $A(t, x)$ and $S(t, x)$ by asymptotic expansion. (Here both $A(t, x)$ and $S(t, x)$ are real-valued functions, and do not depend $\mathrm{on} \ \varepsilon.)$

(b) Define $u(t, x) = \nabla_{x} S(t, x) \in \mathbb{R}^{n}$ . Derive an equation for $u(t, x)$ . Suppose $u(0, x) \in$ $C^{\infty}(\mathbb{R}^{n})$ , will $u(t, x)$ always be in $C^{\infty}(\mathbb{R}^{n})$ for all $t > 0 ?$ Explain why.
