# S.-T. Yau College Student Mathematics Contests 2023

# Computational and Applied Mathematics

Solve every problem.

1. Consider the forward and the centered finite difference formulas

$$
D _ {h} ^ {+} f \left(x _ {0}\right) = \frac {f \left(x _ {0} + h\right) - f \left(x _ {0}\right)}{h}, \tag {1}
$$

$$
D _ {h} ^ {0} f \left(x _ {0}\right) = \frac {f \left(x _ {0} + h\right) - f \left(x _ {0} - h\right)}{2 h}, \tag {2}
$$

to approximate the derivative of $f$ at a point $x _ { 0 }$ . Assume $f$ is a smooth function in a neighborhood of $x _ { 0 }$ containing the points $x _ { 0 } + h$ and $x _ { 0 } - h$ .

(a) Prove that $D _ { h } ^ { + } f ( x _ { 0 } )$ and $D _ { h } ^ { 0 } f ( x _ { 0 } )$ approximate $f ^ { \prime } ( x _ { 0 } )$ to $O ( h )$ and $O ( h ^ { 2 } )$ , respectively.   
(b) Derive an $O ( h ^ { 2 } )$ approximation to $f ^ { \prime } ( x _ { 0 } )$ from $D _ { h } ^ { + } f ( x _ { 0 } )$ by doing Richardson extrapolation.   
(c) Take $f ( x ) = \sin x$ and $x _ { 0 } = 0$ . Prove that both $D _ { h } ^ { + } f ( x _ { 0 } )$ and $D _ { h } ^ { 0 } f ( x _ { 0 } )$ converge quadratically to $f ^ { \prime } ( x _ { 0 } )$ as $h  0$ and that in fact they produce the same approximation to $f ^ { \prime } ( x _ { 0 } )$ in this particular case.

2. For functions defined on a closed interval $[ 0 , 1 ]$ , we want to compute the following definite integral,

$$
I [ f ] = \int_ {0} ^ {1} f (x) \log (1 / x) d x.
$$

Here we consider the weight function $\log ( 1 / x )$ , and denote $P _ { n } ( x )$ as the monic orthogonal polynomials for the corresponding weighted inner product.

(a) Let $P _ { 0 } = 1$ . Find $P _ { 1 } ( x )$ , and the corresponding node $x _ { 1 } ^ { 1 }$ and weight $\omega _ { 1 } ^ { 1 }$ for the 1-point Gaussian quadrature rule.   
(b) Derive a recursive formula for $P _ { n + 1 } ( x )$ using $P _ { n } ( x )$ and $P _ { n - 1 } ( x )$ .   
(c) Consider the normalized orthogonal polynomials $Q _ { n } ( x ) = P _ { n } ( x ) / \vert \vert P _ { n } \vert \vert$ , where

$$
| | P _ {n} | | = \sqrt {P _ {n} (x) ^ {2} \log (1 / x) d x}.
$$

Derive a recursive formula for $Q _ { n + 1 } ( x )$ using $Q _ { n } ( x )$ and $Q _ { n - 1 } ( x )$ .

(d) Use the above recursive formula to show that $x = \lambda$ is a node of the 4-point Gaussian quadrature if and only if it is an eigenvalue of a symmetric, tridiagonal matrix. Write out the form of the symmetric and tridiagonal matrix explicitly.

3. Let $A$ be a real $n \times n$ matrix with distinct eigenvalues such that

$$
\left| \lambda_ {1} \right| > \left| \lambda_ {2} \right| \geq \left| \lambda_ {3} \right| \geq \dots \geq \left| \lambda_ {n} \right| \geq 0,
$$

with corresponding eigenvectors $\{ v _ { j } \} _ { j = 1 } ^ { n }$ .

(a) Show that the power iteration

$$
z _ {m} = \frac {A ^ {m} z _ {0}}{| | A ^ {m} z _ {0} | | _ {\infty}} \longrightarrow \pm \frac {v _ {1}}{| | v _ {1} | | _ {\infty}}, \quad \forall z _ {0} \in \mathbb {R} ^ {n}.
$$

(b) Consider the following iteration with initial guess $x _ { 0 } = y _ { 0 } = 1$

$$
x _ {n + 1} = x _ {n} + y _ {n}, \quad y _ {n + 1} = x _ {n + 1} + x _ {n}.
$$

Show that $y _ { n } / x _ { n } \to { \sqrt { 2 } }$ as $n \to \infty$

4. Consider the initial value problem

$$
y ^ {\prime} = f (t, y), \quad 0 <   t \leq T. \tag {3}
$$

$$
y (0) = y _ {0}. \tag {4}
$$

Assume $f$ is continuous and Lipschitz in $y$ in $[ 0 , T ] \times ( - \infty , \infty )$ . Denote $y _ { n } \approx y ( t _ { n } )$ , $t _ { n } = n h$ , and $h = T / N$ , with $N$ a positive integer, and consider the one-step method

