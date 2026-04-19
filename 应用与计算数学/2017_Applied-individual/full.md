# S.-T. Yau College Student Mathematics Contests 2017

# Applied Math. and Computational Math. Individual (5 problems)

1. The Chebyshev polynomial of the first kind is defined on $[ - 1 , 1 ]$ by

$$
T _ {n} (x) = \cos (n \operatorname {a r c c o s} x).
$$

Prove: The envelope for the extremals of $T _ { n + 1 } ( x ) - T _ { n - 1 } ( x )$ forms an ellipse.

2. Consider a fixed point iteration

$$
x _ {n} = g \left(x _ {n - 1}\right),
$$

where $g : \mathbb { R } \to \mathbb { R }$ is a smooth function. Suppose this fixed point method does converge to a fixed point $x ^ { * }$ . The Steffensen algorithm is an acceleration method to find $x ^ { * }$ which reads

$$
\hat {x} _ {n} = x _ {n - 2} - \frac {\left(x _ {n - 1} - x _ {n - 2}\right) ^ {2}}{x _ {n} - 2 x _ {n - 1} + x _ {n - 2}}.
$$

or

$$
x _ {n + 1} = G \left(x _ {n}\right)
$$

where

$$
G (x) = x - \frac {(g (x) - x) ^ {2}}{g (g (x)) - 2 g (x) + x}.
$$

(a) Show that the Steffensen algorithm $\{ x _ { k } \}$ converges quadratically.   
(b) Can you extend this method to two dimensions?

3. We consider a piecewise smooth function

$$
f (x) = \left\{ \begin{array}{l l} f _ {1} (x), & \qquad x \leq 0, \\ f _ {2} (x), & \qquad x > 0 \end{array} \right.
$$

where $f _ { 1 } ( x )$ is a $C ^ { \infty }$ function on $( - \infty , 0 ]$ and $f _ { 2 } ( x )$ is a $C ^ { \infty }$ function on $[ 0 , \infty )$ , but $f _ { 1 } ( 0 ) \ne f _ { 2 } ( 0 )$ . Suppose $p ( x )$ is a $k$ -th degree polynomial $k \geq 1$ ) interpolating $f ( x )$ at $k + 1$ equally-spaced grid points $x _ { j }$ , $j = 0 , 1 , 2 , \cdots , k$ with $x _ { i } < 0 < x _ { i + 1 }$ for some $i$ between 0 and $k - 1$ . Prove that, when the grid size $h = x _ { j + 1 } - x _ { j }$ is small enough, $p ^ { \prime } ( x ) \neq 0$ for $x _ { i } \leq 0 \leq x _ { i + 1 }$ , that is, $p ( x )$ is monotone in the interval $[ x _ { i } , x _ { i + 1 } ]$ . (Hint: first prove the case when $f _ { 1 } ( x ) = c _ { 1 }$ , $f _ { 2 } ( x ) = c _ { 2 }$ and $c _ { 1 } \neq c _ { 2 }$ are two constants.)

4. Let $b \in \mathbb { R } ^ { n }$ . Suppose $A \in M _ { n \times n } ( \mathbb { R } )$ and $B \in M _ { n \times n } ( \mathbb { R } )$ are two $n \times n$ matrices. Let $A$ to be non-singular.

(a) Consider the iterative scheme: $A x ^ { k + 1 } = b - B x ^ { k }$

State and prove the necessary and sufficient condition for the iterative scheme to converge.

(b) Suppose the spectral radius of $A ^ { - 1 } B$ satisfies $\rho ( A ^ { - 1 } B ) = 0$ . Prove that the iterative scheme converges in $n$ iterations.   
(c) Consider the following iterative scheme:

$$
x ^ {(k + 1)} = \omega_ {1} x ^ {(k)} + \omega_ {2} \left(c _ {1} - M x ^ {(k)}\right) + \omega_ {3} \left(c _ {2} - M x ^ {(k)}\right) + \dots + \omega_ {k} \left(c _ {k - 1} - M x ^ {(k)}\right)
$$

where $M$ is symmetric and positive definite, $\omega _ { 1 } > 1$ , $\omega _ { 2 } , . . . , \omega _ { k } > 0$ and $c _ { 1 } , . . . , c _ { k - 1 } \in$ $\mathbb { R } ^ { n }$ . Deduce from (a) that the iterative scheme converges if and only if all eigenvalues of $M$ (denote it as $\lambda ( M )$ ) satisfies:

