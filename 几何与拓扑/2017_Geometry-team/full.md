# Analysis and Differential Equations Team

Please solve 5 out of the following 6 problems.

1. Suppose that $f$ is an integrable function on the circle with $\begin{array} { r } { \hat { f } ( n ) = \frac { 1 } { 2 \pi } \int _ { 0 } ^ { 2 \pi } f ( x ) e ^ { - i n x } d x = } \end{array}$ $0$ , for all $n \in \mathbf { Z }$ . Then $f ( \theta ) = 0$ whenever $f$ is continuous at the point $\theta$ .   
2. Let $F ^ { \prime }$ be continuous on $[ a , b ]$ . Show that:

1) Suppose $\begin{array} { r } { ( D ^ { + } F ) ( x ) = \operatorname* { l i m } \operatorname* { s u p } _ { h \to 0 , h > 0 } \frac { F ( x + h ) - F ( x ) } { h } > 0 } \end{array}$ F (x+h)−F (x) > 0 for every x ∈ [a, b). Then F $x \in [ a , b )$ $F$ is increasing on $[ a , b ]$ .   
2) If $F ^ { ' } ( x )$ exists for every $x \in ( a , b )$ and $| F ^ { ' } ( x ) | \le M$ , then $| F ( x ) - F ( y ) | \leq M | x - y |$ and $F$ is absolutely continuous.

3. Let $f ( z )$ be holomorphic for $| z | < 1$ and assume $| f ( z ) | < 1$ , if $| z | < 1$ . If $\alpha$ and $\beta$ are such that $| \alpha | < 1 , | \beta | < 1 , \alpha \neq \beta$ , and $f ( \alpha ) = f ( \beta ) = 0$ , then

$$
| f (z) | \leq | \frac {z - \alpha}{1 - \bar {\alpha} z} \frac {z - \beta}{1 - \bar {\beta} z} |, | z | <   1.
$$

4. Show that a single-valued analytic branch of $\sqrt { 1 - z ^ { 2 } }$ can be defined in any region such that the points R $\pm 1$ are in the same component of the complement. What are the possible values of $\textstyle \int { \frac { \ d z } { \sqrt { 1 - z ^ { 2 } } } }$ over a closed curve in the region?

5. In $\mathbf { R } ^ { n }$ , consider the Laplace equation

$$
u _ {1 1} + u _ {2 2} + \dots + u _ {n n} = 0.
$$

Show that the equation is invariant under orthogonal transformation. Find all rotationally symmetric solutions to this equation.

6. Let $A$ be an operator over the function space $C [ \boldsymbol { a } , \boldsymbol { b } ]$ defined as:

$$
(A f) (x) = \int_ {a} ^ {b} K (x, y) f (y) d y,
$$

where $K ( x , y )$ is continuous over $[ a , b ] \times [ a , b ]$ except at several curves defined by $y =$ $\phi _ { k } ( x ) , x \in [ a , b ] , k = 1 , . . . , n$ with $\phi _ { k }$ continuous. Show that $A$ is a compact operator.

# Probability and Statistics

# Team (5 problems)

Problem 1. Let $\mu ^ { n }$ be the uniform probability measure on the $n$ -dimensional cube $[ - 1 , 1 ] ^ { n }$ . Let $H \in \mathbb { R } ^ { n }$ be the hyperplane orthogonal to the principal diagonal, i.e., $H = ( 1 , \cdots , 1 ) ^ { \perp }$ . For any $r > 0$ , we further define

$$
A _ {H, r} := \{x \in [ - 1, 1 ] ^ {n}, \mathrm {d i s t} (x, H) \leq r \},
$$

where $\operatorname { d i s t } ( x , H )$ represents the distance from the point $x$ to the hyperplane $H$ . Show that for any constant $\varepsilon > 0$ , the following two estimates hold for all sufficiently large $n$

$$
1: \quad \mu^ {n} \big (A _ {H, n ^ {\varepsilon}} \big) \geq 1 - n ^ {- 2 \varepsilon},
$$

$$
{ 2 : } { \mu ^ { n } \big ( A _ { H , n ^ { \varepsilon } } \big ) \geq 1 - e ^ { - n ^ { \varepsilon / 2 } } }
$$

Problem 2. Let $X _ { 1 }$ , $X _ { 2 }$ , . . . be positive random variables. We assume that $X _ { n }$ converges to 0 in probability, and that $\begin{array} { r } { \operatorname* { l i m } _ { n  \infty } E ( X _ { n } ) = 2 } \end{array}$ . Prove that $\scriptstyle \operatorname* { l i m } _ { n \to \infty } E ( | X _ { n } -$ 1|) exists and compute its value.

