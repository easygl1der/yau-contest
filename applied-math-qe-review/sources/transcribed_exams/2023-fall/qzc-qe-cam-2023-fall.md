# Qualification Exam: Applied Math

## September, 2023

1. Consider the Newton’s method for finding a solution $x _ { * }$ to $f ( x ) = 0$ , where $f \in$ $C ^ { 2 } ( a , b ) , x _ { * } \in ( a , b )$

1: determine $x _ { 0 } \in ( a , b )$

2: for $k = 0 , 1 , 2 , \ldots$ do

3: $\begin{array} { r } { x _ { k + 1 } = x _ { k } - \frac { f ( x _ { k } ) } { f ^ { \prime } ( x _ { k } ) } . } \end{array}$

4: end for

(1). Prove that if $x _ { 0 }$ is suficiently close to $x _ { * }$ and $f ^ { \prime } ( x _ { * } ) \neq 0$ , then $\begin{array} { r } { \operatorname* { l i m } _ { k \to \infty } x _ { k } = x _ { * } } \end{array}$ and lim $\begin{array} { r } { \mathfrak { l } _ { k \to \infty } \frac { x _ { k + 1 } - x _ { * } } { ( x _ { k } - x _ { * } ) ^ { 2 } } = \frac { f ^ { \prime \prime } ( x _ { * } ) } { 2 f ^ { \prime } ( x _ { * } ) } } \end{array}$

(2). In practice sometimes the derivative is not easy to be obtained. As a result, a diference is used instead: $\begin{array} { r } { x _ { k + 1 } = x _ { k } - \frac { x _ { k } - x _ { k - 1 } } { f ( x _ { k } ) - f ( x _ { k - 1 } ) } f ( x _ { k } ) } \end{array}$ . Prove that if $x _ { 0 }$ is suficiently close to $x _ { * }$ , then $x _ { k } \to x _ { * }$ and lim $\begin{array} { r } { k \to \infty \ \frac { x _ { k + 1 } - x _ { * } } { ( x _ { k } - x _ { * } ) ( x _ { k - 1 } - x _ { * } ) } = \frac { f ^ { \prime \prime } ( x _ { * } ) } { 2 f ^ { \prime } ( x _ { * } ) } } \end{array}$

2. Consider the explicit shifted QR method for computing eigenvalues of a matrix $A \in \mathbb { C } ^ { n \times n }$

1: find an upper Hessenberg matrix $H _ { 0 }$ and a unitary matrix $U _ { 0 }$ such that $H _ { 0 } =$ $U _ { 0 } ^ { \mathrm { H } } A U _ { 0 }$

2: for $i = 0 , 1 , 2 , . . .$ . do

3: determine a scalar $\mu _ { k }$ .

4: compute QR factorization $Q _ { k } R _ { k } = H _ { k } - \mu _ { k } I .$

5: $H _ { k + 1 } = R _ { k } Q _ { k } + \mu _ { k } I .$

6: end for

(1). Prove that $H _ { i } , i = 1 , 2 , . .$ . are all upper Hessenberg matrices.

(2). Interpret the purpose to use $H _ { 0 }$ rather than A in the iteration.

(3). Suppose that A has n distinct eigenvalues and none of the shifts $\mu _ { i } , i \ =$ 1, 2, . . . is an eigenvalue of A. Prove that $H _ { i } , i = 0 , 1 , 2 , \ldots$ are unreduced upper Hessenberg matrices. (An upper Hessenberg matrix H is called unreduced, if $H _ { i + 1 , i } \neq 0$ for $i = 1 , \ldots , n - 1 .$ )

(4). Write $H _ { k } = \left[ \begin{array} { l l } { G _ { k } } & { u _ { k } } \\ { \varepsilon _ { k } e ^ { \mathrm { T } } } & { \alpha _ { k } } \end{array} \right]$ where $\alpha _ { k } , \varepsilon _ { k } \in \mathbb { C } , u _ { k } , e \in \mathbb { C } ^ { n - 1 }$ and $e = { \left[ \begin{array} { l } { 0 } \\ { \vdots } \\ { 0 } \\ { 1 } \end{array} \right] }$ . Suppose A has n distinct eigenvalues. Prove that $\lvert \varepsilon _ { k + 1 } \rvert \leq \rho _ { k } ^ { 2 } \lVert u _ { k } \rVert _ { 2 } \lvert \varepsilon _ { k } \rvert ^ { 2 } + \bar { \rho _ { k } } \lvert \bar { \alpha } _ { k } - \mu _ { k } \rvert \lvert \varepsilon _ { k } \rvert$ where $\rho _ { k } = \| ( G _ { k } - \mu _ { k } I ) ^ { - 1 } \| _ { 2 }$ , provided $\mu _ { k }$ is not an eigenvalue of $G _ { k }$

