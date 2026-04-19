# INDIVIDUAL TEST S.-T YAU COLLEGE MATH CONTESTS 2012

# Applied Math. and Computational Math.

Please solve 4 out of the following 5 problems, or highest scores of 4 problems will be counted.

1. In the numerical integration formula

$$
\int_ {- 1} ^ {1} f (x) d x \approx a f (- 1) + b f (c), \tag {1}
$$

if the constants $a$ , $b$ , $c$ can be chosen arbitrarily, what is the highest degree $k$ such that the formula is exact for all polynomials of degree up to $k$ ? Find the constants $a$ , $b$ , $c$ for which the formula is exact for all polynomials of degree up to this $k$ .

2. Here is the definition of a moving least square approximation of a function $f ( x )$ near a point $x$ given $K$ points $x _ { k }$ around $x$ in $\mathbb { R }$ , $k \in$ $\lfloor 1 , \cdots , K \rfloor$ .

$$
\min  _ {P _ {\bar {x}} \in \Pi_ {m}} \sum_ {k = 1} ^ {K} \left| P _ {\bar {x}} \left(x _ {k}\right) - f _ {k} \right| ^ {2} \tag {2}
$$

where $f _ { k } = f ( x _ { k } )$ , $\Pi _ { m }$ is the space of polynomials of degree less or equal to $m$ , i.e.

$$
P _ {\overline {{x}}} (x) = \mathbf {b} _ {\overline {{x}}} (x) ^ {T} \mathbf {c} (\overline {{x}}),
$$

$\mathbf { c } ( \overline { { x } } ) = \left[ c _ { 0 } , c _ { 1 } , \cdots , c _ { m } \right] ^ { T }$ is the coefficient vector to be determined by (2),

${ \bf b } _ { \overline { { x } } } ( x )$ is the polynomial basis vector, $\mathbf { b } _ { \overline { { x } } } ( x ) = \left[ 1 , x - \overline { { x } } , ( x - \overline { { x } } ) ^ { 2 } , \ldots , ( x - \overline { { x } } ) ^ { m } \right] ^ { T }$ .

Assume that there are $K > m$ different points $x _ { k }$ and $f ( x )$ is smooth,

(a) prove that there is a unique solution $\overline { { { P } } } _ { \overline { { x } } } ( x )$ to (2)   
(b) denote $h = \operatorname* { m a x } _ { k } \ \left| x _ { k } - { \overline { { x } } } \right|$ , prove

$$
| c _ {i} - \frac {1}{i !} f ^ {(i)} (\overline {{x}}) | = C (f, i) h ^ {m + 1 - i}, i = 0, 1, \ldots , m,
$$

where $f ^ { ( i ) } ( \cdot )$ is the $i$ -th derivative of $f$ and $C ( f , i )$ denote some constant depending on $f , i$ .

(c) if $S = \{ x _ { k } | k = 1 , 2 , \ldots , K \}$ are symmetrically distributed around $\textstyle { \overline { { x } } }$ , that is, if $x _ { k } \in S$ then $2 \overline { { x } } - x _ { k } \in S$ , prove that

$$
\left| c _ {i} - \frac {1}{i !} f ^ {(i)} (\bar {x}) \right| = C (f, i) h ^ {m + 2 - i}, i = 0, 1, \dots , m,
$$

for $i$ $( \in \{ 0 , 1 , \cdots , m \} )$ with the same parity of $m$

3. Describe the forward-in-time and center-in-space finite difference scheme for the one-wave wave equation:

$$
u _ {t} + u _ {x} = 0.
$$

(i). Conduct the von Neumann stability analysis and comment on their stability property.   
(ii). Under what condition on $\Delta t$ and $\Delta x$ would this scheme be stable and convergent?   
(iii). How many ways you can modify this scheme to make it stable when the CFL condition is satisfied.

4. Let $C$ and $D$ in $\mathbb { C } ^ { n \times n }$ be Hermitian matrices. Denote their eigenvalues by

$$
\lambda_ {1} \geq \lambda_ {2} \geq \dots \geq \lambda_ {n} \quad \text {a n d} \quad \mu_ {1} \geq \mu_ {2} \geq \dots \geq \mu_ {n},
$$

respectively. Then it is known that

$$
\sum_ {i = 1} ^ {n} \left(\lambda_ {i} - \mu_ {i}\right) ^ {2} \leq \| C - D \| _ {F} ^ {2}.
$$