Problem 3. There are $n$ people playing a game. Initially everybody had one dollar at hand. During each round of the game, we randomly pick two people and they will toss a fair coin, to decide who wins this round of the game. The loser will submit one dollar (note: just one, not all of his money) to the winner. Assume that a person who had no money at hand will be immediately driven out of the game. The game stops until all money is at the hand of only one person. Calculate the average number of rounds that the game plays.

Note: In each round only two players are involved.

# Problem 4.

Let $\{ X _ { n } \} _ { n \in \mathbb { N } }$ and $\{ X _ { n } ^ { \prime } \} _ { n \in \mathbb { N } }$ be two independent simple random walks on $\mathbb { Z } ^ { d }$ such that $X _ { 0 } = X _ { 0 } ^ { \prime } = 0$ . Here simple walk means if $x , y \in \mathbb { Z } ^ { d }$ and $\| x - y \| = 1$ , then

$$
\mathbb {P} (X _ {n + 1} = y | X _ {n} = x) = (2 d) ^ {- 1}
$$

Let $\mathcal { T } = \{ ( s , t ) : X _ { s } = X _ { t } ^ { \prime } \}$ . Prove that $| \mathcal { T } | < \infty$ a.s.

Hint: You can first prove that

$$
\mathbb {P} (X _ {n} = 0) = O (n ^ {- d / 2}), \quad n \to \infty
$$

Problem 5. Suppose $X _ { 1 } , \ldots , X _ { n }$ are i.i.d. Poisson variables with mean $\lambda$ and we are interested in estimating $p = P _ { \lambda } ( X _ { i } = 0 ) = e ^ { - \lambda }$ .

(a) One estimator for $p$ is the proportion of zeros in the sample, $\tilde { p } = \# \{ i \leq n : X _ { i } =$ $0 \} / n$ . Determine limiting distribution for $\sqrt { n } ( \tilde { p } - p )$ .   
(b) Another estimator would be the maximum likelihood estimator $\hat { p }$ . Give a formula for $\hat { p }$ and determine limiting distribution for $\sqrt { n } ( \hat { p } - p )$ .   
(c) Find the asymptotic relative efficiency of $\tilde { p }$ with respect to $\hat { p }$

S.-T. Yau College Student Mathematics Contests 2017

# Geometry and Topology Team

Please solve 5 out of the following 6 problems.

1. Consider the space $X ~ = ~ M _ { 1 } \cup M _ { 2 }$ , where $M _ { 1 }$ and $M _ { 2 }$ are M¨obius bands and $M _ { 1 } \cap M _ { 2 } = \partial M _ { 1 } = \partial M _ { 2 }$ . Here a M¨obius band is the quotient space $( [ - 1 , 1 ] \times$ $[ - 1 , 1 ] ) / ( ( 1 , y ) \sim ( - 1 , - y ) )$ . Determine the fundamental group of $X$ .

2. If $f : X \to X$ is a self-map, then the “mapping torus of $f ^ { \prime }$ is the quotient

$$
T _ {f} := (X \times [ 0, 1 ]) / (x, 0) \sim (f (x), 1), \quad \forall x \in X.
$$

For $n \in \mathbb { Z }$ , let $f _ { n }$ be a degree $n$ map on $S ^ { 3 }$ . Compute the integral homology groups of $T _ { f _ { n } }$ .

3. Let $C$ be a regular curve on a smooth surface $S$ in $R ^ { 3 }$ . Denote by $I = E d u ^ { 2 } + $ $2 F d u d v + G d v ^ { 2 }$ and $I I = L d u ^ { 2 } + 2 M d u d v + N d v ^ { 2 }$ the first and second fundamental forms of $S$ , respectively. Assume that the equation of $C$ is given by $u = u ( s )$ , $v = v ( s )$ , where $s$ is the arc-length parameter of $C$ . Show that geodesic torsion along the curve $C$ satisfies

$$
\tau_ {g} = \frac {1}{\sqrt {E G - F ^ {2}}} \left| \begin{array}{c c c} \left(\frac {d v}{d s}\right) ^ {2} & - \frac {d u}{d s} \frac {d v}{d s} & \left(\frac {d u}{d s}\right) ^ {2} \\ E & F & G \\ L & M & N \end{array} \right|.
$$

