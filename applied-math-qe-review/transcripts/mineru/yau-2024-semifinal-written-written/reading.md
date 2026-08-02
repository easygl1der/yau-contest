## S.-T. Yau College Student Mathematics Contests 2024

## Computational and Applied Mathematics

1. Let $A \in \mathbb{R}^{n \times n}$ be a non-singular matrix. Let u, $v \in \mathbb{R}^{n}$ be column vectors. Define the rank 1 perturbation $\widehat{A} = A \overset{\vartriangle}{+} u \boldsymbol{v}^{T}$

(a) Derive a necessary and suficient condition for $\widehat{A}$ to be invertible.

(b) Let $x, \z$ and b be column vectors in $\mathbb{R}^{n}$ . Suppose one can solve $Az = b$ with ${\mathcal{O}}(n)$ floating-point operations (flops). Under the conditions derived $\mathrm{in(a)}$ , design an algorithm to solve ${\widehat{A}} x = b$ with ${\mathcal{O}}(n)$ flops, and provide justification for your answer.

2. Consider the integral

$$
\int_{0}^{\infty} f(x) dx
$$

where $f$ is continuous, $f^{\prime}(0) \neq 0$ , and $f(x)$ decays like $x^{- 1 - \alpha}$ with $\alpha > 0$ in the limit $x \to \infty$

(a) Suppose you apply the equispaced composite trapezoid rule with n subintervals to approximate

$$
\int_{0}^{L} f(x) dx.
$$

What is the asymptotic error formula for the error in the limit $n \infty$ with L fixed?

(b) Suppose you consider the quadrature from $\mathrm{(a)}$ to be an approximation to the full integral from 0 to ∞. How should L increase with n to optimize the asymptotic rate of total error decay? What is the rate of error decrease with this choice of L? 5

(c) Make the following change of variable $x ={\frac{L(1 + y)}{1 - y}}, y ={\frac{x - L}{x + L}}$ in the original integral to obtain

$$
\int_{- 1}^{1} F_{L}(y) dy.
$$

Suppose you apply the equispaced composite trapezoid rule; what is the asymptotic error formula for fixed $L ?$

(d) Depending on α, which method - domain truncation or change-of-variable - is preferable?

3. Consider the Chebyshev polynomial of the first kind

$$
T_{n}(x) = \cos(n \theta), \quad x = \cos(\theta), \quad x \in[- 1, 1].
$$

The Chebyshev polynomials of the second kind are defined as

$$
U_{n}(x) = \frac{1}{n + 1} T^{\prime}(x), \quad n \geq 0.
$$

(a) Derive a recursive formula for computing $U_{n}(x)$ for all $n \geq 0$

(b) Show that the Chebyshev polynomials of the second kind are orthogonal with respect to the inner product

$$
\langle f, g \rangle = \int_{- 1}^{1} f(x) g(x) \sqrt{1 - x^{2}} dx
$$

(c) Derive the 2-point Gaussian Quadrature rule for the integral

$$
\int_{- 1}^{1} f(x) \sqrt{1 - x^{2}} dx = \sum_{j = 1}^{2} w_{j} f(x_{j})
$$

4. Consider the boundary value problem

$$
- \frac{d}{dx} \left(a(x) \frac{du}{dx}\right) = f(x), \quad u(0) = u(1) = 0
$$

where $a(x) > \delta \geq 0$ is a bounded diferentiable function in [0, 1]. We assume that, although $a(x)$ is available, an expression for its derivative, ${\frac{da}{dx}}.$ , is not available.

(a) Using finite diferences and an equally spaced grid in [0, 1], $x_{l} = hl, l = 0, \ldots, n$ and $h = 1 / n$ , we discretize the ODE to obtain a linear system of equations, yielding an $O(h^{2})$ approximation of the ODE. After the application of the boundary conditions, the resulting coeficient matrix of the linear system is an $(n - 1) \times(n - 1)$ tridiagonal matrix.

Provide a derivation and write down the resulting linear system (by giving the expressions of the elements).

(b) Utilizing all the information provided, find a disc in $\mathbb{C},$ the smaller the better, that is guaranteed to contain all the eigenvalues of the linear system constructed in part (a).

5. (a) Verify that the PDE

$$
u_{t} = u_{xxx}
$$

is well posed as an initial value problem.

(b) Consider solving it numerically using the scheme

$$
{\frac{u(t + k, x) - u(t - k, x)}{2k}} ={\frac{- \frac{1}{2} u(x - 2h, t) + u(x - h, t) - u(x + h, t) + \frac{1}{2} u(x + 2h, t)}{h}}.
$$

Determine this scheme’s stability condition.

6. Consider the difusion equation

$$
\frac{\partial v}{\partial t} = \mu \frac{\partial^{2} v}{\partial x^{2}}, \quad v(x, 0) = \phi(x), \quad \int_{a}^{b} v(x, t) dx = 0
$$

with $x \in[a, b]$ and periodic boundary conditions. The solution is to be approximated using the central diference operator L for the 1D Laplacian.

$$
Lv_{m} = \frac{v_{m + 1} - 2v_{m} + v_{m - 1}}{h^{2}},
$$

and the following two finite diferent approximations, (i) Forward-Euler

$$
v_{n + 1} = v_{n} + \mu kLv_{n},\tag{1}
$$

and (ii) Crank-Nicolson

$$
v_{n + 1} = v_{n} + \mu k(Lv_{n} + Lv_{n + 1}).\tag{2}
$$

Throughout, consider $[a, b] =[0, 2 \pi]$ and the finite diference stencil to have periodic boundary conditions on the spatial lattice $[0, h, 2h, \ldots,(N - 1) h]$ where $h ={\frac{2 \pi}{N}}$ and N is even.

(a) Determine the order of accuracy of the central diference operator $\mathit{Lv}$ in approximating the second derivative $v_{xx}$

(b) Using $v_{m}^{n} = \sum_{l = 0}^{N - 1} \hat{v}_{l}^{n} \exp \left(- i \frac{2 \pi lm}{N} \right)$ give the updates $\hat{v}_{l}^{n + 1}$ in terms of $\hat{v}_{l}^{n}$ for each of the methods, including the case $l = 0$

(c) Give the solution for $ { v _ { m } } ^ { n }$ for each method when the initial condition is $\phi(m \Delta x) =$ $(- 1)^{m}$

(d) What are the stability constraints on the time step k for each of the methods, if any, in equations (1) and $(2) ?$ Show there are either no constraints or express them in the form $k \leq F(h, \mu)$