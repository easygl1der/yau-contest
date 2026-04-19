# S.-T. Yau College Student Mathematics Contests 2015

# Applied Math. and Computational Math.

# Team (5 problems)

Problem 1. Consider the elliptic interface problem

$$
(a (x) u _ {x}) _ {x} = f, x \in (0, 1)
$$

with the Dirichlet boundary condition

$$
u (0) = u (1) = 0.
$$

Here, $f$ is a smooth function, the elliptic coefficient $a ( x )$ is discontinuous across an interface point $\xi$ , that is,

$$
a (x) = \left\{ \begin{array}{l l} a _ {0} & \mathrm {f o r} 0 <   x <   \xi \\ a _ {1} & \mathrm {f o r} \xi <   x <   1, \end{array} \right.
$$

$a _ { 0 } , a _ { 1 } \ > \ 0$ are positive constants, and $0 < \xi < 1$ is an interface point. Across the interface, we need to impose two jump conditions

$$
u (\xi -) = u (\xi +), a (\xi -) u _ {x} (\xi -) = a (\xi +) u _ {x} (\xi +).
$$

# Question:

1. (25%) Design a numerical method to solve this problem. The method should be at least first order. It is better to be high order (if your method is first order, you get 20% points).   
2. (75%) Prove your accuracy and convergence arguments (if your method is first order, you get 60% points).

Problem 2. Let $G$ be graph of a social network, where for each pair of members there is either no connection, or a positive or a negative one.

An unbalanced cycle in $G$ is a a cycle which have odd number of negative edges. Traversing along such a cycle with social rules such as friend of enemy are enemy would result in having a negative relation of one with himself!

A resigning in $G$ at a vertex $\boldsymbol { v }$ of $G$ is to switch the type (positive or negative) of all edges incident to $v$ .

Question: Show that one can switch all edge of $G$ into positive edges using a sequence resigning if and only if there is no unbalanced cycle in $G$ .

Problem 3. We consider particles which are able to produce new particles of like kind. A single particle forms the original, or zero, generation. Every particle has probability $p _ { k }$ $k = 0 , 1 , 2 , \ldots$ ) of creating exactly $k$ new particles; the direct descendants of the $n$ th generation form the $( n + 1 ) \mathrm { s t }$ generation. The particles of each generation act independently of each other.

Assume $0 ~ < ~ p _ { 0 } ~ < ~ 1$ . Let $\begin{array} { r } { P ( x ) = \sum _ { k \geq 0 } p _ { k } x ^ { k } } \end{array}$ and $\begin{array} { r } { \mu = P ^ { \prime } ( 1 ) = \sum _ { k \geq 0 } k p _ { k } } \end{array}$ be the expected number of direct descendants of one particle. Prove that if $\mu > 1$ , then the probability $x _ { n }$ that the process terminates at or before the $n$ th generation tends to the unique root $\sigma \in ( 0 , 1 )$ of equation $\sigma = P ( \sigma )$ .

Problem 4. (Isopermetric inequality). Consider a closed plane curve described by a parametric equation $( x ( t ) , y ( t ) ) , 0 \leq t \leq T$ with parameter $t$ oriented counterclockwise and $( x ( 0 ) , y ( 0 ) ) = ( x ( T ) , y ( T ) )$ .

(a): Show that the total length of the curve is given by

$$
L = \int_ {0} ^ {T} \sqrt {(x ^ {\prime} (t)) ^ {2} + (y ^ {\prime} (t)) ^ {2}} d t
$$

(b): Show that the total area enclosed by the curve is given by

$$
A = \frac {1}{2} \int_ {0} ^ {T} \left(x (t) y ^ {\prime} (t) - y (t) x ^ {\prime} (t)\right) d t
$$

(c): The classical iso-perimetric inequality states that for closed plane curves with a fixed length $L$ , circles have the largest enclosed area $A$ . Formulate this question into a variational problem.   
(d): Derive the Euler-Lagrange equation for the variational problem in (c).   
(e): Show that there are two constants $x _ { 0 }$ and $y _ { 0 }$ such that

$$
\left(x (t) - x _ {0}\right) ^ {2} + \left(y (t) - y _ {0}\right) ^ {2} \equiv r ^ {2}
$$

where $r = L / ( 2 \pi )$ . Explain your result.

Problem 5. Let $A \in \mathbb { R } ^ { n \times m }$ with rank $r < \operatorname* { m i n } ( m , n )$ . Let $A = U \Sigma V ^ { T }$ be the SVD of $A$ , with singular values $\sigma _ { 1 } \geq \sigma _ { 2 } \geq \cdot \cdot \cdot \geq \sigma _ { r } > 0$ .

(a) Show that, for every $\epsilon > 0$ , there is a full rank matrix $A _ { \epsilon } \in \mathbb { R } ^ { n \times m }$ such that $\vert \vert A - A _ { \epsilon } \vert \vert _ { 2 } = \epsilon$ .   
(b) Let $A _ { k } = U \Sigma _ { k } V ^ { T }$ where $\Sigma _ { k } = \operatorname { d i a g } ( \sigma _ { 1 } , \ldots , \sigma _ { k } , 0 , \ldots , 0 )$ and $1 \leq k \leq r - 1$ Show that $\operatorname { r a n k } ( A _ { k } ) = k$ and

$$
\sigma_ {k + 1} = \left| \left| A - A _ {k} \right| \right| _ {2} = \min  \left\{\left| \left| A - B \right| \right| _ {2} \quad \right| \quad \operatorname {r a n k} (B) \leq k \}
$$

(c) Assume that $r = \operatorname* { m i n } ( m , n )$ . Let $B \in \mathbb { R } ^ { n \times m }$ and assume that $| | A - B | | _ { 2 } < \sigma _ { r }$ . Show that $\operatorname { r a n k } ( B ) = r$ .