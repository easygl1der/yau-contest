# Qualifying Exam: 2023 Fall

考试课程: Probability & Statistics 姓名: 学号:

• 本试卷共3页, 8道大题, 总分为100分.

• 考生默认遵守考试纪律, 不遵守者后果自负.

• 所有的解答请写出必要的细节,推理依据和推理过程.

1. (10 points) Let (X, Y ) be a random vector of joint density

$$
f (x, y) = \frac {1}{2 \pi \sqrt {1 - \rho^ {2}}} \exp \left(- \frac {x ^ {2} - 2 \rho x y + y ^ {2}}{2 (1 - \rho^ {2})}\right).
$$

(a) Prove that f is a probability density. Calculate the marginal distributions of X and Y . Determine the condition of $\rho$ such that X and Y are independent.

(b) Define $R = \sqrt { X ^ { 2 } + Y ^ { 2 } }$ and $\Phi \in [ 0 , 2 \pi ]$ by

$$
\cos \Phi = \frac {X}{R}, \quad \sin \Phi = \frac {Y}{R}.
$$

Determine the law of (R, Φ) and then the law of Φ.

2. (10 points) Let $( X _ { n } ) _ { n \in \mathbb { N } _ { + } }$ be i.i.d. random variables of density

$$
f (x) = \frac {1}{2} e ^ {- | x |}, \qquad x \in \mathbb {R},
$$

and we denote by ${ \mathcal { F } } _ { n }$ its natural filtration $\mathcal { F } _ { n } = \sigma ( ( X _ { i } ) _ { 1 \leq i \leq n } )$ . We define $M _ { n } ( \theta )$ as

$$
M _ {n} (\theta) := \exp \left(\theta \sum_ {k = 1} ^ {n} X _ {k} - A _ {n} (\theta)\right).
$$

Determine $( A _ { n } ( \theta ) ) _ { n \in \mathbb { N } _ { + } }$ such that for any $| \theta | < 1$ , the sequence $( M _ { n } ( \theta ) ) _ { n \in \mathbb { N } _ { + } }$ is a martingale with respect to the natural filtration $( \mathcal { F } _ { n } ) _ { n \in \mathbb { N } _ { + } }$

3. (10 points) There are N identical coins and every coin has two sides, which are denoted by “Head” and $\mathbf { \Phi } ^ { \langle 6 \rangle } \mathrm { T a i l } ^ { \prime \rangle }$ . Every round we draw a coin uniformly and flip it. Suppose that every draw is independent and let $X _ { n }$ be the number of heads after n-th round.

(a) Prove that $( X _ { n } ) _ { n \in \mathbb { N } _ { + } }$ is a Markov chain and write down the transition probabilities.

(b) Prove that there exists a unique stationary distribution $\mu$ for this Markov chain. Determine the law of $\mu .$

4. (10 points) Alice has 3 identical dices. Every dice has faces marked {1, 2, 3, 4, 5, 6} and can sample value uniformly from these faces. Alice plays the following game: in every round, she can choose any subset of dices and resample their values, while keep the other dices as last round. All the samplings of dices are independent, and Alice’s decision does not change the law of dices. Let T be the number of rounds that Alice realizes the 3 dices of configuration $" 6 , 6 , 6  '$ for the first time.

(a) What is the optimal strategy of Alice to minimize the waiting time $T  { ? }$

(b) Under the optimal strategy, calculate the expectation of $T .$

5. (15 points) Consider the Bernoulli percolation on an infinite d-regular $( d \in \mathbb { N }$ and $d \geq 3 )$ tree T with root o. More precisely, T is an infinite tree where each vertex has d neighborhoods. Each edge is open with probability $p ,$ and closed with probability $1 - p ,$ independently of the states of other edges. Let $\mathcal { C } ( o )$ be the connected component (called cluster ) containing $^ { O , }$ i.e., ${ \mathcal { C } } ( o )$ is the subset of all vertices that can be reached from o through open edges. Let $\theta ( p )$ be the probability that o is in an infinite cluster, i.e., $\theta ( p ) = \mathbb { P } ( | \mathcal { C } ( o ) | = \infty )$

(a) Prove that there exists a $p _ { c } \in ( 0 , 1 )$ such that if $p > p _ { c }$ , then $\theta ( p _ { c } ) > 0$ , while if $p < p _ { c }$ then $\theta ( p _ { c } ) = 0$ . Give the value of $p _ { c }$

(b) Fix any $p \in ( 0 , p _ { c } )$ , prove that there exist constants $c , C > 0$ (which may depend on $p _ { c }$ but do not depend on $k )$ such that for all $k \geq 2$ , there is

