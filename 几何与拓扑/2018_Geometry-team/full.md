S.-T. Yau College Student Mathematics Contests 2018

# Analysis and Differential Equations Team

Please solve the following 5 problems.

1. Suppose $\{ f _ { n } \} _ { n = 1 } ^ { \infty } \in L ^ { 2 } ( \mathbf { R } )$ is a sequence that converges to 0 in the $L ^ { 2 }$ norm .

Prove that there exists a subsequence $\left\{ { { f } _ { { { n } _ { k } } } } \right\}$ such that $f _ { n _ { k } }  0$ almost everywhere.

2. Let $\begin{array} { r } { \hat { f } ( \xi ) = \int e ^ { - i x \xi } f ( x ) d x } \end{array}$ be the Fourier transform on Schwartz function $f \in S ( \mathbf { R } )$ . Suppose $f \in S ( \mathbf { R } )$ satisfies $f ( 2 \pi n ) = 0$ and ${ \hat { f } } ( n ) = 0$ for all integers $n$ . Prove that $f = 0$ .

3. If $f$ is integrable on $\mathbf { R } ^ { d }$ , then

$$
\lim _ {m (B) \to 0, x \in B} \frac {1}{m (B)} \int_ {B} f (y) d y = f (x),
$$

for a.e. $x , B$ is an open ball centered at $x$ .

4. Let $C [ 0 , 1 ] = \{ f : [ 0 , 1 ] \to \mathbf { R } |$ $f$ is continuous} be the space of continuous function on $[ 0 , 1 ]$ . Let $\begin{array} { r } { \rho ( f , g ) = \int _ { 0 } ^ { 1 } | f ( x ) - g ( x ) | d x } \end{array}$ be a metric on $[ 0 , 1 ]$ .

Show that $( C [ 0 , 1 ] , \rho )$ is not a complete metric vector space.

Construct a complete metric vector space $( W , { \widetilde { \rho } } )$ such that $i : ( C [ 0 , 1 ] , \rho ) \hookrightarrow ( W , \widetilde { \rho } )$ is an isometric embedding such that $\widetilde { \rho } | _ { C [ 0 , 1 ] } = \rho$ , ${ \overline { { C [ 0 , 1 ] } } } = W$ .

5. Let $\Omega$ be a simply connected domain in $\mathbf { C }$ . Consider a point $z _ { 0 } \in \Omega$ and solve the Dirichlet problem in $\Omega$ with the boundary values $\log | \zeta - z _ { 0 } |$ . The solution is denoted by $G ( z , z _ { 0 } )$ and let $g ( z , z _ { 0 } ) = G ( z , z _ { 0 } ) - \log | z - z _ { 0 } |$ . Let $w = f ( z ) : \Omega \to D _ { 1 } = \{ z | | z | < 1 \}$ be the one to one surjective conformal mapping with $f ( z _ { 0 } ) = 0$ . Show that

1) $g ( z , z _ { 0 } ) = - \log | f ( z ) |$ .

2) $g ( z , z _ { 0 } ) = g ( z _ { 0 } , z )$ . (Hint: Let $g ( z , z _ { 1 } ) = g _ { 1 } , g ( z , z _ { 2 } ) = g _ { 2 }$ , calculate the integral $g _ { 1 } * d g _ { 2 } - g _ { 2 } * d g _ { 1 }$ over the cycle $\partial \Omega - c _ { 1 } - c _ { 2 }$ , where $c _ { 1 } , c _ { 2 }$ are small circles around $z _ { 1 } , z _ { 2 } , d u = u _ { x } d x + u _ { y } d y , * d u = - u _ { y } d x + u _ { x } d y .$ )

# S.-T. Yau College Student Mathematics Contests 2018

# Probability and Statistics

# Team (5 problems)

Problem 1. Let $X _ { i }$ , $1 \leq i \leq N$ be i.i.d. random variables. Here $X _ { 1 }$ is uniformly distributed on [0, 1]. We reorder them as

$$
\widetilde {X} _ {1} \leq \widetilde {X} _ {2} \leq \dots \widetilde {X} _ {N}
$$

