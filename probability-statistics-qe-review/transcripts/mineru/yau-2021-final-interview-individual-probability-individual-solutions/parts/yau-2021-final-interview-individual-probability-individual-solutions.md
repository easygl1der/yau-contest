# Yau College Math Competition 2021 Final Probability and Statistics Individual Exam Problems (May 29, 2021)

Problem 1. Let $\{ X _ { n } \} _ { n \geq 1 }$ be a sequence of real valued, nonnegative random variables. Assume that there are constants $C > 0$ and $\lambda > 0$ such that $\mathbb { E } X _ { n } \leq C e ^ { - \lambda n } , \ \forall n \geq 1$ Prove that

$$
P \Big (\limsup _ {n \to \infty} \frac {1}{n} \ln X _ {n} \leq - \lambda \Big) = 1.
$$

## Solution

For any $\lambda _ { 0 } \in ( 0 , \lambda )$ , define the events

$$
A _ {n} = \{\omega \in \Omega : X _ {n} (\omega) > e ^ {- \lambda_ {0} n} \}, \quad n \geq 1.
$$

$\mathrm { B y }$ Chebyshev’s inequality,

$$
\mathbb {P} (A _ {n}) \leq e ^ {\lambda_ {0} n} \mathbb {E} X _ {n} \leq C e ^ {(\lambda_ {0} - \lambda) n}, \quad \forall n \geq 1.
$$

Since $\lambda _ { 0 } < \lambda$ , we have

$$
\sum_ {n = 1} ^ {\infty} \mathbb {P} (A _ {n}) \leq \sum_ {n = 1} ^ {\infty} C e ^ {(\lambda_ {0} - \lambda) n} <   + \infty .
$$

Borel-Cantelli’s lemma implies that for $\mathbb { P } \mathrm { - a . s . } \ \omega \in \Omega$ , there exists $n ( \omega ) \in \mathbb { N }$ such that for all $n \geq n ( \omega )$ , we have $\omega \in A _ { n } ^ { c }$ , that is $X _ { n } ( \omega ) \leq e ^ { - \lambda _ { 0 } n }$ . Therefore,

$$
\frac {1}{n} \ln X _ {n} (\omega) \leq - \lambda_ {0}, \quad \forall n \geq n (\omega).
$$

This implies the desired result since $\lambda _ { 0 }$ is an arbitrary number less than λ.

Problem 2. Assume that $X _ { 1 } , \dots , X _ { n } \sim U [ 0 , 1 ]$ (uniform distribution) are i.i.d. Denote $\begin{array} { r } { X _ { ( 1 ) } = \operatorname* { m i n } _ { 1 \leq k \leq n } X _ { k } } \end{array}$ and $X _ { ( n ) } = \operatorname* { m a x } _ { 1 \leq k \leq n } X _ { k }$ . Let $R = X _ { ( n ) } - X _ { ( 1 ) }$ be the sample range and $V = ( X _ { ( 1 ) } + X _ { ( n ) } ) / 2$ be the sample midvalue.

(1). Find the joint density of $( X _ { ( 1 ) } , X _ { ( n ) } )$

(2). Find the joint density of $( R , V )$

(3). Find the density of R and the density of $V$ .

## Solution

(1). Denote $F ( x _ { 1 } , x _ { n } ) = P ( X _ { ( 1 ) } \leq x _ { 1 } , X _ { ( n ) } \leq x _ { n } )$ , then $F ( x _ { 1 } , x _ { n } ) = 0$ for $x _ { 1 } \notin [ 0 , 1 ]$ or $x _ { n } \notin [ 0 , 1 ]$ . If $x _ { 1 } \geq x _ { n }$ , then $\{ X _ { ( n ) } \leq x _ { n } \} \subset \{ X _ { ( 1 ) } \leq x _ { 1 } \}$ , and therefore

$$
F (x _ {1}, x _ {n}) = P (X _ {(n)} \leq x _ {n}).
$$

If $0 \leq x _ { 1 } \leq x _ { n } \leq 1$ , then

