# Applied Math. and Computational Math. Individual

Please solve as many problems as you can!

1. (20 pts) Ming Antu (1692-1763) is one of the greatest Chinese/Mongolian mathematicians. In the 1730s, he first established and used what was later to be known as Catalan numbers (Euler (1707-1763) rediscovered them around 1756; Belgian mathematician Eugene Catalan (1814- 1894) “rediscovered” them again in 1838),

$$
c _ {n} = \frac {1}{n + 1} \binom {2 n} {n}, \quad n = 0, 1, 2, \dots
$$

and Ming Antu derived the following half-angle formula in 1730:

$$
\sin^ {2} \frac {\theta}{2} = \sum_ {n = 1} ^ {\infty} c _ {n - 1} \left(\frac {\sin \theta}{2}\right) ^ {2 n}
$$

Prove this formula.

Hint: you may use generating function

$$
F (z) = \sum_ {n = 0} ^ {\infty} c _ {n} z ^ {n}
$$

and show that $\begin{array} { r } { \sum _ { m + k = n } c _ { m } c _ { k } = c _ { n + 1 } } \end{array}$ and then show $z F ( z ) ^ { 2 } = F ( z ) - 1$

2. Many algorithms, including polynomial factorisation in finite fields, require to compute gc $\operatorname { d } ( f ( X ) , X ^ { N } - 1 )$ for a polynomial $f$ of reasonably small degree n and a binomial $X ^ { N } - 1$ of very large degree $N$ . Since $N$ is very large the direct application of the Euclid algorithm is very inefficient.

Questions:

(i) (10 pts) Suggest a more efficient approach the direct computation of $\operatorname* { g c d } ( f ( X ) , X ^ { N } - 1 )$ via the Euclid algorithm.   
(ii) (10 pts) Generalise it to $\operatorname* { g c d } ( f ( X ) , A _ { 1 } X ^ { N _ { 1 } } + . . . + A _ { m } X ^ { N _ { m } } +$ $A _ { m + 1 }$ ).

Hint: If for three polynomials $f$ , $g$ and $h$ we have $g \equiv h$ (mod $f$ ) then

$$
\operatorname * {g c d} (f, g) = \operatorname * {g c d} (f, h).
$$

3. For solving the following partial differential equation

$$
u _ {t} + f (u) _ {x} = 0, \quad 0 \leq x \leq 1 \tag {1}
$$

where $f ^ { \prime } ( u ) \geq 0$ , with periodic boundary condition, we can use the following semi-discrete upwind scheme

$$
\frac {d}{d t} u _ {j} + \frac {f \left(u _ {j}\right) - f \left(u _ {j - 1}\right)}{\Delta x} = 0, \quad j = 1, 2, \dots , N, \tag {2}
$$

with periodic boundary condition

$$
u _ {0} = u _ {N}, \tag {3}
$$

where $u _ { j } = u _ { j } ( t )$ approximates $u ( x _ { j } , t )$ at the grid point $x = x _ { j } = j \Delta x$ , with $\textstyle \Delta x = { \frac { 1 } { N } }$ .

(i) (15 pts) Prove the following $L ^ { 2 }$ stability of the scheme

$$
\frac {d}{d t} E (t) \leq 0 \tag {4}
$$

where $\begin{array} { r } { E ( t ) = \sum _ { j = 1 } ^ { N } | u _ { j } | ^ { 2 } \Delta x } \end{array}$

(ii) (15 pts) Do you believe (4) is true for $\begin{array} { r } { E ( t ) = \sum _ { j = 1 } ^ { N } | u _ { j } | ^ { 2 p } \Delta x } \end{array}$ for arbitrary integer $p \geq 1$ ? If yes, prove the result. If not, give a counter example.

4. Let $A$ be an $n \times n$ matrix with real and positive eigenvalues and $b$ be a given vector. Consider the solution of $A x = b$ by the following Richardson’s iteration

$$
x ^ {(k + 1)} = (I - \omega A) x ^ {(k)} + \omega b
$$

where $\omega$ is a damping coefficient. Let $\lambda _ { 1 }$ and $\lambda _ { n }$ be the smallest and the largest eigenvalues of $A$ . Let $G _ { \omega } = I - \omega A$ .

(i) (4 points) Prove that the Richardson’s iteration converges if and only if

$$
0 <   \omega <   \frac {2}{\lambda_ {n}}.
$$

(ii) (8 points) Prove that the optimal choice of $\omega$ is given by

$$
\omega_ {\mathrm {o p t}} = \frac {2}{\lambda_ {1} + \lambda_ {n}}.
$$

Prove also that

$$
\rho (G _ {\omega}) = \left\{ \begin{array}{l l} 1 - \omega \lambda_ {1} & \quad \omega \leq \omega_ {\mathrm {o p t}} \\ (\lambda_ {n} - \lambda_ {1}) / (\lambda_ {n} + \lambda_ {1}) & \quad \omega = \omega_ {\mathrm {o p t}} \\ \omega \lambda_ {n} - 1 & \quad \omega \geq \omega_ {\mathrm {o p t}} \end{array} \right.
$$

where $\rho ( G _ { \omega } )$ is the spectral radius of $G _ { \omega }$ .

(iii) (8 points) Prove that, if $A$ is symmetric and positive definite, then

$$
\rho (G _ {\omega_ {\mathrm {o p t}}}) = \frac {\kappa_ {2} (A) - 1}{\kappa_ {2} (A) + 1}
$$

where $\kappa _ { 2 } ( A )$ is the spectral condition number of $A$ .

5. (10 pts) For solving the following heat equation on interval

$$
u _ {t} = u _ {x x}, \quad 0 \leq x \leq 1 \tag {5}
$$

with boundary condition

$$
u (0) = u _ {0}, \quad u (1) = u _ {1}, \tag {6}
$$

we first discretize the interval $\lfloor 0 , 1 \rfloor$ into $N$ subintervals uniformly, that is, the mesh size $h = 1 / N$ . We choose a temporal step size $k$ and approximate the solution $u ( j h , n k )$ by $U _ { j } ^ { n }$ , $j = 1 , . . . , N - 1$ , $n = 0 , 1 , 2 , \ldots$ . Using the backward Euler method in time and central finite difference in space, the discrete function $U _ { j } ^ { n }$ satisfies:

$$
U _ {j} ^ {n + 1} - U _ {j} ^ {n} = \lambda \left(U _ {j - 1} ^ {n + 1} - 2 U _ {j} ^ {n + 1} + U _ {j + 1} ^ {n + 1}\right), \quad j = 1, \dots , N - 1, \tag {7}
$$

where $\lambda = k / h ^ { 2 }$ , and

$$
U _ {0} ^ {n + 1} = u _ {0}, U _ {N} ^ {n + 1} = u _ {1}.
$$

Show that

$$
\begin{array}{l} \frac {1}{2} \sum_ {j = 1} ^ {N - 1} \left(\left(U _ {j} ^ {n + 1}\right) ^ {2} - \left(U _ {j} ^ {n}\right) ^ {2}\right) \leq - \lambda \sum_ {j = 1} ^ {N - 2} \left(U _ {j + 1} ^ {n + 1} - U _ {j} ^ {n + 1}\right) ^ {2} \\ - \frac {\lambda}{2} \left(\left(U _ {1} ^ {n + 1}\right) ^ {2} + \left(U _ {N - 1} ^ {n + 1}\right) ^ {2}\right) + \frac {\lambda}{2} \left(u _ {0} ^ {2} + u _ {1} ^ {2}\right) \tag {8} \\ \end{array}
$$