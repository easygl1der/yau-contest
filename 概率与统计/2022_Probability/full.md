# Probability and Statistics

Solve every problem.

Problem 1. Let $\{ X _ { n } \}$ be a sequence of Gaussian random variables. Suppose that $X$ is a random variable such that $X _ { n }$ converges to $X$ in distribution as $n  \infty$ . Show that $X$ is also a (possibly degenerate, i.e., variance zero) Gaussian random variable.

Problem 2. For two probability measures $\mu$ and $\nu$ on the real line ??, the total variation distance $\| \mu - \nu \| _ { T V }$ is defined as

$$
\left\| \mu - \nu \right\| _ {T V} = \sup  \left\{\mu (C) - \nu (C): C \in \mathcal {B} (\mathbf {R}) \right\},
$$

where $\mathcal B ( { \bf R } )$ is the $\sigma$ -algebra of Borel sets on ??. Let $\mathcal { C } ( \mu , \nu )$ be the space of couplings of the probability measures $\mu$ and $\nu$ , i.e., the space of $\mathbf { R } ^ { 2 }$ valued random variables $( X , Y )$ defined on some (not necessarily same) probability space $( \varOmega , \mathcal { F } , \mathbb { P } )$ such that the marginal distributions of $X$ and $Y$ are $\mu$ and ??, respectively. Show that

$$
\left\| \mu - v \right\| _ {T V} = \inf  \left\{\mathbb {P} (X \neq Y): (X, Y) \in \mathcal {C} (\mu , v) \right\}.
$$

For simplicity you may assume that $\mu$ and $\nu$ are absolutely continuous with respect to the Lebesgue measure on ??.

Problem 3. We throw a fair die repeatedly and independently. Let $\tau _ { 1 1 }$ be the first time the pattern 11 (two consecutive 1’s) appears and $\tau _ { 1 2 }$ the first time the pattern 12 (1 followed by 2) appears.

(a) Calculate the expected value $\mathbb { E } \tau _ { 1 1 }$   
(b) Which is larger, $\mathbb { E } \tau _ { 1 1 }$ or $\mathbb { E } \tau _ { 1 2 } ?$ It is sufficient to give an intuitive argument to justify your answer. You can also calculate $\mathbb { E } \tau _ { 1 2 }$ if you wish.

Problem 4. Let $\{ X _ { n } \}$ be a Markov chain on a discrete state space $s$ with transition function $p ( x , y ) , x , y \in S$ . Suppose that there is a state $y _ { 0 } \in S$ and a positive number $\boldsymbol { \theta }$ such that $p ( x , y _ { 0 } ) \ge \theta$ for all $x \in S$ .

(a) Show that is a positive constant $\lambda < 1$ such that for any two initial distribution $\mu$ and $\nu$

$$
\sum_ {y \in S} \left| \mathbb {P} _ {\mu} \left\{X _ {1} = y \right\} - \mathbb {P} _ {\nu} \left\{X _ {1} = y \right\} \right| \leq \lambda \sum_ {y \in S} | \mu (y) - \nu (y) |.
$$

(b) Show that the Markov chain has a unique stationary distribution $\pi$ and

$$
\sum_ {y \in S} \left| \mathbb {P} _ {\mu} \left\{X _ {n} = y \right\} - \pi (y) \right| \leq 2 \lambda^ {n}.
$$

Problem 5. Consider a linear regression model with $p$ predictors and $n$ observations:

$$
\mathbf {Y} = X \boldsymbol {\beta} + \mathbf {e},
$$

where $X _ { n \times p }$ is the design matrix, $\beta$ is the unknown coefficient vector, and the random error vector ?? has a multivariate normal distribution with mean zero and $\mathrm { V a r } ( \mathbf { e } ) = \sigma ^ { 2 } I _ { n }$ $\sigma ^ { 2 } > 0$ unknown and $I _ { n }$ is the identity matrix).

Here $\operatorname { r a n k } ( X ) = k \leq p$ , $p$ may or may not be greater than $n$ , but we assume $n - k > 1$ . Let $\mathbf { x } _ { 1 } = ( x _ { 1 , 1 } , \hdots , x _ { 1 , p } )$ be the first row of $X$ and define

$$
\gamma = \frac {\mathbf {x} _ {1} \boldsymbol {\beta}}{\sigma}.
$$

Find the uniformly minimum variance unbiased estimator (UMVUE) of $\gamma$ or prove it does not exist.

Problem 6. Let $X _ { 1 } , \dots , X _ { 2 0 2 2 }$ be independent random variables with $X _ { i } \sim \ N ( \ \theta _ { i } , i ^ { 2 } ) , 1 \leq i \leq 2 0 2 2 .$ For estimating the unknown mean vector $\theta \in R ^ { 2 0 2 2 }$ , consider the loss function $\begin{array} { r } { L ( \boldsymbol { \theta } , \mathbf { d } ) = \sum _ { i = 1 } ^ { 2 0 2 2 } ( d _ { i } - \theta _ { i } ) ^ { 2 } / i ^ { 2 } } \end{array}$ . Prove that $\mathbf { X } =$ $( X _ { 1 } , \dots , X _ { 2 0 2 2 } )$ is a minimax estimator of $\boldsymbol { \theta }$ .

Recall: If $Y | \mu \sim N ( \mu , \sigma ^ { 2 } )$ and ?? ∼  ??(??0, ??20) then ??|?? = ?? ∼ ?? ( ??0/??20+??/??21/??2+1/??2 , 11/??2+1/??2 ).