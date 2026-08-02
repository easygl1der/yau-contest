## 2012 S. T. Yau College Math Contests Oral Exam on Statistics

Saturday, August 4, morning

Problem 1. Let $X _ { 1 } , \cdots , X _ { n }$ be n independent and identically distributed observations from the exponential distribution with density function $\begin{array} { r } { f ( x ) = \frac { 1 } { \beta } e ^ { - x / \beta } , x \ge 0 } \end{array}$

a) Let T be an unbiased estimator of the scale parameter $\beta .$ Prove that

$$
\operatorname{Var} (T) \geq \frac {\beta^ {2}}{n}.
$$

b) Can you find an unbiased estimator T that attains the lower bound in part a)? If yes, please construct one. If no, please show why such an estimator does not exist.

# Solutions to 2012 S. T. Yau College Math Contests Oral Exam on Statistics

Saturday, August 4, morning

Problem 1. Let $X _ { 1 } , \cdots , X _ { n }$ be n independent and identically distributed observations from the exponential distribution with density function $\begin{array} { r } { f ( x ) = \frac { 1 } { \beta } e ^ { - x / \beta } , x \ge 0 } \end{array}$

a) Let $T$ be an unbiased estimator of the scale parameter $\beta .$ Prove that

$$
\operatorname{Var} (T) \geq \frac {\beta^ {2}}{n}.
$$

Solution: The above lower bound on the variance of an unbiased estimator $T$ of the scale parameter $\beta$ is given by the Cram´er-Rao bound $1 / I ( \beta )$ . The log-likelihood function is

$$
\ell (\beta) = \sum_ {i = 1} ^ {n} \left\{- \log \beta - \frac {X _ {i}}{\beta} \right\},
$$

which leads to

$$
\ell^ {\prime} (\beta) = \sum_ {i = 1} ^ {n} \left\{- \frac {1}{\beta} + \frac {X _ {i}}{\beta^ {2}} \right\} \quad \mathrm{and} \quad \ell^ {\prime \prime} (\beta) = \sum_ {i = 1} ^ {n} \left\{\frac {1}{\beta^ {2}} - \frac {2 X _ {i}}{\beta^ {3}} \right\}.
$$

Thus the Fisher information is

$$
I (\beta) = - E \ell^ {\prime \prime} (\beta) = \frac {n}{\beta^ {2}}.
$$

b) Can you find an unbiased estimator T that attains the lower bound in part $\mathrm { a } ) ?$ If yes, please construct one. If no, please show why such an estimator does not exist.

Solution: The answer is yes. The maximum likelihood estimator ${ \widehat { \beta } } ,$ which solves the score equation $\ell ^ { \prime } ( \beta ) = 0 .$ is identical to the sample mean $\textstyle { \frac { 1 } { n } } \sum _ { i = 1 } ^ { n } X _ { i }$ . It is easy to show that such an estimator is unbiased and attains the lowest variance.

# 2012 S. T. Yau College Math Contests Oral Exam on Statistics

Saturday, August 4, afternoon

Problem 1. Let $X _ { 1 } , \cdots , X _ { n }$ be n independent and identically distributed observations from the Cauchy distribution with density function $\begin{array} { r } { f ( x ) = \frac { 1 } { \pi } \frac { 1 } { 1 + ( x - \theta ) ^ { 2 } } , x \in \mathbb { R } } \end{array}$

a) Let T be an unbiased estimator of the location parameter θ. Prove that

$$
\operatorname{Var} (T) \geq \frac {2}{n}.
$$

b) Can you find an unbiased estimator T that attains the lower bound in part a)? If yes, please construct one. If no, please show why such an estimator does not exist.

c) Can you provide an estimator T that can attain the lower bound on Var(T ) in part a) asymptotically, by removing the constraint of unbiasedness?

## Solutions to 2012 S. T. Yau College Math Contests Oral Exam on Statistics

Saturday, August 4, afternoon

