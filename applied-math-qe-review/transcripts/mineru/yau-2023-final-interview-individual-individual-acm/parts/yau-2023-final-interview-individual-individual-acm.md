# ST Yau College Students Mathematics Contest Applied and Computational Math (Individual Final)

June 10, 2023

1. Let $U \in \mathbb { R } ^ { n \times n }$ be an orthogonal matrix satisfying det $( \pmb { U } ) = 1$

(a) Prove that U can be written into the product of finitely many Givens rotation matrices. Recall that an $n \times n$ Givens rotation matrix is an orthogonal matrix $G ( i , j , \theta )$ , for some given indices $i > j$ and some angle $\theta \in [ 0 , 2 \pi ]$ , whose entries are the same as the identity matrix except for

$$
\left\{ \begin{array}{l} g _ {i i} = g _ {j j} = \cos \theta , \\ g _ {i j} = - g _ {j i} = \sin \theta . \end{array} \right.
$$

(b) Find an algorithm to compute the Givens decomposition in part $\mathrm { ( a ) }$

2. Let $A \in \mathbb { C } ^ { n \times n }$ be a self-adjoint matrix wth k dominant eigenvalues, which are denoted by $\lambda _ { j } , j = 1 , 2 , \cdots , n$ . In particular, we have

$$
\left| \lambda_ {1} \right| \geq \left| \lambda_ {2} \right| \geq \dots \geq \left| \lambda_ {k} \right| > \left| \lambda_ {k + 1} \right| \geq \dots \geq \left| \lambda_ {n} \right|.
$$

We write

$$
A = Q D Q ^ {*}
$$

where $Q \in \mathbb { C } ^ { n \times n }$ is unitary and $D = \mathrm { d i a g } ( \lambda _ { j } ) \in \mathbb { C } ^ { n \times n }$ is diagonal. Consider the following iteration

$$
X ^ {(m + 1)} = A X ^ {(m)}.
$$

Assume that $X ^ { ( 0 ) } \in \mathbb { C } ^ { n \times k }$ is given. Define $\widehat { P } \in \mathbb { C } ^ { n \times n }$ by

$$
\widehat {P} = \left( \begin{array}{c c} I _ {k} & 0 \\ 0 & 0 \end{array} \right)
$$

where $I _ { k }$ is the $k \times k$ identity matrix, and $P = Q \widehat { P } Q ^ { \ast }$ <sup>∗</sup>. Assume that $P X ^ { ( 0 ) }$ has independent columns.

(a) Show that $P X ^ { ( m ) }$ also has independent columns.

(b) Hence, show that $X ^ { ( m ) }$ has independent columns.

(c) Show that, there is a matrix $\boldsymbol { \Lambda } \in \mathbb { C } ^ { k \times k }$ such that

$$
\frac {\| (A X ^ {(m)} - X ^ {(m)} \Lambda) y \|}{\| P X ^ {(m)} y \|} \leq \left(\frac {| \lambda_ {k + 1} |}{| \lambda_ {k} |}\right) ^ {m} \frac {\| (A X ^ {(0)} - X ^ {(0)} \Lambda) y \|}{\| P X ^ {(0)} y \|}
$$

for all non-zero $y \in \mathbb { C } ^ { k }$

3. Consider a system of two ODEs of the form

$$
{\frac {d x}{d t}} = f (x, y), \quad {\frac {d y}{d t}} = g (x, y).
$$

Suppose that it is more computationally expensive to evaluate $g$ than to evaluate $f .$

(a) Prove that the multi-rate explicit Euler method defined by

$$
\begin{array}{c} x _ {j + 1 / 2} = x _ {j} + \frac {k}{2} f (x _ {j}, y _ {j}), \\ x _ {j + 1} = x _ {j + 1 / 2} + \frac {k}{2} f (x _ {j + 1 / 2}, y _ {j}), \\ y _ {j + 1} = y _ {j} + k g (x _ {j}, y _ {j}), \end{array}
$$

is locally second order, where k is the time step.

(b) Consider applying the method from (a) to the following linear problem:

$$
{\frac {d x}{d t}} = - x + y, \quad {\frac {d y}{d t}} = - y.
$$

Under what conditions on the time step k will the discrete solution remain stable, i.e., as $j \to \infty$ , both $x _ { j } \to 0$ and $y _ { j } \to 0$ for any initial conditions?

4. For the advection equation $u _ { t } + a u _ { x } = 0$ with $a > 0 ,$ , consider the five-point stencil:

$$
u _ {j} ^ {n + 1} = \frac {1}{2} (u _ {j - 1} ^ {n} + u _ {j + 1} ^ {n}) + \frac {a k}{1 2 h} (u _ {j + 2} ^ {n} - 8 u _ {j + 1} ^ {n} + 8 u _ {j - 1} ^ {n} - u _ {j - 2} ^ {n}).
$$

(a) Recall that the CFL condition for a scheme is when the numerical domain of dependence contains the analytic domain of dependence. It is a necessary condition for stability but not suficient. Write down the CFL condition for this scheme.

(b) Write down its amplification factor $g ( \omega )$ . Recall that the von Neumann stability Condition for a scheme is the condition on $a , k , h$ such that $| g ( \omega ) | < 1 + K k$ for all admissible ω, h, k. It is a necessary and suficient condition for stability. In this case, we see $| g ( \omega ) |$ depends on k through $\lambda = k / h$ , so the criterion reduced to $| g ( \omega ) | \le 1$ for all admissible $\omega , k , h$ . Find out the von Neumann condition for this scheme. How does that compare with the CFL condition?