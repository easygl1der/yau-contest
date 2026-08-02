# 2026 Yau Mathematical Contest Semifinal Written Examination written

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2026-semifinal-written-written.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2026-semifinal-written-written/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

## Problem 1. Consider the equation

$$
\alpha \partial_{t} u(t, x) + \beta \partial_{x} u(t, x) - \gamma \partial_{xx} u(t, x) = f(x),\tag{1}
$$

for $(t, x) \in(0, T) \times(0, 1)$ , with $f \in L^{2}(0, 1), T > 0$ , boundary condition $u(t, 0) = u(t, 1) = 0$ for all $t > 0$ and initial condition $u(0, x) = 0$ . Parameters satisfy $\alpha > 0, \beta \in \mathbb{R}$ and $\gamma > 0$ . Let $\mathcal{T}_{h}$ be a uniform mesh partitioning (0, 1), i.e., a collection of intervals $[ih,(i + 1) h]$ with $i = 0, 1, \ldots, N$ and $h = 1 /(N + 1)$

(a). Write the fully discrete variational formulation of (1) using the continuous piecewise linear finite element method (<sup>P</sup> Lagrange FEM) in space and implicit Euler method in time. Denoting the time step by τ and $t_{i} = i \tau$ for all $i \in \mathbb N$

(b). Prove the $L^{2}$ stability estimate $\| u_{h}^{n} \| \leq C \| f \|$ with a constant $C > 0$ independent of $h, \tau, n.$

(c). Let $\{\phi_{i}\}_{1 \leq i \leq N}$ be the global Lagrange shape functions associated with the nodes $x_{i} : = ih$ for $i = 1, \ldots, N$ . Denoting by $\begin{array}{r}{u_{h}^{i} : = \sum_{1 < j < N} U_{j}^{i} \phi_{j}} \end{array}$ the approximation of u at $t_{i}$ , write the algebraic linear system solved by $(U_{1}^{i}, \dots, U_{N}^{i})$

## Problem 2

^yau-2026-semifinal-written-written-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s2).

Let $\Omega \subset \mathbb{R}^{d}$ be a bounded domain, $d \leq 3$ . Consider the functional $J : H_{0}^{1}(\Omega) \to \mathbb{R} \mathrm{:}$ :

$$
J(u) = \int_{\Omega} \left(\frac{1}{2} | \nabla u(x) |^{2} + \frac{1}{4} u(x)^{4} - f(x) u(x)\right) dx,
$$

where $f \in L^{2}(\Omega)$

(a). Compute the Fr´echet derivative (gradient) $\nabla J(u)$ and the second Fr´echet derivative (Hessian) $\nabla^{2} J(u)$ . Prove that J is strictly convex.

(b). Write the Newton’s method for finding the minimizer $u^{*}$ of $J(u)$ . Assuming the initial guess $u^{0}$ is suficiently close to the solution $u^{*}$ , prove the second order convergence of the Newton’s method: there exists $C > 0$ such that $\| u_{k + 1} - u^{*} \|_{H^{1}} \leq C \| u_{k} - u^{*} \|_{H^{1}}^{2}$

(c). Let $s_{k} = u_{k + 1} - u_{k}$ and $y_{k} = \nabla J(u_{k + 1}) - \nabla J(u_{k})$ . A Quasi-Newton method resorts to an approximate Hessian $B_{k + 1}$ satisfying the secant equation: $B_{k + 1} s_{k} = y_{k}$ . A BFGS update of $B_{k + 1}$ is

$$
B_{k + 1} v = B_{k} v - \frac{\langle B_{k} s_{k}, v \rangle}{\langle B_{k} s_{k}, s_{k} \rangle} B_{k} s_{k} + \frac{\langle y_{k}, v \rangle}{\langle y_{k}, s_{k} \rangle} y_{k},
$$

for any test function $v \in H_{0}^{1}(\Omega)$ . Assuming $B_{k}$ is positive definite, prove that above BFGS update is well-defined.

## Problem 3

^yau-2026-semifinal-written-written-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s3).

Consider the initial value problem over $\mathbb{R}^{N}$ in the form

$$
x^{\prime} = f(t, x) \quad x(0) = x_{0} \in \mathbb{R}^{N},
$$

where $f :[0, T] \times \mathbb{R}^{N} \mathbb{R}^{N}$ is smooth. Consider the family of one-step methods

$$
x_{n + 1} = x_{n} +(1 - b) hf \left(t_{n}, x_{n}\right) + bhf \left(t_{n + 1}, x_{n + 1}\right),\tag{2}
$$

where $h = t_{n + 1} - t_{n}$ for any $n \geq 0$ is a uniform step size and $b \in[0, 1]$ is a constant.

(a). Find the value of b so that the local truncation error is $\mathcal{O}(h^{3})$ .

(b). Apply the method (2) to $x^{\prime} = \lambda x, x(0) = x_{0} \in \mathbb{R}$ . Find the function $g(\cdot)$ such that $x_{n} = g(h \lambda)^{n} x_{0}$

