# S.-T. Yau College Student Mathematics Contests 2014

# Probability and Statistics Problems

# Individual

Please solve the following 5 problems.

Problem 1. Let $X$ be a real valued random variable such that for all smooth functions $f : R  R$ with compact support we have $E [ X f ( X ) ] = E [ f ^ { \prime } ( X ) ]$ . Show that $X$ has the standard normal distribution.

Problem 2. Let ( $X _ { n }$ ) be a sequence of uncorrelated random variables of mean zero such that

$$
\sum_ {n = 1} ^ {\infty} n E | X _ {n} | ^ {2} <   \infty .
$$

Show that $\begin{array} { r } { S _ { n } = \sum _ { i = 1 } ^ { n } X _ { i } } \end{array}$ converges almost surely.

Problem 3. Let $( \Omega , { \mathcal { F } } )$ be a measurable space and $\mathcal { G }$ be a sub- $\sigma$ -field of $\mathcal { F }$ . Let $P$ and $Q$ be two probabilities which are mutually absolutely continuous on $\mathcal { F }$ . We denote by $X _ { 0 }$ the Radon-Nikodym density of $Q$ with respect to $P$ on $\mathcal { F }$ . Show that the following two properties are satisfied:

(a) $0 < E _ { P } [ X _ { 0 } | \mathcal { G } ] < + \infty$ , $P$ -a.s.;

(b) for every $\mathcal { F }$ -measurable non-negative random variable $f$

$$
E _ {P} [ f X _ {0} | \mathcal {G} ] = E _ {Q} [ f | \mathcal {G} ] E _ {P} [ X _ {0} | \mathcal {G} ].
$$

Problem 4. Suppose $X _ { 1 } , \dots , X _ { n } , \dots$ is a sequence of random numbers drawn from the uniform distribution $U ( 0 , 1 )$ . One observes these numbers sequentially. At time $n$ , one keeps a record of $Y _ { n } \ { \stackrel { d e f } { = } } \ X _ { ( n ) } = \operatorname* { m a x } _ { i = 1 } ^ { n } X _ { i } = \operatorname* { m a x } \{ Y _ { n - 1 } , X _ { n } \}$ and $Z _ { n } \stackrel { d e f } { = } \bar { X } _ { n } =$ $\begin{array} { r } { \sum _ { i = 1 } ^ { n } X _ { i } / n = ( n - 1 ) / n Z _ { n - 1 } + 1 / n X _ { n } } \end{array}$ and discards all previous recordings.

(a) What is the best guess of $X _ { 1 }$ if one only observes $Y _ { n }$ ?   
(b) What is the best guess of $X _ { 1 }$ if one only observes $Z _ { n }$ ?   
(c) Comparing the two guesses of $X _ { 1 }$ , which one is better (and in what sense)?

Give good reasoning to justify your answers.

Problem 5. Suppose we take a random sample of size $n$ from a bag of colored balls (red, blue and yellow balls) with replacement. Let $X _ { 1 }$ denote the number of red balls, $X _ { 2 }$ denote the number of blue balls, and $X _ { 3 }$ denote the number of yellow balls in the sample. Assuming we know that the total number of yellow balls is triple the total number of red balls in the bag. Or in other words, the red, blue and yellow balls occur with probability $p _ { 1 }$ , $p _ { 2 }$ and $p _ { 3 } = 3 p _ { 1 }$ , respectively in the bag.

1. Find the aymptotic distribution (after appropriate normalization) for the MLE of $p _ { 2 }$ .   
2. Construct the likelihood ratio test statistic for the null hypothesis that $p _ { 1 } = p _ { 2 } =$ $p _ { 3 } / 3$ (the alternative is that $p _ { 1 } = p _ { 2 } = p _ { 3 } / 3$ is not true). What is the asymptotic distribution of your test statistic under null?