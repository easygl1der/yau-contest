# Statistics problems: team contest

## May 2019

1. Consider the simple linear regression

$$
Y _ {i} = \alpha + \beta X _ {i} + \epsilon_ {i}, \qquad i = 1, \ldots , 2 n.
$$

(i) Suppose that only the first half of $Y \mathrm { { } s }$ are observed, i.e. only $Y _ { i } , i = 1 , \dots , n$ are observed and $Y _ { i } , \ i = n + 1 , \dots , 2 n$ are missing, while all $X \mathrm { { s } }$ are observed. What would you suggest for the estimation of $\beta ?$ Are there assumptions you need to make for your estimator to be valid?

(ii) Suppose for the second half of $Y \mathrm { { } s }$ , their absolute values are observed, i.e. we observe $| Y _ { i } |$ $i = n + 1 , \ldots , 2 n$ . What would you suggest for the estimation of $\beta ?$ Are there assumptions you need to make for your estimator to be valid? Any good properties for your estimator?

2. Suppose that $X = ( X _ { 1 } , \ldots , X _ { n } ) ^ { \prime }$ is an observation from the n-dimensional multivariate normal distribution $N _ { n } ( \theta , I )$ with unknown parameter $\theta \in R ^ { n }$ , that is, $X _ { i } ^ { , }$ s are independent of each other with $X _ { i } \ \sim \ N ( \theta _ { i } , 1 )$ for $i = 1 , \ldots , n$ . (i). Derive the maximum likelihood estimator (MLE) of $\begin{array} { r } { \| \theta \| ^ { 2 } = \sum _ { i = 1 } ^ { n } \theta _ { i } ^ { 2 } } \end{array}$

(ii). Show that the MLE is a biased estimator.

(iii). Find the distribution of the MLE and describe how to use this distribution to construct exact confidence intervals.

3. Suppose that $X _ { 1 } , \cdots , X _ { n }$ is a sample of size n from the Student-t distribution $t _ { \nu } ( \mu , 1 )$ with known degrees of freedom $\nu \geq 1$ , unit scale, and known center $\mu .$ The Student-t distribution $t _ { \nu } ( \mu , 1 )$ has density function of the form

$$
f _ {X} (x; \mu , \nu) = \frac {\Gamma (\frac {\nu + 1}{2})}{\sqrt {\pi \nu} \Gamma (\frac {\nu}{2})} \left(1 + \frac {(x - \mu) ^ {2}}{\nu}\right) ^ {- \frac {\nu + 1}{2}}, (x \in \mathcal {R} ^ {1}).
$$

(i). Write $X _ { i } = \mu + U _ { i }$ , where $U _ { i }$ are independently and identically distributed (iid) with $t _ { \nu } ( 0 , 1 )$ for $i = 1 , \cdots , n$ . Find the conditional distribution of $U _ { 1 }$ given $U _ { i } - U _ { 1 } = X _ { i } - X _ { 1 }$ for $i = 2 , \cdots , n$

(ii). Describe a method to construct confidence intervals by making use of the above result, and argue for its eficiency and coverage probability.

(iii). Use the limiting case of $\nu \to \infty$ to verify your answers.