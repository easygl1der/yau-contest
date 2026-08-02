## Question I

Let A be an n×n matrix with real and positive eigenvalues and b be a given vector. Consider the solution of $A x = b$ by the following Richardson’s iteration

$$
x ^ {(k + 1)} = (I - \omega A) x ^ {(k)} + \omega b
$$

where $\omega$ is a damping coeficient. Let $\lambda _ { 1 }$ and $\lambda _ { n }$ be the smallest and the largest eigenvalues of A. Let $G _ { \omega } = I - \omega A$

1. Prove that the Richardson’s iteration converges if and only if

$$
0 <   \omega <   \frac {2}{\lambda_ {n}}.
$$

2. Prove that the optimal choice of ω is given by

$$
\omega_ {\mathrm{opt}} = \frac {2}{\lambda_ {1} + \lambda_ {n}}.
$$

Prove also that

$$
\rho (G _ {\omega}) = \left\{ \begin{array}{l l} 1 - \omega \lambda_ {1}, & \omega \leq \omega_ {\mathrm{opt}} \\ (\lambda_ {n} - \lambda_ {1}) / (\lambda_ {n} + \lambda_ {1}), & \omega = \omega_ {\mathrm{opt}} \\ \omega \lambda_ {n} - 1, & \omega \geq \omega_ {\mathrm{opt}} \end{array} \right.
$$

where $\rho ( G _ { \omega } )$ is the spectral radius of $G _ { \omega }$

3 Prove that, if A is symmetric and positive definite, then

$$
\rho (G _ {\omega_ {\mathrm{opt}}}) = \frac {\kappa_ {2} (A) - 1}{\kappa_ {2} (A) + 1}
$$

where $\kappa _ { 2 } ( A )$ is the spectral condition number of A.

## Question II

Let the energy functional for $u ( x ) \in \mathbb { R } \ ( x \in [ 0 , 1 ] )$ be given as

$$
E [ u ] = \int_ {0} ^ {1} \left[ \frac {1}{2} | \partial_ {x} u (x) | ^ {2} + \frac {1}{4 \varepsilon^ {2}} (1 - | u | ^ {2}) ^ {2} \right] d x, \quad 0 <   \varepsilon \ll 1.
$$

Consider the dynamical equation (natural boundary condtions)

$$
\frac {\mathrm{d}}{\mathrm{dt}} u (x, t) = - \frac {\delta E}{\delta u} [ u (x, t) ], \quad u (x, 0) = u _ {0},
$$

where $u _ { 0 }$ is a suficiently smooth function.

1. Show that $E [ u ( x , t ) ]$ is decreasing in t.

2. If initially $u _ { 0 } ( x ) \in [ - 1 , 1 ]$ , show that $u ( x , t ) \in [ - 1 , 1 ]$ for all $t > 0$

3. Design a semi-discrete-in-time scheme such that the energy functional is decreasing for the discrete scheme.

Question III

Let $a _ { k } ( t ) , b _ { k } ( t ) \in \mathbb { R } \ ( k = 1 , 2 , \ldots , n )$ satisfy the diferential equations:

$$
\frac {\mathrm{d}}{\mathrm{dt}} a _ {k} (t) = 2 \left(b _ {k} ^ {2} - b _ {k - 1} ^ {2}\right), \quad \frac {\mathrm{d}}{\mathrm{dt}} b _ {k} (t) = b _ {k} \left(a _ {k + 1} - a _ {k}\right), \quad k = 1, 2, \dots , n,
$$

where $b _ { 0 } ( t ) = b _ { n } ( t ) = 0$ . Consider the $n \times n$ tri-diagonal matrix $L ( a , b )$

$$
L (a, b) = \left[ \begin{array}{c c c c c} a _ {1} & b _ {1} & & & \\ b _ {1} & a _ {2} & & & 0 \\ & & \ddots & & \\ & & & & b _ {n - 1} \\ 0 & & & b _ {n - 1} & a _ {n} \end{array} \right],
$$

show that:

1. The eigenvalues of $L ( t ) = L ( a ( t ) , b ( t ) )$ ) are independent of t.

2. lim $b _ { k } ( t ) = 0 , k = 1 , 2 , \cdot \cdot \cdot , n - 1$ t→∞