a) Let $N = 2 m - 1$ , and $Y = \widetilde { X } _ { m }$ , please find the A and B such that

$$
\frac {Y - A}{N ^ {B}}
$$

has nontrivial distribution, and please find this distribution.

b) Let $N = 2 m$ , and $Y = \widetilde { X } _ { m } - \widetilde { X } _ { m - 1 }$ , please find the A and B such that

$$
\frac {Y - A}{N ^ {B}}
$$

has nontrivial distribution, and please find this distribution.

Problem 2. Let $\mathbf { X } = ( \mathbb { Z } _ { 2 } ) ^ { \mathbb { N } }$ , i.e., $\mathbf { X } = ( X _ { 1 } , X _ { 2 } \cdots , X _ { N } \cdot \cdot \cdot )$ , $X _ { i } \in ( 0 , 1 )$ . It can be considered as countable lightbulbs. 0 means off, 1 means on. We start with ${ \bf { X } } _ { 0 } \ =$ 0. Keep generating independent geometric random variables, whose distribution are $g e o m ( 1 / 2 )$ . Denote them as $K _ { 1 }$ , $K _ { 2 } \cdots$ . Now let $\mathbf { X } _ { m }$ (for $m \geq 1$ ) be as follows

$$
\left(\mathbf {X} _ {m} - \mathbf {X} _ {m - 1}\right) _ {k} = \mathbf {1} (k = K _ {m}), \qquad \mathbb {Z} _ {2}
$$

i.e, in the $m - t h$ turn, we only change the status of the $K _ { m }$ −th light bulb. Then what is the probability of all lights being off again, i.e.,

$$
\mathbb {P} \left(\exists m > 1, \quad \mathbf {X} _ {m} = \mathbf {0}\right)
$$

Problem 3. Let $x _ { 1 } , x _ { 2 } , \ldots , x _ { n }$ be $d$ -dimensional vectors of real numbers with $n$ sufficiently large but the exact value is not of importance.

A function of $\mu$ is defined to be

$$
\ell (\mu) = \sup  \{\sum_ {i = 1} ^ {n} \log p _ {i}: \sum_ {i = 1} ^ {n} p _ {i} x _ {i} = \mu ; \sum_ {i = 1} ^ {n} p _ {i} = 1, p _ {1} > 0, \dots , p _ {n} > 0 \}
$$

on the space of the interior of the convex hull of $x _ { 1 } , \ldots , x _ { n }$

(a) Show that this is a concave function of $\mu$ on the convex hull.   
(b) Let ${ \bar { x } } = n ^ { - 1 } \sum _ { i = 1 } ^ { n } x _ { i }$ . Let $\mathbf { a }$ be a vector of length $d$ . Prove that $\ell ( { \bar { x } } + t \mathbf { a } )$ is a decreasing function of $t$ when $t > 0$ .

Problem 4. Consider the histogram estimator, defined as follows. We observe iid random variables $X _ { 1 } , \ldots , X _ { n }$ , taking values in $[ 0 , 1 ]$ according to the distribution with PDF $f$ (assuming it is sufficiently smooth). Define bins

$$
B _ {1} = \left[ 0, \frac {1}{m}\right), B _ {2} = \left[ \frac {1}{m}, \frac {2}{m}\right), \ldots , B _ {m} = \left[ \frac {m - 1}{m}, 1 \right]
$$

Let $h = 1 / m$ , $v _ { j }$ be the number of observations in bin $B _ { j }$ , and define $\hat { p } _ { j } = v _ { j } / n$ and $\begin{array} { r } { p _ { j } = \int _ { B _ { j } } f ( u ) d u } \end{array}$ . Then the histogram estimator of the density $f$ is

$$
\hat {f} _ {n} (x) = \sum_ {j = 1} ^ {m} \frac {\hat {p} _ {j}}{h} I \{x \in B _ {j} \}
$$

