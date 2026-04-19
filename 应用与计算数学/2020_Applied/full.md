# Computational and Applied Mathematics

Solve every problem.

Problem 1. Let $f \in C ^ { k + 1 } [ - 1 , 1 ]$ and $[ - 1 , 1 ]$ be partitioned into subintervals $I _ { j } = [ ( j - 1 ) h , j h ]$ of width $h$ . Assume $p$ , , is a polynomial of degree $k$ which approximates $f$ in $I _ { j }$ with

$$
\max  _ {x \in I _ {j}} \left| p _ {j} (x) - f (x) \right| \leq C _ {0} h ^ {k + 1},
$$

where $C _ { 0 }$ is a constant independent of $j$ . Show that there exists an another constant $C$ , independent of $j$ , such that

$$
\max  _ {x \in I _ {j \pm 1}} \left| p _ {j} (x) - f (x) \right| \leq C h ^ {k + 1}.
$$

(as long as $I _ { j \pm 1 } \subset [ - 1 , 1 ]$ , of course).

Problem 2. Consider the iteration

$$
x _ {n + 1} = x _ {n} - \left(\frac {x _ {n} - x _ {0}}{f (x _ {n}) - f (x _ {0})}\right) f (x _ {n})
$$

for finding the roots of a two times continuous differentiable function $f ( x )$ . Assuming the method converges to a simple root $x ^ { * }$ , what is the rate of convergence? Justify your answer.

Problem 3. Suppose A is an $m \times m$ matrix with a complete set of orthonormal eigenvectors $\mathbf { q _ { 1 } , . . . , q _ { m } }$ and corresponding eigenvalues $\lambda _ { 1 } , \ldots , \lambda _ { m }$ . Assume that $\left| \lambda _ { 1 } \right| > \left| \lambda _ { 2 } \right| > \left| \lambda _ { 3 } \right|$ and $\lambda _ { j } \geq \lambda _ { j + 1 }$ ,for $j = 3 , \ldots , m$ λ , . .. Consider the power method $\mathbf { v } ^ { ( k ) } = \mathbf { A } \mathbf { v } ^ { ( k - 1 ) } / \lambda _ { 1 }$ λ >, with $\mathbf { v } ^ { ( 0 ) } = \alpha _ { 1 } \mathbf { q } _ { 1 } + \cdot \cdot \cdot + \alpha _ { m } \mathbf { q } _ { m }$ where $\alpha _ { 1 }$ , . . .and $\alpha _ { 2 }$ are both nonzero. Show that the sequence $\{ \mathbf { v } ^ { ( k ) } \} _ { k = 0 } ^ { \infty }$ αconverges linearly to $\alpha _ { 1 } \mathbf { q } _ { 1 }$ with α αasymptotic constant $C = | \lambda _ { 2 } / \lambda _ { 1 } |$ .

Problem 4. For the initial value problem $y ^ { \prime } = f ( t , y )$ $y ( 0 ) = y _ { 0 }$ on the interval $[ 0 , T ]$ , consider the implicit two-step method

$$
y _ {n + 1} = \frac {4}{3} y _ {n} - \frac {1}{3} y _ {n - 1} + \frac {2 h}{3} f \left(t _ {n + 1}, y _ {n + 1}\right),
$$

$$
y _ {1} = y _ {0} + h f \left(t _ {1}, y _ {0}\right),
$$

where $h$ is the step size and $t _ { n } = n h$ .

(a) What is the order of the accuracy of the scheme?   
(b) Check the stability of the scheme by analyzing the stability polynomial?   
(c) Find the stability region of the scheme.

Problem 5. Suppose the difference scheme $u ^ { n + 1 } = B u ^ { n }$ is stable, and $C ( \Delta t )$ is a bounded family of

operators. Show that the scheme

$$
u ^ {n + 1} = (B + \Delta t C (\Delta t)) u ^ {n}
$$

is stable.

Problem 6. Let $A$ be an $m \times m$ nonsingular matrix. Suppose $\begin{array} { r } { \operatorname* { i n f } _ { p _ { n } \in P ^ { n } } \left| | p _ { n } ( A ) | \right| = | | p ^ { * } ( A ) | | > 0 } \end{array}$ ${ \dot { P } } _ { n } \in P ^ { n }$ where $P ^ { n }$ denotes the set of all degree- $n$ monic polynomials:

$$
P ^ {n} = \left\{p: p \text {i s a p o l y n o m i a l o f d e g r e e} n, p (z) = z ^ {n} + \dots \right\}.
$$

Prove that $p ^ { * }$ is unique.