4. Let $\{ e _ { i } \} _ { i = 1 , \ldots , n }$ be a basis of a vector space $V$ . Denote by $\{ \omega ^ { i } \} _ { i = 1 , \dots , n }$ the dual basis of $\{ e _ { i } \} _ { i = 1 , \ldots , n }$ . Show that the set

$$
\left\{\omega^ {i _ {1}} \wedge \dots \wedge \omega^ {i _ {r}} \mid 1 \leq i _ {1} <   i _ {2} <   \dots <   i _ {r} \leq n \right\}
$$

is a basis of $\Lambda ^ { \prime } V ^ { * }$ , where $r$ is a positive integer and $r \leq n$ .

5. Let $M  R ^ { n + 1 }$ be a compact closed hypersurface in the $( n + 1 )$ -dimensional Euclidean space $R ^ { n + 1 }$ . Prove that $M$ is a hypersphere if $M$ has constant scalar curvature and nonnegative Ricci curvature.

6. On a Riemannian manifold, if $f$ is a smooth function such that $| \mathrm { g r a d } f | = 1$ . Show that the integral curves of grad $f$ are geodesics.

# S.-T. Yau College Student Mathematics Contests 2017

# Algebra and Number Theory Team

This test has 5 problems and is worth 100 points. Carefully justify your answers.

Problem 1 (20 points). Let $G$ be a group and let $g \in G$ be an element of finite order $n$ . Suppose that $n$ is the product of two positive integers $r$ and $s$ which are coprime to each other.

(a) (10 points) Show that there is a pair $( g _ { 1 } , g _ { 2 } )$ of elements of $G$ such that $g _ { 1 } ^ { r } = 1$ $g _ { 2 } ^ { s } = 1$ and $g _ { 1 } y _ { 2 } = y _ { 2 } y _ { 1 } = y$ .   
(b) (10 points) Show that such a pair is unique.

Problem 2 (20 points). Let $p > 2$ be a prime number and let $T$ be a linear operator of order $p$ on an $n$ -dimensional vector space $V$ over $\mathbb { Q }$ .

(a) (8 points) Show that the trace $\mathrm { t r } ( T )$ of $T$ on $V$ is an integer in $\mathbb { Z }$   
(b) (12 points) Show that $\mathrm { t r } ( T )$ is congruent to $n$ modulo $p$

Problem 3 (20 points). Let $\mathfrak { g }$ be a finite dimensional Lie algebra over $\mathbb { C }$ . For each $x \in { \mathfrak { g } }$ , define a linear map

$$
\operatorname {a d} _ {x}: \mathfrak {g} \to \mathfrak {g}, \quad y \mapsto [ x, y ].
$$

Put

$$
n (x) := \text {t h e d i m e n s i o n o f t h e k e r n e l o f t h e o p e r a t o r} \left(\mathrm {a d} _ {x}\right) ^ {\dim \mathfrak {g}}.
$$

The rank of $\mathfrak { g }$ is defined to be

$$
\operatorname {r a n k} (\mathfrak {g}) := \min  \{n (x) \mid x \in \mathfrak {g} \}.
$$

Show that

$$
\left\{x \in \mathfrak {g} \mid n (x) > \operatorname {r a n k} (\mathfrak {g}) \right\}
$$

is the zero set of a polynomial function on $\mathfrak { g }$

Problem 4 (20 points). Let $p$ be a prime number and let $K = \mathbb { F } _ { p } ( T )$ be the field of rational functions over $\mathbb { F } _ { p }$ . Consider the polynomials

$$
f (X) = X ^ {p} - T X - T, \quad g (X) = X ^ {p - 1} - T.
$$

(a) (5 points) Show that $f$ and $g$ are irreducible and separable over $K$ .   
(b) (5 points) Let $M$ be the splitting field of $g$ over $K$ . Show that $\operatorname { G a l } ( M / K )$ is isomorphic to $\mathbb { F } _ { p } ^ { \times }$ .   
(c) (10 points) Let $L$ be the splitting field of $f$ over $K$ . Show that $g$ splits in $L$ and $\operatorname { G a l } ( L / K )$ is isomorphic to the semidirect product $G = \mathbb { F } _ { p } \rtimes \mathbb { F } _ { p } ^ { \times }$ , where $\mathbb { F } _ { p } ^ { \times }$ acts on $\mathbb { F } _ { p }$ by homotheties.

Problem 5 (20 points). Let $a$ and $b$ be a pair of coprime positive integers. Let $\mathbb { N } ( a , b )$ be the set of nonnegative integral linear combinations of $a$ and $b$ :

