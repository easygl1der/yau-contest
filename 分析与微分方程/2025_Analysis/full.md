# S.-T. Yau College Student Mathematics Contests 2025

# Analysis and Differential Equations (6 problems)

# Problem 1.

Find the solution $R ( r )$ ( $r \geq 1$ ) of the differential equation

$$
r ^ {3} R ^ {\prime \prime \prime} (r) + 2 r ^ {2} R ^ {\prime \prime} (r) - r R ^ {\prime} (r) + R (r) = 2 0 2 5, r > 1,
$$

satisfying the conditions

$$
R (1) = 2 0 2 5, \quad R ^ {\prime} (1) = 0 \quad \text {a n d} \quad R ^ {\prime \prime} (1) = 1.
$$

# Problem 2.

(1). Prove that for $n \geq 3$ , there exists a constant $C > 0$ such that

$$
\int_ {\mathbb {R} ^ {n}} \frac {u ^ {2}}{| x | ^ {2}} d x \leq C \int_ {\mathbb {R} ^ {n}} | \nabla u | ^ {2} d x, \quad \forall u \in H ^ {1} (\mathbb {R} ^ {n});
$$

(2). Prove that the optimal constant $C$ in (1) is $\frac { 4 } { ( n - 2 ) ^ { 2 } }$

# Problem 3.

(1). Let $u ( x , y )$ be a subharmonic function on a domain $D$ containing the annulus $\{ r _ { 1 } < | x | < r _ { 2 } \}$ Define

$$
M (r) = \max  _ {x ^ {2} + y ^ {2} = r} u (x, y)
$$

for $r _ { 1 } < r < r _ { 2 }$ . Prove that:

$$
M (r) \leq \frac {M \left(r _ {1}\right) \left(\log r _ {2} - \log r\right) + M \left(r _ {2}\right) \left(\log r - \log r _ {1}\right)}{\log r _ {2} - \log r _ {1}};
$$

(2). If $u$ is subharmonic on $\mathbb { R } ^ { 2 } \backslash \{ 0 \}$ and bounded above, prove that $u$ is constant.

# Problem 4.

Write $\mathbf { S } ^ { 1 } = \{ e ^ { 2 \pi { \sqrt { - 1 s } } } : s \in \mathbf { R } \} \cong \{ s : s \in [ 0 , 1 ] \} = [ 0 , 1 ]$ . For a smooth closed curve

$$
\gamma : \mathbf {S} ^ {1} \longrightarrow \mathbf {R} ^ {2}, \quad s \longmapsto \gamma (s) = (x (s), y (s))
$$

we mean that $x , y : { \mathbf { S } } ^ { 1 } \to { \mathbf { R } }$ are continuously differentiable functions of $s$ , $\gamma ( 0 ) \ = \ \gamma ( 1 )$ , and $\gamma ^ { \prime } ( s ) = \frac { d \gamma ( s ) } { d s } \neq 0$ for all $s \in [ 0 , 1 ]$ .

The degree of a smooth closed curve $\gamma : \mathbf { S } ^ { 1 }  \mathbf { R } ^ { 2 }$ is given by

$$
d (\gamma) := \frac {1}{2 \pi} \oint_ {\gamma} \frac {x d y - y d x}{x ^ {2} + y ^ {2}}.
$$

(1) Show that

$$
d (\gamma) = \frac {1}{2 \pi \sqrt {- 1}} \oint_ {\gamma} \frac {d z}{z}.
$$

Hence $d ( \gamma )$ is an integer.

(2) For the curve $\gamma ( s ) = r e ^ { 2 \pi \sqrt { - 1 } n s } \in \mathbf { C }$ with $z _ { 0 } \in \mathbf { C }$ , $s \in [ 0 , 1 ]$ and $n \in \mathbf { Z }$ , compute $d ( \gamma )$   
(3) Two smooth closed curves $\gamma _ { 0 }$ and $\gamma _ { 1 }$ are regularly homotopic if there exists a family of smooth closed curves $\gamma _ { t }$ with a continuous dependence on $t \in [ 0 , 1 ]$ , where the curves $\gamma _ { 0 }$ and $\gamma _ { 1 }$ correspond to $t = 0$ and $t = 1$ respectively. Here, by a continuous dependence on $t$ we mean that the map

$$
[ 0, 1 ] \times [ 0, 1 ] \longrightarrow \mathbf {R} ^ {2}, \quad (s, t) \longmapsto \gamma (s, t) = \gamma_ {t} (s)
$$

is continuous.

Prove that two smooth closed curves $\gamma _ { 0 }$ and $\gamma _ { 1 }$ are regularly homotopic if and only if there have equal degrees.

# Problem 5.

If $A$ and $B$ are disjoint closed subsets of a metric space $( X , d )$ and $[ a , b ]$ is a given closed interval, then there exists a continuous map $f : X \to [ a , b ]$ such that $f ( A ) = \{ a \}$ and $f ( B ) = \{ b \}$ .

# Problem 6.

For $f$ a complex-valued locally integrable function on $\mathbf { R } ^ { n }$ , set

$$
| | f | | _ {\mathbf {B M O}} := \sup _ {Q} \left(\frac {1}{| Q |} \int_ {Q} \left| f (x) - \mathbf {A v g} _ {Q} f \right| d x\right),
$$

where the supremum is taken over all cubes $Q$ in $\mathbf { R } ^ { n }$ and

$$
\mathbf {A v g} _ {Q} f := \frac {1}{| Q |} \int_ {Q} f (x) d x.
$$

Let BMO( $\mathbf { R } ^ { n }$ ) be the set of all complex-valued locally integrable functions on $\mathbf { R } ^ { n }$ with $| | f | | _ { \mathbf { B M O } } <$ $\infty$ .

(1) $| | \cdot | | _ { \bf B M O }$ is not a norm, and is only a seminorm.   
(2) $\begin{array} { r } { \sharp ^ { \infty } ( { \bf R } ^ { n } ) \subset { \bf B M O } ( { \bf R } ^ { n } ) \ \mathrm { a n d } \ \| \boldsymbol { f } \| _ { { \bf B M O } } \leq 2 | | \boldsymbol { f } | | _ { L ^ { \infty } } . } \end{array}$   
(3) Suppose that there exists an $A > 0$ such that for all cubes $Q$ in $\mathbf { R } ^ { n }$ there exists a constant $c _ { Q }$ such that

$$
\sup _ {Q} \left(\frac {1}{| Q |} \int_ {Q} | f (x) - c _ {Q} | d x\right) \leq A.
$$

then $f \in \mathbf { B M O } ( \mathbf { R } ^ { n } )$ and $| | f | | _ { \mathbf { B M O } } \leq 2 A$ .

(4) $L ^ { \infty } ( \mathbf { R } ^ { n } )$ is a proper subspace of $\mathbf { B M O } ( \mathbf { R } ^ { n } )$ .