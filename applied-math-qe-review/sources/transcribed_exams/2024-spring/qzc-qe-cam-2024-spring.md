# QUALIFY EXAM FOR APPLIED MATHEMATICS

(1) (15 points) Suppose $k \leqslant n \leqslant m$ , and $A \in \mathbb { C } ^ { m \times n }$

• find a rank-k matrix X satsifying $\| A - X \| _ { 2 } \leqslant \| A - B \| _ { 2 }$ for any rank-k matrix $B .$ Here $\lVert \cdot \rVert _ { 2 }$ is the spectral norm.

• find a rank-k matrix X satsifying $\| A - X \| _ { \mathrm { F } } \leqslant \| A - B \| _ { \mathrm { F } }$ for any rank-k matrix $B .$ Here $\lVert \cdot \rVert _ { \mathrm { F } }$ is the Frobenius norm.

(2) (20 points) Consider the Gauss-Seidel iteration for solving the linear equation $A x = b$ for $A = [ a _ { i j } ] \in \mathbb { R } ^ { n \times n } , b = [ b _ { i } ] \in \mathbb { R } ^ { n }$ with $a _ { i i } \neq 0$ for $i = 1 , \ldots , n$

1: determine $\boldsymbol { x } ^ { ( 0 ) } \in \mathbb { R } ^ { n }$

2: for $k = 0 , 1 , 2 , \ldots { } \ \mathbf { d o }$

3: $\begin{array} { r } { x _ { i } ^ { ( k + 1 ) } = \frac { 1 } { a _ { i j } } ( b _ { i } - \sum _ { j = 1 } ^ { i - 1 } a _ { i j } x _ { j } ^ { ( k + 1 ) } - \sum _ { j = i + 1 } ^ { n } a _ { i j } x _ { j } ^ { ( k ) } ) \mathrm { ~ f o r ~ } i = 1 , 2 , \ldots , n . } \end{array}$

4: end for

• Write $x ^ { ( k ) } = [ x _ { i } ^ { ( k ) } ]$ and $A = D - L - U$ where $D , - L , - U$ are the diagonal, strictly lower triangular, strictly upper triangular parts of A respectively. Show that $x ^ { ( k + 1 ) } = ( D - L ) ^ { - 1 } U x ^ { ( k ) } + ( \bar { D } - L ) ^ { - 1 } \bar { b }$

• Prove that if A is diagonally dominant, then A is invertible, and the Gauss-Seidel iteration converges, namely lim ${ \mathfrak { i } } _ { k \to \infty } x ^ { ( k ) } = A ^ { - 1 } b$ for any $x ^ { ( 0 ) }$ . (A matrix A is called diagonally dominant, if $\begin{array} { r } { | a _ { i i } | > \sum _ { i \neq i } | a _ { i j } | } \end{array}$ for $i = 1 , \ldots , n . )$

• Prove that if A is symmetric and positive definite, then A is invertible, and the Gauss-Seidel iteration converges.

(3) (20 points) Given the Hilbert matrix $\begin{array} { r } { H _ { n } = \left[ \frac { 1 } { i + j - 1 } \right] _ { i , j = 1 , \dots , n } } \end{array}$ . Prove:

$H _ { n }$ is positive definite.

• the spectral radius $\rho ( H _ { n } )$ of $H _ { n }$ is strictly monotonically increasing with respect to n.

$\rho ( H _ { n } ) \to \pi { \mathrm { ~ a s ~ } } n \to \infty .$

(4) (10 points) Apply the following three-step method with a parameter $\theta \geqslant 0$ for solving the heat equation $u _ { t } - a ^ { 2 } u _ { x x } = 0$ (Cauchy or periodic problem):

$$
(1 + \theta) \frac {u _ {j} ^ {n + 1} - u _ {j} ^ {n}}{k} - \theta \frac {u _ {j} ^ {n} - u _ {j} ^ {n - 1}}{k} = a ^ {2} \frac {u _ {j + 1} ^ {n + 1} - 2 u _ {j} ^ {n + 1} + u _ {j - 1} ^ {n + 1}}{h ^ {2}}.
$$

Give its truncation error and stability. Particularly, give the value of θ such that the truncation error attains its highest order.

(5) (15 points) Denote the grid $I _ { h } = \{ x _ { j } \} _ { j = 0 } ^ { M } , x _ { 0 } < x _ { 1 } < . . . < x _ { M }$ . Set $u = \{ u _ { j } \} _ { j = 0 } ^ { M }$ as a grid function on $I _ { h }$ . Suppose

$$
L u _ {j} = - (a _ {j} u _ {j - 1} - b _ {j} u _ {j} + c _ {j} u _ {j + 1}) + q _ {j} u _ {j}, \quad j = 1, \ldots , M - 1,
$$

where $a _ { j } , b _ { j } , c _ { j } > 0 , q _ { j } \geqslant 0$ and $a _ { j } + c _ { j } \leqslant b _ { j }$

• Assume $L u _ { j } \leqslant 0$ for all $1 \leqslant j \leqslant M - 1$ . Show that $u _ { j }$ can’t attain positive maximum at inner points $( 1 \leqslant j \leqslant M - 1 )$ ) unless $u _ { j } \equiv C ;$

• Suppose $d _ { j } = b _ { j } - a _ { j } - c _ { j } + q _ { j } > 0 ( j = 1 , \dots , M - 1 )$ . Show the solution of the diference equation

$$
L u _ {j} = \varphi_ {j}, \quad j = 1, \ldots , M - 1; \qquad u _ {0} = u _ {M} = 0,
$$

satisfies $\begin{array} { r } { \| u \| _ { \infty } = \operatorname* { m a x } _ { j } | u _ { j } | \leqslant \operatorname* { m a x } _ { j } \frac { | \varphi _ { j } | } { d _ { j } } } \end{array}$

(6) (10 points) Let $S \subset \mathbb { R } ^ { n }$ be a non-empty closed convex set, $f \in { \mathcal { C } } ^ { 2 } ( S )$ is convex. For any $x ^ { 0 } \in S$ , define $L ( f ( x ^ { 0 } ) ) = \{ x \in S | f ( x ) \leq f ( x ^ { 0 } ) \}$ , if there exists some m $> 0$ such that

$$
d ^ {\top} \nabla^ {2} f (x) d \geq m \| d \| ^ {2}, \quad \forall x \in L (f (x ^ {0})), d \in \mathbb {R} ^ {n}.
$$

Prove that $L ( f ( x ^ { 0 } ) )$ is a bounded and closed convex set.

(7) (10 points) Given a linear programming (LP) :

$$
\max 3 x _ {1} + 2 x _ {2} + 1 5 x _ {3}
$$

$$
\mathrm{s.t.} x _ {1} + x _ {2} + x _ {3} \leq 1 2
$$

$$
2 x _ {1} + x _ {2} + 5 x _ {3} \leq 1 8,
$$

$$
x _ {1}, x _ {2}, x _ {3} \geq 0.
$$

• Write down the standard LP form.

• Compute the optimal solution and optimal value of the problem.