$$
(\omega_ {1} - 1) / \left(\sum_ {i = 2} ^ {k} \omega_ {i}\right) <   \lambda (M) <   (\omega_ {1} + 1) / \left(\sum_ {i = 2} ^ {k} \omega_ {i}\right).
$$

(d) Let $A$ be non-singular. Now, consider the following system of iterative scheme $( ^ { * } )$

$$
A x _ {1} ^ {(k + 1)} = b _ {1} - B x _ {2} ^ {(k)}, A x _ {2} ^ {(k + 1)} = b _ {2} - B x _ {1} ^ {(k)}
$$

Find and prove the necessary and sufficient condition for the iterative scheme $( ^ { * } )$ to converge.

For the iterative scheme $( ^ { * * } )$

$$
A x _ {1} ^ {(k + 1)} = b _ {1} - B x _ {2} ^ {(k)}, A x _ {2} ^ {(k + 1)} = b _ {2} - B x _ {1} ^ {(k + 1)}
$$

Find and prove the necessary and sufficient condition for the iterative scheme $( ^ { * * } )$ to converge. Compare the rate of convergence of the iterative schemes (*) and $( ^ { * * } )$ .

5. Consider the differential equation

$$
- u ^ {\prime \prime} + \alpha u = f, x \in (0, 1).
$$

Here, prime denotes for $d / d x$ and $\alpha$ is a constant. We consider a mixed boundary condition

$$
u (0) = 0, u ^ {\prime} (1) - b u (0) = 0.
$$

This equation is approximated by a standard finite difference method:

$$
\frac {- U _ {j - 1} + 2 U _ {j} - U _ {j + 1}}{h ^ {2}} + \alpha U _ {j} = f _ {j}, j = 1, \dots , N - 1.
$$

Here, $N$ is the number of grid points, $h = 1 / N$ is the mesh size, $U _ { j }$ is the approximate solution at $x _ { j } : = j h$ , and $f _ { j } = f ( x _ { j } )$ . The noundary condition is approximated by

$$
U _ {0} = 0, \frac {U _ {N} - U _ {N - 1}}{h} - b U _ {N} = 0.
$$

The resulting linear system is $A U = F$ with

$$
\left[ \begin{array}{c c c c c c} \beta & - 1 & 0 & \dots & & \\ - 1 & \beta & - 1 & \dots & & \\ & & & \ddots & & \\ & & & & - 1 & \beta \\ & & & & 0 & - 1 \end{array} \right] \left[ \begin{array}{c} U _ {1} \\ U _ {2} \\ \vdots \\ U _ {N - 1} \\ U _ {N} \end{array} \right] = \left[ \begin{array}{c} h ^ {2} f _ {1} \\ h ^ {2} f _ {2} \\ \vdots \\ h ^ {2} f _ {N - 1} \\ 0 \end{array} \right]
$$

where $\beta = 2 + \alpha h ^ { 2 }$

$$
u _ {t} + a u _ {x} = 0, a > 0.
$$

We discretize this PDE by For solving the following partial differential equation

(1) $u _ { t } + f ( u ) _ { x } = 0 , \qquad 0 \leq x \leq 1$

where $f ^ { \prime } ( u ) \geq 0$ , with periodic boundary condition, we can use the following semidiscrete upwind scheme

(2) $\frac { d } { d t } u _ { j } + \frac { f ( u _ { j } ) - f ( u _ { j - 1 } ) } { \Delta x } = 0 , \qquad j = 1 , 2 , \cdot \cdot \cdot , N ,$ f (uj ) − f (uj−1) = 0, ∆x

with periodic boundary condition

(3) $u _ { 0 } = u _ { N } ,$

where $u _ { j } = u _ { j } ( t )$ approximates $u ( x _ { j } , t )$ at the grid point $x = x _ { j } = j \Delta x$ , with $\textstyle \Delta x = { \frac { 1 } { N } }$ .

(a) Prove the following $L ^ { 2 }$ stability of the scheme

(4) ${ \frac { d } { d t } } E ( t ) \leq 0$

where $\begin{array} { r } { E ( t ) = \sum _ { j = 1 } ^ { N } | u _ { j } | ^ { 2 } \Delta x } \end{array}$

(b) Do you believe (4) is true for $\begin{array} { r } { E ( t ) = \sum _ { j = 1 } ^ { N } | u _ { j } | ^ { 2 p } \Delta x } \end{array}$ for arbitrary integer $p \geq 1$