$$
\begin{array}{c} P (X _ {(1)} \geq x _ {1}, X _ {(n)} \leq x _ {n}) = P (\cup_ {k = 1} ^ {n} \{x _ {1} \leq X _ {k} \leq x _ {n}) \\ = \prod_ {k = 1} ^ {n} P (x _ {1} \leq X _ {k} \leq x _ {n}) \\ = (x _ {n} - x _ {1}) ^ {n}, \end{array}
$$

which implies that

$$
\begin{array}{c} F (x _ {1}, x _ {n}) = P (X _ {(n)} \leq x _ {n}) - P (X _ {(1)} \geq x _ {1}, X _ {(n)} \leq x _ {n}) \\ = P (X _ {(n)} \leq x _ {n}) - (x _ {n} - x _ {1}) ^ {n}. \end{array}
$$

Thus,

$$
\begin{array}{l} f (x _ {1}, x _ {n}) = \frac {\partial^ {2} F (x _ {1} , x _ {n})}{\partial x _ {1} \partial x _ {n}} \\ \qquad = \left\{ \begin{array}{l l} n (n - 1) (x _ {n} - x _ {1}) ^ {n - 2}, & \text { if } 0 \leq x _ {1} \leq x _ {n} \leq 1, \\ 0, & \text { elsewhere }. \end{array} \right. \end{array}
$$

(2). Note that

$$
\binom{X _ {(1)}}{X _ {(n)}} = \left( \begin{array}{c c} - \frac {1}{2} & 1 \\ \frac {1}{2} & 1 \end{array} \right) \binom{R}{V} \equiv A \binom{R}{V},
$$

thus the joint density of (R, V ) is

$$
\begin{array}{c} f _ {R, V} (r, v) = f (x _ {1}, x _ {n}) \times | \det A | \\ = f \Big (v - \frac {r}{2}, v + \frac {r}{2} \Big) \\ = n (n - 1) r ^ {n - 2}, \end{array}
$$

where $( r , v ) \in D \equiv \{ ( r , v ) : 0 \leq v - { \frac { r } { 2 } } \leq v + { \frac { r } { 2 } } \leq 1 \}$ and

$$
f _ {R, V} (r, v) = 0,
$$

if $( r , v ) \notin D .$

(3) The density of R is

$$
\begin{array}{l} f _ {R} (r) = \int_ {- \infty} ^ {+ \infty} f _ {R, V} (r, v) d v \\ = \int_ {r / 2} ^ {1 - r / 2} f _ {R, V} (r, v) d v = n (n - 1) r ^ {n - 2} (1 - r), \quad 0 \leq r \leq 1. \end{array}
$$

For the density of V , if $v \in [ 0 , 1 / 2 ]$ ], then

$$
f _ {V} (v) = \int_ {- \infty} ^ {+ \infty} f _ {R, V} (r, v) d r = \int_ {0} ^ {2 v} n (n - 1) r ^ {n - 2} d r = n (2 v) ^ {n - 1},
$$

if $v \in [ 1 / 2 , 1 ]$ , then

$$
f _ {V} (v) = \int_ {- \infty} ^ {+ \infty} f _ {R, V} (r, v) d r = \int_ {0} ^ {2 (1 - v)} n (n - 1) r ^ {n - 2} d r = n (2 (1 - v)) ^ {n - 1}.
$$

Problem 3. A binary tree is a tree in which each node has exactly two descendants. Suppose that each node of the tree is coloured black with probability p, and white otherwise, independently of all other nodes. For any path π containing n nodes beginning at the root of the tree, let $B ( \pi )$ be the number of black nodes in π, and let $X _ { n } ( k )$ be the number of such paths π for which $B ( \pi ) \geq k$

(1) Show that there exists $\beta _ { c }$ such that

$$
\lim _ {n \to \infty} \mathbb {E} (X _ {n} (\beta n)) = \left\{ \begin{array}{l l} 0, & \text { if } \beta > \beta_ {c}, \\ \infty , & \text { if } \beta <   \beta_ {c}. \end{array} \right.
$$

How to determine the value of $\beta _ { c } ?$

(2) For $\beta \neq \beta _ { c }$ , find the limit li $\operatorname { 1 } _ { n \to \infty } \mathbb { P } \big ( X _ { n } \bigl ( \beta n \bigr ) \geq 1 \bigr )$

## Solution

The number of paths π containing exactly n nodes is $2 ^ { n - 1 }$ , and each such π satisfies $\mathbb { P } ( B ( \pi ) \geq k ) = \mathbb { P } \left( S _ { n } \geq k \right)$ where $S _ { n } = Y _ { 1 } + Y _ { 2 } + \cdot \cdot \cdot + Y _ { n }$ is the sum of n independent Bernoulli variables having parameter p. Therefore $\mathbb { E } ( X _ { n } ( k ) ) = 2 ^ { n - 1 } \mathbb { P } \left( S _ { n } \geq k \right)$ . We set $k = n \beta$ , and need to estimate P $( S _ { n } \geq n \beta )$ . It is a consequence of the large deviation theorem that, if $p \leq \beta < 1$

$$
\mathbb {P} \left(S _ {n} \geq n \beta\right) ^ {1 / n} \stackrel {n \to \infty} {\longrightarrow} \inf _ {t > 0} \left\{e ^ {- t \beta} M (t) \right\}
$$

where $M ( t ) = \mathbb { E } \left( e ^ { t Y _ { 1 } } \right) = q + p e ^ { t } , q = 1 - p$ . With some calculus, we find that

$$
\mathbb {P} \left(S _ {n} \geq n \beta\right) ^ {1 / n} \stackrel {{n \rightarrow \infty}} {{\longrightarrow}} \left(\frac {p}{\beta}\right) ^ {\beta} \left(\frac {1 - p}{1 - \beta}\right) ^ {1 - \beta}, \quad p \leq \beta <   1
$$

Hence

$$
\mathbb {E} (X _ {n} (\beta n)) \stackrel {{n \to \infty}} {{\longrightarrow}} \left\{ \begin{array}{l l} 0, & \text {if} \gamma (\beta) <   1 \\ \infty , & \text {if} \gamma (\beta) > 1 \end{array} \right.
$$

where

$$
\gamma (\beta) = 2 \left(\frac {p}{\beta}\right) ^ {\beta} \left(\frac {1 - p}{1 - \beta}\right) ^ {1 - \beta}
$$

is a decreasing function of $\beta .$ . If $\begin{array} { r } { p < { \frac { 1 } { 2 } } } \end{array}$ , there is a unique $\beta _ { c } \in [ p , 1 )$ such that $\gamma \left( \beta _ { c } \right) = 1$ ; if $\begin{array} { r } { p \geq \frac { 1 } { 2 } } \end{array}$ then $\gamma ( \beta ) > 1$ for all $\beta \in [ p , 1 )$ so that we may take $\beta _ { c } = 1$

Turning to the final part,

$$
\mathbb {P} \left(X _ {n} (\beta n) \geq 1\right) \leq \mathbb {E} (X _ {n} (\beta n)) \stackrel {{n \rightarrow \infty}} {{\longrightarrow}} 0, \quad \text { if } \beta > \beta_ {c}.
$$

As for the other case, we will use the Payley-Zygmund inequality

$$
\mathbb {P} (N \neq 0) \geq \frac {\mathbb {E} (N) ^ {2}}{\mathbb {E} \left(N ^ {2}\right)}
$$

for nonnegative random variable N.

We have that $\begin{array} { r } { \mathbb { E } ( X _ { n } ( \beta n ) ^ { 2 } ) = \sum _ { \pi , \rho } \mathbb { E } \left( I _ { \pi } I _ { \rho } \right) } \end{array}$ , where the sum is over all such paths $\pi , \rho _ { ; }$ and $I _ { \pi }$ is the indicator function of the event $\{ B ( \pi ) \geq \beta n \}$ . Hence

$$
\mathbb {E} (X _ {n} (\beta n) ^ {2}) = \sum_ {\pi} \mathbb {E} (I _ {\pi}) + \sum_ {\pi \neq \rho} \mathbb {E} (I _ {\pi} I _ {\rho}) = \mathbb {E} (X _ {n} (\beta n)) + 2 ^ {n - 1} \sum_ {\rho \neq L} \mathbb {E} (I _ {L} I _ {\rho})
$$

where $L$ is the path which always takes the left fork (there are $2 ^ { n - 1 }$ choices for $\pi ,$ and by symmetry each provides the same contribution to the sum). We divide up the last sum according to the number of nodes in common to $\rho$ and $L ,$ obtaining $\begin{array} { r } { \sum _ { m = 1 } ^ { n - 1 } 2 ^ { n - m - 1 } \mathbb { E } \left( I _ { L } I _ { M } \right) } \end{array}$ where M is a path having exactly m nodes in common with $L$ . Now

$$
\mathbb {E} \left(I _ {L} I _ {M}\right) = \mathbb {E} \left(I _ {M} \mid I _ {L} = 1\right) \mathbb {E} \left(I _ {L}\right) \leq \mathbb {P} \left(T _ {n - m} \geq \beta n - m\right) \mathbb {E} \left(I _ {L}\right),
$$

where $T _ { n - m }$ has the Binomial $( n - m , p )$ distribution (the ’most value’ to $I _ { M }$ of the event $\{ I _ { L } = 1 \}$ is obtained when all m nodes in $L \cap M$ are black). However

$$
\mathbb {E} \left(I _ {M}\right) = \mathbb {P} \left(T _ {n} \geq \beta n\right) \geq p ^ {m} \mathbb {P} \left(T _ {n - m} \geq \beta n - m\right),
$$

so that E $\left( I _ { L } I _ { M } \right) \leq p ^ { - m } \mathbb { E } \left( I _ { L } \right) \mathbb { E } \left( I _ { M } \right)$ . It follows that $N = X _ { n } ( \beta n )$ satisfies

$$
\mathbb {E} \left(N ^ {2}\right) \leq \mathbb {E} (N) + 2 ^ {n - 1} \sum_ {m = 1} ^ {n - 1} 2 ^ {n - m - 1} \cdot \frac {1}{p ^ {m}} \mathbb {E} \left(I _ {L}\right) \mathbb {E} \left(I _ {M}\right) = \mathbb {E} (N) + \frac {1}{2} (\mathbb {E} (N)) ^ {2} \sum_ {m = 1} ^ {n - 1} \left(\frac {1}{2 p}\right) ^ {m}
$$

whence, by the Payley-Zygmund inequality,

$$
\mathbb {P} (N \neq 0) \geq \frac {1}{\mathbb {E} (N) ^ {- 1} + \frac {1}{2} \sum_ {m = 1} ^ {n - 1} (2 p) ^ {- m}}.
$$

If $\beta < \beta _ { c }$ then $\mathbb { E } ( N ) \to \infty$ as $n  \infty$ . It is immediately evident that $\mathbb { P } ( N \neq 0 ) \to 1$ if $\begin{array} { r } { p \leq \frac { 1 } { 2 } } \end{array}$ . Suppose finally that $\begin{array} { r } { p > \frac { 1 } { 2 } } \end{array}$ and $\beta < \beta _ { c }$ . By the above inequality,

$$
\mathbb {P} \left(X _ {n} (\beta n) > 0\right) \geq c (\beta), \quad \forall n\tag{0.1}
$$

where $c ( \beta )$ is some positive constant. Take $\epsilon > 0$ such that $\beta + \epsilon < \beta _ { c }$ . Fix a positive integer $m ,$ and let $\mathcal { P } _ { m }$ be a collection of $2 ^ { m }$ disjoint paths each of length $n - m$ starting from depth m in the tree. Now

$$
\mathbb {P} \left(X _ {n} (\beta n) = 0\right) \leq \mathbb {P} (B (v) <   \beta n \text {   for   all   } v \in \mathcal {P} _ {m}) = \mathbb {P} (B (v) <   \beta n) ^ {2 ^ {m}},
$$

where $v \in \mathcal { P } _ { m }$ . However

$$
\mathbb {P} (B (v) <   \beta n) \leq \mathbb {P} (B (\nu) <   (\beta + \epsilon) (n - m))
$$

if $\beta n < ( \beta + \epsilon ) ( n - m )$ , which is to say that $n \ge ( \beta + \epsilon ) m / \epsilon$ . Hence, for all large $n ,$

$$
\mathbb {P} \left(X _ {n} (\beta n) = 0\right) \leq (1 - c (\beta + \epsilon)) ^ {2 ^ {m}}
$$

by (0.1). We let $n  \infty$ and $m  \infty$ in that order, to obtain $\mathbb { P } ( X _ { n } ( \beta n ) = 0 )  0$ as $n \to \infty$ . In summary,

$$
\mathbb {P} (X _ {n} (\beta n) \geq 1) \stackrel {{n \to \infty}} {{\longrightarrow}} \left\{ \begin{array}{l l} 0, & \text { if } \beta > \beta_ {c}, \\ 1, & \text { if } \beta <   \beta_ {c}. \end{array} \right.
$$