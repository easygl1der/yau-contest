# Statistics problems: personal-overall

## May 2019

1. Consider the multiple linear regression model

$$
\binom{Y _ {1}}{Y _ {2}} = \binom{X _ {1}}{X _ {2}}   \beta + \binom{\epsilon_ {1}}{\epsilon_ {2}},
$$

where $Y _ { 1 } \in \mathbb { R } ^ { n _ { 1 } } , Y _ { 2 } \in \mathbb { R } ^ { n _ { 2 } } , X _ { 1 }$ is a $( n _ { 1 } \times p )$ matrix, $X _ { 2 }$ is a $( n _ { 2 } \times p )$ matrix, $X = { \left( \begin{array} { l } { X _ { 1 } } \\ { X _ { 2 } } \end{array} \right) }$ has rank $p ,$ and error terms $\epsilon _ { 1 }$ and $\epsilon _ { 2 }$ are independent of each other with

$$
\epsilon_ {1} \sim N _ {n _ {1}} (0, \sigma^ {2} I _ {n _ {1}}) \text { and } \epsilon_ {2} \sim N _ {n _ {2}} (0, \rho \sigma^ {2} I _ {n _ {2}}) \quad (\rho > 0).
$$

The unknown parameters are $\beta \in \mathbb { R } ^ { p }$ and $\sigma ^ { 2 }$ .

1. Treat $\rho$ as a constant and driver the maximum likelihood estimates of $\beta$ and $\sigma ^ { 2 }$ , denoted by $\hat { \beta } _ { \rho }$ and $\hat { \sigma } _ { \rho } ^ { 2 } .$

2. Suppose that $X _ { 1 }$ has full rank $p$ and $X _ { 2 }$ has full rank $n _ { 2 } < p$ . Prove that as $\rho$ goes to zero, $\hat { \beta } _ { \rho }$ converges to

$$
\hat {\beta} + \left(X _ {1} ^ {\prime} X _ {1}\right) ^ {- 1} X _ {2} ^ {\prime} \left[ X _ {2} \left(X _ {1} ^ {\prime} X _ {1}\right) ^ {- 1} X _ {2} ^ {\prime} \right] ^ {- 1} \left(Y _ {2} - X _ {2} \hat {\beta}\right)
$$

where $\hat { \beta } = ( X _ { 1 } ^ { \prime } X _ { 1 } ) ^ { - 1 } X _ { 1 } ^ { \prime } Y _ { 1 }$

3. Interpret the above limit in some context of multiple linear regression with constraints on $\beta .$

2. Consider the simple linear regression

$$
Y _ {i} = \alpha + \beta X _ {i} + \epsilon_ {i}, \qquad i = 1, \ldots , n.
$$

Define quadratic function

$$
Q (\alpha , \beta) = \sum_ {i = 1} ^ {n} (Y _ {i} - \alpha - \beta X _ {i}) ^ {2}.
$$

Let ˆα and $\hat { \beta }$ be the estimators of α and $\beta ,$ which minimizes $Q ( \alpha , \beta )$ . Let $\hat { Y } _ { i } = \hat { \alpha } + \hat { \beta } X _ { i }$ 1. Find the gradient vector of $\hat { Y _ { i } }$ with respect to the vector $Y = ( Y _ { 1 } \ldots , Y _ { n } ) ^ { \prime }$

2. The degree of freedom, $d _ { L M }$ of the fitted model is defined to be the trace of matrix $\frac { \partial \hat { Y } } { \partial Y }$ , where $\hat { Y } = ( \hat { Y } _ { 1 } \ldots , \hat { Y } _ { n } ) ^ { \prime }$ . Find $d _ { L M }$ . How is it related to the model?