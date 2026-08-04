# PhD Qualification Exam in Applied Mathematics

## Spring, 2026

1. (10 points) Assume that locally the function $f \in C ^ { 2 } ( \mathbb { R } )$ has a unique zero x<sub>⋆</sub> with $f ^ { \prime } ( x _ { \star } ) \neq 0$ . Consider the iteration

$$
x _ {k + 1} = x _ {k} - \frac {[ f (x _ {k}) ] ^ {2}}{f (x _ {k} + f (x _ {k})) - f (x _ {k})}, k = 0, 1, \dots .
$$

Prove that $x _ { k } \to x _ { \star }$ , and estimate its order of local convergence.

2. (20 points) For any continuous function $f ,$ define $\langle f , g \rangle = \int _ { - 1 } ^ { 1 } f ( x ) g ( x )$ dx and $\| f \| _ { 2 } = { \sqrt { \langle f , f \rangle } }$ . Write $a _ { n } =$ ${ \frac { ( 2 n ) ! } { 2 ^ { n } ( n ! ) ^ { 2 } } } .$

Define the n-th monic Legendre polynomial by: $P _ { 0 } ( x ) = 1 , P _ { 1 } ( x ) = x , P _ { n + 1 } ( x ) = x P _ { n } ( x ) - \frac { n ^ { 2 } } { 4 n ^ { 2 } - 1 } P _ { n - 1 } ( x ) .$

(a) Compute $\langle P _ { n } , P _ { m } \rangle$ , for $m , n \in \mathbb { N }$

(b) Prove that $P _ { n }$ solves $\operatorname* { m i n } _ { \mathrm { \ p o l y n o m i a l \ } p } \quad \| p \| _ { 2 }$ and compute the minimal value.

(c) For $f \in C ^ { n + 1 } [ - 1 , 1 ]$ , choose the interpolation nodes $x _ { 0 } , x _ { 1 } , \ldots , x _ { n }$ as the $n + 1$ zeros of $P _ { n + 1 } ( x )$ , and denote its degree-n interpolation polynomial by $L _ { n }$ . Prove

$$
\| f - L _ {n} \| _ {2} \leq \frac {2 \| f ^ {(n + 1)} \| _ {2}}{(2 n + 3) a _ {n + 1} (n + 1) !}.
$$

(d) For $f \in C ^ { 2 n + 2 } [ - 1 , 1 ]$ , derive the Gauss quadrature formula o $I ( f ) = \int _ { - 1 } ^ { 1 } f ( x ) \mathrm { d } x \mathrm { f o r } n + 1$ quadrature nodes, written by $I _ { n + 1 } ( f )$ , and estimate its error $| I ( f ) - I _ { n + 1 } ( f ) |$

3. (20 points) Given $A \in \mathbb { R } ^ { l \times m } , B \in \mathbb { R } ^ { n \times p } , C \in \mathbb { R } ^ { l \times p }$ . Consider the problem $\operatorname* { m i n } _ { X } \| A X B - C \| _ { \mathrm { F } }$ , where $\lVert \cdot \rVert _ { \mathrm { F } }$ is the Frobenius norm of a matrix.

(a) Prove that the minimal value is $0 ,$ if and only if $\operatorname { r a n k } ( A ) = \operatorname { r a n k } \left( \left[ A \quad C \right] \right) , \operatorname { r a n k } ( B ) = \operatorname { r a n k } \left( \left[ B \right] \right)$

(b) Show that there exists a unique minimal point $X _ { \star } ,$ if and only if rank(A) = m, rank(B) = n.

(c) Propose a numerical method to compute the unique X in (b).

(d) Does $X _ { \star }$ also minimize $\| A X B - C \| _ { 2 } ?$ Why? Here $\lVert \cdot \rVert _ { 2 }$ is the spectral norm of a matrix.

4. (15 points) For the advection equation $u _ { t } + u _ { x } = 0$ , analyze the stability of the implicit schemes

$$
\mathrm{(a)} \frac {u _ {j} ^ {n + 1} - u _ {j} ^ {n}}{\tau} + \frac {u _ {j} ^ {n + 1} - u _ {j - 1} ^ {n + 1}}{h} = 0;
$$

$$
\mathrm{(b)} \frac {u _ {j} ^ {n + 1} - u _ {j} ^ {n}}{\tau} + \frac {u _ {j + 1} ^ {n + 1} - u _ {j} ^ {n + 1}}{h} = 0;
$$

$$
\mathrm{(c)} \frac {u _ {j} ^ {n + 1} - u _ {j} ^ {n}}{\tau} + \frac {u _ {j + 1} ^ {n + 1} - u _ {j - 1} ^ {n + 1}}{2 h} = 0.
$$

5. (15 points) Write and prove the maximum principle of the centered finite diference scheme for discretizing the equation

$$
u _ {x x} + u _ {y y} + d u _ {x} + e u _ {y} + f u = 0, \quad f <   0,
$$

under some suitable assumptions. Apply the maximum principle to show the stability of the backward Euler scheme for the parabolic equation

$$
u _ {t} - \left(u _ {x x} + u _ {y y} + d u _ {x} + e u _ {y} + f u\right) = 0, \quad (x, y) \in (0, 1) \times (0, 1),
$$

with homogeneous Dirichlet boundary conditions.

You can choose either 6 or 7 to answer. The points will be decided as max(6, 7).

6. (20 points) Consider the following system

$$
\ddot {x} - 2 x - x ^ {2} + x ^ {3} = 0.
$$

(a) (6 points) Find the static solutions to the system.

(b) (14 points) For suficiently small but nonzero ϵ, show that the orbit starting at $( x ( 0 ) , \dot { x } ( 0 ) ) = ( 2 + \epsilon , 0 )$ is closed in the phase space, i.e., x − x˙ plane. Find the approximation of the period of this orbit up to $O ( \epsilon ^ { 2 } )$ .

7. (20 points) The polar of $C \subseteq \mathbf { R } ^ { n }$ is defined as the set

$$
C ^ {\circ} = \left\{y \in \mathbf {R} ^ {n} \mid y ^ {T} x \leq 1 \text {   for   all   } x \in C \right\}.
$$

(a) (2 points) Show that $C ^ { \circ }$ is convex (even if C is not).

(b) (3 points) What is the polar of a cone?

(c) (3 points) What is the polar of the unit ball for a norm $\| \cdot \| ?$

(d) (4 points) What is the polar of the set $C = \{ x \mid \mathbf { 1 } ^ { T } x = 1 , x \succeq 0 \} \ ?$

(e) (8 points) Show that if C is closed and convex, with $0 \in C$ , then $\left( C ^ { \circ } \right) ^ { \circ } = C$