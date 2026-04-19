# INDIVIDUAL TEST S.-T YAU COLLEGE MATH CONTESTS 2012

# Probability and Statistics

Please solve 5 out of the following 6 problems, or highest scores of 5 problems will be counted.

1. Solve the following two problems:

1) An urn contains $b$ black balls and $r$ red balls. One of the balls was drawn at random, and putted back in the urn with $a$ additional balls of the same color. Now suppose that the second ball drawn at random is red. What is the probability that the first ball drawn was black?

2) Let ( $X _ { n }$ ) be a sequence of random variables satisfying

$$
\lim  _ {a \to \infty} \sup  _ {n \geq 1} P (| X _ {n} | > a) = 0.
$$

Assume that sequence of random variables ( $Y _ { n }$ ) converges to 0 in probability. Prove that $( X _ { n } Y _ { n } )$ converges to 0 in probability.

2. Solve the following two problems:

1) Let $( \Omega , { \mathcal { F } } , P )$ be a probability space, $\mathcal { G }$ be a sub-algebra of $\mathcal { F }$ . Assume that $X$ is a non-negative integrable random variable. Set $Y =$ $E [ X | { \mathcal { G } } ]$ . Prove that

$( \mathrm { a } ) [ X > 0 ] \subset [ Y > 0 ]$ ,a.s.;

$( \mathrm { b } ) [ Y > 0 ] = \mathrm { e s s . i n f } \{ A : A \in { \mathcal { G } } , ~ [ X > 0 ] \subset A \}$

2) Let $X$ and $Y$ have a bivariate normal distribution with zero means, variances $\sigma ^ { 2 }$ and $\tau ^ { 2 }$ , respectively, and correlation $\rho$ . Find the conditional expectation $E ( X | X + Y )$ .

3. Suppose that $\{ p ( i , j ) : i = 1 , 2 , \cdots , m ; j = 1 , 2 , \cdots , n \}$ is a finite bivariate joint probability distribution, that is,

$$
p (i, j) > 0, \sum_ {i = 1} ^ {m} \sum_ {j = 1} ^ {n} p (i, j) = 1.
$$

(i) Can $\{ p ( i , j ) \}$ be always expressed as

$$
p (i, j) = \sum_ {k} \lambda_ {k} a _ {k} (i) b _ {k} (j)
$$

for some finiteP $\begin{array} { r } { \lambda _ { k } \geq 0 , ~ \sum _ { k } \lambda _ { k } = 1 , \ : a _ { k } ( i ) \geq 0 , ~ \sum _ { i = 1 } ^ { m } a _ { k } ( i ) = 1 , ~ b _ { k } ( j ) \geq } \end{array}$ $\lambda _ { k } \geq 0$ $\textstyle \sum _ { k } \lambda _ { k } = 1$ 0, $\begin{array} { r } { \sum _ { j = 1 } ^ { n } b _ { k } ( j ) = 1 } \end{array}$ ?

(ii) Prove or disprove the above relation by use of conditional probability.

4. Let $X _ { 1 } , \cdots , X _ { m }$ be an independent and identically distributed (i.i.d.) random sample from a cumulative distribution function (CDF) $F$ , and $Y _ { 1 } , \cdots , Y _ { n }$ an i.i.d. random sample from a CDF $G$ . We want to test $H _ { 0 } : F = G$ versus $H _ { 1 } : F \neq G$ . The total sample size is $N = m + n$ . Consider the following two nonparametric tests.

• The Wilcoxon rank sum tests. The test proceeds by first ranking the pooled X and Y samples and then taking the sum of the ranks associated with the Y sample. Let $R _ { y _ { 1 } } , \ldots , R _ { y _ { n } }$ be the rankings of the sample $y _ { 1 } < \cdots < y _ { n }$ from the pooled sample in increasing order. The Wilcoxon rank sum statistic is defined as $\begin{array} { r } { W = \sum _ { j = 1 } ^ { n } R _ { y _ { j } } } \end{array}$ .

• The Mann-Whitney $U$ -test. Let $U _ { i j } ~ = ~ 1$ if $X _ { i } ~ < ~ Y _ { j }$ , and $U _ { i j } = 0$ otherwise. The Mann-Whitney $U$ -statistic is defined as $\begin{array} { r } { U = \sum _ { i = 1 } ^ { m } \sum _ { j = 1 } ^ { n } U _ { i j } } \end{array}$ . The probability $\gamma = P ( X < Y )$ can be estimated as $U / ( m n )$ . The decision rule is based on assessing if $\gamma = 0 . 5$ .

Assume that there are no tied data values.

(a) Show that $\begin{array} { r } { W = U + \frac { 1 } { 2 } n ( n + 1 ) } \end{array}$ , which shows that the two test statistics differ only by a constant and yield exactly the same $p$ -values.

(b) Using the central limit theorem, the Wilcoxon rank sum statistic $W$ can be converted to a $Z$ -variable, which provides an easyto-use approximation. The transformation is

$$
Z _ {W} = \frac {W - \mu_ {W}}{\sigma_ {W}},
$$

where $\mu _ { W }$ and $\sigma _ { W } ^ { 2 }$ are the mean and variance of $W$ under $H _ { 0 }$ . Show that $\begin{array} { r } { \mu _ { W } = \frac { 1 } { 2 } n ( N + 1 ) } \end{array}$ and $\begin{array} { r } { \sigma _ { W } ^ { 2 } = \frac { 1 } { 1 2 } m n ( N + 1 ) } \end{array}$ .

5. Let $X$ be a random variable with $E X ^ { 2 } < \infty$ , and $Y = | X |$ . Assume that $X$ has a Lebesgue density symmetric about 0. Show that random variables $X$ and $Y$ are uncorrelated, but they are not independent.

6. Let $E _ { 1 } , \cdots , E _ { n }$ be i.i.d. random variables with $E _ { i } \sim \mathrm { E x p o n e n t i a l } ( 1 )$ . Let $U _ { 1 } , \cdots , U _ { n }$ be i.i.d. uniformly (on [0,1]) distributed random variables. Further, assume that $E _ { 1 } , \cdots , E _ { n }$ and $U _ { 1 } , \cdots , U _ { n }$ are independent.

(a) Find the density of $X = ( E _ { 1 } + \cdot \cdot \cdot + E _ { m } ) / ( E _ { 1 } + \cdot \cdot \cdot + E _ { n } )$ , where $m < n$ .   
(b) Show that $\begin{array} { r } { Y = \frac { \left( n - m \right) X } { m \left( 1 - X \right) } } \end{array}$ is distributed as the F-distribution with degrees of freedom $( 2 m , 2 ( n - m ) )$   
(c) Find the density of $( U _ { 1 } \cdots U _ { n } ) ^ { - X }$