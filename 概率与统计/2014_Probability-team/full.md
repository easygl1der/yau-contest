# Probability and Statistics Problems

# Team

Please solve the following 5 problems.

Problem 1. Suppose that $X _ { n }$ converges to $X$ in distribution and $Y _ { n }$ converges to a constant $c$ in distribution. Show that

(a) $Y _ { n }$ converges to $c$ in probability;   
(b) $X _ { n } Y _ { n }$ converges to $c X$ in distribution.

Problem 2. Let $X$ and $Y$ be two random variables with $| Y | > 0$ , a.s.. Let $Z = X / Y$ .

(a) Assume the distribution function of $( X , Y )$ has the density $p ( x , y )$ . What is the density function of $Z$ ?   
(b) Assume $X$ and $Y$ are independent and $X$ is $N ( 0 , 1 )$ distributed, $Y$ has the uniform distribution on $( 0 , 1 )$ . Give the density function of $Z$ .

Problem 3. Let $( \Omega , { \mathcal { F } } , P )$ be a probability space.

(a) Let $\mathcal { G }$ be a sub $\sigma$ -algebra of $\mathcal { F }$ , and $1 \in { \mathcal { F } }$ . Prove that the following properties are equivalent:   
(i) $\Gamma$ is independent of $\mathcal { G }$ under $P$ ,   
(ii) for every probability $Q$ on $( \Omega , { \mathcal { F } } )$ , equivalent to $P$ , with $d Q / d P$ being $\mathcal { G }$ measurable, we have $Q ( \Gamma ) = P ( \Gamma )$ .   
(b) Let $X , Y , Z$ be random variables and $Y$ is integrable. Show that if $( X , Y )$ and $Z$ are independent, then $E [ Y | X , Z ] = E [ Y | X ]$ .

Problem 4. Let $X _ { 1 } , . . . , X _ { n }$ be i.i.d. $N ( 0 , \sigma ^ { 2 } )$ , and let $M$ be the mean of $\vert X _ { 1 } \vert , . . . , \vert X _ { n } \vert$

1. Find $c \in R$ so that $\hat { \sigma } = c M$ is a consistent estimator of $\sigma$   
2. Determine the limiting distribution for $\sqrt { n } ( \hat { \sigma } - \sigma )$ .   
3. Identify an approximate $( 1 - \alpha ) \%$ confidence interval for $\sigma$   
4. Is $\hat { \sigma } = c M$ asymptotically efficient? Please justify your answer.

Problem 5. The shifted exponential distribution has the density function

$$
f (y; \phi , \theta) = 1 / \theta \exp \{- (u - \phi) / \theta \}, \qquad y > \phi , \theta > 0.
$$

Let $Y _ { 1 } , \dots , Y _ { n }$ be a random sample from this distribution. Find the maximum likelihood estimator (MLE) of $\phi$ and $\theta$ and the limiting distribution of the MLE.

You may use the following R´enyi representation of the order statistics: Let $E _ { 1 } , \ldots , E _ { n }$ , be a random sample from the standard exponential distribution (i.e., the above distribution with $\phi = 0 , \theta = 1$ ). Let $E _ { ( r ) }$ denote the $r$ -th order statistics. According to the R´enyi representation,

$$
E _ {(r)} \stackrel {D} {=} \sum_ {j = 1} ^ {r} \frac {E _ {j}}{n + 1 - j}, \qquad r = 1, \ldots , n.
$$

Here, the symbol $\underline { { \underline { { D } } } }$ denotes equal in distribution.