$$
y _ {n + 1} = y _ {n} + \alpha h f (t _ {n}, y _ {n}) + \beta h f (t _ {n} + \gamma h, y _ {n} + \gamma h f (t _ {n}, y _ {n})),
$$

where $\alpha$ , $\beta$ and $\gamma$ are real parameters.

(a) Prove that the method is consistent if and only if $\alpha + \beta = 1$ , and the order of the method can not exceed 2.   
(b) Suppose that a second-order method of the above form is applied to $f ( t , y ) = - \lambda y$ with $\lambda > 0$ , and the initial condition $y _ { 0 } = 1$ . Show that the sequence $( y _ { n } ) _ { n \geq 0 }$ is bounded if and only if $\begin{array} { r } { h \leq \frac { 2 } { \lambda } } \end{array}$ . Show further that for such $h$ ,

$$
| y (t _ {n}) - y _ {n} | \leq \frac {1}{6} \lambda^ {3} h ^ {2} t _ {n}, \quad n \geq 0.
$$

5. Let $u ( t , x )$ be the solution of the initial-boundary value problem

$$
u _ {t} = D u _ {x x}, \quad 0 <   x <   L, \quad 0 <   t \leq T, \tag {5}
$$

$$
u (0, x) = f (x) \tag {6}
$$

$$
u (t, 0) = u (t, L) = 0, \tag {7}
$$

where $L > 0$ and $D > 0$ . Consider the finite difference scheme

$$
\frac {u _ {j} ^ {n + 1} - u _ {j} ^ {n}}{\Delta t} = D \frac {u _ {j + 1} ^ {n} - 2 u _ {j} ^ {n} + u _ {j - 1} ^ {n}}{(\Delta x) ^ {2}}, \quad j = 1, \dots , M - 1, \quad n = 0, 1, \dots , N - 1 \tag {8}
$$

with $u _ { 0 } ^ { n } = u _ { M } ^ { n } = 0$ for all $n$ and $u _ { j } ^ { \mathrm { 0 } } = f ( j \Delta x )$ , $j = 0 , \ldots , M$ . Here $\Delta t = T / N$ and $\Delta x = L / M$ and $u _ { j } ^ { n } \approx u ( n \Delta t , j \Delta x )$ .

(a) Prove that (8) is consistent with (5).   
(b) Prove that if $\begin{array} { r } { \Delta t { } \leq \frac { 1 } { 2 D } ( \Delta x ) ^ { 2 } } \end{array}$ the finite difference scheme (8) is stable under the $l ^ { \infty }$ norm.   
(c) Prove that if $\begin{array} { r } { \Delta t { } \leq \frac { 1 } { 2 D } ( \Delta x ) ^ { 2 } } \end{array}$ the finite difference scheme (8) converges in the $l ^ { \infty }$ norm to the exact solution of (5)-(7).

6. Let $\psi ^ { \varepsilon } ( t , x )$ be the solution to the following Schr¨odinger equation:

$$
\mathrm {i} \varepsilon \frac {\partial \psi^ {\varepsilon}}{\partial t} = - \frac {\varepsilon^ {2}}{2} \nabla_ {x} ^ {2} \psi^ {\varepsilon} + V (x) \psi^ {\varepsilon}, x = (x _ {1}, \dots , x _ {n}) ^ {\mathrm {T}} \in \mathbb {R} ^ {n},
$$

where $\mathrm { i } = \sqrt { - 1 }$ , $\varepsilon \ll 1$ is a small positive real number (rescaled Planck constant), $\nabla _ { x } ^ { 2 } = \sum _ { j = 1 } ^ { n } \partial _ { x _ { j } } ^ { 2 }$ n ∂2xj , and $V ( x ) \in C ^ { \infty } ( \mathbb { R } ^ { n } )$ is the potential function.

Consider the WKB expansion

$$
\psi^ {\varepsilon} (t, x) = A (t, x) e ^ {\mathrm {i} \frac {S (t , x)}{\varepsilon}},
$$

(a) Derive equations for $A ( t , x )$ and $S ( t , x )$ by asymptotic expansion. (Here both $A ( t , x )$ and $S ( t , x )$ are real-valued functions, and do not depend on $\varepsilon$ .)   
(b) Define $u ( t , x ) = \nabla _ { x } S ( t , x ) \in \mathbb { R } ^ { n }$ . Derive an equation for $u ( t , x )$ . Suppose $u ( 0 , x ) \in$ $C ^ { \infty } ( \mathbb { R } ^ { n } )$ , will $u ( t , x )$ always be in $C ^ { \infty } ( \mathbb { R } ^ { n } )$ for all $t > 0$ ? Explain why.