$$
\mathbb {P} (| \mathcal {C} (o) | \geq k) \leq C \exp (- c k).
$$

![](images/ef3f512ba6a6384162b8b589c3559f1d5c554bda4deac17de5b650b14bf6d087.jpg)  
图 1: An illustration of a 3-regular tree.

6. (15 points) Let X be an $n \times n$ random matrix with i.i.d. standard Gaussian entries, i.e., the entries $X _ { i j }$ are independent standard normal random variables.

(a) Given any deterministic orthogonal matrices U and V, prove that UXV has the same law as $X$

(b) Given any deterministic unit vector $u \in \mathbb { R } ^ { n }$ , calculate the mean and variance of $Y _ { n } =$ $u ^ { T } X ^ { T } X u .$ , and prove the central limit theorem for $Y _ { n }$ as $n  \infty ( \mathrm { i . e . , } Y _ { n } .$ , after proper shift and rescaling, converges in law to the standard normal distribution).

(c) Given any deterministic unit vectors $u , v \in \mathbb { R } ^ { n }$ , calculate the mean and variance of $Z _ { n } =$ $u ^ { T } X ^ { T } X u + \sqrt { n } v ^ { T } X v .$ , and prove the central limit theorem for $Z _ { n }$ as $n \to \infty$ . (Hint: You may try the moment method or Stein’s method, i.e., a random variable $x _ { n }$ converges in law to the standard normal distribution if for any diferentiable function $f$ with bounded derivatives, $\mathbb { E } ( f ^ { \prime } ( x _ { n } ) - x _ { n } f ( x _ { n } ) )  0 { \mathrm { ~ a s ~ } } n  \infty . )$

7. (15 points) Assume that $X _ { 1 } , . . . , X _ { n }$ are i.i.d. $N ( \mu , \sigma ^ { 2 } )$ and consider testing the hypotheses $H _ { 0 } : \mu = \mu _ { 0 } , \sigma ^ { 2 } = \sigma _ { 0 } ^ { 2 }$ versus $H _ { 1 } : \mu = \mu _ { 1 } , \sigma ^ { 2 } = \sigma _ { 1 } ^ { 2 }$ . Note that the density for $N ( \mu , \sigma ^ { 2 } )$ is ${ \frac { 1 } { \sqrt { 2 \pi } \sigma } } e ^ { - { \frac { ( x - \mu ) ^ { 2 } } { 2 \sigma ^ { 2 } } } } , - \infty < x < \infty , - \infty < \mu < \infty , \sigma > 0 .$

(a) Find the uniformly most powerful (UMP) size α test of testing $H _ { 0 }$ vs $H _ { 1 }$ if $\mu _ { 0 } < \mu _ { 1 }$ and $\sigma _ { 0 } ^ { 2 } = \sigma _ { 1 } ^ { 2 }$

(b) Find the UMP size α test of testing $H _ { 0 }$ vs $H _ { 1 }$ if $\mu _ { 0 } = \mu _ { 1 }$ and $\sigma _ { 0 } ^ { 2 } < \sigma _ { 1 } ^ { 2 }$

(c) Assume $\sigma ^ { 2 } = 1$ , find the UMP level α test of testing $H _ { 0 } ^ { \prime } : \mu \geq 1$ versus $H _ { 1 } ^ { \prime } : \mu < 1$

8. (15 points) Consider the following distribution (Cauchy) $\begin{array} { r } { f ( x \mid \theta ) = \frac { 1 } { \pi [ 1 + ( x - \theta ) ^ { 2 } ] } , - \infty < x < } \end{array}$ $\infty , - \infty < \theta < \infty$

(a) Let $X _ { 1 } , . . . , X _ { n }$ be a random sample from the above distribution, find a minimal suficient statistic for θ.

(b) Let $X _ { 1 }$ and $X _ { 2 }$ be i.i.d with the above density. Let $x _ { 1 }$ and $x _ { 2 }$ be the observations and set $\begin{array} { r } { \Delta = \frac { 1 } { 2 } ( x _ { 1 } - x _ { 2 } ) } \end{array}$ . Let $\hat { \theta }$ denote the maximum likelihood estimator (MLE). Show that if $| \Delta | \leq 1$ , then the MLE exists and is unique. Give the MLE when $| \Delta | \leq 1$

(c) Show that $\mathrm { i f } \mid \Delta \mid > 1$ , then the MLE is not unique. Find the values of θ that maximize the likelihood when $| \Delta | > 1$