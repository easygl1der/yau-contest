# GROUP TEST S.-T YAU COLLEGE MATH CONTESTS 2012

# Probability and Statistics

Please solve 5 out of the following 6 problems.

1. Let (Xn) be a sequence of i.i.d. random variables.

1) Assume that each $X _ { n }$ satisfies the exponential distribution with parameter 1 (i.e. $P ( X _ { n } \geq x ) = e ^ { - x } , x \geq 0 \quad$ ). Prove that   
(a) $P ( X _ { n } > \alpha \log n , i . o . ) = 0$ , if $\alpha > 1$ ; $P ( X _ { n } > \alpha \log n , i . o . ) = 1$ , if $\alpha \leq 1$ .

Here “i.o” stands for “infinitely often”, and $A _ { n } , i . o .$ . stands lim $\operatorname* { s u p } _ { n \to \infty } A _ { n }$

(b) Let $L = \operatorname* { l i m } \operatorname* { s u p } _ { n \to \infty } ( X _ { n } / \log n )$ , then $P ( L = 1 ) = 1$

2) Assume that each $X _ { n }$ satisfies the Poisson distribution with parameter $\lambda$ (i.e. $\begin{array} { r } { P ( X _ { n } = k ) = \frac { \lambda ^ { k } } { k ! } e ^ { - \lambda } , k = 0 , 1 , 2 , \cdots . } \end{array}$ ) Put

$$
L = \limsup_{n\to \infty}\bigl(X_{n}\log \log n / \log n\bigr).
$$

Prove that $P ( L = 1 ) = 1$

2. Let $X _ { i }$ be i.i.d exponential r.v with rate one, $i \geq 1$ . Let $N$ be a geometric random variable with success probability $p$ , $0 < p < 1$ , i.e. $P ( N = k ) = ( 1 - p ) ^ { k - 1 } p , k = 1 , 2 , \cdot \cdot \cdot$ , and independent of all $X _ { i }$ , $i \geq 1$ . Find the distribution of $\textstyle \sum _ { i = 1 } ^ { N } X _ { i }$ .   
3. Let $X$ and $Y$ be i.i.d real valued r.v’s. Prove that $P ( | X + Y | < 1 ) \leq$ $3 P ( | X - Y | < 1 )$ .   
4. Suppose $S = X _ { 1 } + X _ { 2 } + \cdot \cdot \cdot + X _ { n }$ , a sum of independent random variables with $X _ { i }$ distributed Binomial(1, pi). Show that $\mathbb { P } ( S \ e v e n ) =$ $1 / 2$ if and only if at least one $p _ { i }$ equals $1 / 2$ .   
5. Let $B _ { \theta }$ denote the closed unit ball in $\mathbb { R } ^ { 2 }$ with center $\theta$ . Suppose $X _ { 1 } , X _ { 2 } , \cdots , X _ { n }$ are independently and uniformly distributed on $B _ { \theta }$ , for an unknown $\theta$ in $\mathbb { R } ^ { 2 }$ . Denote that maximum likelihood estimator by $\hat { \theta }$ . Show that $| \hat { \theta } - \theta | = O _ { p } ( 1 / n )$ .   
6. Suppose that $X _ { 1 } , \cdots , X _ { n }$ are a random sample from the Bernoulli distribution with probability of success $p _ { 1 }$ and $Y _ { 1 } , \cdots , Y _ { n }$ be an independent random sample from the Bernoulli distribution with probability of success $p _ { 2 }$ .

(a) Derive the maximum likelihood ratio test statistic for

$$
H _ {0}: p _ {1} = p _ {2} \longleftrightarrow H _ {1}: p _ {1} \neq p _ {2}.
$$

(Note: No simplification of the resulting test statistic is required. However, you need to give the asymptotic null.)

(b) Compute the asymptotic power of the test with critical region

$$
\left| \sqrt {n} \left(\hat {p} _ {1} - \hat {p} _ {2}\right) / \sqrt {2 \hat {p} \hat {q}} \right| \geqslant z _ {1 - \alpha}
$$

when $p _ { 1 } = p$ and $p _ { 2 } = p + n ^ { - 1 / 2 } \Delta$ , where $\hat { p } = 0 . 5 . \hat { p } _ { 1 } + 0 . 5 \hat { p } _ { 2 }$