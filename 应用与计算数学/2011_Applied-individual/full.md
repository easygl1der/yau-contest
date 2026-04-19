S.-T. Yau College Student Mathematics Contests 2011

# Applied Math., Computational Math., Probability and Statistics

Individual 6:30–9:00 pm, July 9, 2011 (Please select 5 problems to solve)

1. Given a weight function $\rho ( x ) > 0$ , let the inner-product corresponding to $\rho ( x )$ be defined as follows:

$$
(f, g) := \int_ {a} ^ {b} \rho (x) f (x) g (x) \mathrm {d} x,
$$

and let $\| f \| : = ( f , f )$ .

(1) Define a sequence of polynomials as follows:

$$
\begin{array}{l} p _ {0} (x) = 1, \quad p _ {1} (x) = x - a _ {1}, \\ p _ {n} (x) = \left(x - a _ {n}\right) p _ {n - 1} (x) - b _ {n} p _ {n - 2} (x), \quad n = 2, 3, \dots \\ \end{array}
$$

where

$$
a _ {n} = \frac {\left(x p _ {n - 1} , p _ {n - 1}\right)}{\left(p _ {n - 1} , p _ {n - 1}\right)}, \quad n = 1, 2, \dots
$$

$$
b _ {n} = \frac {\left(x p _ {n - 1} , p _ {n - 2}\right)}{\left(p _ {n - 2} , p _ {n - 2}\right)}, \quad n = 2, 3, \dots .
$$

Show that $\{ p _ { n } ( x ) \}$ is an orthogonal sequence of monic polynomials.

(2) Let $\{ q _ { n } ( x ) \}$ be an orthogonal sequence of monic polynomials corresponding to the $\rho$ inner product. (A polynomial is called monic if its leading coefficient is 1.) Show that $\{ q _ { n } ( x ) \}$ is unique and it minimizes $\| q _ { n } \|$ amongst all monic polynomials of degree $n$ .   
(3) Hence or otherwise, show that if $\rho ( x ) = 1 / \sqrt { 1 - x ^ { 2 } }$ and $[ a , b ] =$ $[ - 1 , 1 ]$ , then the corresponding orthogonal sequence is the Chebyshev polynomials:

$$
T _ {n} (x) = \cos (n \operatorname {a r c c o s} x), \quad n = 0, 1, 2, \dots .
$$

and the following recurrent formula holds:

$$
T _ {n + 1} (x) = 2 x T _ {n} (x) - T _ {n - 1} (x), \quad n = 1, 2, \dots .
$$

(4) Find the best quadratic approximation to $f ( x ) = x ^ { 3 }$ on $[ - 1 , 1 ]$ using $\rho ( x ) = 1 / \sqrt { 1 - x ^ { 2 } }$ .

2. If two polynomials $p ( x )$ and $q ( x )$ , both of fifth degree, satisfy

$$
p (i) = q (i) = \frac {1}{i}, \qquad i = 2, 3, 4, 5, 6,
$$

and

$$
p (1) = 1, \qquad q (1) = 2,
$$

find $p ( 0 ) - q ( 0 )$

3. Lay aside $m$ black balls and $n$ red balls in a jug. Supposes $1 \leq r \leq$ $k \leq n$ . Each time one draws a ball from the jug at random.

1) If each time one draws a ball without return, what is the probability that in the $k$ -th time of drawing one obtains exactly the $r$ -th red ball?   
2) If each time one draws a ball with return, what is the probability that in the first $k$ times of drawings one obtained totally an odd number of red balls?

4. Let $X$ and $Y$ be independent and identically distributed random variables. Show that

$$
E [ | X + Y | ] \geq E [ | X | ].
$$

Hint: Consider separately two cases: $E [ X ^ { + } ] \geq E [ X ^ { - } ]$ and $E [ X ^ { + } ] <$ $E [ X ^ { - } ]$ .

5. Suppose that $X _ { 1 } , \cdots , X _ { n }$ are a random sample from the Bernoulli distribution with probability of success $p _ { 1 }$ and $Y _ { 1 } , \cdots , Y _ { n }$ be an independent random sample from the Bernoulli distribution with probability of success $p _ { 2 }$ .

(a) Give a minimum sufficient statistic and the UMVU (uniformly minimum variance unbiased) estimator for $\theta = p _ { 1 } - p _ { 2 }$ .   
(b) Give the Cramer-Rao bound for the variance of the unbiased estimators for $v ( p _ { 1 } ) = p _ { 1 } ( 1 - p _ { 1 } )$ or the UMVU estimator for $v ( p _ { 1 } )$ .   
(c) Compute the asymptotic power of the test with critical region

$$
| \sqrt {n} (\hat {p _ {1}} - \hat {p _ {2}}) / \sqrt {2 \hat {p} \hat {q}} | \geq z _ {1 - \alpha}
$$

when $p _ { 1 } = p$ and $p _ { 2 } = p + n ^ { - 1 / 2 } \Delta$ , where $\hat { p } = 0 . 5 \hat { p } _ { 1 } + 0 . 5 \hat { p } _ { 2 }$

6. Suppose that an experiment is conducted to measure a constant $\theta$ . Independent unbiased measurements $y$ of $\theta$ can be made with either of two instruments, both of which measure with normal errors: for $i = 1 , 2$ , instrument $i$ produces independent errors with a $N ( 0 , \sigma _ { i } ^ { 2 } )$ distribution. The two error variances $\sigma _ { 1 } ^ { 2 }$ and $\sigma _ { 2 } ^ { 2 }$ are known. When a measurement $y$ is made, a record is kept of the instrument used so that after $n$ measurements the data is $( a _ { 1 } , y _ { 1 } ) , \dotsc , ( a _ { n } , y _ { n } )$ , where $a _ { m } = i$ if $y _ { m }$ is obtained using instrument $i$ . The choice between instruments is made independently for each observation in such a way that

$$
P (a _ {m} = 1) = P (a _ {m} = 2) = 0. 5, \quad 1 \leq m \leq n.
$$

Let $x$ denote the entire set of data available to the statistician, in this case $( a _ { 1 } , y _ { 1 } ) , \dotsc , ( a _ { n } , y _ { n } )$ , and let $l _ { \theta } ( x )$ denote the corresponding log likelihood function for $\theta$ . Let $a = \sum _ { m = 1 } ^ { n } ( 2 - a _ { m } )$ Xn .

(a) Show that the maximum likelihood estimate of $\theta$ is given by

$$
\hat {\theta} = \left(\sum_ {m = 1} ^ {n} 1 / \sigma_ {a _ {m}} ^ {2}\right) ^ {- 1} \left(\sum_ {m = 1} ^ {n} y _ {m} / \sigma_ {a _ {m}} ^ {2}\right).
$$

(b) Express the expected Fisher information $I _ { \theta }$ and the observed Fisher information $I _ { x }$ in terms of $n$ , $\sigma _ { 1 } ^ { 2 }$ , $\sigma _ { 2 } ^ { 2 }$ , and $a$ . What happens to the quantity $I _ { \theta } / I _ { x }$ as $n \to \infty$ ?   
(c) Show that $a$ is an ancillary statistic, and that the conditional variance of $\hat { \theta }$ given $a$ equals $1 / I _ { x }$ . Of the two approximations

$$
\hat {\theta} \stackrel {.} {\sim} N (\theta , 1 / I _ {\theta})
$$

and

$$
\hat {\theta} \stackrel {\cdot} {\sim} N (\theta , 1 / I _ {x}),
$$

which (if either) would you use for the purposes of inference, and why?