1. Find the (exact) mean and variance of ${ \hat { f } } _ { n } ( x )$ .   
2. Explain why increasing the number of bins decreases the bias of ${ \hat { f } } _ { n } ( x )$ .   
3. If our goal is to minimize the mean-squared error

$$
M S E = E \left[ \int (f (x) - \hat {f} _ {n} (x)) ^ {2} d x \right],
$$

please give some advice on how to choose $m$ .

Problem 5. Let $X _ { i } \sim N ( \theta _ { i } , 1 )$ independently for $i = 1 , \ldots , k$ . We are interested in estimating $\tau = \theta _ { 1 } ^ { 2 } + \cdot \cdot \cdot + \theta _ { k } ^ { 2 }$ given observations $X _ { 1 } , \ldots , X _ { k }$ .

1. A possible estimator of $\tau$ is $\begin{array} { r } { \tilde { \tau } = \sum _ { i = 1 } ^ { k } X _ { i } ^ { 2 } - k } \end{array}$ . Show that it is unbiased and compute its sampling variance.   
2. Now assume the proper prior $\theta _ { i } \sim N ( 0 , A )$ , independently for $i = 1 , \ldots , k$ and a given $A > 0$ . Since $A$ is unknown, please provide an estimator $\hat { A }$ of $A$ and also derive the empirical Bayes estimator of $\tau$ , denoted as $\hat { \tau } _ { B }$ . (Hint: $\hat { \tau } _ { B } = E ( \tau \mid$ $X _ { 1 } , \dotsc , X _ { k } , { \hat { A } } )$ ).   
3. How do you compare the two estimators, $\tilde { \tau }$ and $\hat { \tau } _ { B }$ ?

S.-T. Yau College Student Mathematics Contests 2018

# Geometry and Topology Team

Please solve 5 out of the following 6 problems.

1. Let $X$ be $( S ^ { 2 } \times S ^ { 2 } ) \cup _ { S ^ { 2 } } D ^ { 3 }$ , where we attach the 3-disk via the map

$$
S ^ {2} \rightarrow S ^ {2} \vee S ^ {2}
$$

which crushes a great circle connecting the north and south poles. Compute the homology groups of $X$ .

2. (a) Let $A$ be a single circle in $\mathbb { R } ^ { 3 }$ . Compute the fundamental group $\pi _ { 1 } ( \mathbb { R } ^ { 3 } - A )$

(b) Let $A$ and $B$ be disjoint circles in $\mathbb { R } ^ { 3 }$ , supported in the upper and lower half space, respectively. Compute $\pi _ { 1 } ( \mathbb { R } ^ { 3 } - ( A \cup B ) )$ .

3. Consider the differential 1-form $\omega = x d y - y d x + d z$ in $\mathbb { R } ^ { 3 }$ with coordinates $( x , y , z )$ . Prove that $f \omega$ is not closed for any nowhere zero function $f : \mathbb { R } ^ { 3 }  \mathbb { R }$ .

4. Show that

$$
Q ^ {n} := \left\{\left(x ^ {1}, \dots , x ^ {n + 1}\right) \in \mathbb {R} ^ {n + 1}; \sum_ {i = 1} ^ {n + 1} \left(x ^ {i}\right) ^ {4} = 1 \right\}
$$

is a differentiable manifold.

5. Let $M$ be a closed surface in $\mathbb { R } ^ { 3 }$ . Prove that

$$
\int_ {M} | K | d \sigma \geq 4 \pi (1 + g),
$$

where $K$ , $g$ and $d \sigma$ is the Gaussian curvature, the genus and the area element of $M$ , respectively.

6. Let $M$ be an $n$ -dimensional compact and simply connnected Riemannian manifold. If the sectional curvature $K _ { M }$ of $M$ satisfies

$$
\frac {1}{4} <   K _ {M} \leq 1,
$$

then $M$ is homeomorphic to $S ^ { n }$

# S.-T. Yau College Student Mathematics Contests 2018

# Algebra and Number Theory Team

This test has 5 problems and is worth 100 points. Carefully justify your answers.

