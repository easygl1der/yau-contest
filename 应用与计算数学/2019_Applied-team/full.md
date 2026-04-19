# S.-T. Yau College Student Mathematics Contests 2019

# Applied and Computational Math Team (5 problems)

1) (10 points)

Show that the quadrature formula $\int _ { - 1 } ^ { 1 } { \frac { f ( x ) } { \sqrt { 1 - x ^ { 2 } } } } d x = { \frac { \pi } { n } } \sum _ { k = 0 } ^ { n - 1 } f \left( \cos \pi { \frac { 2 k + 1 } { 2 n } } \right)$ is exact for all polynomials of degree up to and including $2 n - 1$ .

2) (15 pointes) Let $x = ( x _ { 0 } , \ldots , x _ { N - 1 } ) \in \mathbf { R } ^ { N }$ , $x \neq 0$ and $\hat { x }$ be its discrete Fourier transform, i.e.

$$
\hat {x} _ {w} = \frac {1}{\sqrt {N}} \sum_ {t = 0} ^ {N - 1} x _ {t} \exp (- 2 \pi i w t / N), w = 0, \dots , N - 1.
$$

Prove that $\| x \| _ { 0 } \| \hat { x } \| _ { 0 } \geqslant N$ where $\| x \| _ { 0 }$ denotes the number of nonzero entries in $x$ . (Hint: show that $\hat { x }$ can not have $\| x \| _ { 0 }$ consecutive zeros.)

3) (20 pointes)

Let $m \leqslant n$ . Consider the $( n + m ) \times ( n + m )$ real matrix defined by

$$
A = \left[ \begin{array}{c c} I & X \\ X ^ {\top} & O \end{array} \right],
$$

where $I$ is the $n \times n$ identity matrix, $X$ is a full-rank $n \times m$ matrix, $O$ is the $m \times m$ zero matrix.

(i) Show that $A$ is nonsingular.   
(ii) Find the eigenvalues of $A$ , some of which are in terms of the singular values of $X$   
(iii) Under what conditions on $X$ would the iteration

$$
x _ {n + 1} = x _ {n} - \left(A x _ {n} - b\right)
$$

converge to the solution of $A x = b$ for any $( n + m ) \times ( n + m )$ real vector b?

4) (25 pointes)

Let $f$ be a continuously differentiable convex function defined on $\mathbf { R } ^ { n }$ , i.e., $f : \mathbf { R } ^ { n }  \mathbf { R }$ is continuously differentiable and for any $x , y \in \mathbf { R } ^ { n }$ and any $\alpha \in ( 0 , 1 )$ , $f ( \alpha x + ( 1 - \alpha ) y ) \leq \alpha f ( x ) + ( 1 - \alpha ) f ( y )$ . Suppose that the gradient of $f$ is Lipschitz continuous, i.e., there exists a constant $L > 0$ such that

$$
\| \nabla f (x) - \nabla f (y) \| _ {2} \leq L \| x - y \| _ {2}.
$$

Prove the following inequalities:

$( i )$ . $\begin{array} { r } { f ( y ) \leq f ( x ) + ( \nabla f ( x ) ) ^ { T } ( y - x ) + \frac { L } { 2 } \| y - x \| _ { 2 } ^ { 2 } , } \end{array}$   
$( i i )$ . $\begin{array} { r } { f ( \boldsymbol { y } ) \ge f ( \boldsymbol { x } ) + ( \nabla f ( \boldsymbol { x } ) ) ^ { T } ( \boldsymbol { y } - \boldsymbol { x } ) + \frac { \sim } { \gamma _ { L } } \| \nabla f ( \boldsymbol { y } ) - \nabla f ( \boldsymbol { x } ) \| _ { 2 } ^ { 2 } , \quad \forall \boldsymbol { x } , \boldsymbol { y } \in \mathbf { R } ^ { n } ; } \end{array}$   
$( i i i )$ . $\begin{array} { r } { \frac { 1 } { L } \| \nabla f ( y ) - \nabla f ( x ) \| _ { 2 } ^ { 2 } \leq ( \nabla f ( y ) - \nabla f ( x ) ) ^ { \scriptscriptstyle { \cal A } } ( y - x ) , \quad \forall x , y \in { \bf R } ^ { n } . } \end{array}$

5) (30 pointes) Consider the following problems.

(i) Determine the order of St¨ormer’s method,

$$
y _ {n + 2} - 2 y _ {n + 1} + y _ {n} = h ^ {2} f \left(t _ {n + 1}, y _ {n + 1}\right), \quad n \geqslant 0,
$$

for solving the second order system of ODE’s

$$
y ^ {\prime \prime} = f (t, y), \quad t \geqslant 0,
$$

with the initial conditions $y ( 0 ) = y _ { 0 }$ and $y ^ { \prime } ( 0 ) = y _ { 0 } ^ { \prime }$ .

(ii) Using the second order central differences in space and St¨ormer’s method in time, construct a scheme to solve the wave equation,

$$
u _ {t t} = u _ {x x}.
$$

(iii) Determine the condition for its stability.