# S.-T. Yau College Student Mathematics Contests 2011

# Applied Math., Computational Math., Probability and Statistics

Team 9:00–12:00 am, July 9, 2011 (Please select 5 problems to solve)

1. Let $A$ be an $N$ -by- $N$ symmetric positive definite matrix. The conjugate gradient method can be described as follows:

$$
\mathbf {r} _ {0} = \mathbf {b} - A \mathbf {x} _ {0}, \mathbf {p} _ {0} = \mathbf {r} _ {0}, \mathbf {x} _ {0} = 0
$$

$$
\mathrm {F O R} n = 0, 1, \dots
$$

$$
\alpha_ {n} = \lVert \mathbf {r} _ {n} \rVert_ {2} ^ {2} / (\mathbf {p} _ {n} ^ {T} A \mathbf {p} _ {n})
$$

$$
\mathbf {x} _ {n + 1} = \mathbf {x} _ {n} + \alpha_ {n} \mathbf {p} _ {n}
$$

$$
\mathbf {r} _ {n + 1} = \mathbf {r} _ {n} - \alpha_ {n} A \mathbf {p} _ {n}
$$

$$
\beta_ {n} = - \mathbf {r} _ {k + 1} ^ {T} A \mathbf {p} _ {k} / \mathbf {p} _ {k} ^ {T} A \mathbf {p} _ {k}
$$

$$
\mathbf {p} _ {n + 1} = \mathbf {r} _ {n + 1} + \beta_ {n} \mathbf {p} _ {n}
$$

END FOR

Show

(a) $\alpha _ { n }$ minimizes $f ( \mathbf { x } _ { n } + \alpha \mathbf { p } _ { n } )$ for all $\alpha \in \mathbb { R }$ where

$$
f (\mathbf {x}) \equiv \frac {1}{2} \mathbf {x} ^ {T} A \mathbf {x} - \mathbf {b} ^ {T} \mathbf {x}.
$$

(b) $\mathbf { p } _ { i } ^ { T } \mathbf { r } _ { n } = 0$ for $i < n$ and $\mathbf { p } _ { i } ^ { T } A \mathbf { p } _ { j } = 0$ if $i \neq j$   
(c) $\mathrm { S p a n } \{ \mathbf { p } _ { 0 } , \mathbf { p } _ { 1 } , \dots , \mathbf { p } _ { n - 1 } \} { = } \mathrm { S p a n } \{ \mathbf { r } _ { 0 } , \mathbf { r } _ { 1 } , \dots , \mathbf { r } _ { n - 1 } \} \equiv K _ { n }$   
(d) $\mathbf { r } _ { n }$ is orthogonal to $K _ { n }$

2. We use the following scheme to solve the PDE $u _ { t } + u _ { x } = 0$ :

$$
u _ {j} ^ {n + 1} = a u _ {j - 2} ^ {n} + b u _ {j - 1} ^ {n} + c u _ {j} ^ {n}
$$

where ∆x $\frac { \Delta t } { \Delta x }$ . Here $a$ , $b$ $x _ { j } = j \Delta x$ , $c$ are constants which may depend on the CFL number , $t ^ { n } = n \Delta t$ and $u _ { j } ^ { n }$ is the numerical approximation $\lambda =$ to the exact solution $u ( x _ { j } , t ^ { n } )$ , with periodic boundary conditions.

(i) Find $a$ , $b$ , $c$ so that the scheme is second order accurate.   
(ii) Verify that the scheme you derived in Part (i) is exact (i.e. $u _ { j } ^ { n } =$ $u ( x _ { j } , t ^ { n } ) )$ if $\lambda = 1$ or $\lambda = 2$ . Does this imply that the scheme is stable for $\lambda \leq 2 ^ { \cdot }$ ? If not, find $\lambda _ { 0 }$ such that the scheme is stable for $\lambda \le \lambda _ { 0 }$ . Recall that a scheme is stable if there exist constants $M$ and $C$ , which are independent of the mesh sizes $\Delta x$ and $\Delta t$ , such that

$$
\| u ^ {n} \| \leq M e ^ {C T} \| u ^ {0} \|
$$

for all $\Delta x$ , $\Delta t$ and $n$ such that $t ^ { n } \leq T$ . You can use either the $L ^ { \infty }$ norm or the $L ^ { 2 }$ norm to prove stability.

3. Let $X$ and $Y$ be independent random variables, identically distributed according to the Normal distribution with mean 0 and variance 1, $N ( 0 , 1 )$ .

(a) Find the joint probability density function of $( R , \theta )$ , where

$$
R = (X ^ {2} + Y ^ {2}) ^ {1 / 2} \quad \text {a n d} \quad \theta = \arctan (Y / X).
$$

(b) Are $R$ and $\theta$ independent? Why, or why not?   
(c) Find a function $U$ of $R$ which has the uniform distribution on (0, 1), Unif(0, 1).   
(d) Find a function $V$ of $\theta$ which is distributed as Unif(0,1).   
(e) Show how to transform two independent observations $U$ and $V$ from Unif(0,1) into two independent observations $X$ , $Y$ from $N ( 0 , 1 )$ .

4. Let $X$ be a random variable such that $E [ | X | ] < \infty$ . Show that

$$
E [ | X - a | ] = \inf  _ {x \in R} E [ | X - x | ],
$$

if and only if $a$ is a median of $X$

5. Let $Y _ { 1 } , \dots , Y _ { n }$ be iid observations from the distribution $f ( x - \theta )$ , where $\theta$ is unknown and $f ( \mathbf { \theta } )$ is probability density function symmetric about zero.

Suppose a priori that $\theta$ has the improper prior $\theta \sim$ Lebesgue (flat) on $( - \infty , \infty )$ . Write down the posterior distribution of $\theta$ .

Provides some arguments to show that this flat prior is noninformative.

Show that with the posterior distribution in (a), a 95% probability interval is also a 95% confidence interval.

6. Suppose we have two independent random samples {Y1, $i = 1 , \ldots , n \}$ from Poisson with (unknown) mean $\lambda _ { 1 }$ and $\{ Y _ { i } , \ i = n + 1 , \dots , 2 n \}$ from Poisson with (unknown) mean $\lambda _ { 2 }$ Let $\theta = \lambda _ { 1 } / ( \lambda _ { 1 } + \lambda _ { 2 } )$ .

(a) Find an unbiased estimator of $\theta$   
(b) Does your estimator have the minimum variance among all unbiased estimators? If yes, prove it. If not, find one that has the minimum variance (and prove it).   
(c) Does the unbiased minimum variance estimator you found attain the Fisher information bound? If yes, show it. If no, why not?