Problem 1 (20 points). Recall that a ring $E$ is said to be local if for every $u \in E$ , at least one of the elements $u$ and $\mathrm { ~ 1 ~ - ~ } u$ is invertible. Let $R$ be a ring and let $M$ be an $R$ -module.

(a) (8 points) Show that if $\operatorname { E n d } _ { R } ( M )$ is a local ring, then $M$ is indecomposable.   
(b) (12 points) Assume $M$ indecomposable and of finite length. Prove the Fitting lemma: Every endomorphism $u$ of $M$ is either invertible or nilpotent. Deduce that $\operatorname { E n d } _ { R } ( M )$ is a local ring.

Problem 2 (20 points).

(a) (6 points) Let $n \geq 2$ be an integer. Show that there exists an integer $m$ with $1 \leq m \leq n - 1$ such that the binomial coefficient $\binom { n } { m }$ satisfies ${ \binom { n } { m } } \geq 2 ^ { n } / n$ .   
(b) (6 points) Let $0 \leq m \leq n$ be integers with $n \geq 1$ . Show that for every prime number $p$ ,

$$
v _ {p} \left(\binom {n} {m}\right) \leq \log_ {p} (n)
$$

Here $v _ { p }$ is the $p$ -adic valuation: $v _ { p } ( p ^ { a } b ) = a$ for integers $b$ prime to $p$ and $a \geq 0$ .

(c) (8 points) Let $n \geq 2$ be an integer and let $\pi ( n )$ denote the number of prime numbers $p \leq n$ . Deduce the following inequality of Chebyshev:

$$
\pi (n) \geq \frac {n}{\log_ {2} n} - 1.
$$

Problem 3 (20 points). Let $n \geq 1$ be an integer and let $\Phi _ { n } ( X ) \in \mathbb { Q } [ X ]$ denote the $n$ -th cyclotomic polynomial, i.e.

$$
\Phi_ {n} (X) := \prod_ {\xi} (X - \xi),
$$

where $\xi$ runs through primitive $n$ -th roots of unity in $\mathbb { C }$ . Recall that $X ^ { n } - 1 =$ $\Pi _ { d | n } \Phi _ { d } ( X )$ and $\Phi _ { n } ( X )$ belongs to $\mathbb { Z } [ X ]$ . Let $p$ be a prime number such that $p \nmid n$ . Denote by $\overline { { \Phi } } _ { n }$ the residue class of $\Phi _ { n }$ in $\mathbb { F } _ { p } \lfloor X \rfloor$ . Prove the following statements:

(a) (8 points) The roots of $\overline { { \Phi } } _ { n } = 0$ in the algebraic closure $\overline { { \mathbb { F } } } _ { p }$ of $\mathbb { F } _ { p }$ are exactly the primitive $n$ -th roots of 1 in $\mathbb { F } _ { p }$ .   
(b) (12 points) $\overline { { \Phi } } _ { n }$ is irreducible in $\mathbb { F } _ { p } \lfloor X \rfloor$ if and only if $( \mathbb { Z } / n \mathbb { Z } ) ^ { \times }$ is a cyclic group generated by the class of $p$ .

Problem 4 (20 points). Let $G$ be a finite group. Let $V$ be a finite-dimensional complex representation of $G$ and let $\chi \colon V  \mathbb { C }$ be the associated character.

(a) (8 points) Show that there exists a subfield $L \subseteq \mathbb { C }$ containing the image of $\chi$ such that $L / \mathbb { Q }$ is a finite Galois extension. Show moreover that

$$
B (\chi) = \prod_ {\sigma \in \operatorname {G a l} (L / \mathbb {Q})} \prod_ {g \in G} \sigma (\chi (g))
$$

belongs to $\mathbb { Z }$ .

(b) (12 points) Suppose that $\chi$ is irreducible and $\dim ( V ) \geq 2$ . Show that there exists $g \in G$ with $\chi ( g ) = 0$ . (Hint. One may apply the inequality of arithmetic and geometric means to $| B ( \chi ) | ^ { 2 }$ .)

