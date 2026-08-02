# S.-T. Yau College Student Mathematics Contests 2017 Applied Math. and Computational Math. Individual (5 problems)

1. The Chebyshev polynomial of the first kind is defined on $[- 1, 1]$ by

$$
T_{n}(x) = \cos(n \arccos x).
$$

Prove: The envelope for the extremals of $T_{n + 1}(x) - T_{n - 1}(x)$ forms an ellipse.

## 2. Consider a fixed point iteration

$$
x_{n} = g(x_{n - 1}),
$$

where $g : \mathbb{R} \to \mathbb{R}$ is a smooth function. Suppose this fixed point method does converge to a fixed point $x^{*}$ . The Stefensen algorithm is an acceleration method to find $x^{*}$ which reads

$$
\hat{x}_{n} = x_{n - 2} - \frac{(x_{n - 1} - x_{n - 2})^{2}}{x_{n} - 2x_{n - 1} + x_{n - 2}}.
$$

or

$$
x_{n + 1} = G(x_{n})
$$

where

$$
G(x) = x - \frac{(g(x) - x)^{2}}{g(g(x)) - 2g(x) + x}.
$$

(a) Show that the Stefensen algorithm $\{x_{k}\}$ converges quadratically.

(b) Can you extend this method to two dimensions?

3. We consider a piecewise smooth function

