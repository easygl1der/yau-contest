Problem 1. Show that for any integer $n \geq 3$ there are infinitely many irreducible polynomials of the form

$$
x^{n} +(6a - 1) x^{2} +(7b - 3) x + 25c \in \mathbb{Z}[x]
$$

for some $a, b, c \in \mathbb{Z}[x]$

Problem 2. The matrix A is defined by $a_{ij} = 1$ , when $i + j$ is even and $a_{ij} = 0$ , when $i + j$ is odd. The order of the matrix is 2n. Show that

$$
\left\| \mathbf{A} \right\|_{F} = \left\| \mathbf{A} \right\|_{\infty} = n,
$$

where $\| \mathbf{A} \|_{F}$ is the Frobenius norm, and that

$$
\sum_{k = 1}^{\infty} \left(\frac{1}{2n}\right)^{k} \mathbf{A}^{k} = \frac{1}{n} \mathbf{A}.
$$

Problem 3. Let X and $Y$ be two Hilbert spaces, with inner products $(\cdot, \cdot)_{X}$ and $(\cdot, \cdot)_{Y}$ , and the norms $\| \cdot \|_{X}$ and $\Vert \cdot \Vert_{Y}$ , respectively. Consider a bounded operator $T$ mapping from $X$ to $Y$ , with its adjoint operator given by $T^{*}$ . For any $\beta > 0$ and $z \in Y$ , consider the minimization

$$
\min_{f \in X} J(f) := \frac{1}{2} \| Tf - z \|_{Y}^{2} + \frac{\beta}{2} \| f \|_{X}^{2},
$$

and write its minimizer f as $f(\beta)$ , and its minimal value function as $F(\beta), \mathrm{i.e.,} F(\beta) = J(f(\beta))$

(1) Prove $f(\beta) \in X$ satisfies

$$
(Tf, Tg)_{Y} + \beta(f, g)_{X} =(z, Tg)_{Y} \quad \text{for all} \quad g \in X.
$$

(2) Prove the n-th derivative $w = f^{(n)}(\beta) \in X$ satisfies

$$
(Tw, Tg)_{Y} + \beta(w, g)_{X} = - n \left(f^{(n - 1)}(\beta), g\right)_{X} \quad \text{for all} \quad g \in X.
$$

(3) Prove the first and second derivatives of $F(\beta)$ are given by

$$
F^{\prime}(\beta) = \frac{1}{2} \| f(\beta) \|_{X}^{2}, \quad F^{\prime \prime}(\beta) =(f(\beta), f^{\prime}(\beta))_{X}.
$$

(4) If $z \not \in$ ker $T^{*}$ , prove $F(\beta)$ is strictly monotonically increasing and strictly concave.