Problem 5 (20 points). Let $F$ be a field, $V$ an $F$ -vector space of dimension $d$ and $W \subseteq V$ a subspace. Let $f \colon W \to V$ be an $F$ -linear map. Assume that the only subspace $W ^ { \prime } \subseteq W$ such that $f ( W ^ { \prime } ) \subseteq W ^ { \prime }$ is $\{ 0 \}$ .

(a) (6 points) Let $v \in V$ be a non-zero vector. Show that there exists a unique integer $k ( v ) \geq 0$ such that $v , f ( v ) , f ^ { 2 } ( v ) , \ldots , f ^ { k ( v ) - 1 } ( v ) \in W$ but $f ^ { k ( v ) } ( v ) \notin W$ . Show moreover that $v , f ( v ) , \ldots , f ^ { k ( v ) } ( v )$ are linearly independent over $F$ .   
(b) (14 points) Prove that given $\lambda _ { 1 } , \dotsc , \lambda _ { d } \in F$ , there exists an $F$ -linear extension of $f$ to ${ \ddot { f } } \colon V \to V$ such that the characteristic polynomial of $\ddot { f }$ is $\textstyle \prod _ { i = 1 } ^ { d } ( \lambda - \lambda _ { i } )$ . (Hint. You may first treat the special case $V = \oplus _ { i = 0 } ^ { k ( v ) } F f ^ { i } ( v )$ . For the general case, consider the subset $W _ { n } \subseteq V$ of vectors $v \in V$ with $k ( v ) \geq n$ or $v = 0$ .)

# S.-T. Yau College Student Mathematics Contests 2018

# Applied Math. and Computational Math.

# Team (5 problems)

1. Let $H$ be a bipartite graph with the bipartition $V = V _ { 1 } \cup V _ { 2 }$ , where $| V _ { 1 } | = | V _ { 2 } | = n$ . We say that $H$ satisfies the $( p , q )$ -condition if (i) for all subsets $I \subseteq V _ { 1 }$ of cardinality at most $p$ , the inequality $| I | \leq | N ( I ) |$ holds, and (ii) for all subsets $J \subseteq V _ { 2 }$ of cardinality at most $q$ , the inequality $\vert J \vert \le \vert N ( J ) \vert$ holds. Note that the $( n , 0 )$ -condition is Hall’s original condition in his marriage theorem.

Prove that if $H$ satisfies the $( p , q )$ -condition with $n \leq p + q$ , then $H$ contains a matching of size $n$ .

2. Let $C _ { n }$ be the $n$ dimensional hypercube, i.e., the graph whose vertex set $V$ is $\{ 0 , 1 \} ^ { n }$ , and whose edges are defined by: two vertices $u = u _ { 1 } u _ { 2 } \ldots u _ { n }$ and $v = v _ { 1 } v _ { 2 } \ldots v _ { n }$ are adjacent iff $u _ { i } \neq v _ { i }$ for exactly one $i \in [ n ]$ . Let $\mathbb { R } [ V ]$ be the vector space of all the functions $f : V \to \mathbb { R }$ . The space $\mathbb { R } | V |$ has a natural inner product. For $f , g \in \mathbb { R } | V |$ ,

$$
<   f, g > = \sum_ {u \in \{0, 1 \} ^ {n}} f (u) g (u).
$$

The standard basis of $\mathbb { R } | V |$ is the set $\{ f _ { u } : u \in \{ 0 , 1 \} ^ { n } \}$ where $f _ { u } ( v ) = \delta _ { u , v }$ , the Kronecker delta, for $u , v \in \{ 0 , 1 \} ^ { n }$ . Denote by $B _ { 1 }$ the standard basis.

(1) For any two vertices $u , v \in \{ 0 , 1 \} ^ { n }$ , $u \cdot v$ is defined to be $\sum _ { i } u _ { i } v _ { i }$ . For each $u \in \{ 0 , 1 \} ^ { n }$ , define a function $\chi _ { u } \in \mathbb { R } [ V ]$ by letting

$$
\chi_ {u} (v) = (- 1) ^ {u \cdot v}.
$$