3. If p is a polynomial of degree n (on [−1, 1]), it is determined by its values on an $( n + 1 )$ −point grid on [−1, 1]. The derivative $p ^ { \prime } .$ , a polynomial of degree $( n - 1 )$ 2 is determined on the same grid. The (classical) diferentiation matrix is the $( n +$ $1 ) - \mathrm { b y } - ( n + 1 )$ matrix $D \stackrel { \cdot } { = } ( D _ { i j } ) \in \dot { \mathbb { R } } ^ { ( n + 1 ) \times ( n + 1 ) }$ that represents the linear map from the vector of values of $p$ to the vector of values of $p ^ { \prime } ,$ , namely:

$$
p ^ {\prime} (x _ {i}) = \sum_ {j = 0} ^ {n} D _ {i j} p (x _ {j}).
$$

(1). Prove that $D _ { i j } = l _ { j } ^ { \prime } ( x _ { i } )$ , where $l _ { j } ( x )$ is the j−th Lagrange basis function.

(2). If a Chebyshev grid $( x _ { j } = \cos ( j \pi / n ) , 0 \leq j \leq n )$ is adopted, derive explicit formulas for $D _ { i j }$

4. Consider a Runge-Kutta method for the ODE $y ^ { \prime } = f ( t , y ) \ ( f$ is Lipschitz continuous in y and uniform in t) with the following Butcher tableau:

$$
\begin{array}{c c c} 0 & 0 \\ 1 & 1 & 0 \\ \hline & 1 / 2 & 1 / 2 \end{array}
$$

(1). Rewrite the scheme in the form of $u _ { n + 1 } = u _ { n } + h F ( t _ { n } , u _ { n } , h ; f )$

(2). Assume that $f$ is suficiently smooth. Prove that this method is convergent and determine the order of convergence.

(3). What is the region of absolute stability of this method? Give a description that is as explicit as possible.

5. For the equation $u _ { t } + a u _ { x x x } = 0$ (a is a constant), applying the idea of the Lax-Friedrichs scheme, one can get the scheme

$$
u _ {m} ^ {n + 1} = \frac {1}{2} (u _ {m + 1} ^ {n} + u _ {m - 1} ^ {n}) - \frac {1}{2} a k h ^ {- 3} (u _ {m + 2} ^ {n} - 2 u _ {m + 1} ^ {n} + 2 u _ {m - 1} ^ {n} - u _ {m - 2} ^ {n}),
$$

where k and h represent the time step and mesh size, respectively.

(1). Give the leading order term of local trancation error.

(2). Analyze the stability of this scheme.

6. Consider the following linear programming problem

$$
\max _ {\mathbf {x}} \langle \mathbf {c}, \mathbf {x} \rangle \quad \text {s.t.} \quad A \mathbf {x} = \mathbf {b}, \mathbf {x} \geq 0,
$$

where $\mathbf { x } \in \mathbb { R } ^ { n } , 0 \leq \mathbf { b } \in \mathbb { R } ^ { m } , A \in \mathbb { R } ^ { m \times n }$ and $\mathbf { c } \in \mathbb { R } ^ { n }$ , A is a full rank matrix and $m < n$

(1) Prove that the basic feasible solutions are equivalent to the vertices of its feasible region.

(2) Write down the dual problem , and prove that when the optimal solution exists, the dual problem must also have an optimal solution, and the optimal objective values of these two problems are equal.

7. Consider the eigenvalue problem with $0 < \epsilon \ll 1$

$$
\begin{array}{l} u ^ {\prime \prime} + (\lambda + \epsilon f (x)) u = 0, \quad 0 <   x <   1 \\ u (0) = 0, \quad u ^ {\prime} (1) = 0. \end{array}
$$

where f is a given smooth function. Give the asymptotic expansion of λ such that the accuracy is $O ( \epsilon )$