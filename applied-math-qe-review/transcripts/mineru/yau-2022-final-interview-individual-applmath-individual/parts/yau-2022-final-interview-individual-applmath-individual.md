# Oral Exam, Applied and Computational Mathematics

## Question I

Consider the Allen-Cahn equation for $u : = u ( x , t ) \in \mathbb { R }$ (natural boundary conditions)

$$
\partial_ {t} u = \partial_ {x x} u + u (1 - u ^ {2}), \quad u (x, 0) = u _ {0} (x), \quad x \in (0, 1), \quad t > 0,
$$

where $u _ { 0 }$ is a suficiently smooth function.

1. Denote the energy functional as $E ( u )$

$$
E (u (\cdot , t)) = \int_ {0} ^ {1} \left(\frac {1}{2} | \partial_ {x} u (x, t) | ^ {2} + \frac {1}{4} (u (x, t) - 1) ^ {2}\right) d x.
$$

Show $E ( u ( \cdot , t ) )$ is a decreasing function respect to t.

2. Consider a semi-discrete-in-time scheme

$$
\frac {u ^ {n + 1} - u ^ {n}}{\tau} = \partial_ {x x} u ^ {n + 1} - (u ^ {n + 1}) ^ {3} + u ^ {n},\tag{1}
$$

where $u ^ { 0 } = u _ { 0 }$ and $u ^ { n }$ is the numerical approximation of $u ( \cdot , t _ { n } )$ with $t _ { n } = n \tau \ ( \tau > 0$ is the time step size, $n = 0 , 1 , 2 , \cdots )$ . Show that the scheme is energy stable, i.e. $E ( u ^ { n + 1 } ) \leq E ( u ^ { n } ) \ ( n = 0 , 1 , 2 , \cdot \cdot \cdot )$

3. For given $u ^ { n }$ , prove that (1) admits a unique solution $u ^ { n + 1 }$ at each time step.

## Question II

For an integer $n \geq 1$ , consider the equation

$$
f (x) = 0, f (x) = x ^ {n + 1} - b ^ {n} x + a b ^ {n}, a > 0, b > 0.
$$

(a) Prove that the equation has exactly two distinct positive roots if and only if

$$
a <   \frac {n}{(n + 1) ^ {1 + \frac {1}{n}}} b.
$$

(b) Assuming that the condition in (a) holds, show that Newton’s method converges to the smaller positive root, when started at $x _ { 0 } = a$ , and to the larger one, when started at $x _ { 0 } = b$

## Question III

1. Consider a non-singular tridiagonal $n \times n$ matrix given by:

$$
A = \left[ \begin{array}{c c c c c} a _ {1} & b _ {1} & & & \\ c _ {1} & a _ {2} & b _ {2} & & \\ & c _ {2} & a _ {3} & \ddots & \\ & & \ddots & \ddots & b _ {n - 1} \\ & & & c _ {n - 1} & a _ {n} \end{array} \right]
$$

with no zero on all three diagonals. Denote the strictly lower triangular, diagonal, strictly upper triangular of A by $L , D , U$ respectively.

(a) Let $B _ { J } = I _ { n } - D ^ { - 1 } A$ , and $p _ { B _ { J } } ( \lambda )$ be the characteristic polynomial of $B _ { J }$ . Also, let $B _ { G S } = - ( L + D ) ^ { - 1 } U$ , and $p _ { B _ { G S } } ( \lambda )$ be the charateristic polynomial of $B _ { G S }$ . Prove that

$$
p _ {B _ {J}} (\lambda) = \det (- D ^ {- 1}) \det (L + \lambda D + U) \mathrm{and}
$$

$$
p _ {B _ {G S}} (\lambda) = \det (- (L + D) ^ {- 1}) \det (\lambda L + \lambda D + U).
$$

(b) Prove that

$$
\det (\lambda^ {2} L + \lambda^ {2} D + U) = \lambda^ {n} \det (L + \lambda D + U).
$$

(c) Using part (a) and (b), prove that

$$
\rho (B _ {G S}) = \rho (B _ {J}) ^ {2},
$$

where $\rho ( B _ { G S } )$ and $\rho ( B _ { J }$ are the spectral radii of $B _ { G S }$ and $B _ { J }$ respectively. Hence, determine whether Jacobi or Gauss-Seidel methods to solve $A \mathbf { x } =$ b converges faster if they both converge. Please explain your answers with details.