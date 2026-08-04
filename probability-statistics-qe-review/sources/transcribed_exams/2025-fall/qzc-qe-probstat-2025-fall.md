# Qualifying Exam: 2025 Fall

考试课程: Probability & Statistics 姓名: 学号:

• There are 11 problems in this exam (3 pages). You need to choose 8 of them to solve. If you select more than 8, only the first 8 that you have worked on will be graded. Note that 4 of the problems are worth 15 points each and the rest 10 points each.

• You must follow all the rules of exam taking. Misconducts will be subject to proper disciplinary actions by the Center.

• You must provide all necessary details for full credits. A final answer with no or little explanation/derivation, even if correct, receives a minimal credit.

• R denotes the set of real numbers and $\mathbb { N } = \{ 1 , 2 , 3 , . . . \}$ denotes the set of positive integers. ${ \xrightarrow { ( d ) } } \operatorname { a n d } { \frac { ( d ) } { = } } $ mean “converges in distribution” and “equal in distribution”, respectively.

• Beta function Bet $\begin{array} { r } { \ i ( \alpha , \beta ) = \int _ { 0 } ^ { 1 } x ^ { \alpha - 1 } ( 1 - x ) ^ { \beta - 1 } d x = \frac { \Gamma ( \alpha ) \Gamma ( \beta ) } { \Gamma ( \alpha + \beta ) } } \end{array}$ where $\Gamma ( \cdot )$ is the gamma function. $\Gamma ( n ) = ( n - 1 ) !$ for any positive integer n.

• For $\mu \in \mathbb { R } , \sigma > 0$ , the 1-dimensional normal distribution ${ \mathcal { N } } ( \mu , \sigma ^ { 2 } )$ is defined by the density function

$$
f (x | \mu , \sigma^ {2}) = \frac {1}{\sqrt {2 \pi \sigma^ {2}}} \exp \left(- \frac {(x - \mu) ^ {2}}{2 \sigma^ {2}}\right).
$$

1. (10 points) Let X and N be two independent random variables. Suppose X follows the standard exponential distribution (i.e., with probability density function $e ^ { - x } \mathbf { 1 } _ { \{ x > 0 \} } )$ , and N follows the Poisson distribution with parameter $\lambda > 0$

(a) Find all $\lambda > 0$ such that $\mathbb { E } [ X ^ { N } ] < \infty$

(b) Calculate the expectation of $\mathbb { E } [ X ^ { N } ]$ under the above condition on λ.

(c) Is there any $\lambda > 0$ such that $\mathrm { V a r } [ X ^ { N } ] < \infty \stackrel { ? } { . }$ Justify your answer.

2. (10 points) Let X, Y be two independent random variables uniformly distributed on $[ 0 , 1 ]$ , and define

$$
Z := \max \{X, Y \}.
$$

(a) Determine the distribution of Z conditioned on $\{ X + Y \in [ 0 , 1 ] \}$

(b) Determine the distribution of Z conditioned on $\{ X + Y \in [ 1 , 2 ] \}$

3. (10 points) Let $( X _ { n } , \mathcal { F } _ { n } )$ be a martingale.

(a) Prove that if $( X _ { n } ^ { 2 } , \mathcal { F } _ { n } )$ is also a martingale, then $X _ { m } = X _ { n }$ a.s. for any $m , n \in \mathbb { N }$

(b) Prove that if $( | X _ { n } | ^ { p } , \mathcal { F } _ { n } )$ is a martingale for some $p > 1$ , then $\left( | X _ { n } | ^ { q } , \mathcal { F } _ { n } \right)$ is also a martingale for every $1 \leq q \leq p$

4. (15 points) Given independent random variables $( X _ { n } ) _ { n \in \mathbb { N } }$ satisfying

$$
\forall n \in \mathbb {N}, \qquad \mathbb {P} (X _ {n} = - 1) = \frac {1}{2}, \qquad \mathbb {P} (X _ {n} = 4 n) = \frac {1}{8 n}, \qquad \mathbb {P} (X _ {n} = 0) = \frac {1}{2} - \frac {1}{8 n},
$$

and denote $\begin{array} { r } { S _ { n } : = \sum _ { k = 1 } ^ { n } X _ { k } } \end{array}$ . Prove that almost surely

$$
\liminf _ {n \to \infty} \frac {S _ {n}}{n} <   0 <   \operatorname * {l i m s u p} _ {n \to \infty} \frac {S _ {n}}{n}.
$$

5. (10 points) Let $B _ { t }$ be a one-dimensional (1D) standard Brownian motion starting from 0. Define $X _ { t } = \exp ( B _ { t } - { \textstyle \frac { 1 } { 2 } } t )$

(a) Prove that $X _ { t }$ converges almost surely at $t \to \infty$

(b) For any $t > 0 .$ , calculate

$$
\mathbb {E} \int_ {0} ^ {t} X _ {s} \mathrm{d} s, \quad \mathrm{and} \quad \operatorname{Var} \int_ {0} ^ {t} X _ {s} \mathrm{d} s.
$$

(c) Show that

$$
\int_ {0} ^ {\infty} X _ {t} \mathrm{d} t <   \infty a. s.
$$

6. (15 points) Let M be a $2 \times 2$ real symmetric random matrix of the form

