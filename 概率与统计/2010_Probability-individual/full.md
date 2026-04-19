# Applied Math., Computational Math., Probability and Statistics

Individual (Please select 5 problems to solve)

1. Let $Z _ { 1 } , \cdots , Z _ { n }$ be i.i.d. random variables with $Z _ { i } \sim N ( \mu , \sigma ^ { 2 } )$ . Find

$$
E (\sum_ {i = 1} ^ {n} Z _ {i} | Z _ {1} - Z _ {2} + Z _ {3}).
$$

2. Let $X _ { 1 } , \cdots , X _ { n }$ be pairwise independent. Further, assume that $E X _ { i } \ = \ 1 + \ i ^ { - 1 }$ and that $\operatorname* { m a x } _ { 1 \leq i \leq n } E | X _ { i } | ^ { 1 + \epsilon } < \infty$ for some $\epsilon > 0$ . Show that

$$
\frac {1}{n} \sum_ {i = 1} ^ {n} X _ {i} \xrightarrow {P} 1.
$$

3. Let $Z _ { 1 } , \cdots , Z _ { 6 }$ be i.i.d. random variables with $Z _ { i } \sim N ( 0 , 1 )$ . Set

$$
U ^ {2} = \frac {(Z _ {1} Z _ {2} + Z _ {3} Z _ {4} + Z _ {5} Z _ {6}) ^ {2}}{Z _ {2} ^ {2} + Z _ {4} ^ {2} + Z _ {6} ^ {2}}, V ^ {2} = \frac {U ^ {2} (Z _ {2} ^ {2} + Z _ {4} ^ {2})}{U ^ {2} + Z _ {6} ^ {2}}.
$$

Find and identify the densities of $U ^ { 2 }$ and $V ^ { 2 }$ .

4. Suppose that three characteristics in a large propulation can be observed according to the following frequencies

$$
p _ {1} = \theta^ {3}, \quad p _ {2} = 3 \theta (1 - \theta), \quad p _ {3} = (1 - \theta) ^ {3},
$$

where $\theta \in ( 0 , 1 )$ . Let $N _ { j } , ~ j = 1 , 2 , 3$ be the observed frequencies of characteristic $j$ in a random sample of size $n$ .

(a) Construct the approximate level $( 1 - \alpha )$ maximum likelihood confidence set for $\theta$ .   
(b) Derive the asymptotic distribution for the frequency substitution estimator $\hat { \theta } _ { 2 } = 1 - ( N _ { 3 } / n ) ^ { 1 / 3 }$ .

5. (1) Suppose

$$
S = \left[ \begin{array}{c c} \sigma & \mathbf {u} ^ {T} \\ 0 & S _ {c} \end{array} \right], \quad T = \left[ \begin{array}{c c} \tau & \mathbf {v} ^ {T} \\ 0 & T _ {c} \end{array} \right], \quad \mathbf {b} = \left[ \begin{array}{c} \beta \\ \mathbf {b} _ {c} \end{array} \right],
$$

where $\sigma$ , $\tau$ and $\beta$ are scalars, $S _ { c }$ and $T _ { c }$ are $n$ -by- $n$ matrices, and ${ \bf b } _ { c }$ is an $n$ -vector. Show that if there exists a vector $\mathbf { x } _ { c }$ such that

$$
(S _ {c} T _ {c} - \lambda I) \mathbf {x} _ {c} = \mathbf {b} _ {c}
$$

and $\mathbf { w } _ { c } = T _ { c } \mathbf { x } _ { c }$ is available, then

$$
\mathbf {x} = \left[ \begin{array}{l} \gamma \\ \mathbf {x} _ {c} \end{array} \right], \quad \gamma = \frac {\beta - \sigma \mathbf {v} ^ {T} \mathbf {x} _ {c} - \mathbf {u} ^ {T} \mathbf {w} _ {c}}{\sigma \tau - \lambda}
$$

solves $( S T - \lambda I ) \mathbf { x } = \mathbf { b }$ .

(2) Hence or otherwise, derive an $O ( n ^ { 2 } )$ algorithm for solving the linear system $( U _ { 1 } U _ { 2 } - \lambda I ) \mathbf { x } = \mathbf { b }$ where $U _ { 1 }$ and $U _ { 2 }$ are $n$ -by-$n$ upper triangular matrices, and $( U _ { 1 } U _ { 2 } - \lambda I )$ is nonsingular. Please write down your algorithm and prove that it is indeed of $O ( n ^ { 2 } )$ complexity.

(3) Hence or otherwise, derive an $O ( p n ^ { 2 } )$ algorithm for solving the linear system $( U _ { 1 } U _ { 2 } \cdot \cdot \cdot U _ { p } - \lambda I ) \mathbf { x } = \mathbf { b }$ where $\{ U _ { i } \} _ { i = 1 } ^ { p }$ are all $n$ - by- $n$ upper triangular matrices, and $( U _ { 1 } U _ { 2 } \cdot \cdot \cdot U _ { p } - \lambda I )$ is nonsingular. Please write down your algorithm and prove that it is indeed of $O ( p n ^ { 2 } )$ complexity.

6. (1) Let $A \in \mathbb { R } ^ { m \times n }$ , i.e. $A$ is an $m$ -by- $n$ real matrix. Show that there exists an $m$ -by- $m$ orthogonal matrix $U$ and an $n$ -by- $n$ orthogonal matrix $V$ such that

$$
U ^ {T} A V = \operatorname {d i a g} \left(\sigma_ {1}, \sigma_ {2}, \dots , \sigma_ {p}\right),
$$

where $p = \operatorname* { m i n } \{ m , n \}$ and

$$
\sigma_ {1} \geq \sigma_ {2} \geq \ldots \geq \sigma_ {p} \geq 0.
$$

(2) Let $\operatorname { r a n k } ( A ) = r$ . Show that for any positive integer $k < r$

$$
\min  _ {\operatorname {r a n k} (B) = k} \| A - B \| _ {2} = \sigma_ {k + 1}.
$$

(Hint: Consider the matrix $A _ { k } = \sum _ { i = 1 } ^ { k } \sigma _ { i } \mathbf { u } _ { i } \mathbf { v } _ { i } ^ { T }$ , where $\mathbf { u } _ { i }$ and $\mathbf { v } _ { i }$ are columns of $U$ and $V$ respectively.)