Prove that the set $\{ \chi _ { u } : u \in \{ 0 , 1 \} ^ { n } \}$ is orthogonal with respect to the inner product of $\mathbb { R } [ V ]$ , i.e.,

$$
<   \chi_ {u}, \chi_ {v} > = \delta_ {u, v} 2 ^ {n},
$$

for all $u , v \in \{ 0 , 1 \} ^ { n }$ .

(2) Prove that the set $\{ \chi _ { u } : u \in \{ 0 , 1 \} ^ { n } \}$ forms a basis of the vector space $\mathbb { R } | V |$ Denoted by $B _ { 2 }$ this basis.

(3) For $1 \leq i \leq n$ , let $e _ { i } = ( 0 , \ldots , 0 , 1 , 0 , \ldots , 0 ) \in \{ 0 , 1 \} ^ { n }$ where the only 1 occurs in position $i$ . Let $S = \{ e _ { 1 } , e _ { 2 } , \ldots , e _ { n } \}$ .

Define a linear transformation $\Phi : \mathbb { R } [ V ]  \mathbb { R } [ V ]$ as follows. For $f \in \mathbb { R } | V |$ , $\Phi f$ is the element in $\mathbb { R } [ V ]$ which is given by

$$
(\Phi f) (v) = \sum_ {e _ {i} \in S} f (v + e _ {i})
$$

where $v + e _ { i }$ is the usual vector addition modulo 2.

Prove that the matrix of $\Phi$ with respect to the standard basis $B _ { 1 }$ is just $A ( C _ { n } )$ , the adjacency matrix of the hypercube $C _ { n }$ .

(4) Prove that $\Phi \chi _ { u } = \lambda _ { u } \chi _ { u }$ for each $u \in \{ 0 , 1 \} ^ { n }$ , where

$$
\lambda_ {u} = \sum_ {e \in S} (- 1) ^ {u \cdot e} = n - 2 | u |,
$$

where $| u |$ is the number of 1’s in $u = u _ { 1 } u _ { 2 } \ldots u _ { n }$

(5) Compute the eigenvalues of the matrix $A ( C _ { n } )$ .

3. Let $A \in \mathbb { R } ^ { n \times n }$ , and assume that there are unitary matrix $Q$ and diagonal matrix $D = \mathrm { d i a g } ( \lambda _ { 1 } , \cdot \cdot \cdot , \lambda _ { n } )$ such that $A = Q D Q ^ { * }$ . Let $E _ { k }$ be the space spanned by the first $k$ columns of $Q$ . We let

$$
\widehat {P} = \left( \begin{array}{c c} I _ {k} & \\ & 0 \end{array} \right), \quad P = Q \widehat {P} Q ^ {*}
$$

where $I _ { k }$ is the $k \times k$ identity matrix.

(1) Show that $P$ is an orthogonal projection onto $E _ { k }$   
(2) Assume that

$$
\left| \lambda_ {1} \right| \geq \dots \geq \left| \lambda_ {k} \right| > \left| \lambda_ {k + 1} \right| \geq \dots \geq \left| \lambda_ {n} \right|.
$$

Let $X ^ { ( 0 ) } \in \mathbb { R } ^ { n \times k }$ and assume $P X ^ { ( 0 ) }$ is injective. We define the iterations

$$
X ^ {(m + 1)} = A X ^ {(m)}.
$$

Show that there is a matrix $\boldsymbol { \Lambda } \in \mathbb { R } ^ { k \times k }$ such that

$$
\frac {\| (A X ^ {(m)} - X ^ {(m)} \Lambda) y \|}{\| P X ^ {(m)} y \|} \leq \left(\frac {| \lambda_ {k + 1} |}{| \lambda_ {k} |}\right) ^ {m} \frac {\| (A X ^ {(0)} - X ^ {(0)} \Lambda) y \|}{\| P X ^ {(0)} y \|}, \quad \forall y \in \mathbb {R} ^ {k} \setminus \{0 \}.
$$

4. For the one-way equation

(1) $u _ { t } + a u _ { x } = f ,$