(c). Determine the values of b so that this method is A-stable.

## Problem 4

^yau-2026-semifinal-written-written-q4

> Corresponding solutions: [Problem 4 Reference Solution](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s4).

Let A be an invertible $N \times N$ matrix. The shifted QR iteration for a given sequence of shifts $\left\{\sigma_{n} \right\}$ is defined by

$$
A_{0} = A, \quad A_{n} - \sigma_{n} I_{N} = Q_{n} R_{n}, \quad A_{n + 1} = R_{n} Q_{n} + \sigma_{n} I_{N},
$$

where $I_{N}$ is the $N \times N$ identity matrix, $Q_{n}$ is orthogonal and $R_{n}$ is upper triangular with positive diagonal entries.

(a). Prove if no $\sigma_{n}$ is an eigenvalue of A then the sequences $\{A_{n}\}, \{Q_{n}\}$ and $\{R_{n}\}$ are uniquely defined and satisfy

$$
A_{n + 1} = Q_{n}^{T} A_{n} Q_{n}, \quad A_{n + 1} = R_{n} A_{n}(R_{n})^{- 1}.
$$

(b). Suppose A is a symmetric $2 \times 2$ matrix with eigenvalues $\lambda_{1}$ and $\lambda_{2}$ . Let $\sigma_{0} = \lambda_{1}$ . Find $A_{1}$

(c). Let $\hat{Q}_{n} = Q_{0} \ldots Q_{n - 1}$ and $\hat{R}_{n} = R_{n - 1}...R_{0}$ for $n \geq 1$ . Prove $\begin{array}{r}{\hat{Q}_{k + 1} \hat{R}_{k + 1} = \prod_{i = 0}^{k}(A -} \end{array}$ $\sigma_{i} I_{N})$

## Problem 5

^yau-2026-semifinal-written-written-q5

> Corresponding solutions: [Problem 5 Reference Solution](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s5).

Let $A \in \mathbb{R}^{n \times n}$ be an n by n real matrix and $\sigma_{i}(A)$ be its i-th largest singular value. A vector $x \in \mathbb{R}^{n}$ such that $Ax = x$ is called a fixed point of A.

(a). Assume $\sigma_{1}(A) \leq 1$ , show that every fixed point of A is a fixed point of its transpose $A^{T}$

(b). Consider $A ={\bigg \lceil} 1{\pmod{1}}$ to verify that the assertion in (a) is not generally true without assuming $\sigma_{1}(A)^{-} \leq 1$

(c). Assume $AA^{T} = A^{T} A$ , show that every fixed point of A is a fixed point of its transpose $A^{T}$

## Problem 6

^yau-2026-semifinal-written-written-q6

> Corresponding solutions: [Problem 6 Reference Solution](../../solutions/yau/yau-2026-semifinal-written-written-solutions.md#^yau-2026-semifinal-written-written-s6).

Let the subdiferential of a convex function $f : \mathbb{R}^{n} \mathbb{R} \cup \{+ \infty\}$ at a point x be denoted by $\partial f(x)$ . Recall that a vector $x^{*} \in \mathbb{R}^{n}$ is a subgradient of $f$ at x if it satisfies:

$$
f(z) \geq f(x) + \langle x^{*}, z - x \rangle, \quad \forall z \in \mathbb{R}^{n}.
$$

Namely, $\partial f(x) = \{x^{*} : f(z) \geq f(x) + \langle x^{*}, z - x \rangle, \forall z \in \mathbb{R}^{n}\}$ . Here, $\langle x, y \rangle = x^{T} y$ for any vectors x and y in <sup>Rn</sup>. We assume $n \geq 2$ (the $n = 1$ case is trivial).

(a). Let $f : \mathbb{R}^{n} \mathbb{R}$ be defined by

$$
f(x) = \max_{i = 1, \dots, n} x_{i}, \quad x =(x_{1}, \dots, x_{n})^{T} \in \mathbb{R}^{n}.
$$

Compute the subdiferential $\partial f(0)$

(b). Let

$$
g(x) = \max_{i = 1, \dots, n} x_{i} + \delta_{\mathbb{R}_{+}^{n}}(x),
$$

where $\delta_{\mathbb{R}_{~ 1}^{n}}$ is the indicator function of the non-negative orthant $\mathbb{R}_{+}^{n} \(\mathrm{i.e.,} \ \delta_{\mathbb{R}_{+}^{n}}(x) = 0$ if $x \geq 0.$ , and $+ \infty$ otherwise). Show that

$$
\partial g(0) = \partial f(0) - \mathbb{R}_{+}^{n}.
$$

[Here, one may use the fact that $\partial g(x) = \partial f(x) + \partial \delta_{\mathbb{R}_{+}^{n}}(x) \ \mathrm{for} \g(x) = f(x) + \delta_{\mathbb{R}_{+}^{n}}(x).\mathrm{\}$
