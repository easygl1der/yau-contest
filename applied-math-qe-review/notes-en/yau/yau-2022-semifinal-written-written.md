# 2022 Yau Mathematical Contest Semifinal Written Examination written

> [!info] Sources and Transcription
> - Original file: [local source file](../../sources/yau-contest/semifinal-written/yau-2022-semifinal-written-written.pdf).
> - Source: local historical problem archive; the upstream release page remains to be catalogued.
> - MinerU reading transcript: [full transcript](../../transcripts/mineru/yau-2022-semifinal-written-written/reading.md); the original Markdown, JSON, and image assets are stored in `parts/`.
> - Corresponding solutions: [Reference solutions by problem](../../solutions/yau/yau-2022-semifinal-written-written-solutions.md).
> - The original file is authoritative for mathematical expressions, figures, layout, and any OCR ambiguities.

# Computational and Applied Mathematics

Solve every problem.

## Problem 1

^yau-2022-semifinal-written-written-q1

> Corresponding solutions: [Problem 1 Reference Solution](../../solutions/yau/yau-2022-semifinal-written-written-solutions.md#^yau-2022-semifinal-written-written-s1).

Consider $\left\{p_{i}(x) \right\}_{i = 0}^{\infty}$ , a family of orthogonal polynomials associated with the inner product

$$
\langle f, g \rangle = \int_{- 1}^{1} f(x) g(x) w(x) dx, \quad w(x) > 0 \quad \text{for} x \in(- 1, 1),
$$

where $p_{i}(x)$ is a polynomial of degree ??. Let $x_{0}, x_{1}, \ldots, x_{n}$ be the roots of $p_{n + 1}(x)$ Construct an orthonormal basis in the subspace of the polynomials of degree no more than ?? such that, for any polynomial in this subspace, the coefficients of its expansion into the basis are equal to the scaled values of this polynomial at the nodes $x_{0}, x_{1}, \ldots, x_{n}.$

## Problem 2

^yau-2022-semifinal-written-written-q2

> Corresponding solutions: [Problem 2 Reference Solution](../../solutions/yau/yau-2022-semifinal-written-written-solutions.md#^yau-2022-semifinal-written-written-s2).

Consider a 2D fixed point iteration of the form

$$
x_{k + 1} = f(x_{k}, y_{k}), y_{k + 1} = g(x_{k}, y_{k}).\tag{1}
$$

Assume that the vector-valued function $\vec{H}(x, y) =(f(x, y), g(x, y))^{T}$ is continuously-differentiable, and the infinity norm of the Jacobian matrix is less than 1 at a unique fixed point $(x_{\infty}, y_{\infty})$

Now consider a new iteration:

$$
x_{k + 1} = f(x_{k}, y_{k}), \quad y_{k + 1} = g(x_{k + 1}, y_{k}).\tag{2}
$$

Prove that iteration (2) is convergent, to the same fixed point as iteration (1), for the initial conditions sufficiently close to the fixed point.

## Problem 3

^yau-2022-semifinal-written-written-q3

> Corresponding solutions: [Problem 3 Reference Solution](../../solutions/yau/yau-2022-semifinal-written-written-solutions.md#^yau-2022-semifinal-written-written-s3).

Let $A \in \mathbb{R}^{\mathbf{m} \times \mathbf{m}}$ be a matrix with entries $a_{ij}$ which satisfy

$$
a_{ii} \geq \sum_{j \neq i} | a_{ij} | + 2, \quad a_{ii} \leq 7.
$$

(a) Prove that $A^{- 1}$ exists.

(b) Prove that $\| A \|_{\infty}$ is the max row sum (of absolute values) of ??.

(c) Find both a lower and upper bound for $\| A \|_{\infty}$

(d) Now assume $A = A^{T}.$ . Find bounds for $\| A \|_{2}$ and $\| A^{- 1} \|_{2}$

## Problem 4

^yau-2022-semifinal-written-written-q4

> Corresponding solutions: [Problem 4 Reference Solution](../../solutions/yau/yau-2022-semifinal-written-written-solutions.md#^yau-2022-semifinal-written-written-s4).

Consider a system of ODE initial value problems of the form:

$$
\frac{d}{dt} u = f(u), \quad u(0) = u_{0}.
$$

Assume that $f(u)$ has the property that the forward Euler (FE) method:

$$
U^{n + 1} = U^{n} + kf(U^{n}),
$$

satisfies

$$
\| U^{n + 1} \| \leq \| U^{n} \|
$$

for some norm $\| \cdot \|$ and for all time-steps $k, 0 < k \leq k_{FE}$ . Now consider the 2-stage Runge-Kutta method:

$$
\begin{array}{rl} & U^{(1)} = U^{n} + k \beta_{10} f(U^{n}), \\ & U^{n + 1} = \{\alpha_{20} U^{n} + k \beta_{20} f(U^{n})\} + \{\alpha_{21} U^{(1)} + k \beta_{21} f(U^{(1)})\} \end{array}
$$

where

$$
\beta_{10} \geq 0, \quad \beta_{20} \geq 0, \quad \beta_{21} \geq 0, \quad \alpha_{20} \geq 0, \quad \alpha_{21} \geq 0, \quad \alpha_{20} + \alpha_{21} = 1.
$$

(a) Prove that the above 2-stage Runge-Kutta method also satisfies the inequality:

$$
\| U^{n + 1} \| \leq \| U^{n} \|
$$

under some appropriate time-step restriction: $0 \leq k \leq k^{*}$ , where you need to explicitly determine $k^{*}$ in terms of $k_{FE}.$

(b) Explicitly determine the coefficients:

$$
\beta_{10}, \quad \beta_{20}, \quad \beta_{21}, \quad \alpha_{20}, \quad \alpha_{21},
$$

so that

(i) The method is second-order accurate; and

(ii) The maximum allowed time-step, $k^{*}$ , is as large as possible.

## Problem 5

^yau-2022-semifinal-written-written-q5

> Corresponding solutions: [Problem 5 Reference Solution](../../solutions/yau/yau-2022-semifinal-written-written-solutions.md#^yau-2022-semifinal-written-written-s5).

Construct a third-order accurate Lax-Wendroff-type method for $u_{t} + au_{x} = 0(a > 0$ is a constant) in the following way:

(a) • Expand $u(t + k, x)$ in a Taylor series and keep the first four terms. Replace all time derivatives by spatial derivatives using the equation.

• Construct a cubic polynomial passing through the points $U_{j - 2}^{n}, U_{j - 1}^{n}, U_{j}^{n}, U_{j + 1}^{n}$ .

• Approximate the spatial derivatives in the Taylor series by the exact derivatives of the above constructed cubic polynomial.

(b) Verify that the truncation error is $O(k^{3}) \mathrm{if} h = O(k).$

## Problem 6

^yau-2022-semifinal-written-written-q6

> Corresponding solutions: [Problem 6 Reference Solution](../../solutions/yau/yau-2022-semifinal-written-written-solutions.md#^yau-2022-semifinal-written-written-s6).

Suppose you have \$60K to invest and there are 3 investment options available. You must invest in multiples of \$10??. If $d_{i}$ dollars are invested in investment ?? then you receive a net value (as the profit) of $r_{i}(d_{i})$ dollars. For $d_{i} > 0$ we have

$$
\begin{array}{rl} & r_{1}(d_{1}) =(7d_{1} + 2) \times 10, \\ & r_{2}(d_{2}) =(3d_{2} + 7) \times 10, \\ & r_{3}(d_{3}) =(4d_{3} + 5) \times 10, \end{array}
$$

and $d_{1}(0) = d_{2}(0) = d_{3}(0)$ . All are measured in \$10?? dollars. The objective is to maximize the net value of your

investments. This can be formulated as a linear programming problem:

$$
\max_{d_{1}, d_{2}, d_{3}} r_{1}(d_{1}) + r_{2}(d_{2}) + r_{3}(d_{3}),
$$

$$
\mathrm{suchthat} d_{1} + d_{2} + d_{3} \leq 6,
$$

$$
d_{i} \geq 0i = 1, 2, 3 \mathrm{areintegers.}
$$