$$
M = \left( \begin{array}{c c} X _ {1} & Y \\ Y & X _ {2} \end{array} \right),
$$

where $X _ { 1 } , X _ { 2 } ,$ and Y are independent normal random variables: $X _ { 1 }$ and $X _ { 2 }$ follow the normal distribution $\mathcal { N } ( 0 , 2 )$ with mean 0 and variance 2, and Y follows the standard normal distribution $\mathcal { N } ( 0 , 1 )$ with mean 0 and variance 1. Let $\lambda _ { 1 } \geq \lambda _ { 2 }$ denote the eigenvalues of $M .$ , and let $\mathbf { v } _ { 1 }$ and $\mathbf { v } _ { 2 }$ be the corresponding unit eigenvectors.

(a) Find the distribution of $\lambda _ { 1 } + \lambda _ { 2 }$

(b) Find the distribution of $\lambda _ { 1 } - \lambda _ { 2 }$

(c) Are $\lambda _ { 1 }$ and $\lambda _ { 2 }$ independent? Prove your claim.

(d) Prove that the joint distribution of $\mathbf { ( v _ { 1 } , v _ { 2 } ) }$ is invariant under orthogonal transformations, i.e., for any $2 \times 2$ orthogonal matrix $O , ( O \mathbf { v } _ { 1 } , O \mathbf { v } _ { 2 } )$ has the same distribution as $\mathbf { ( v _ { 1 } , v _ { 2 } ) }$

7. (10 points) Suppose $\hat { \theta } _ { n }$ is a real-valued consistent estimator of a parameter of interest θ based on n observations, and it is further known that $\theta \in [ - 1 , 1 ]$ . Let $T _ { n }$ be a suficient statistic for θ. Show there exists a consistent estimator of θ based on $T _ { n }$

8. (15 points) Let $X _ { 1 } , . . . , X _ { n }$ <sub>n</sub> be iid $\sim \exp ( \lambda )$ (with pdf $\lambda e ^ { - \lambda x }$ for $x > 0 )$ . Let $\phi = P _ { \lambda } ( X _ { 1 } > x ) =$ $e ^ { - \lambda x }$

(a) Find a complete and suficient statistic for λ.

(b) Find the UMVUE of $\phi .$

9. (15 points) Let $X _ { 1 } , . . . , X _ { n }$ be iid Bernoulli(p) random variables with $0 < p < 1$

(a) Let $g ( p ) = p ^ { k } + ( 1 - p ) ^ { n - k }$ where k is a nonnegative integer and $0 \leq k \leq n$ . Find the BUE (UMVUE) for $g ( p )$

(b) Prove that $\begin{array} { r } { \bar { X } \ = \ \frac { \sum _ { i = 1 } ^ { n } X _ { i } } { n } } \end{array}$ is an admissible estimator/rule of $p$ under the loss function $\begin{array} { r } { l ( p , a ) = \frac { ( p - a ) ^ { 2 } } { p ( 1 - p ) } } \end{array}$

10. (10 points) Let $X _ { 1 } , . . . , X _ { n }$ be iid from the uniform distribution $\mathrm { U } ( 0 , \theta )$ with $\theta > 0$ unknown. Suppose that the prior on θ is lognormal, i.e., ln θ follows $\mathrm { N } ( \mu _ { 0 } , \sigma _ { 0 } ^ { 2 } )$ distribution where $\mu _ { 0 } \in \mathbb { R }$ and $\sigma _ { 0 } > 0$ are known constants.

(a) Find the posterior density of ln θ.

(b) Suppose that one defines the Bayes estimate for θ as the value that maximizes the posterior density of θ. Find this Bayes estimator. Is it consistent for θ? Please explain your answer.

11. (10 points) Let $X _ { 1 } , . . . , X _ { n }$ be iid random variables following a discrete uniform distribution on the set $1 , 2 , . . . , \theta .$ , where θ is an unknown positive integer. Let $\theta _ { 0 }$ be a known positive integer. Let $X _ { ( n ) }$ be the largest order statistic and $x _ { ( n ) }$ be its realized value. We are interested in the hypothesis testing problems below at level $0 < \alpha < 1$

(a) Consider testing $H _ { 0 } : \theta \leq \theta _ { 0 }$ versus $H _ { 1 } : \theta > \theta _ { 0 }$ . Show that

$$
\phi (\mathbf {x}) = \left\{ \begin{array}{l l} 1 & \quad \text { if } x _ {(n)} > \theta_ {0} \\ \alpha & \quad \text { if } x _ {(n)} \leq \theta_ {0} \end{array} \right.
$$

is a (randomized) UMP test of size α.

(b) Now consider testing $H _ { 0 } : \theta = \theta _ { 0 }$ versus $H _ { 1 } : \theta \neq \theta _ { 0 }$ . Show that

$$
\phi (\mathbf {x}) = \left\{ \begin{array}{l l} 1 & \quad \text { if } x _ {(n)} > \theta_ {0} \text { or } x _ {(n)} \leq \theta_ {0} \alpha^ {1 / n} \\ 0 & \quad \text { otherwise } \end{array} \right.
$$

is a UMP test of size α when $\theta _ { 0 } \alpha ^ { 1 / n }$ is an integer.