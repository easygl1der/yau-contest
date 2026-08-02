## Question I

Let A be an n×n matrix with real and positive eigenvalues and b be a given vector. Consider the solution of $Ax = b$ by the following Richardson’s iteration

$$
x^{(k + 1)} =(I - \omega A) x^{(k)} + \omega b
$$

where $\omega$ is a damping coeficient. Let $\lambda_{1}$ and $\lambda_{n}$ be the smallest and the largest eigenvalues of A. Let $G_{\omega} = I - \omega A$

1. Prove that the Richardson’s iteration converges if and only if

$$
0 < \omega < \frac{2}{\lambda_{n}}.
$$

2. Prove that the optimal choice of ω is given by

$$
\omega_{\mathrm{opt}} = \frac{2}{\lambda_{1} + \lambda_{n}}.
$$

Prove also that

$$
\rho(G_{\omega}) = \left\{\begin{array}{ll} 1 - \omega \lambda_{1}, & \omega \leq \omega_{\mathrm{opt}} \\(\lambda_{n} - \lambda_{1}) /(\lambda_{n} + \lambda_{1}), & \omega = \omega_{\mathrm{opt}} \\ \omega \lambda_{n} - 1, & \omega \geq \omega_{\mathrm{opt}} \end{array} \right.
$$

where $\rho(G_{\omega})$ is the spectral radius of $G_{\omega}$

3 Prove that, if A is symmetric and positive definite, then

$$
\rho(G_{\omega_{\mathrm{opt}}}) = \frac{\kappa_{2}(A) - 1}{\kappa_{2}(A) + 1}
$$

where $\kappa_{2}(A)$ is the spectral condition number of A.

## Question II

Let the energy functional for $u(x) \in \mathbb{R} \(x \in[0, 1])$ be given as

$$
E[u] = \int_{0}^{1} \left[\frac{1}{2} | \partial_{x} u(x) |^{2} + \frac{1}{4 \varepsilon^{2}}(1 - | u |^{2})^{2} \right] dx, \quad 0 < \varepsilon \ll 1.
$$

Consider the dynamical equation (natural boundary condtions)

$$
\frac{d}{\mathrm{dt}} u(x, t) = - \frac{\delta E}{\delta u}[u(x, t)], \quad u(x, 0) = u_{0},
$$

where $u_{0}$ is a suficiently smooth function.

1. Show that $E[u(x, t)]$ is decreasing in t.

2. If initially $u_{0}(x) \in[- 1, 1]$ , show that $u(x, t) \in[- 1, 1]$ for all $t > 0$

3. Design a semi-discrete-in-time scheme such that the energy functional is decreasing for the discrete scheme.

Question III

Let $a_{k}(t), b_{k}(t) \in \mathbb{R} \(k = 1, 2, \ldots, n)$ satisfy the diferential equations:

$$
\frac{d}{\mathrm{dt}} a_{k}(t) = 2 \left(b_{k}^{2} - b_{k - 1}^{2}\right), \quad \frac{d}{\mathrm{dt}} b_{k}(t) = b_{k} \left(a_{k + 1} - a_{k}\right), \quad k = 1, 2, \dots, n,
$$

where $b_{0}(t) = b_{n}(t) = 0$ . Consider the $n \times n$ tri-diagonal matrix $L(a, b)$

$$
L(a, b) = \left[\begin{array}{ccccc} a_{1} & b_{1} & & & \\ b_{1} & a_{2} & & & 0 \\ & & \ddots & & \\ & & & & b_{n - 1} \\ 0 & & & b_{n - 1} & a_{n} \end{array} \right],
$$

show that:

1. The eigenvalues of $L(t) = L(a(t), b(t))$ ) are independent of t.

2. lim $b_{k}(t) = 0, k = 1, 2, \cdot \cdot \cdot, n - 1$ t→∞