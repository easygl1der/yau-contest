# S.-T. Yau College Student Mathematics Contests 2026 Computational and Applied Mathematics (6 problems)

## Problem 1. Consider the equation

$$
\alpha \partial_ {t} u (t, x) + \beta \partial_ {x} u (t, x) - \gamma \partial_ {x x} u (t, x) = f (x),\tag{1}
$$

for $( t , x ) \in ( 0 , T ) \times ( 0 , 1 )$ , with $f \in L ^ { 2 } ( 0 , 1 ) , T > 0$ , boundary condition $u ( t , 0 ) = u ( t , 1 ) = 0$ for all $t > 0$ and initial condition $u ( 0 , x ) = 0$ . Parameters satisfy $\alpha > 0 , \beta \in \mathbb { R }$ and $\gamma > 0$ . Let $\mathcal { T } _ { h }$ be a uniform mesh partitioning (0, 1), i.e., a collection of intervals $[ i h , ( i + 1 ) h ]$ with $i = 0 , 1 , \ldots , N$ and $h = 1 / ( N + 1 )$

(a). Write the fully discrete variational formulation of (1) using the continuous piecewise linear finite element method (<sup>P</sup> Lagrange FEM) in space and implicit Euler method in time. Denoting the time step by τ and $t _ { i } = i \tau$ for all $i \in \mathbb N$

(b). Prove the $L ^ { 2 }$ stability estimate $\| u _ { h } ^ { n } \| \leq C \| f \|$ with a constant $C > 0$ independent of $h , \tau , n .$

(c). Let $\{ \phi _ { i } \} _ { 1 \leq i \leq N }$ be the global Lagrange shape functions associated with the nodes $x _ { i } : = i h$ for $i = 1 , \ldots , N$ . Denoting by $\begin{array} { r } { u _ { h } ^ { i } : = \sum _ { 1 < j < N } U _ { j } ^ { i } \phi _ { j } } \end{array}$ the approximation of u at $t _ { i }$ , write the algebraic linear system solved by $( U _ { 1 } ^ { i } , \dots , U _ { N } ^ { i } )$

Problem 2. Let $\Omega \subset \mathbb { R } ^ { d }$ be a bounded domain, $d \leq 3$ . Consider the functional $J : H _ { 0 } ^ { 1 } ( \Omega ) \to \mathbb { R } \mathrm { : }$ :

$$
J (u) = \int_ {\Omega} \left(\frac {1}{2} | \nabla u (x) | ^ {2} + \frac {1}{4} u (x) ^ {4} - f (x) u (x)\right) d x,
$$

where $f \in L ^ { 2 } ( \Omega )$

(a). Compute the Fr´echet derivative (gradient) $\nabla J ( u )$ and the second Fr´echet derivative (Hessian) $\nabla ^ { 2 } J ( u )$ . Prove that J is strictly convex.

(b). Write the Newton’s method for finding the minimizer $u ^ { * }$ of $J ( u )$ . Assuming the initial guess $u ^ { 0 }$ is suficiently close to the solution $u ^ { * }$ , prove the second order convergence of the Newton’s method: there exists $C > 0$ such that $\| u _ { k + 1 } - u ^ { * } \| _ { H ^ { 1 } } \leq C \| u _ { k } - u ^ { * } \| _ { H ^ { 1 } } ^ { 2 }$

(c). Let $s _ { k } = u _ { k + 1 } - u _ { k }$ and $y _ { k } = \nabla J ( u _ { k + 1 } ) - \nabla J ( u _ { k } )$ . A Quasi-Newton method resorts to an approximate Hessian $B _ { k + 1 }$ satisfying the secant equation: $B _ { k + 1 } s _ { k } = y _ { k }$ . A BFGS update of $B _ { k + 1 }$ is

$$
B _ {k + 1} v = B _ {k} v - \frac {\langle B _ {k} s _ {k} , v \rangle}{\langle B _ {k} s _ {k} , s _ {k} \rangle} B _ {k} s _ {k} + \frac {\langle y _ {k} , v \rangle}{\langle y _ {k} , s _ {k} \rangle} y _ {k},
$$

for any test function $v \in H _ { 0 } ^ { 1 } ( \Omega )$ . Assuming $B _ { k }$ is positive definite, prove that above BFGS update is well-defined.

Problem 3. Consider the initial value problem over $\mathbb { R } ^ { N }$ in the form

$$
x ^ {\prime} = f (t, x) \quad x (0) = x _ {0} \in \mathbb {R} ^ {N},
$$

where $f : [ 0 , T ] \times \mathbb { R } ^ { N }  \mathbb { R } ^ { N }$ is smooth. Consider the family of one-step methods

$$
x _ {n + 1} = x _ {n} + (1 - b) h f \left(t _ {n}, x _ {n}\right) + b h f \left(t _ {n + 1}, x _ {n + 1}\right),\tag{2}
$$

where $h = t _ { n + 1 } - t _ { n }$ for any $n \geq 0$ is a uniform step size and $b \in [ 0 , 1 ]$ is a constant.

(a). Find the value of b so that the local truncation error is $\mathcal { O } ( h ^ { 3 } )$ .