$$
\mathbb {N} (a, b) := \{N \in \mathbb {Z} \mid N = a x + b y \mathrm {f o r s o m e} x, y \in \mathbb {Z} _ {\geq 0} \}.
$$

(a) (7 points) Show that every integer $N$ satisfying $N \geq a ( b { - } 1 )$ belongs to $\mathbb { N } ( a , b )$   
(b) (13 points) Show that there are exactly $( a - 1 ) ( b - 1 ) / 2$ positive integers not belonging to $\mathbb { N } ( a , b )$ .

# S.-T. Yau College Student Mathematics Contests 2017

# Applied Math. and Computational Math.

# Team (5 problems)

1. Given an integer parameter $K$ , one can test whether for a vector $\vec { u } = ( u _ { 1 } , \dots , u _ { n } ) \in$ $\mathbf { N } ^ { \boldsymbol { \prime } \iota }$ there is non-zero vector ${ \vec { k } } = ( k _ { 1 } , \ldots , k _ { n } ) \in \mathbf { Z } ^ { n }$ with

$$
\| \vec {k} \| _ {\infty} \leq K \text {a n d} u _ {1} ^ {k _ {1}} \dots u _ {n} ^ {k _ {n}} = 1,
$$

where $\| \vec { k } \| _ { \infty } = \operatorname* { m a x } _ { 1 \leq i \leq n } | k _ { i } |$ in about $O ( ( 2 K + 1 ) ^ { n } )$ arithmetic operations with integers having about $O ( n K \log ( \| \vec { u } \| _ { \infty + 1 } ) )$ bits via testing all possible combinations of the exponents (ordered lexicographically) and direct computation.

Assuming that the memory is essentially unlimited, suggest a better algorithm which uses about $O ( ( 2 K + 1 ) ^ { n / 2 } )$ arithmetic operations with integers of the same size as above.

Hints: (i) Use the divide-and-conquer strategy; (ii) Recall that a list $L$ of $M$ real numbers can be sorted via $O ( M \log M )$ comparisons; (iii) A sorted list $L$ of $M$ real numbers can be searched for $x \in L$ via ${ \cal O } ( \log M )$ comparisons; (iv) To decide whether $a / b > c / d$ for two rational numbers with $b , d > 0$ we simply compare the products ad and $b c$ .

2. We have the following partial differential equation

$$
u _ {t} = H (u) _ {x x}, \quad 0 \leq x <   1 \tag {1}
$$

with an initial condition $u ( x , 0 ) = f ( x )$ and periodic boundary condition. Here $0 \leq$ $H ^ { \prime } ( u ) \leq d$ . Consider the following one-step, three-point scheme on a uniform mesh $x _ { j } = j \Delta x$ with spatial mesh size $\Delta x$ :

$$
u _ {j} ^ {n + 1} = u _ {j} ^ {n} + a H \left(u _ {j - 1} ^ {n}\right) + b H \left(u _ {j} ^ {n}\right) + c H \left(u _ {j + 1} ^ {n}\right), \tag {2}
$$

where $a$ $b$ $c$ constants which may depend on th atio $\textstyle \mu = { \frac { \Delta t } { \Delta x ^ { 2 } } }$ $\Delta t$ is the $u _ { j } ^ { n }$ $u ( x _ { j } , t ^ { n } )$ $t ^ { n } = n \Delta t$

(1) Find the constants $a$ , $b$ , $c$ such that the scheme (2) is second order accurate.   
(2) Find the CFL number $\mu _ { 0 }$ such that the scheme (2), with the constants determined by Step 1 above, is stable under the time step restriction $\mu \leq \mu _ { 0 }$ . Please specify which norm you are using for stability, and prove this stability result.

3. Consider the problem describing projectile motion on the surface of the Earth, written in physical variables as follows:

$$
\frac {d ^ {2} y}{d t ^ {2}} = - \frac {G M}{(R + y) ^ {2}}, \quad y (0) = 3 \mathrm {m}, \quad y ^ {\prime} (0) = - V \mathrm {m / s e c}
$$

Let $y ( t ) = L \tilde { y } ( \dot { t } )$ and $t = T t$ . Consider two out of the following four cases:

