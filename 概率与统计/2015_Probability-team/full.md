# S.-T. Yau College Student Mathematics Contests 2015

# Probability and Statistics

# Team (5 problems)

Problem 1. One hundred passengers board a plane with exactly 100 seats. The first passenger takes a seat at random. The second passenger takes his own seat if it is available, otherwise he takes at random a seat among the available ones. The third passenger takes his own seat if it is available, otherwise he takes at random a seat among the available ones. This process continues until all the 100 passengers have boarded the plane. What is the probability that the last passenger takes his own seat?

Problem 2. Assume a sequence of random variables $X _ { n }$ converges in distribution to a random variable $X$ . Let $\{ N _ { t } , t \ge 0 \}$ be a set of positive integer-valued random variables, which is independent of ( $X _ { n }$ ) and converges in probability to $\infty$ as $t \to \infty$ . Prove that $X _ { N _ { t } }$ converges in distribution to $X$ as $t \to \infty$ .

Problem 3. Suppose $T _ { 1 } , T _ { 2 } , \dots , T _ { n }$ is a sequence of independent, identically distributed random variables with the exponential distribution of the density function

$$
p (x) = \left\{ \begin{array}{l l} e ^ {- x}, & \quad x \geq 0; \\ 0, & \quad x <   0. \end{array} \right.
$$

Let $S _ { n } = T _ { 1 } + T _ { 2 } + \cdot \cdot \cdot + T _ { n }$ . Find the distribution of the random vector

$$
V _ {n} = \left\{\frac {T _ {1}}{S _ {n}}, \frac {T _ {2}}{S _ {n}}, \dots , \frac {T _ {n}}{S _ {n}} \right\}.
$$

Problem 4. Suppose that $X$ and $Z$ are jointly normal with mean zero and standard deviation 1. For a strictly monotonic function $f ( \cdot )$ , $\operatorname { c o v } ( X , Z ) ~ = ~ 0$ if and only if $\operatorname { c o v } ( X , f ( Z ) ) = 0$ , provided the latter covariance exists. Hint: $Z$ can be expressed as $Z = \rho X + \varepsilon$ where $X$ and $\varepsilon$ are independent and $\varepsilon \sim N ( 0 , \sqrt { 1 - \rho ^ { 2 } } )$ .

Problem 5. Consider the following penalized least-squares problem (Lasso):

$$
\frac {1}{2} \| \mathbf {Y} - \mathbf {X} \boldsymbol {\beta} \| ^ {2} + \lambda \| \boldsymbol {\beta} \| _ {1}
$$

Let $\widehat { \beta }$ be a minimizer and $\Delta = { \widehat { \beta } } - \beta ^ { * }$ for any given $\beta ^ { * }$ . If $\lambda > 2 \| \mathbf { X } ^ { I ^ { \prime } } ( \mathbf { Y } - \mathbf { X } \beta ^ { * } ) \| _ { \infty }$ show that

$$
1. \| \mathbf {Y} - \mathbf {X} ^ {T} \widehat {\beta} \| ^ {2} - \| \mathbf {Y} - \mathbf {X} ^ {T} \beta^ {*} \| ^ {2} > - \lambda \| \boldsymbol {\Delta} \| _ {1}.
$$

2. $\| \Delta _ { S ^ { c } } \| _ { 1 } \leq 3 \| \Delta _ { S } \| _ { 1 }$ , where $S = \{ j : \beta _ { j } ^ { * } \neq 0 \}$ is the support of the vector $\beta ^ { * }$ , $S ^ { c }$ is its complement set, $\Delta _ { S }$ is the subvector of $\Delta$ restricted on the set $S$ , and $\| \Delta _ { S } \| _ { 1 }$ is its $L _ { 1 }$ -norm.