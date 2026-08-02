# Yau Mathematical Competition 2018 Probability and Statistics Team

Problem 1 (Probability) Let $\left\{ X _ { n } \right\}$ be a sequence of independent and identically distributed random variables with the distribution $\mathbb { P } \left\{ X _ { n } = 1 \right\} = \mathbb { P } \left\{ X _ { n } = - 1 \right\} = 1 / 2$ . Define

$$
Z = \sqrt {\frac {1}{2} + \frac {X _ {1}}{2} \sqrt {\frac {1}{2} + \frac {X _ {2}}{2} \sqrt {\frac {1}{2} + \cdots}}}.
$$

(1) Let

$$
Z _ {N} = \sqrt {\frac {1}{2} + \frac {X _ {1}}{2} \sqrt {\frac {1}{2} + \frac {X _ {2}}{2} \sqrt {\frac {1}{2} + \cdots X _ {N} \sqrt {\frac {1}{2}}}}}
$$

be the random variable $Z$ truncated at the nth step. Show that

$$
Z _ {N} = \sin \left(\frac {\pi}{4} \sum_ {n = 0} ^ {N} \frac {X _ {1} X _ {2} \cdots X _ {n}}{2 ^ {n}}\right).
$$

(2) Let

$$
Y _ {n} = X _ {1} X _ {2} \dots X _ {n}, \quad n = 1, 2, \dots .
$$

What is the joint distribution of the random variables $\{ Y _ { n } \} ?$

(3) Find the distribution function $F _ { Z }$ of the random variable $Z .$

Problem 2 (Statistics) For $n \geq 2 .$ , let $( X _ { 1 } , Y _ { 1 } ) , \cdots , ( X _ { n } , Y _ { n } )$ be independent, identically distributed random vectors, with a common distribution which is bivariate normal with two component means $\mu _ { 1 }$ and $\mu _ { 2 }$ and the variance-covariance elements

$$
\operatorname{var} \left(X _ {1}\right) = \sigma_ {1} ^ {2}, \quad \operatorname{var} \left(X _ {2}\right) = \sigma_ {2} ^ {2}, \quad \operatorname{cov} \left(X _ {1}, X _ {2}\right) = \rho \sigma_ {1} \sigma_ {2}.
$$

We assume that $\sigma _ { 1 }$ and $\sigma _ { 2 }$ are both positive. Let $\pmb { \theta } = ( \mu _ { 1 } , \mu _ { 2 } , \sigma _ { 1 } , \sigma _ { 2 } , \pmb { \rho } ) ^ { T }$

(1) Assuming that the parameter $\theta$ is known, show that if one desires to predict $Y _ { 1 }$ by using a function $g ( X _ { 1 } , \cdots , X _ { n } )$ that minimizes $\mathbb { E } _ { \pmb { \theta } } ( Y _ { 1 } - g ( X _ { 1 } , \cdots , X _ { n } ) ) ^ { 2 }$ , then the solution is given by

$$
g \left(X _ {1}, \dots , X _ {n}\right) = \beta_ {0} + \beta_ {1} X _ {1}.
$$

Provide expressions for $\beta _ { 0 }$ and $\beta _ { 1 }$ in terms of $\theta$ .

(2) Assuming that the parameter $\theta$ is unknown, how do you predict $Y _ { 1 }$ and how do you measure the uncertainty of your prediction?