(a): $R = O ( 1 )$ , $V  \infty$ , $M = O ( 1 )$ : the fast projectile limit   
(b): $R = O ( 1 )$ , $V = O ( 1 )$ , $M \to \infty$ : the dense Earth limit   
(c): $R = O ( 1 )$ , $V = O ( 1 )$ , $M \to 0$ : the light Earth limit   
(d): $R \to 0$ , $V = O ( 1 )$ , $M = O ( 1 )$ : the small Earth limit (two possible scalings, determine both)

In each case:

• Choose your scalings for $L$ , $T$ to normalize as many terms as possible. Pick your scalings so that the time it takes for the projectile to fall to $\tilde { y } = 0$ is $\tilde { t } = O ( 1 )$ .   
• Write the scaled (normalized) problem, identify all remaining dimensionless parameters.   
• Identify a limiting small parameter and the leading order problem.

Note: DO NOT solve-out the problems, just write them!

Hint: If any scaled coefficients blow-up in the leading order problem, the scaling is not good.

4. Let $f$ be an arbitrary function in $C ^ { n } ( \mathbb { R } )$ . Given $n$ distinct points $x _ { 1 } , x _ { 2 } , \cdot \cdot \cdot , x _ { n } \in \mathbb { R }$ and an extra point $x _ { 0 } \in \mathbb { R }$ , we want to approximate $f ^ { \prime } ( x _ { 0 } )$ using a linear combination of the function values at $x _ { 1 } , x _ { 2 } , \cdots , x _ { n }$ , i.e. we want to compute the coefficients $c _ { 1 } , c _ { 2 } , \cdots , c _ { n }$ such that

$$
f ^ {\prime} (x _ {0}) \approx c _ {1} f (x _ {1}) + c _ {2} f (x _ {2}) + \dots + c _ {n} f (x _ {n})
$$

in some sense.

(a) Consider the undetermined coefficients method. You use Taylor expansion to expand each $f ( x _ { i } ) , i = 1 , 2 , \cdots , n$ about the point $x _ { 0 }$ ,

$$
f (x _ {i}) = \sum_ {k = 0} ^ {n - 1} \frac {1}{k !} f ^ {(k)} (x _ {0}) (x _ {i} - x _ {0}) ^ {k} + \frac {1}{n !} f ^ {(n)} (\xi_ {i}) (x _ {i} - x _ {0}) ^ {n}, \quad \xi_ {i} \in [ x _ {0}, x _ {i} ] \mathrm {o r} [ x _ {i}, x _ {0} ],
$$

and choose the coefficients so that the resulting approximation is as accurate as possible. This gives you the linear system

$$
\frac {1}{k !} \sum_ {i = 1} ^ {n} c _ {i} (x _ {i} - x _ {0}) ^ {k} = \delta_ {k, 1}, \quad k = 0, 1, \dots , n - 1,
$$

where $\delta _ { k , 1 } = 1$ if $k = 1$ ; otherwise $\delta _ { k , 1 } = 0$ . Explain why this linear system is nonsingular. Then use this method to solve the case when $n = 3$ , $x _ { 1 } = x _ { 0 }$ , $x _ { 2 } = x _ { 0 } + h$ , $x _ { 3 } = x _ { 0 } + 2 h$ for some constant $h$ .

(b) You can also make use of interpolation method. Consider the n-point interpolating polynomial

$$
p (x) = \sum_ {i = 1} ^ {n} \Big (\prod_ {j = 1, j \neq i} ^ {n} \frac {x - x _ {j}}{x _ {i} - x _ {j}} \Big) f (x _ {i}),
$$

and the approximation is given by

$$
f ^ {\prime} (x _ {0}) \approx p ^ {\prime} (x _ {0}).
$$

This gives the coefficients as

$$
c _ {i} = \Big (\prod_ {j = 1, j \neq i} ^ {n} \frac {x - x _ {j}}{x _ {i} - x _ {j}} \Big) ^ {\prime} \Big | _ {x = x _ {0}}.
$$

Show that the approximation of this method is exact if $f$ is a polynomial of degree no more than $n - 1$ .

(c) Show that the two methods given in (a) and (b) are essentially the same, i.e. the coefficients obtained in (a) and (b) are the same.

5. Let

$$
\mathcal {A} = \left[ \begin{array}{c c c c c} 2 & - 1 & & & \\ - 1 & 2 & - 1 & & \\ & & \ddots & & \\ & & - 1 & 2 & - 1 \\ & & & - 1 & \gamma \end{array} \right]
$$

Find $\boldsymbol { A } ^ { - 1 }$ explicitly. Show that all entries of $\boldsymbol { A } ^ { - 1 }$ are nonnegative if and only if $\gamma \geq 1$