# S.-T. Yau College Student Mathematics Contests 2013

# Probability and Statistics Problems

# Individual

Please solve 5 out of the following 6 problems.

Problem 1. Let ( $X _ { n }$ ) be a sequence of random variables.

(1) Assume that $\textstyle \sum _ { n = 0 } ^ { \infty } P ( | X _ { n } | > n ) < \infty$ . Prove that $\begin{array} { r } { \operatorname* { l i m } \operatorname* { s u p } _ { n  \infty } \frac { | X _ { n } | } { n } \leq 1 } \end{array}$ |Xn| ≤ 1.   
(2) Prove that (Xn) converges in probability to 0 if and only if for certain $r > 0$ , $\begin{array} { r } { E [ \frac { | X _ { n } | ^ { r } } { 1 + | X _ { n } | ^ { r } } ]  0 } \end{array}$ .

Problem 2. Let $X$ and $Y$ be independent $N ( 0 , 1 )$ random variables.

(1) Find $E [ X + Y | X \geq 0 , Y \geq 0 ]$ ;   
(2) Find the distribution function of $X + Y$ given that $X \geq 0$ and $Y \geq 0$

(Hint: For b) using the fact that $U = ( X + Y ) / \sqrt { 2 }$ and $V \ : = \ : ( X \ : - \ : Y ) / \sqrt { 2 }$ are independent and $N ( 0 , 1 )$ distributed.)

Problem 3. Let $\{ X _ { n } \}$ be a sequence of independent and identically distributed continuous real valued random variables, and regard $n$ as time. Let $A _ { n }$ be the following event:

$$
A _ {n} = \{X _ {n} = \max  \{X _ {1}, X _ {2}, \dots , X _ {n} \} \}.
$$

We say that a maximum record occurs at $n$ in such an event.

(1) Evaluate the probability $P ( A _ { n } )$   
(2) Denote by $Y _ { n }$ the number of maximum records occurred until time $n$ , i.e.,

$$
Y _ {n} = \text {t h e n u m b e r o f} \{1 \leq k \leq n: X _ {k} = \max  \left\{X _ {1}, X _ {2}, \dots , X _ {k} \right\} \}.
$$

Evaluate the expectation $E Y _ { n }$ and the variance $D Y _ { n }$ .

Problem 4. Let $X = ( X _ { 1 } , \cdots , X _ { n } )$ be an iid sample from an exponential density with mean $\theta$ . Consider testing $H _ { 0 } : \theta = \theta _ { 0 }$ vs. $H _ { 1 } : \theta > \theta _ { 0 }$ . Let P (X) = your p-value for an appropriate test.

(a) What is $E _ { \theta _ { 0 } } ( P ( X ) )$ ? Derive your answer explicitly.   
(b) Derive $E _ { \theta } ( P ( X ) )$ for $\theta \neq \theta _ { 0 }$ . Specifically, assuming only one sample, i.e. $n = 1$ calculate $E _ { \theta } ( P ( X ) )$ as explicitly as possible for $\theta \neq \theta _ { 0 }$ .   
(c) When there is only one sample, is $E _ { \theta } ( P ( X ) )$ a decreasing function of $\theta$ ? In general, can you prove your result for an arbitrary MLR family?

Problem 5. Let $X _ { 1 }$ , $X _ { 2 }$ be iid uniform on $\theta - { \textstyle \frac { 1 } { 2 } }$ to $\theta + { \textstyle { \frac { 1 } { 2 } } }$

(a) Show that for any given $0 < \alpha < 1$ , you can find $c > 0$ such that

$$
P _ {\theta} \{\bar {X} - c <   \theta <   \bar {X} + c \} = 1 - \alpha ,
$$

where $X$ is the sample mean.

(b) Show that for $\epsilon$ positive and sufficiently small

$$
P _ {\theta} \left\{\bar {X} - c <   \theta <   \bar {X} + c \mid | X _ {2} - X _ {1} | \geq 1 - \epsilon \right\} = 1
$$

(c) The statement in (a) is used to assert that $X \pm c$ is a $1 0 0 ( 1 - \alpha ) \%$ confidence interval for $\theta$ . Does the assertion in (b) contradict this? If your sample observations are $X _ { 1 } = 1 , X _ { 2 } = 2$ , would you use the confidence interval in (a)?

Problem 6. Suppose you want to estimate the total number of enemy tanks in a war on the basis of the captured tanks. Assume without loss of generality that the tank serial numbers are $1 , 2 , \cdots , N$ , where $N$ is the unknown total number of enemy tanks. Also assume the serial numbers of the $n$ captured tanks are iid uniform on $1 , 2 , \cdots , N$ . (This is a simplified assumption which provides a good approximation if $n < < N$ ).

(a) Find the complete sufficient statistic.   
(b) Suggest how you may find the minimum variance unbiased estimate of $N$