(b). Apply the method (2) to $x ^ { \prime } = \lambda x , x ( 0 ) = x _ { 0 } \in \mathbb { R }$ . Find the function $g ( \cdot )$ such that $x _ { n } = g ( h \lambda ) ^ { n } x _ { 0 }$

(c). Determine the values of b so that this method is A-stable.

Problem 4. Let A be an invertible $N \times N$ matrix. The shifted QR iteration for a given sequence of shifts $\left\{ \sigma _ { n } \right\}$ is defined by

$$
A _ {0} = A, \quad A _ {n} - \sigma_ {n} I _ {N} = Q _ {n} R _ {n}, \quad A _ {n + 1} = R _ {n} Q _ {n} + \sigma_ {n} I _ {N},
$$

where $I _ { N }$ is the $N \times N$ identity matrix, $Q _ { n }$ is orthogonal and $R _ { n }$ is upper triangular with positive diagonal entries.

(a). Prove if no $\sigma _ { n }$ is an eigenvalue of A then the sequences $\{ A _ { n } \} , \{ Q _ { n } \}$ and $\{ R _ { n } \}$ are uniquely defined and satisfy

$$
A _ {n + 1} = Q _ {n} ^ {T} A _ {n} Q _ {n}, \quad A _ {n + 1} = R _ {n} A _ {n} (R _ {n}) ^ {- 1}.
$$

(b). Suppose A is a symmetric $2 \times 2$ matrix with eigenvalues $\lambda _ { 1 }$ and $\lambda _ { 2 }$ . Let $\sigma _ { 0 } = \lambda _ { 1 }$ . Find $A _ { 1 }$

(c). Let $\hat { Q } _ { n } = Q _ { 0 } \ldots Q _ { n - 1 }$ and $\hat { R } _ { n } = R _ { n - 1 } . . . R _ { 0 }$ for $n \geq 1$ . Prove $\begin{array} { r } { \hat { Q } _ { k + 1 } \hat { R } _ { k + 1 } = \prod _ { i = 0 } ^ { k } ( A - } \end{array}$ $\sigma _ { i } I _ { N } )$

Problem 5. Let $A \in \mathbb { R } ^ { n \times n }$ be an n by n real matrix and $\sigma _ { i } ( A )$ be its i-th largest singular value. A vector $x \in \mathbb { R } ^ { n }$ such that $A x = x$ is called a fixed point of A.

(a). Assume $\sigma _ { 1 } ( A ) \leq 1$ , show that every fixed point of A is a fixed point of its transpose $A ^ { T }$

(b). Consider $A = { \bigg \lceil } 1 { \pmod { 1 } }$ to verify that the assertion in (a) is not generally true without assuming $\sigma _ { 1 } ( A ) ^ { - } \leq 1$

(c). Assume $A A ^ { T } = A ^ { T } A$ , show that every fixed point of A is a fixed point of its transpose $A ^ { T }$

Problem 6. Let the subdiferential of a convex function $f : \mathbb { R } ^ { n }  \mathbb { R } \cup \{ + \infty \}$ at a point x be denoted by $\partial f ( x )$ . Recall that a vector $x ^ { * } \in \mathbb { R } ^ { n }$ is a subgradient of $f$ at x if it satisfies:

$$
f (z) \geq f (x) + \langle x ^ {*}, z - x \rangle , \quad \forall z \in \mathbb {R} ^ {n}.
$$

Namely, $\partial f ( x ) = \{ x ^ { * } : f ( z ) \geq f ( x ) + \langle x ^ { * } , z - x \rangle , \forall z \in \mathbb { R } ^ { n } \}$ . Here, $\langle x , y \rangle = x ^ { T } y$ for any vectors x and y in <sup>Rn</sup>. We assume $n \geq 2$ (the $n = 1$ case is trivial).

(a). Let $f : \mathbb { R } ^ { n }  \mathbb { R }$ be defined by

$$
f (x) = \max _ {i = 1, \dots , n} x _ {i}, \quad x = (x _ {1}, \dots , x _ {n}) ^ {T} \in \mathbb {R} ^ {n}.
$$

Compute the subdiferential $\partial f ( 0 )$

(b). Let

$$
g (x) = \max _ {i = 1, \dots , n} x _ {i} + \delta_ {\mathbb {R} _ {+} ^ {n}} (x),
$$

where $\delta _ { \mathbb { R } _ { ~ 1 } ^ { n } }$ is the indicator function of the non-negative orthant $\mathbb { R } _ { + } ^ { n } \ ( \mathrm { i . e . , } \ \delta _ { \mathbb { R } _ { + } ^ { n } } ( x ) = 0$ if $x \geq 0 .$ , and $+ \infty$ otherwise). Show that

$$
\partial g (0) = \partial f (0) - \mathbb {R} _ {+} ^ {n}.
$$

[Here, one may use the fact that $\partial g ( x ) = \partial f ( x ) + \partial \delta _ { \mathbb { R } _ { + } ^ { n } } ( x ) \ \mathrm { f o r } \ g ( x ) = f ( x ) + \delta _ { \mathbb { R } _ { + } ^ { n } } ( x ) . \mathrm { \ }$