Problem 1. Let $X _ { 1 } , \cdots , X _ { n }$ be n independent and identically distributed observations from the Cauchy distribution with density function $\begin{array} { r } { f ( x ) = \frac { 1 } { \pi } \frac { 1 } { 1 + ( x - \theta ) ^ { 2 } } , x \in \mathbb { R } } \end{array}$

a) Let $T$ be an unbiased estimator of the location parameter $\theta .$ Prove that

$$
\operatorname{Var} (T) \geq \frac {2}{n}.
$$

Solution: The above lower bound on the variance of an unbiased estimator $T$ of the location parameter θ is given by the Cram´er-Rao bound $1 / I ( \theta )$ . The log-likelihood function is n

$$
\ell (\theta) = \sum_ {i = 1} ^ {n} \left\{- \log \pi - \log \left[ 1 + (X _ {i} - \theta) ^ {2} \right] \right\},
$$

which leads to

$$
\ell^ {\prime} (\theta) = \sum_ {i = 1} ^ {n} \frac {2 (X _ {i} - \theta)}{1 + (X _ {i} - \theta) ^ {2}} \quad \mathrm{and} \quad \ell^ {\prime \prime} (\theta) = \sum_ {i = 1} ^ {n} \frac {- 2 + 2 (X _ {i} - \theta) ^ {2}}{[ 1 + (X _ {i} - \theta) ^ {2} ] ^ {2}}.
$$

Thus the Fisher information is

$$
I (\theta) = - E \ell^ {\prime \prime} (\theta) = \frac {n}{2}.
$$

b) Can you find an unbiased estimator $T$ that attains the lower bound in part $\mathrm { a } ) ?$ If yes, please construct one. If no, please show why such an estimator does not exist.

Solution: The answer is no. From the proof of the Cram´er-Rao theorem, we see that the above lower bound on variance can be attained only if the following Cauchy-Schwarz inequality becomes an equation

$$
\left(E \left\{\ell^ {\prime} (\theta) (T - \theta) \right\}\right) ^ {2} \leq E \left\{\ell^ {\prime} (\theta) \right\} ^ {2} E (T - \theta) ^ {2}.
$$

It is well known that the equation holds only when

$$
T - \theta = (\mathrm{someconstant}) \cdot \ell^ {\prime} (\theta) = (\mathrm{someconstant}) \cdot \sum_ {i = 1} ^ {n} \frac {2 (X _ {i} - \theta)}{1 + (X _ {i} - \theta) ^ {2}},
$$

which entails that

$$
T = \theta + (\mathrm{someconstant}) \cdot \sum_ {i = 1} ^ {n} \frac {2 (X _ {i} - \theta)}{1 + (X _ {i} - \theta) ^ {2}}.
$$

The above representation shows that such an “optimal” estimator $T$ should always depend on the location parameter $\theta ,$ , which cannot be an estimator in the first place.

c) Can you provide an estimator T that can attain the lower bound on Var(T ) in part a) asymptotically, by removing the constraint of unbiasedness?

Solution: The answer is yes by the classical asymptotic theory of the maximum likelihood estimator (MLE). The MLE ${ \widehat { \theta } } ,$ which solves the score equation $\ell ^ { \prime } ( \theta ) = 0$ , is known to be asymptotically normal with mean θ and variance $\begin{array} { r } { 1 / I ( \theta ) = \frac { 2 } { n } } \end{array}$

## 2012 S. T. Yau College Math Contests Oral Exam on Statistics

Sunday, August 5, morning

Problem 1. Consider the linear regression model

$$
\mathbf {y} = \mathbf {X} \boldsymbol {\beta} _ {0} + \varepsilon ,
$$