1) Let $A$ and $B$ be in $\mathbb { C } ^ { n \times n }$ . Denote their singular values by

$$
\sigma_ {1} \geq \sigma_ {2} \geq \dots \geq \sigma_ {n} \quad \text {a n d} \quad \tau_ {1} \geq \tau_ {2} \geq \dots \geq \tau_ {n},
$$

respectively. Prove that the following inequality holds:

$$
\sum_ {i = 1} ^ {n} \left(\sigma_ {i} - \tau_ {i}\right) ^ {2} \leq \| A - B \| _ {F} ^ {2}.
$$

2) Given $A \ \in \ \mathbb { R } ^ { n \times n }$ and its SVD is $A \ = \ U \Sigma V ^ { T }$ , where $U =$ $\left( \mathbf { u } _ { 1 } , \mathbf { u } _ { 2 } , \ldots , \mathbf { u } _ { n } \right)$ , $V = \left( \mathbf { v } _ { 1 } , \mathbf { v } _ { 2 } , \ldots , \mathbf { v } _ { n } \right)$ are orthogonal matrices, and

$$
\Sigma = \operatorname {d i a g} \left(\sigma_ {1}, \sigma_ {2}, \dots , \sigma_ {n}\right), \quad \sigma_ {1} \geq \sigma_ {2} \geq \dots \geq \sigma_ {n} \geq 0.
$$

Suppose $\operatorname { r a n k } ( A ) > k$ and denote by

$$
U _ {k} = \left(\mathbf {u} _ {1}, \mathbf {u} _ {2}, \dots , \mathbf {u} _ {k}\right), \quad V _ {k} = \left(\mathbf {v} _ {1}, \mathbf {v} _ {2}, \dots , \mathbf {v} _ {k}\right), \quad \Sigma_ {k} = \operatorname {d i a g} \left(\sigma_ {1}, \sigma_ {2}, \dots , \sigma_ {k}\right),
$$

and

$$
A _ {k} = U _ {k} \Sigma_ {k} V _ {k} ^ {T} = \sum_ {i = 1} ^ {k} \sigma_ {i} \mathbf {u} _ {i} \mathbf {v} _ {i} ^ {T}.
$$

Prove that

$$
\min _ {\operatorname {r a n k} (B) = k} \| A - B \| _ {F} ^ {2} = \| A - A _ {k} \| _ {F} ^ {2} = \sum_ {i = k + 1} ^ {n} \sigma_ {i} ^ {2}.
$$

3) Let the vectors $\mathbf { x } _ { i } \in \mathbb { R } ^ { n }$ , $i = 1 , 2 , \dots , n$ , be in the space $\mathcal { W }$ with dimension $d$ , where $d \ll n$ . Let the orthonormal basis of $\mathcal { W }$ be $W \in \mathbb { R } ^ { n \times d }$ . Then we can represent $\mathbf { x } _ { i }$ by

$$
\mathbf {x} _ {i} = \mathbf {c} + W \mathbf {r} _ {i} + \mathbf {e} _ {i}, i = 1, 2, \ldots , n,
$$

where $\mathbf { c } \in \mathbb { R } ^ { n }$ is a constant vector, $\mathbf { r } _ { i } \in \mathbb { R } ^ { d }$ is the coordinate of the point $\mathbf { x } _ { i }$ in the space $\mathcal { W }$ , and $\mathbf { e } _ { i }$ is the error. Denote $R = \left( \mathbf { r } _ { 1 } , \mathbf { r } _ { 2 } , \ldots , \mathbf { r } _ { n } \right)$ and $E = ( \mathbf { e } _ { 1 } , \mathbf { e } _ { 2 } , \ldots , \mathbf { e } _ { n } )$ . Find $W$ , $R$ and $\mathbf { c }$ such that the error $\| E \| _ { F }$ is minimized.

(Hint: write $X = [ \mathbf { x } _ { 1 } , \mathbf { x } _ { 2 } , \ldots , \mathbf { x } _ { n } ] = \mathbf { c } ( 1 , 1 , \ldots , 1 ) + W R + E . )$

5. Two primes $p$ and $q$ are called twin primes if $q ~ = ~ p + 2$ . For example, 5 and 7, 11 and 13, 29 and 31 are twin primes. There is a still unproven (but extensively numerically verified) conjecture that there are infinitely many twin primes and that they are rather common. Show how to factor an integer $N$ which is a product of two twin primes.