consider the multistep scheme given by

(2) $\frac { 3 u _ { m } ^ { n + 1 } - 4 u _ { m } ^ { n } + u _ { m } ^ { n - 1 } } { 2 k } + a \frac { u _ { m + 1 } ^ { n + 1 } - u _ { m - 1 } ^ { n + 1 } } { 2 h } = f _ { m } ^ { n + 1 } .$ un+1m−1

(1) Show that the scheme is second order accurate.   
(2) Show that the scheme is unconditionally stable.

(Hint: (i) apply von Neumann analysis to the scheme with $f \equiv 0$ and find the characteristic polynomial. (ii) show that for all $k , h$ , the characteristic polynomial satisfies the root condition: all roots reside in the unit disk, and all roots on the unit circle are simple. (iii) for a root $r$ of the characteristic polynomial, it would be more convenient to study the form ${ \textstyle { \frac { 1 } { r } } } = X + i Y$ and prove that $X ^ { 2 } + Y ^ { 2 } \ge 1$ .)

5. For a convex function $f : D  \mathbb { R }$ , where $D \subseteq \mathbb { R } ^ { n }$ is convex and open, define a subgradient of $f$ at $x _ { 0 } \in D$ to be any vector $s \in \mathbb { R } ^ { n }$ such that

$$
f (x) - f (x _ {0}) \geq s \cdot (x - x _ {0})
$$

for all $x \in D$ . The subgradient is a plausible choice for generalizing the notion of a gradient at a point where $f$ is not differentiable. The subdifferential $\partial f ( x _ { 0 } )$ is the set of all subgradients of $f$ at $x _ { 0 }$ .

(1) What is $\partial f ( 0 )$ for the function $f ( x ) = \left| x \right|$ .   
(2) Suppose we wish to minimize a convex and continuous function $f : \mathbb { R } ^ { n } \to$ $\mathbb { R }$ , which may not differentiable everywhere. Propose an optimality condition involving subdifferential for a point $x _ { * }$ to be a minimizer of $f$ . Show that your condition holds if and only if $x _ { * }$ is a globally minimizer $f$ .   
(3) The subgradient method extends the gradient descent to a wider class of functions. Analogously to the gradient descent, the subgradient method performs the iteration

$$
x _ {k + 1} = x _ {k} - \alpha g _ {k},
$$

where $\alpha > 0$ is small stepsize that is known as the learning rate, and $g _ { k }$ is any instead we keep tra subgradient of $f$ at $x _ { k }$ . This method might not decrease of the best iterate we have seen so far, $f$ in each iteration, so $\boldsymbol x _ { k } ^ { \mathrm { b e s t } }$ .

In the following parts, assume that $f$ is Lipschitz continuous with constant $L > 0$ , $\| x _ { 1 } - x _ { * } \| _ { 2 } \leq B$ for some $B > 0$ . Under these assumptions we will show that

$$
\lim  _ {k \rightarrow \infty} f \left(x _ {k} ^ {\text {b e s t}}\right) \leq f \left(x _ {*}\right) + \frac {L ^ {2}}{2} \alpha , \tag {3}
$$

a bound characterizing convergence of the subgradient method.

(a) Derive an upper bound for the error $\lVert x _ { k + 1 } - x _ { * } \rVert _ { 2 } ^ { 2 }$ of $x _ { k + 1 }$ in terms of $\| x _ { k } - x _ { * } \| _ { 2 } ^ { 2 }$ , $g _ { k }$ , $\alpha$ , $f ( x _ { k } )$ and $f ( x _ { * } )$ .   
(b) By recursively applying the result from Problem 3a, provide an upper bound for $\lVert x _ { k + 1 } - x _ { * } \rVert _ { 2 } ^ { 2 }$ .   
(c) Incorporate $f ( x _ { k } ^ { \mathrm { b e s t } } )$ into your upper bound in Problem 3b, and take a limit as $k \to \infty$ to obtain the desired convergence result (3).   
(d) Suggest a best choice of the learning rate $\alpha$