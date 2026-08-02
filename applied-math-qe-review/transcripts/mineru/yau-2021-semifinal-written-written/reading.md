# Computational and Applied Mathematics

Solve every problem.

## Problem 1.

(a) Show that

$$
T_{n}(x) = \cos(n \arccos x), \quad x \in[- 1, 1],
$$

is a polynomial of degree n with extrema at

$$
x_{k} = \cos \left(k \frac{\pi}{n}\right), \quad k = 0, 1, \ldots, n
$$

and leading coeficient $2^{n - 1}.$

(b) Show that if $f \in C^{n + 1}[- 1, 1]$ and if $P(x)$ is the polynomial with degree at most n that interpolates f at $x_{k}, k = 0, 1, \ldots, n$ then

$$
\left\| f(x) - P(x) \right\|_{\infty} \leq \frac{1}{2^{n - 1}(n + 1) !} \left\| f^{n + 1} \right\|_{\infty}.
$$

Problem 2. Let $S(x)$ be a cubic spline with knots $\{t_{i}\}_{i = 0}^{n}.$ If it is determined that $S(x)$ is linear over $[t_{1}, t_{2}]$ and $[t_{3}, t_{4}]$ . Prove that S(x) is also linear over $\left[t_{2}, t_{3} \right]$

Problem 3. Let $f : \mathbb{R} \mathbb{R}$ be defined by $f(x) = 2x - \cos x.$

(a) Prove that the equation $f(x) = 0$ has a unique solution $x^{*} \in \mathbb{R}$ that lies in the interval $\textstyle{\bigl(}{\frac{1}{4}},{\frac{1}{2}}{\bigr)}$ .

(b) Prove that the sequence defined by the fixed point iteration

$$
x_{n} = \frac{1}{2} \cos x_{n - 1}, \quad n = 1, 2, \ldots
$$

converges to $x^{*}$ with any initial guess $x_{0}.$

(c) For the fixed point iteration in (b) with $\begin{array}{r}{x_{0} = \frac{\pi}{6}} \end{array}$ , determine an n that guarantees $| x_{n} - x^{*} | <{\frac{1}{2}} \times 10^{- 8}.$ For the fixed point iteration in (b) with $x_{0} = 20$ , determine an n that guarantees $\begin{array}{r}{| x_{n} - x^{*} | < \frac{1}{4}} \end{array}$

Problem 4. Let matrix $\mathbf{A} \in \mathbb{R}^{\mathbf{m} \times \mathbf{n}}$ with $m \geq n$ and $r ={\operatorname{rank}}(\mathbf{A}) < n.$ , and assume A has the following SVD decomposition

$$
\mathbf{A} =[\mathbf{U_{1}}, \mathbf{U_{2}}] \left[\begin{array}{cc} \Sigma_{\mathbf{1}} & \mathbf{0} \\ \mathbf{0} & \mathbf{0} \end{array} \right][\mathbf{V}_{1}, \mathbf{V}_{2}]^{T} = \mathbf{U}_{1} \Sigma_{1} \mathbf{V}_{1}^{T},
$$

where $\Sigma_{1}$ is $r \times r$ nonsingular and $\mathbf{U}_{1}$ and $\mathbf{V}_{1}$ have r columns. Let $\sigma = \sigma_{\mathrm{min}}(\Sigma_{1})$ the smallest nonzero singular value of A. Consider the following least square problem, for some $ { \mathbf { b } } \in  { \mathbf { R } } ^ {  { \mathbf { m } } }$

$$
\min_{\mathbf{x} \in \mathbb{R}^{\mathbf{n}}} \| \mathbf{Ax} - \mathbf{b} \|_{2}.
$$

(a) Show that all solutions x can be written as

$$
\mathbf{x} = \mathbf{V_{1}} \boldsymbol{\Sigma_{1}^{- 1}} \mathbf{U_{1}^{T}} \mathbf{b} + \mathbf{V_{2}} \mathbf{z_{2}},
$$

with $\mathbf{z}_{2}$ an arbitrary vector.

(b) Show that the solution x has minimal norm $\left\| \mathbf{x} \right\|_{2}$ precisely when $\mathbf{z}_{2} = \mathbf{0}$ , and in which case,

$$
\| \mathbf{x} \|_{2} \leq \frac{\| \mathbf{b} \|_{2}}{\sigma}.
$$

Problem 5. Consider the family of semi-implicit Runge-Kutta methods

$$
\begin{array}{c} k_{1} = f(y_{n} + \beta hk_{1}), \quad k_{2} = f(y_{n} + hk_{1} + \beta hk_{2}), \\ y_{n + 1} = y_{n} + h \Big((\frac{1}{2} + \beta) k_{1} +(\frac{1}{2} - \beta) k_{2} \Big).\end{array}
$$

(a) Determine the order and the principal part of the local truncation error.

(b) Show that if $\beta > \frac{1}{2}$ , then the negative real axis $\{z : \mathbf{Re}(z) < 0, \mathbf{Im}(z) = 0\}$ is contained in the region of absolute stability of the method.

Problem 6. Consider the Beam equation from mechanics with boundary conditions that model a cantilever beam:

$$
\begin{array}{rl} & u^{(4)} = f(x), \quad x \in(0, 1), \\ & u(0) = u^{\prime}(0) = u^{\prime \prime}(1) = u^{\prime \prime \prime}(1) = 0.\end{array}\tag{1}
$$

(a) Recast this equation into a variational problem, stating the trial and test function spaces.

(b) Interpret the variational problem as an energy minimization problem, clearly stating the energy functional. Prove that the variational problem and the energy minimization problems are equivalent.

(c) Develop $a \mathrm{CG}(3)$ (cubic continuous Galerkin method) finite element method for this problem.

(d) Prove an a priori error estimate for this method in the energy norm:

$$
\| e \|_{E} = \left(\int_{0}^{1}(e^{\prime \prime})^{2} dx\right)^{\frac{1}{2}},
$$

Where $e = u(x) - U(x)$ , in which, $u(x)$ is the exact solution to VP (variational problem), $U(x)$ is the FEM (finite element method) solution.

(e) Prove an a priori error estimate for this method in the $L_{2}$ norm:

$$
\left\| e \right\|_{L_{2}} =: \left\| e \right\| = \left(\int_{0}^{1} e^{2} dx\right)^{\frac{1}{2}}.
$$