where $\mathbf { y } = ( y _ { 1 } , \cdots , y _ { n } ) ^ { T }$ is an n-dimensional vector of response, $\mathbf { X } = ( \mathbf { x } _ { 1 } , \cdots , \mathbf { x } _ { p } )$ is an $n \times p$ design matrix, $\beta _ { 0 } = ( \beta _ { 0 , 1 } , \cdots , \beta _ { 0 , p } ) ^ { T }$ is a p-dimensional vector of regression coeficients, and $\pmb { \varepsilon } = ( \varepsilon _ { 1 } , \cdots , \varepsilon _ { n } ) ^ { T }$ is an n-dimensional vector of independent and identically distributed noise with mean 0 and variance $\sigma ^ { 2 }$ . It is well known that the ordinary least-squares estimator becomes unstable or even inapplicable when $p$ is large compared to n. One idea for remedying this issue is the ridge regression which gives the ridge estimator

$$
\widehat {\pmb {\beta}} _ {\mathrm{ridge}} = (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1} \mathbf {X} ^ {T} \mathbf {y},
$$

where $\lambda > 0$ is called the ridge parameter.

a) Calculate the mean of ${ \widehat { \beta } } _ { \mathrm { r i d g e } }$

b) Calculate the covariance matrix of ${ \widehat { \beta } } _ { \mathrm { r i d g e } }$

# Solutions to 2012 S. T. Yau College Math Contests Oral Exam on Statistics

Sunday, August 5, morning

Problem 1. Consider the linear regression model

$$
\mathbf {y} = \mathbf {X} \boldsymbol {\beta} _ {0} + \varepsilon ,
$$

where $\mathbf { y } = ( y _ { 1 } , \cdots , y _ { n } ) ^ { T }$ is an n-dimensional vector of response, $\mathbf { X } = ( \mathbf { x } _ { 1 } , \cdots , \mathbf { x } _ { p } )$ is an $n \times p$ design matrix, $\beta _ { 0 } = ( \beta _ { 0 , 1 } , \cdot \cdot \cdot , \beta _ { 0 , p } ) ^ { T }$ is a p-dimensional vector of regression coeficients, and $\pmb { \varepsilon } = ( \varepsilon _ { 1 } , \cdots , \varepsilon _ { n } ) ^ { T }$ is an n-dimensional vector of independent and identically distributed noise with mean 0 and variance $\sigma ^ { 2 }$ . It is well known that the ordinary least-squares estimator becomes unstable or even inapplicable when p is large compared to n. One idea for remedying this issue is the ridge regression which gives the ridge estimator

$$
\widehat {\pmb {\beta}} _ {\mathrm{ridge}} = (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1} \mathbf {X} ^ {T} \mathbf {y},
$$

where $\lambda > 0$ is called the ridge parameter.

a) Calculate the mean of ${ \widehat { \beta } } _ { \mathrm { r i d g e } }$

Solution:

$$
E \widehat {\boldsymbol {\beta}} _ {\mathrm{ridge}} = (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1} \mathbf {X} ^ {T} \mathbf {X} \boldsymbol {\beta} _ {0} = \boldsymbol {\beta} _ {0} - \lambda (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1} \boldsymbol {\beta} _ {0}.
$$

b) Calculate the covariance matrix of ${ \widehat { \beta } } _ { \mathrm { r i d g e } }$ a

Solution:

$$
\begin{array}{r l} & {\mathrm{Cov} (\widehat {\boldsymbol {\beta}} _ {\mathrm{ridge}}) = (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1} \mathbf {X} ^ {T} \mathrm{Cov} (\mathbf {y}) \mathbf {X} (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1}} \\ & {\qquad = \sigma^ {2} (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1} \mathbf {X} ^ {T} \mathbf {X} (\mathbf {X} ^ {T} \mathbf {X} + \lambda I _ {p}) ^ {- 1}.} \end{array}
$$

## 2012 S. T. Yau College Math Contests Oral Exam on Statistics

Sunday, August 5, afternoon

Problem 1. Let $X _ { i } \sim N ( \theta _ { i } , { \frac { 1 } { n } } ) , i = 1 , \cdots , n$ , be independent. Find an estimator $\widehat { T }$ of $\textstyle T = \sum _ { i = 1 } ^ { n } \theta _ { i } ^ { 2 }$ and calculate $E ( \widehat { T } - T ) ^ { 2 }$