$$
f(x) = \left\{\begin{array}{ll} f_{1}(x), & x \leq 0, \\ f_{2}(x), & x > 0 \end{array} \right.
$$

where $f_{1}(x)$ is $\mathrm{~ a ~} C^{\infty}$ function on $(- \infty, 0]$ and $f_{2}(x)$ is $\mathrm{~ a ~} C^{\infty}$ function on $[0, \infty)$ , but $f_{1}(0) \neq f_{2}(0)$ . Suppose $p(x)$ is a k-th degree polynomial $(k \geq 1)$ interpolating $f(x)$ at $k + 1$ equally-spaced grid points $x_{j}, j = 0, 1, 2, \cdots$ , k with $x_{i} < 0 < x_{i + 1}$ for some i between 0 and $k - 1$ . Prove that, when the grid size $h = x_{j + 1} - x_{j}$ is small enough, $p^{\prime}(x) \neq 0$ for $x_{i} \leq 0 \leq x_{i + 1}$ , that is, $p(x)$ is monotone in the interval $[x_{i}, x_{i + 1}]$ . (Hint: first prove the case when $f_{1}(x) = c_{1}, f_{2}(x) = c_{2}$ and $c_{1} \neq c_{2}$ are two constants.)

4. Let $b \in \mathbb{R}^{n}$ . Suppose $A \in M_{n \times n}(\mathbb{R})$ and $B \in M_{n \times n}(\mathbb{R})$ are two $n \times n$ matrices. Let A to be non-singular.

(a) Consider the iterative scheme: $Ax^{k + 1} = b - Bx^{k}$ State and prove the necessary and suficient condition for the iterative scheme to converge.

(b) Suppose the spectral radius of $A^{- 1} B$ satisfies $\rho(A^{- 1} B) = 0$ . Prove that the iterative scheme converges in n iterations.

(c) Consider the following iterative scheme:

$$
x^{(k + 1)} = \omega_{1} x^{(k)} + \omega_{2}(c_{1} - Mx^{(k)}) + \omega_{3}(c_{2} - Mx^{(k)}) + \dots + \omega_{k}(c_{k - 1} - Mx^{(k)})
$$

where M is symmetric and positive definite, $\omega_{1} > 1, \omega_{2},..., \omega_{k} > 0$ and $c_{1},..., c_{k - 1} \in$ $\mathbb{R}^{n}$ . Deduce from (a) that the iterative scheme converges if and only if all eigenvalues of M (denote it as $\lambda(M))$ satisfies:

$$
(\omega_{1} - 1) /(\sum_{i = 2}^{k} \omega_{i}) < \lambda(M) <(\omega_{1} + 1) /(\sum_{i = 2}^{k} \omega_{i}).
$$

(d) Let A be non-singular. Now, consider the following system of iterative scheme (\*):

$$
Ax_{1}^{(k + 1)} = b_{1} - Bx_{2}^{(k)}, Ax_{2}^{(k + 1)} = b_{2} - Bx_{1}^{(k)}
$$

Find and prove the necessary and suficient condition for the iterative scheme (\*) to converge.

For the iterative scheme (\*\*):

$$
Ax_{1}^{(k + 1)} = b_{1} - Bx_{2}^{(k)}, Ax_{2}^{(k + 1)} = b_{2} - Bx_{1}^{(k + 1)}
$$

Find and prove the necessary and suficient condition for the iterative scheme $(^{* *})$ to converge. Compare the rate of convergence of the iterative schemes (\*) and $(^{* *})$

## 5. Consider the diferential equation

$$
- u^{\prime \prime} + \alpha u = f, x \in(0, 1).
$$

Here, prime denotes for $d / dx$ and α is a constant. We consider a mixed boundary condition

$$
u(0) = 0, u^{\prime}(1) - bu(0) = 0.
$$

This equation is approximated by a standard finite diference method:

$$
\frac{- U_{j - 1} + 2U_{j} - U_{j + 1}}{h^{2}} + \alpha U_{j} = f_{j}, j = 1, \dots, N - 1.
$$

Here, N is the number of grid points, $h = 1 / N$ is the mesh size, $U_{j}$ is the approximate solution at $x_{j} : = jh$ , and $f_{j} = f(x_{j})$ . The noundary condition is approximated by

$$
U_{0} = 0, \frac{U_{N} - U_{N - 1}}{h} - bU_{N} = 0.
$$

The resulting linear system is $AU = F$ with

$$
\left[\begin{array}{ccccccc} \beta & - 1 & 0 & \dots & & & \\ - 1 & \beta & - 1 & \dots & & & \\ & & & \ddots & & \\ & & & & - 1 & \beta & - 1 \\ & & & & 0 & - 1 & 1 - bh \end{array} \right] \left[\begin{array}{c} U_{1} \\ U_{2} \\ \vdots \\ U_{N - 1} \\ U_{N} \end{array} \right] = \left[\begin{array}{c} h^{2} f_{1} \\ h^{2} f_{2} \\ \vdots \\ h^{2} f_{N - 1} \\ 0 \end{array} \right]
$$

where $\beta = 2 + \alpha h^{2}$

$$
u_{t} + au_{x} = 0, a > 0.
$$

We discretize this PDE by For solving the following partial diferential equation

$$
u_{t} + f(u)_{x} = 0, \qquad 0 \leq x \leq 1\tag{1}
$$

where $f^{\prime}(u) \geq 0$ , with periodic boundary condition, we can use the following semidiscrete upwind scheme

$$
\frac{d}{dt} u_{j} + \frac{f(u_{j}) - f(u_{j - 1})}{\Delta x} = 0, \quad j = 1, 2, \dots, N,\tag{2}
$$

with periodic boundary condition

$$
u_{0} = u_{N},\tag{3}
$$

where $u_{j} = u_{j}(t)$ approximates $u(x_{j}, t)$ at the grid point $x = x_{j} = j \Delta x$ , with $\textstyle \Delta x ={\frac{1}{N}}$

(a) Prove the following $L^{2}$ stability of the scheme

$$
\frac{d}{dt} E(t) \leq 0\tag{4}
$$

where $\begin{array}{r}{E(t) = \sum_{j = 1}^{N} | u_{j} |^{2} \Delta x.} \end{array}$

(b) Do you believe (4) is true for $\begin{array}{r}{E(t) = \sum_{i = 1}^{N} | u_{j} |^{2p} \Delta x} \end{array}$ for arbitrary integer $p \geq 1 \mathord{?}$ If yes, prove the result. If not, give a counterexample.